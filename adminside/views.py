import datetime
import imp
from django.contrib import messages
from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.models import User
from django.contrib.auth.models import Group
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, JsonResponse
import json
from django.apps import apps
from django.db.models import Q
from django.template.loader import render_to_string
from django.conf import settings
from django.core.mail import send_mail




from accounts.decorators import admin_only  # for use a decorators
from .forms import *
from accounts.models import *


@admin_only
def adminpanel(request):

    customer = Customer.objects.filter(is_pending=False).count()
    pending_customer = Customer.objects.filter(is_pending=True).count()
    sales = ProductHasOrder.objects.filter(status__status="delivered").count()

    context = {
        'customers': customer,
        'pCustomers': pending_customer,
        'sales': sales,
        'index': True,
    }

    return render(request, 'index.html', context)


@admin_only
def manageCustomer(request):

    customers = get_page(request, Customer.objects.filter(
        is_pending=False).order_by('id').reverse(), 10)
    context = {
        'customers': customers,
        'mcustomer': True
    }
    return render(request, 'customer/customer.html', context)


@admin_only
def customerRQ(request):

    customers = get_page(request, Customer.objects.filter(
        is_pending=True).order_by('id').reverse(), 10)
    context = {
        'customers': customers,
        'mcustomer': True
    }
    return render(request, 'customer/customerRQ.html', context)


@admin_only
def action(request, pk, permission, model=None):

    if request.method == 'POST':
        if permission == "accept":
            customer = Customer.objects.get(id=pk)
            customer.is_pending = False
            customer.user.is_active = True
            customer.user.save()
            customer.save()
            messages.success(request, "User Permitted")

        elif permission == "delete":
            data = json.loads(request.body)
            try:
                if model == 'User':
                    User.objects.filter(id=data['uid']).delete()
                else:
                    Model = apps.get_model('accounts', model)
                    Model.objects.filter(id=data['uid']).delete()

                messages.success(request, f"{model} deleted successfully")
                context = {
                    'success': True
                }
                return JsonResponse(context)
            except Exception as e:
                messages.warning(request, "user not deleted")
                context = {
                    'success': False
                }
                return JsonResponse(context)

        elif permission == "userstatus":
            user =  User.objects.get(id=pk)
            user.is_active = not user.is_active
            user.save()
            if user.is_active:
                messages.success(request, "User Approved Successfully")
            else:
                messages.success(request, "User Blocked Successfully")

        return redirect(request.META['HTTP_REFERER'])
    return redirect(request.META['HTTP_REFERER'])


@admin_only
def manageDeliveryBoy(request):
    
    d_fm = DeliveryBoyForm()
    p_fm = ProfileForm()
    deliveryboy= get_page(request,DeliveryBoy.objects.all(),10)
    if request.method == 'POST':

        # fill the details in form from post request for set the data after error
        d_fm = DeliveryBoyForm(request.POST)
        p_fm = ProfileForm(request.POST)
        
        context={
            'modaldeliveryboy':True,
            'deliveryboy':deliveryboy,
            'deliveryboy_fm': d_fm, 
            'profileForm': p_fm
        }

        email = request.POST['email']

        if email != '':
            if User.objects.filter(email=email).exists():
                messages.warning(request, "Email already exist")
                return render(request, 'deliveryboy/manageDeliveryBoy.html',context)

        if d_fm.is_valid() and p_fm.is_valid():

            deliveryboy=d_fm.save()

            group = Group.objects.get(name='deliveryboy')
            deliveryboy.groups.add(group)
            Profile = p_fm.save()
            Profile.user = deliveryboy
            Profile.save()
            messages.success(request, "DeliveryBoy Added Successfully")
            return redirect('manageDeliveryBoy')

        else:
            return render(request, 'deliveryboy/manageDeliveryBoy.html',context)

    context={
            'deliveryboy_fm': d_fm, 
            'profileForm': p_fm,
            'deliveryboy':deliveryboy,
            'modaldeliveryboy':False,
    }
    return render(request, 'deliveryboy/manageDeliveryBoy.html',context)


