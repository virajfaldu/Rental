from django.contrib import messages
from django.http import HttpResponseRedirect
from django.shortcuts import render,redirect
import datetime
from accounts.models import *
from accounts.decorators import notAllowed_users,allowed_users
from adminside.views import invoice

# Create your views here.


@notAllowed_users(roles=['deliveryboy'])
def home(request):

    category = Category.objects.filter(
        subcategory_idcategory=None).all().order_by('id')
    subCategory = Category.objects.exclude(
        subcategory_idcategory=None).all().order_by('id')

    newProducts = Product.objects.all().order_by('id').reverse()[:5]
    topRatedProducts = Product.objects.filter(id__in=FeedbackRating.objects.filter(rating__in=[5,4]).distinct().values("product"))[:6]
    trendingCat=Category.objects.exclude(subcategory_idcategory=None).order_by('id').reverse()[:6]
    products=Product.objects.all()
    brands=Brand.objects.all()

    context = {
        'category': category,
        'subCategory': subCategory,
        'newProducts': newProducts,
        'topRatedProducts':topRatedProducts,
        'trendingCat':trendingCat,
        'products':products,
        'brands':brands,
        'mhome':True
    }

    return render(request, 'home/index.html', context)

@notAllowed_users(roles=['deliveryboy'])
def categoryDetail(request,pk=None):
    mAllProduct=False
    if pk==None:
        products=Product.objects.all()
        mAllProduct=True
    else:
        products=Product.objects.filter(subcategory=pk).all()
    context={
        'products':products,
        'mAllProduct':mAllProduct
    }
    return render(request,'home/productCategory.html',context)


@notAllowed_users(roles=['deliveryboy'])
def productDetail(request,pk):
    product=Product.objects.filter(id=pk).first()
    otherProducts=Product.objects.filter(subcategory=product.subcategory).all()

    ratings=FeedbackRating.objects.filter(product=product).all()

    context={
        'product':product,
        'otherProducts':otherProducts,
        'ratings':ratings,
    }
    return render(request,'home/productDetail.html',context)

@notAllowed_users(roles=['deliveryboy'])
def quickView(request,pk):
    product=Product.objects.filter(id=pk).first()
    context={
        'product':product,
    }
    return render(request,'home/quickView.html',context)

@allowed_users(allowed_roles=['customer'])
def addToCart(request,pk):
    product=Product.objects.filter(id=pk).first()
    customer=Customer.objects.filter(user=request.user).first()
    cart=Cart.objects.filter(customer=customer).all()

    if request.POST['qty']!='':
        qty=int(request.POST['qty'])
    else:
        qty=request.POST['qty']

    rent_amount=int(request.POST['amount'])
    print(rent_amount)
    startDate=datetime.datetime.strptime(request.POST['startDate'],'%d/%m/%Y').date()
    endDate=datetime.datetime.strptime(request.POST['endDate'],'%d/%m/%Y').date()

    if qty=='':
            qty=1
    for c in cart:
        if c.product==product:
            if c.start_date==startDate and c.end_date==endDate:
                c.quantity=qty+c.quantity
                print(c.quantity)
                print(rent_amount)
                c.rent_amount=c.quantity*(rent_amount/qty)
                c.deposit=c.quantity*product.deposit
                c.delivery_pickup_charges=c.quantity*product.delivery_pickup_charges
                c.save()
                return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

    try:
        
        Cart.objects.create(customer=customer,product=product
            ,quantity=qty,start_date=startDate
            ,end_date=endDate,rent_amount=rent_amount
            ,deposit=product.deposit*qty
            ,delivery_pickup_charges=product.delivery_pickup_charges*qty)
        messages.success(request, "Product Added To Cart")

    except Exception:
        print(Exception)
        messages.warning(request,"Something Went To Wrong")

    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

@allowed_users(allowed_roles=['customer'])
def cartView(request,pk=None):
    cart=Cart.objects.filter(customer=request.user.customer).all().order_by('id').reverse()
    context={
        'cart':cart,
    }
    return render(request,'home/cart.html',context)

@allowed_users(allowed_roles=['customer'])
def removeCart(request, pk):

    try:
        cart=Cart.objects.filter(id=pk)
        cart.delete()
    except Exception:
        messages.warning(request,"Something Went To Wrong")
    return redirect(request.META['HTTP_REFERER'])

@allowed_users(allowed_roles=['customer'])
def placeOrder(request,pk=None):

    cart=Cart.objects.filter(customer=request.user.customer).all()
    if request.method=='POST':
        totalAmount=0
        for c in cart:
            product=Product.objects.filter(id=c.product.id).first()
            product.quantity=product.quantity-c.quantity
            product.save()
            totalAmount+=(((c.rent_amount+c.deposit+c.delivery_pickup_charges)*18)/100)+(c.rent_amount+c.deposit+c.delivery_pickup_charges)
        order=Order.objects.create(date=datetime.datetime.now(),tot_amount=totalAmount,customer=request.user.customer)

        for c in cart:
            product=ProductHasOrder.objects.create(product=c.product,order=Order.objects.filter(id=order.pk).first(),start_date=c.start_date
            ,end_date=c.end_date,rent_price=c.rent_amount,deposit=c.deposit,delivery_pickup_charge=c.delivery_pickup_charges,
            quantity=c.quantity).save()
        
        cart=Cart.objects.filter(customer=request.user.customer).all().delete()

        return invoice(request,order.pk)

    context={
        'cart':cart
    }
    return render(request,'home/checkout.html',context)
    

# @allowed_users(allowed_roles=['customer','admin'])
# def checkOut(request):
    

@allowed_users(allowed_roles=['customer'])
def requestProduct(request):
    product=request.POST['product']
    description=request.POST['description']
    
    Customize.objects.create(product_name=product,description=description,date=datetime.datetime.now(),customer=request.user.customer)
    
    messages.success(request,"Request Sent Successfully")

    return redirect(request.META['HTTP_REFERER'])





