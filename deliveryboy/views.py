from ast import Del
from django.shortcuts import redirect, render
from django.contrib.auth.models import User
from django.contrib import messages
from django.http import JsonResponse
import json


from accounts.decorators import allowed_users
from accounts.models import *
from adminside.forms import userForm
from deliveryboy.forms import deliveryBoyForm

# Create your views here.
@allowed_users(['deliveryboy'])
def home(request):
    context={
        'index':True
    }
    return render(request,"dashboard.html",context)

@allowed_users(['deliveryboy'])
def duty(request):

    deliveryboy=DeliveryBoy.objects.filter(user=request.user).first()
    product=ProductHasOrder.objects.filter(deliverypickup__deliveryboy=deliveryboy)

    duties=[]
    for p in product:
        duties.append(Order.objects.get(id=p.order.id))

    print(duties)

    context={

        'duties':duties,
        'mduty':True
        
    }
    return render(request,"duty.html",context)


@allowed_users(['deliveryboy'])
def dutyDetails(request, orderid):

    order = Order.objects.filter(id=orderid).first()
    orderDetails = ProductHasOrder.objects.filter(order=orderid).all()
    status=OrderStatus.objects.exclude(status="cancelled").order_by('-id').reverse()
    

    context = {
        'order': order,
        'orderDetails': orderDetails,
        'status':status,
        'mduty': True,
    }
    return render(request, 'dutyDetails.html', context)


@allowed_users(['deliveryboy'])
def changeStatus(request):
    print("hello")
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


        product.quantity+=orderDetails.quantity
        product.save()
    messages.success(request, "status updated")
    return JsonResponse({"data": "running"})

@allowed_users(['deliveryboy'])
def profile(request):

    boy = DeliveryBoy.objects.filter(user=request.user).first()
    boy_fm = deliveryBoyForm(instance=boy)
    user_fm = userForm(instance=request.user)
    # pass_Form = passwordForm()

    if request.method == 'POST':

        boy_fm = deliveryBoyForm(request.POST, instance=boy)
        user_fm = userForm(request.POST, instance=request.user)

        context = {
            'userForm': user_fm,
            'boyForm': boy_fm,
            'boy': boy,
        }

        email = request.POST['email']
        if email == '':
            messages.warning(request, "Email Cannot Empty")
            return render(request, 'profile.html', context)
        else:
            if User.objects.filter(email=email).exists() and request.user.email != email:
                messages.warning(request, "Email already exist")
                return render(request, 'boy_profile.html', context)

        if boy_fm.is_valid() and user_fm.is_valid():
            user_fm.save()
            boy_fm.save()
            messages.success(request, "Records Save Successfully")
            return redirect(request.META['HTTP_REFERER'])

    context = {
        'userForm': user_fm,
        'boyForm': boy_fm,
        'boy': boy,
    }
    return render(request, 'boy_profile.html', context)

def imageUpload(request):

    if request.method == "POST":

        boy = DeliveryBoy.objects.get(user=request.user)
        boy.image = request.FILES.get('image')
        boy.save()
        messages.success(request, "Records Save Successfully")
    return redirect('profile')