def asignArea(request,pk):
    
    deliveryboy= get_page(request,DeliveryBoy.objects.all(),10)
    boy=DeliveryBoy.objects.get(id=pk)
    boyHasArea=AreaHasDeliveryBoy.objects.filter(deliveryboy=boy).all()
    if request.method=="POST":
        list=request.POST.getlist('area')
        AreaHasDeliveryBoy.objects.filter(deliveryboy=boy).delete()
        for i in list:
            area=Area.objects.get(id=i)
            AreaHasDeliveryBoy.objects.create(area=area,deliveryboy=boy).save()
        context={
            'deliveryboy':deliveryboy,
        }
        messages.success(request,"Record Saved Succesfully")
        return redirect('manageDeliveryBoy')

    area=Area.objects.filter(city_idcity=boy.city).all()
    asignedArea=[]
    for boyarea in boyHasArea:
        asignedArea.append(boyarea.area.area_name)

    context={
        'asignedArea':asignedArea,
        'area':area,
        'deliveryboy':deliveryboy,
        'deliveryboyId':pk,
        'modalAsign':True,
    }

    return render(request, 'deliveryboy/manageDeliveryBoy.html',context)

def load_cities(request):
    state_id = request.GET.get('state')
    cities = City.objects.filter(state_idstate=state_id)
    return render(request, 'load_cities.html', {'cities': cities})


def load_area(request):
    city_id = request.GET.get('city')
    area = Area.objects.filter(city_idcity=city_id)
    return render(request, 'load_area.html', {'areas': area})

# ---------------------------- manage product ----------------------------

@admin_only
def manageProduct(request, proid=None):
    products = get_page(
        request, Product.objects.all().order_by('id').reverse(), 10)
    prodForm = productForm()
    imgForm = imageForm()

    if proid != None:
        proData = Product.objects.filter(id=proid).first()
        prodForm = productForm(instance=proData)
        imgData = Image.objects.filter(product=proid).first()
        imgForm = imageForm(instance=imgData)

        if request.method == 'POST':
            prodForm = productForm(request.POST, instance=proData)
            imgForm = imageForm(request.POST, request.FILES, instance=imgData)
            images = request.FILES.getlist('image')
            if prodForm.is_valid() and imgForm.is_valid():
                pro = prodForm.save()
                if len(images) > 0:
                    for img in images:
                        Image.objects.create(image=img, product=pro)
                    imgForm.save(commit=False)
                messages.success(request, "Product Updated Successfully")
                return redirect('manageProduct')
            else:
                messages.warning(request, "Something Went Wrong")

        context = {
            'products': products,
            'productForm': prodForm,
            'imgForm': imgForm,
            'proid': proid,
            'modalProduct': True,
            'mproduct': True,
        }
        return render(request, 'product/manageProduct.html', context)

    else:
        if request.method == 'POST':
            prodForm = productForm(request.POST)
            imgForm = imageForm(request.POST, request.FILES)
            images = request.FILES.getlist('image')

            if prodForm.is_valid() and imgForm.is_valid():
                pro = prodForm.save()
                img = imgForm.save(commit=False)
                for img in images:
                    Image.objects.create(image=img, product=pro)
                img.save()
                messages.success(request, "Product Added Successfully")
                return redirect('manageProduct')
            else:
                messages.warning(request, "Something Went Wrong")

    context = {
        'products': products,
        'productForm': prodForm,
        'imgForm': imgForm,
        'proid': proid,
        'modalProduct': False,
        'mproduct': True,
    }
    return render(request, 'product/manageProduct.html', context)

@admin_only
def productDetails(request,pk):
    product=Product.objects.get(id=pk)
    images=Image.objects.filter(product=product)
    context={
        'images':images,
        'product':product
    }
    return render(request,"product/productDetails.html",context)

@admin_only
def categoryPage(request):
    category = Category.objects.filter(subcategory_idcategory=None).all()
    subCategory = Category.objects.exclude(subcategory_idcategory=None).all()
    catForm = categoryForm()
    subCatForm = subCategoryForm()

    context = {
        'catForm': catForm,
        'subCatForm': subCatForm,
        'category': category,
        'subCategory': subCategory,
    }
    return render(request, 'product/manageCategory.html', context)


