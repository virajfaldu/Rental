from ast import Del
import imp
from django.shortcuts import redirect, render
from django.contrib.auth.models import User
from django.contrib import messages
import datetime

from accounts.decorators import allowed_users
from accounts.models import *
from .filters import *
from adminside.views import get_page
from .forms import *


# Create your views here.
@allowed_users(['deliveryboy'])
def home(request):

    deliveryboy=DeliveryBoy.objects.filter(user=request.user).first()

    complete_duty=DeliveryPickup.objects.filter(deliveryboy=deliveryboy,iscompleted=True).count()
    pending_duty=DeliveryPickup.objects.filter(deliveryboy=deliveryboy,iscompleted=False).count()

    todayPending=DeliveryPickup.objects.filter(deliveryboy=deliveryboy,iscompleted=False,dutydate=datetime.datetime.now()).count()

    duty=DeliveryPickup.objects.filter(deliveryboy=deliveryboy,iscompleted=False)

    myFilter=dutyFilter(request.GET,queryset=duty)
    duty=myFilter.qs
    duty=get_page(request,duty,10)


    context={
        'complete_duty':complete_duty,
        'pending_duty':pending_duty,
        'todayPending':todayPending,
        'myFilter':myFilter,
        'duties':duty,
        'index':True
    }
    return render(request,"deliveryboy/dashboard.html",context)

@allowed_users(['deliveryboy'])
def duty(request,dutyid=None):

    deliveryboy=DeliveryBoy.objects.filter(user=request.user).first()
    duty=DeliveryPickup.objects.filter(deliveryboy=deliveryboy,iscompleted=False)

    myFilter=dutyFilter(request.GET,queryset=duty)
    duty=myFilter.qs
    duty=get_page(request,duty,10)

    if dutyid != None:
        address = DeliveryPickup.objects.get(id=dutyid)
        address=Order.objects.get(id=address.order.order.id)
        context = {
            'myFilter':myFilter,
            'duties':duty,
            'dutyid': dutyid,
            'address': address,
            'modalComment': True,
            'mduty': True
        }
        return render(request, 'deliveryboy/duty.html', context)

    context={
        'myFilter':myFilter,
        'duties':duty,
        'mduty':True
    }
    return render(request,"deliveryboy/duty.html",context)

@allowed_users(['deliveryboy'])
def history(request):

    deliveryboy=DeliveryBoy.objects.filter(user=request.user).first()
    duty=DeliveryPickup.objects.filter(deliveryboy=deliveryboy,iscompleted=True)

    myFilter=dutyFilter(request.GET,queryset=duty)
    duty=myFilter.qs

    duty=get_page(request,duty,10)
    context={
        'myFilter':myFilter,
        'duties':duty,
        'mhistory':True
    }
    return render(request,"deliveryboy/history.html",context)

@allowed_users(['deliveryboy'])
def confirm(request,dutyid):
    duty=DeliveryPickup.objects.filter(id=dutyid).first()

    delivered=OrderStatus.objects.filter(status="delivered").first()
    pickedup=OrderStatus.objects.filter(status="pickedup").first()
    
    productHasOrder=ProductHasOrder.objects.filter(id=duty.order.id).first()
    
    
    if productHasOrder.status.status=="delivered":
        productHasOrder.status=pickedup
    else:
        productHasOrder.status=delivered

    productHasOrder.save()

    duty.iscompleted=True
    duty.save()

    return redirect('duty')

@allowed_users(['deliveryboy'])
def boyProfile(request):

    boy = DeliveryBoy.objects.filter(user=request.user).first()
    boy_fm = boyForm(instance=boy)
    user_fm = userBoyForm(instance=request.user)

    if request.method == 'POST':
        print("helo")

        boy_fm = boyForm(request.POST, instance=boy)
        user_fm = userBoyForm(request.POST, instance=request.user)

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
            return redirect('boyProfile')

    context = {
        'userForm': user_fm,
        'boyForm': boy_fm,
        'boy': boy,
    }
    return render(request, 'deliveryboy/profile.html', context)

def imgUpload(request):

    if request.method == "POST":

        boy = DeliveryBoy.objects.get(user=request.user)
        boy.image = request.FILES.get('image')
        boy.save()
        messages.success(request, "Records Save Successfully")
    return redirect('boyProfile')