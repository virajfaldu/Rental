import datetime
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
from .filters import *
from accounts.models import *


@admin_only
def adminpanel(request):

    customer_cnt = Customer.objects.filter(is_pending=False).count()
    pending_customer = Customer.objects.filter(is_pending=True).count()
    sales = ProductHasOrder.objects.filter(Q(status__status="delivered") | Q(status__status="pickedup")).count()
    print(sales)    

    customers=Customer.objects.filter(user__is_active=True).order_by('id').reverse()
    myFilter=customerFilter(request.GET,queryset=customers)
    customers=myFilter.qs[:4]

    orders = Order.objects.all().order_by("-date")
    orderfilter=orderFilter(request.GET,queryset=orders)
    orders=orderfilter.qs[:4]

    context = {
        'customers': customers,
        'orders': orders,
        'myFilter':myFilter,
        'orderFilter':orderfilter,
        'customer_cnt': customer_cnt,
        'pCustomers': pending_customer,
        'sales': sales,
        'index': True,
    }

    return render(request, 'adminside/index.html', context)


@admin_only
def manageCustomer(request):

    customers = Customer.objects.filter(is_pending=False).order_by('id').reverse()
    myFilter=customerFilter(request.GET,queryset=customers)
    customers=myFilter.qs
    customers=get_page(request,customers,pages=5)

    context = {
        'customers': customers,
        'myFilter':myFilter,
        'mcustomer': True
    }
    return render(request, 'adminside/customer/customer.html', context)