@admin_only
def manageCategory(request, catid=None):
    if catid is None:
        if request.method == 'POST':
            catForm = categoryForm(request.POST, request.FILES)
            if catForm.is_valid():
                catForm.save()
                messages.success(request, "Category Added Successfully")
            return redirect('categoryPage')
        else:
            return HttpResponse("Operation not allowed")

    else:
        category = Category.objects.filter(subcategory_idcategory=None).all()
        subCategory = Category.objects.exclude(
            subcategory_idcategory=None).all()
        subCatForm = subCategoryForm()
        catData = Category.objects.get(id=catid)
        catForm = categoryForm(instance=catData)

        if request.method == "POST":
            cateForm = categoryForm(
                request.POST, request.FILES, instance=catData)
            if cateForm.is_valid():
                cateForm.save()
                messages.success(request, "Category updated successfully")
                return redirect('categoryPage')
            else:
                messages.warning(request, "All fields are required!")

        context = {
            'catForm': catForm,
            'subCatForm': subCatForm,
            'category': category,
            'subCategory': subCategory,
            "edit": True,
            "modalCat": True,
            "catid": catid,
            'mproduct': True,
        }
        return render(request, 'product/manageCategory.html', context)


@admin_only
def load_subCategory(request):

    if request.method == "POST":
        try:
            data = json.loads(request.body)
            sub_categories = Category.objects.filter(
                subcategory_idcategory=data['category'])
        except Exception as e:
            sub_categories = []
        return render(request, 'product/load_subCategory.html', {'subcategories': sub_categories})
    else:
        return HttpResponse("Operation not allowed")


@admin_only
def manageSubCategory(request, scatid=None):
    if scatid is None:
        if request.method == 'POST':
            subCatForm = subCategoryForm(request.POST, request.FILES)
            if subCatForm.is_valid():
                subCatForm.save()
                messages.success(request, "SubCategory Added Successfully")
            return redirect('categoryPage')
        else:
            return HttpResponse("Operation not allowed")

    else:
        category = Category.objects.filter(subcategory_idcategory=None).all()
        subCategory = Category.objects.exclude(
            subcategory_idcategory=None).all()
        catForm = categoryForm()
        scatData = Category.objects.get(id=scatid)
        subCateForm = subCategoryForm(instance=scatData)

        if request.method == "POST":
            subCateForm = subCategoryForm(
                request.POST, request.FILES, instance=scatData)
            if subCateForm.is_valid():
                subCateForm.save()
                messages.success(request, "SubCategory updated successfully")
                return redirect('categoryPage')
            else:
                messages.warning(request, "All fields are required!")

        context = {
            'catForm': catForm,
            'subCatForm': subCateForm,
            'category': category,
            'subCategory': subCategory,
            "edit": True,
            "modalScat": True,
            "scatid": scatid,
            'mproduct': True,
        }
        return render(request, 'product/manageCategory.html', context)

@admin_only
def manageOffers(request):
    return render(request, 'product/manageOffer.html', {'mproduct': True})

@admin_only
def manageBrand(request, brandid=None):
    brands = get_page(request, Brand.objects.all(), 5)
    bForm = brandForm()

    if brandid == None:
        if request.method == "POST":
            bForm = brandForm(request.POST)

            if bForm.is_valid():
                bForm.save()
                messages.success(request, "Brand Added Successfully")
                return redirect('manageBrand')
            else:
                messages.warning(request, "Something Went Wrong")

    else:
        brand = Brand.objects.filter(id=brandid).first()
        bForm = brandForm(instance=brand)

        if request.method == "POST":
            bForm = brandForm(request.POST, instance=brand)
            if bForm.is_valid():
                bForm.save()
                messages.success(request, "Brand Updated Successfully")
                return redirect('manageBrand')
            else:
                messages.warning(request, "Something Went Wrong")
        context = {
            'brands': brands,
            'brandForm': bForm,
            'brandid': brandid,
            'modalBrand': True,
            'mproduct': True
        }
        return render(request, 'product/manageBrand.html', context)

    context = {
        'brands': brands,
        'brandForm': bForm,
        'brandid': brandid,
        'modalBrand': False,
        'mproduct': True
    }
    return render(request, 'product/manageBrand.html', context)


@admin_only
def publish(request):
    data = json.loads(request.body)
    review = FeedbackRating.objects.get(id=data['id'])
    review.publish = not review.publish
    review.save()
    messages.success(request, "Record Saved Successfully")
    return JsonResponse({"data": "running"})


@admin_only
def manageProductReview(request, reviewid=None):

    reviews = FeedbackRating.objects.filter()
    if reviewid != None:
        comment = FeedbackRating.objects.get(id=reviewid)
        context = {
            'reviews': reviews,
            'comment': comment,
            'modalComment': True,
            'mproduct': True
        }
        return render(request, 'product/manageReview.html', context)

    context = {
        'reviews': reviews,
        'mproduct': True
    }
    return render(request, 'product/manageReview.html', context)

# ---------------------------- manage orders ----------------------------

@admin_only
def manageOrder(request):

    orders = Order.objects.all().order_by("-date")

    context = {
        'orders': orders,
        'morder': True
    }
    return render(request, 'order/manageOrder.html', context)


@admin_only
def manageOrderDetails(request, orderid):

    order = Order.objects.filter(id=orderid).first()
    orderDetails = ProductHasOrder.objects.filter(order=orderid).all()
    status=OrderStatus.objects.exclude(status="cancelled").order_by('-id').reverse()
    
    area_has_deliveryboy=AreaHasDeliveryBoy.objects.filter(area=order.customer.area).all()
    deliveryBoy=[]
    for i in range(0,len(area_has_deliveryboy)):
        deliveryBoy.append(DeliveryBoy.objects.filter(id= area_has_deliveryboy[i].deliveryboy.id,user__is_active=True).first())

    context = {
        'order': order,
        'orderDetails': orderDetails,
        'status':status,
        'deliveryboy': deliveryBoy,
        'morder': True,
    }
    return render(request, 'order/manageOrderDetails.html', context)

@admin_only
def asignDelivery(request):
    data = json.loads(request.body)
    order = Order.objects.get(id=data['oid'])
    product=Product.objects.get(id=data['pid'])

    productHasOrder=ProductHasOrder.objects.get(order=order,product=product)
    delivery=DeliveryPickup.objects.filter(order=productHasOrder,pickup=False).first()

    if data['id']=="":
        delivery.delete()
        
    else:
        deliveryboy = DeliveryBoy.objects.get(id=data['id'])

        if delivery!=None:
            delivery.deliveryboy=deliveryboy
            delivery.save()
            
        elif delivery==None:
            DeliveryPickup.objects.create(deliveryboy=deliveryboy,order=productHasOrder).save()

    messages.success(request, "Record Saved Succesfully!")
    return JsonResponse({"data": "running"})

@admin_only
def asignPickup(request):
    data = json.loads(request.body)
    order = Order.objects.get(id=data['oid'])
    product=Product.objects.get(id=data['pid'])

    productHasOrder=ProductHasOrder.objects.get(order=order,product=product)
    delivery=DeliveryPickup.objects.filter(order=productHasOrder,pickup=True).first()

    if data['id']=="":
        delivery.delete()
        
    else:
        deliveryboy = DeliveryBoy.objects.get(id=data['id'])

        if delivery!=None:
            delivery.deliveryboy=deliveryboy
            delivery.save()
            
        elif delivery==None:
            obj=DeliveryPickup.objects.create(deliveryboy=deliveryboy,order=productHasOrder)
            obj.pickup=True
            obj.save()

    messages.success(request, "Record Saved Succesfully!")
    return JsonResponse({"data": "running"})


@admin_only
def changeStatus(request):
    data = json.loads(request.body)

    status=OrderStatus.objects.get(id=data['ostatus'])
    order=Order.objects.get(id=data['oid'])
    orderDetails = ProductHasOrder.objects.get(order=order,product__id=data['pid'])
    product=Product.objects.get(id=orderDetails.product.id)

    orderDetails.status=status
    orderDetails.save()
    
    if orderDetails.status.status=='cancelled':
        orderDetails.cancel_date=datetime.datetime.now()
        orderDetails.save()

        delivery=DeliveryPickup.objects.filter(order=orderDetails).first()
        if delivery!=None:
            delivery.delete()
  
        # order.tot_amount=order.tot_amount-orderDetails.rent_price-orderDetails.deposit-orderDetails.delivery_pickup_charge
        # order.save()

        product.quantity+=orderDetails.quantity
        product.save()
    messages.success(request, "status updated")
    return JsonResponse({"data": "running"})