@admin_only
def customerRQ(request):

    customers = Customer.objects.filter(is_pending=True).order_by('id').reverse()
    myFilter=customerFilter(request.GET,queryset=customers)
    customers=myFilter.qs
    customers=get_page(request,customers,pages=6)

    context = {
        'customers': customers,
        'myFilter':myFilter,
        'mcustomer': True
    }
    return render(request, 'adminside/customer/customerRQ.html', context)


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
    deliveryboy= DeliveryBoy.objects.all().order_by('id').reverse()
    myFilter=deliveryBoyFilter(request.GET,queryset=deliveryboy)
    deliveryboy=myFilter.qs
    deliveryboy=get_page(request,deliveryboy,pages=10)

    if request.method == 'POST':

        # fill the details in form from post request for set the data after error
        d_fm = DeliveryBoyForm(request.POST)
        p_fm = ProfileForm(request.POST)
        
        context={
            'modaldeliveryboy':True,
            'myFilter':myFilter,
            'deliveryboy':deliveryboy,
            'deliveryboy_fm': d_fm, 
            'profileForm': p_fm,
            'mdeliveryboy':True
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
            return render(request, 'adminside/deliveryboy/manageDeliveryBoy.html',context)

    context={
            'deliveryboy_fm': d_fm, 
            'profileForm': p_fm,
            'myFilter':myFilter,
            'deliveryboy':deliveryboy,
            'modaldeliveryboy':False,
            'mdeliveryboy':True

    }
    return render(request, 'adminside/deliveryboy/manageDeliveryBoy.html',context)


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

    return render(request, 'adminside/deliveryboy/manageDeliveryBoy.html',context)

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
    products = Product.objects.all().order_by('id').reverse()
    
    myFilter=productFilter(request.GET,queryset=products)
    products=myFilter.qs
    products=get_page(request,products,pages=10)
    prodForm = productForm()
    imgForm = imageForm()
    error=False

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
                    imgForm.save()
                messages.success(request, "Product Updated Successfully")
                return redirect('manageProduct')

        context = {
            'products': products,
            'productForm': prodForm,
            'imgForm': imgForm,
            'proid': proid,
            'myFilter':myFilter,
            'edit': True,
            'modalProduct': True,
            'mproduct': True,
        }
        return render(request, 'adminside/product/manageProduct.html', context)

    else:
        if request.method == 'POST':
            prodForm = productForm(request.POST)
            imgForm = imageForm(request.POST, request.FILES)
            images = request.FILES.getlist('image')

            print(prodForm.errors)
            if prodForm.is_valid() and imgForm.is_valid():
                pro = prodForm.save()
                for img in images:
                    Image.objects.create(image=img, product=pro)
                img = imgForm.save()
                
                messages.success(request, "Product Added Successfully")
                return redirect('manageProduct')
            else:
                error=True

    context = {
        'products': products,
        'productForm': prodForm,
        'imgForm': imgForm,
        'myFilter':myFilter,
        'proid': proid,
        'error':error,
        'modalProduct': False,
        'mproduct': True,
    }
    return render(request, 'adminside/product/manageProduct.html', context)

@admin_only
def productDetails(request,pk):
    product=Product.objects.get(id=pk)
    images=Image.objects.filter(product=product)
    context={
        'images':images,
        'product':product
    }
    return render(request,"adminside/product/productDetails.html",context)

@admin_only
def manageCategory(request, catid=None):
    category = Category.objects.filter(subcategory_idcategory=None).all().order_by('id').reverse()
    subCategory = Category.objects.exclude(subcategory_idcategory=None).all().order_by('id').reverse()
    catForm = categoryForm()
    subCatForm = subCategoryForm()
    error=False

    if catid != None:
            subCategory = Category.objects.exclude(subcategory_idcategory=None).all()
            subCatForm = subCategoryForm()
            catData = Category.objects.get(id=catid)
            catForm = categoryForm(instance=catData)
            if request.method=="POST":
                catForm = categoryForm(
                    request.POST, request.FILES, instance=catData)
                if catForm.is_valid():
                    catForm.save()
                    messages.success(request, "Category updated successfully")
                    return redirect('manageCategory')
      
            context = {
                'category': category,
                'subCategory': subCategory,
                'catForm': catForm,
                'subCatForm': subCatForm,
                "edit": True,
                "modalCat": True,
                "catid": catid,
                'mproduct': True,
            }
            return render(request, 'adminside/product/manageCategory.html', context)

    else:
        if request.method == 'POST':
            catForm = categoryForm(request.POST, request.FILES)
            if catForm.is_valid():
                catForm.save()
                messages.success(request, "Category Added Successfully")
                return redirect('manageCategory')
            else:
                error=True

    context = {
        'catForm': catForm,
        'subCatForm': subCatForm,
        'category': category,
        'subCategory': subCategory,
        'error':error,
        'mproduct': True,
    }
    return render(request, 'adminside/product/manageCategory.html', context)


@admin_only
def load_subCategory(request):
    if request.method == "POST":
        try:
            data = json.loads(request.body)
            sub_categories = Category.objects.filter(
                subcategory_idcategory=data['category'])
        except Exception as e:
            sub_categories = []
        return render(request, 'adminside/product/load_subCategory.html', {'subcategories': sub_categories})
    else:
        return HttpResponse("Operation not allowed")


@admin_only
def manageSubCategory(request, scatid=None):
    category = Category.objects.filter(subcategory_idcategory=None).all().order_by('id').reverse()
    subCategory = Category.objects.exclude(subcategory_idcategory=None).all().order_by('id').reverse()
    catForm = categoryForm()
    subCatForm = subCategoryForm()
    isSelected=False

    if scatid is None:
        if request.method == 'POST':
            subCatForm = subCategoryForm(request.POST, request.FILES)

            if request.POST['subcategory_idcategory']=="":
                isSelected=True
            if subCatForm.is_valid() and request.POST['subcategory_idcategory']!="":
                subCatForm.save()
                messages.success(request, "SubCategory Added Successfully")
                return redirect('manageCategory')
            
        context={
            'category':category, 
            'subCatForm': subCatForm,
            'subCategory':subCategory,    
            'catForm': catForm,
            'isSelected':isSelected,
            "modalScat": True,
            'mproduct': True,
        }
        return render(request, 'adminside/product/manageCategory.html', context)

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
                return redirect('manageCategory')

        context = {
            'catForm': catForm,
            'subCatForm': subCateForm,
            'category': category,
            'subCategory': subCategory,
            "scatid": scatid,
            "edit": True,
            "modalScat": True,
            'mproduct': True,
        }
        return render(request, 'adminside/product/manageCategory.html', context)

@admin_only
def manageOffers(request):
    return render(request, 'adminside/product/manageOffer.html', {'mproduct': True})

@admin_only
def manageBrand(request, brandid=None):
    brands = get_page(request, Brand.objects.all().order_by('id').reverse(), 5)
    bForm = brandForm()
    error=False

    if brandid == None:
        if request.method == "POST":
            bForm = brandForm(request.POST)
            if bForm.is_valid():
                bForm.save()
                messages.success(request, "Brand Added Successfully")
                return redirect('manageBrand')
            else:
                error=True

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
                error=True
        context = {
            'brands': brands,
            'brandForm': bForm,
            'brandid': brandid,
            'modalBrand': True,
            'error': error,
            'mproduct': True
        }
        return render(request, 'adminside/product/manageBrand.html', context)

    context = {
        'brands': brands,
        'brandForm': bForm,
        'brandid': brandid,
        'error': error,
        'modalBrand': False,
        'mproduct': True
    }
    return render(request, 'adminside/product/manageBrand.html', context)

@admin_only
def manageProductReview(request, reviewid=None):

    reviews = FeedbackRating.objects.filter().all().order_by('id').reverse()
    myFilter=reviewsFilter(request.GET,queryset=reviews)
    reviews=myFilter.qs
    reviews=get_page(request,reviews,pages=10)

    if reviewid != None:
        comment = FeedbackRating.objects.get(id=reviewid)
        context = {
            'reviews': reviews,
            'comment': comment,
            'modalComment': True,
            'mproduct': True
        }
        return render(request, 'adminside/product/manageReview.html', context)

    context = {
        'reviews': reviews,
        'myFilter':myFilter,
        'mproduct': True
    }
    return render(request, 'adminside/product/manageReview.html', context)

@admin_only
def publish(request):
    data = json.loads(request.body)
    review = FeedbackRating.objects.get(id=data['id'])
    review.publish = not review.publish
    review.save()
    messages.success(request, "Record Saved Successfully")
    return JsonResponse({"data": "running"})

# ---------------------------- manage orders ----------------------------

@admin_only
def manageOrder(request):

    orders = Order.objects.all().order_by("-date")
    myFilter=orderFilter(request.GET,queryset=orders)
    orders=myFilter.qs
    orders=get_page(request,orders,pages=10)

    context = {
        'orders': orders,
        'myFilter':myFilter,
        'morder': True
    }
    return render(request, 'adminside/order/manageOrder.html', context)


@admin_only
def manageOrderDetails(request, orderid):

    order = Order.objects.filter(id=orderid).first()
    orderDetails = ProductHasOrder.objects.filter(order=orderid).all().order_by('id')
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
    return render(request, 'adminside/order/manageOrderDetails.html', context)

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
            DeliveryPickup.objects.create(deliveryboy=deliveryboy,order=productHasOrder,dutydate=productHasOrder.start_date).save()

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
            obj=DeliveryPickup.objects.create(deliveryboy=deliveryboy,order=productHasOrder,dutydate=productHasOrder.end_date)
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

    myFilter=productHasOrderFilter(request.GET,queryset=orderDetails)
    orderDetails=myFilter.qs

    orders = []
    for detail in orderDetails:
        orders.append(Order.objects.get(id=detail.order.id))
        
    for o in orders:
        if orders.count(o)>1:
            orders.remove(o)

    context={
        'orders':orders,
        'myFilter':myFilter,
        'morder': True,
    }

    return render(request, 'adminside/order/cancelOrder.html',context)

@admin_only
def cancelOrderDetails(request, orderid):

    order = Order.objects.filter(id=orderid).first()
    orderDetails = ProductHasOrder.objects.filter(order=orderid,status__status="cancelled").all()

    context = {
        'order': order,
        'orderDetails': orderDetails,
        'morder': True,
    }
    return render(request, 'adminside/order/cancelOrderDetails.html', context)

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
        return render(request, 'adminside/order/cancelOrder.html', context)


    if request.method=="POST":
        orderDetails=ProductHasOrder.objects.filter(status__status="cancelled",order=order)
        print(orderDetails)
        paybackForm=payBackForm(request.POST)
        if paybackForm.is_valid():
            obj=paybackForm.save()
            obj.order=order
            obj.save()

            for i in orderDetails:
                i.cancelpay=True
                i.save()

            messages.success(request, "record Saved Successfully")
            return redirect('cancelOrder')
    
    context = {
        'payBackForm':paybackForm,
        'orders': orders,
        'order': order.id,
        'modalPayBack':True,
        'morder': True,
    }
    return render(request, 'adminside/order/cancelOrder.html', context)

@admin_only
def pickedUpOrder(request):

    order=Order.objects.all()
    pickedUpOrder=[]
    for o in order:
        var=True
        orderDetails=ProductHasOrder.objects.filter(order=o)
        count=0
        for detail in orderDetails:
            if detail.status.status=='cancelled':
                count=count+1
            if detail.status.status!= "cancelled" and detail.status.status!= "pickedup":
                var=False
                break
            print(len(orderDetails),count)
        if var and len(orderDetails)!=count:
            pickedUpOrder.append(o)
    context={
        'orders':pickedUpOrder,
        'morder':True
    }

    return render(request, 'adminside/order/pickedUpOrder.html',context)


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
        return render(request, 'adminside/order/pickedUpOrder.html', context)


    if request.method=="POST":
        paybackForm=payBackForm(request.POST)
        if paybackForm.is_valid():
            obj=paybackForm.save()
            obj.order=order
            obj.cancellation=False
            obj.save()

            order.returndeposite=True
            order.save()
            
            messages.success(request, "record Saved Successfully")
            return redirect('pickedUpOrder')
    
    context = {
        'payBackForm':paybackForm,
        'orders': pickedUpOrder,
        'order': order.id,
        'modalPayBack':True,
        'morder': True,
    }
    return render(request, 'adminside/order/pickedUpOrder.html', context)

@admin_only
def extendRent(request):
    return render(request, 'adminside/order/exRentDur.html', {'morder': True})



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
        return render(request, 'adminside/customizeRQ.html',context)


    context={
        'requests':productRQ,
        'mcustomerRQ': True,
    }
    return render(request, 'adminside/customizeRQ.html',context)

@admin_only
def acceptProductRq(request,pk):

    productRQ=Customize.objects.filter(status="pending").order_by('-date')
    prodForm=productForm()
    imgForm=imageForm()

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

            template=render_to_string('adminside/email/acceptProduct.html',{'name':RQ.customer.user.username})
            sendEmail(request,RQ.customer.user,template)

            messages.success(request, "Product Added Successfully")
            return redirect('customizeProductRq')

    context={
        'requests':productRQ,
        'productForm':prodForm,
        'imgForm':imgForm,
        'id':pk,
        'mcustomerRQ': True,
        'modalProduct':True
    }
    return render(request, 'adminside/customizeRQ.html',context)

@admin_only
def declineProductRq(request,pk):
    data=json.loads(request.body)
    RQ=Customize.objects.get(id=data['rid'])

    RQ.status="declined"
    RQ.save()

    template=render_to_string('adminside/email/declineProduct.html',{'name':RQ.customer.user.username})
    sendEmail(request,RQ.customer.user,template)

    messages.success(request, "Record Saved Sucessfully")
    context = {
       'success': True
    }
    return JsonResponse(context)

@admin_only
def manageLocations(request,pk=None):

    states=State.objects.all().order_by('id').reverse()
    page = request.GET.get('page')
    states=get_page(request,states,5,page)
    stateform=stateForm()
    state_error=False

    cities=City.objects.all().order_by('id').reverse()
    page = request.GET.get('page2')
    cities=get_page(request,cities,5,page)
    cityform=cityForm()

    area=Area.objects.all().order_by('id').reverse()
    page = request.GET.get('page3')
    area=get_page(request,area,5,page)
    areaform=areaForm()

    if request.method=="POST" and pk==None:
        stateform=stateForm(request.POST)
        if stateform.is_valid():
            stateform.save()
            messages.success(request, "Record Saved Sucessfully")
            return redirect('manageLocations')
        else:
            state_error=True

    state=State.objects.filter(id=pk).first()
    if pk!=None:
        stateform=stateForm(instance=state)
        if request.method=='POST':
            stateform=stateForm(request.POST,instance=state)
            if stateform.is_valid():
                stateform.save()
                messages.success(request, "Record Saved Sucessfully")
                return redirect('manageLocations')
            else:
                state_error=True
        
        context={
            'stateForm':stateform,
            'cityForm':cityform,
            'areaForm':areaform,
            'states':states,
            'cities':cities,
            'area':area,
            'state_error':state_error,
            'pk':pk,
            'modalState':True,
            'edit':True,
            'mlocations':True,
        }
        return render(request,'adminside/locations.html',context)


    context={
        'stateForm':stateform,
        'cityForm':cityform,
        'areaForm':areaform,
        'states':states,
        'cities':cities,
        'area':area,
        'state_error':state_error,
        'mlocations':True,
    }

    return render(request,'adminside/locations.html',context)

@admin_only
def manageCity(request,pk=None):

    states=State.objects.all().order_by('id').reverse()
    page = request.GET.get('page')
    states=get_page(request,states,5,page)
    stateform=stateForm()

    cities=City.objects.all().order_by('id').reverse()
    page = request.GET.get('page2')
    cities=get_page(request,cities,5,page)
    cityform=cityForm()
    city_error=False

    area=Area.objects.all().order_by('id').reverse()
    page = request.GET.get('page3')
    area=get_page(request,area,5,page)
    areaform=areaForm()

    if request.method=="POST" and pk==None:
        cityform=cityForm(request.POST)
        if cityform.is_valid():
            cityform.save()
            messages.success(request, "Record Saved Sucessfully")
            return redirect('manageLocations')
        else:
            city_error=True

    city=City.objects.filter(id=pk).first()
    if pk!=None:
        cityform=cityForm(instance=city)
        if request.method=='POST':
            cityform=cityForm(request.POST,instance=city)
            if cityform.is_valid():
                cityform.save()
                messages.success(request, "Record Saved Sucessfully")
                return redirect('manageLocations')
            else:
                city_error=True
        context={
            'stateForm':stateform,
            'cityForm':cityform,
            'areaForm':areaform,
            'states':states,
            'cities':cities,
            'area':area,
            'city_error':city_error,
            'pk':pk,
            'modalCity':True,
            'edit':True,
            'mlocations':True,
        }
        return render(request,'adminside/locations.html',context)
       


    context={
        'stateForm':stateform,
        'cityForm':cityform,
        'areaForm':areaform,
        'states':states,
        'cities':cities,
        'area':area,
        'city_error':city_error,
        'mlocations':True,
    }

    return render(request,'adminside/locations.html',context)

@admin_only
def manageArea(request,pk=None):
    states=State.objects.all().order_by('id').reverse()
    page = request.GET.get('page')
    states=get_page(request,states,5,page)
    stateform=stateForm()

    cities=City.objects.all().order_by('id').reverse()
    page = request.GET.get('page2')
    cities=get_page(request,cities,5,page)
    cityform=cityForm()

    area=Area.objects.all().order_by('id').reverse()
    page = request.GET.get('page3')
    area=get_page(request,area,5,page)
    areaform=areaForm()
    area_error=False

    if request.method=="POST" and pk==None:
        areaform=areaForm(request.POST)
        if areaform.is_valid():
            areaform.save()
            messages.success(request, "Record Saved Sucessfully")
            return redirect('manageLocations')
        else:
            area_error=True

    area_obj=Area.objects.filter(id=pk).first()
    if pk!=None:
        areaform=areaForm(instance=area_obj)
        if request.method=='POST':
            areaform=areaForm(request.POST,instance=area_obj)
            print(areaform.errors,"hello")

            if areaform.is_valid():
                areaform.save()
                messages.success(request, "Record Saved Sucessfully")
                return redirect('manageLocations')
            else:
                area_error=True
        context={
            'stateForm':stateform,
            'cityForm':cityform,
            'areaForm':areaform,
            'states':states,
            'cities':cities,
            'area':area,
            'area_error':area_error,
            'pk':pk,
            'modalArea':True,
            'edit':True,
            'mlocations':True,
        }
        return render(request,'adminside/locations.html',context)
       


    context={
        'stateForm':stateform,
        'cityForm':cityform,
        'areaForm':areaform,
        'states':states,
        'cities':cities,
        'area':area,
        'area_error':area_error,
        'mlocations':True,
    }

    return render(request,'adminside/locations.html',context)


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
                return render(request, 'adminside/profile.html', context)
            else:
                if User.objects.filter(email=email).exists() and request.user.email != email:
                    messages.warning(request, "Email already exist")
                    return render(request, 'adminside/profile.html', context)

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
    return render(request, 'adminside/profile.html', context)


def imageUpload(request):

    if request.method == "POST":

        admin = Admin.objects.get(user=request.user)
        admin.image = request.FILES.get('image')
        admin.save()
        messages.success(request, "Records Save Successfully")
    return redirect('profile')


def get_page(request,obj, pages,page=None):
    paginator = Paginator(obj, pages)

    if page==None:
        page = request.GET.get('page')

    try:
        users = paginator.page(page)
    except EmptyPage:
        users = paginator.page(paginator.num_pages)
    except PageNotAnInteger:
        users = paginator.page(1)

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