@admin_only
def cancelOrder(request):

    orderDetails=ProductHasOrder.objects.filter(status__status="cancelled").order_by('-cancel_date').reverse()
    orders=[]
    for detail in orderDetails:
        orders.append(Order.objects.get(id=detail.order.id))
    for o in orders:
        if orders.count(o)>1:
            orders.remove(o)


    context={
        'orders':orders,
        'morder': True,
    }

    return render(request, 'order/cancelOrder.html',context)

@admin_only
def cancelOrderDetails(request, orderid):

    order = Order.objects.filter(id=orderid).first()
    orderDetails = ProductHasOrder.objects.filter(order=orderid,status__status="cancelled").all()

    context = {
        'order': order,
        'orderDetails': orderDetails,
        'morder': True,
    }
    return render(request, 'order/cancelOrderDetails.html', context)

@admin_only
def payBack(request, orderid,view=None):

    orderDetails=ProductHasOrder.objects.filter(status__status="cancelled").order_by('-cancel_date').reverse()
    orders=[]
    for detail in orderDetails:
        orders.append(Order.objects.get(id=detail.order.id))
    for o in orders:
        if orders.count(o)>1:
            orders.remove(o)


    order = Order.objects.filter(id=orderid).first()
    payback=PayBack.objects.filter(order=order,cancellation=True).first()

    paybackForm=payBackForm()
    if payback!=None:
        paybackForm=payBackForm(instance=payback)
        context = {
            'payBackForm':paybackForm,
            'orders': orders,
            'order': order.id,
            'view': True,
            'modalPayBack':True,
            'morder': True,
        }
        return render(request, 'order/cancelOrder.html', context)


    if request.method=="POST":
        paybackForm=payBackForm(request.POST)
        if paybackForm.is_valid():
            obj=paybackForm.save()
            obj.order=order
            obj.save()
            messages.success(request, "record Saved Successfully")
            return redirect('cancelOrder')
    
    context = {
        'payBackForm':paybackForm,
        'orders': orders,
        'order': order.id,
        'modalPayBack':True,
        'morder': True,
    }
    return render(request, 'order/cancelOrder.html', context)

@admin_only
def pickedUpOrder(request):

    order=Order.objects.all()
    pickedUpOrder=[]
    for o in order:
        var=True
        orderDetails=ProductHasOrder.objects.filter(order=o)
        for detail in orderDetails:
            if detail.status.status!= "cancelled" and detail.status.status!= "pickedup":
                var=False
                break
        if var:
            pickedUpOrder.append(o)
    context={
        'orders':pickedUpOrder,
        'morder':True
    }

    return render(request, 'order/pickedUpOrder.html',context)


@admin_only
def returnDeposit(request, orderid):
 
    orders=Order.objects.all()
    pickedUpOrder=[]
    for o in orders:
        var=True
        orderDetails=ProductHasOrder.objects.filter(order=o)
        for detail in orderDetails:
            if detail.status.status!= "cancelled" and detail.status.status!= "pickedup":
                var=False
                break
        if var:
            pickedUpOrder.append(o)


    order = Order.objects.filter(id=orderid).first()
    payback=PayBack.objects.filter(order=order,cancellation=False).first()
    paybackForm=payBackForm()
    if payback!=None:
        paybackForm=payBackForm(instance=payback)
        context = {
            'payBackForm':paybackForm,
            'orders': pickedUpOrder,
            'order': order.id,
            'view': True,
            'modalPayBack':True,
            'morder': True,
        }
        return render(request, 'order/pickedUpOrder.html', context)


    if request.method=="POST":
        paybackForm=payBackForm(request.POST)
        if paybackForm.is_valid():
            obj=paybackForm.save()
            obj.order=order
            obj.cancellation=False
            obj.save()
            messages.success(request, "record Saved Successfully")
            return redirect('pickedUpOrder')
    
    context = {
        'payBackForm':paybackForm,
        'orders': pickedUpOrder,
        'order': order.id,
        'modalPayBack':True,
        'morder': True,
    }
    return render(request, 'order/pickedUpOrder.html', context)

@admin_only
def extendRent(request):
    return render(request, 'order/exRentDur.html', {'morder': True})



@admin_only
def customizeProductRq(request,pk=None):

    productRQ=Customize.objects.filter(status="pending").order_by('-date')

    if pk!=None:
        detail=Customize.objects.get(id=pk)
        context={
            'detail':detail,
            'requests':productRQ,
            'modalDescription':True,
            'mcustomerRQ': True,
        }
        return render(request, 'customizeRQ.html',context)


    context={
        'requests':productRQ,
        'mcustomerRQ': True,
    }
    return render(request, 'customizeRQ.html',context)

@admin_only
def acceptProductRq(request,pk):

    productRQ=Customize.objects.filter(status="pending").order_by('-date')
    productform=productForm()
    imageform=imageForm()

    if request.method == 'POST':
        RQ=Customize.objects.get(id=pk)
        
        prodForm = productForm(request.POST)
        imgForm = imageForm(request.POST, request.FILES)
        images = request.FILES.getlist('image')

        if prodForm.is_valid() and imgForm.is_valid():
            pro = prodForm.save()
            img = imgForm.save(commit=False)
            for img in images:
                Image.objects.create(image=img, product=pro)
            RQ.status="accepted"
            RQ.save()

            template=render_to_string('email/acceptProduct.html',{'name':RQ.customer.user.username})
            sendEmail(request,RQ.customer.user,template)

            messages.success(request, "Product Added Successfully")
            return redirect('customizeProductRq')
        else:
            messages.warning(request, "Something Went Wrong")

    context={
        'requests':productRQ,
        'productForm':productform,
        'imgForm':imageform,
        'id':pk,
        'mcustomerRQ': True,
        'modalProduct':True
    }
    return render(request, 'customizeRQ.html',context)

@admin_only
def declineProductRq(request,pk):
    data=json.loads(request.body)
    RQ=Customize.objects.get(id=data['rid'])

    RQ.status="declined"
    RQ.save()

    template=render_to_string('email/declineProduct.html',{'name':RQ.customer.user.username})
    sendEmail(request,RQ.customer.user,template)

    messages.success(request, "Record Saved Sucessfully")
    context = {
       'success': True
    }
    return JsonResponse(context)

@admin_only
def profile(request):

    admin = Admin.objects.filter(user=request.user).first()
    admin_fm = adminForm(instance=admin)
    user_fm = userForm(instance=request.user)
    pass_Form = passwordForm()

    if request.method == 'POST':

        if "password1" in request.POST:
            pass_Form = passwordForm(request.POST, instance=request.user)

            if pass_Form.is_valid():
                pass_Form.save()
                messages.success(request, "Password Changed Sucessfully")
                return redirect('signin')
            else:
                messages.warning(request, "Something Went To Wrong")

            return redirect('profile')

        else:
            admin_fm = adminForm(request.POST, instance=admin)
            user_fm = userForm(request.POST, instance=request.user)

            context = {
                'userForm': user_fm,
                'adminForm': admin_fm,
                'admin': admin,
                'passForm': pass_Form
            }

            email = request.POST['email']
            if email == '':
                messages.warning(request, "Email Cannot Empty")
                return render(request, 'profile.html', context)
            else:
                if User.objects.filter(email=email).exists() and request.user.email != email:
                    messages.warning(request, "Email already exist")
                    return render(request, 'profile.html', context)

            if admin_fm.is_valid() and user_fm.is_valid():
                user_fm.save()
                admin_fm.save()
                messages.success(request, "Records Save Successfully")
                return redirect(request.META['HTTP_REFERER'])

    context = {
        'userForm': user_fm,
        'adminForm': admin_fm,
        'admin': admin,
        'passForm': pass_Form
    }
    return render(request, 'profile.html', context)


def imageUpload(request):

    if request.method == "POST":

        admin = Admin.objects.get(user=request.user)
        admin.image = request.FILES.get('image')
        admin.save()
        messages.success(request, "Records Save Successfully")
    return redirect('profile')


def get_page(request, user_obj, pages):
    all_user = Paginator(user_obj.all(), pages)
    page = request.GET.get('page')

    try:
        users = all_user.page(page)
    except EmptyPage:
        users = all_user.page(all_user.num_pages)
    except PageNotAnInteger:
        users = all_user.page(1)

    return users


@admin_only
def sendEmail(request,user,template):
    send_mail(
        'thank you for send new product request',
        template,
        settings.EMAIL_HOST_USER,
        [user.email],
        fail_silently=False,
    )