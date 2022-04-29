
from cgi import print_arguments
import imp
from django.http import HttpResponse
from django.shortcuts import redirect, render
from django.contrib.auth.models import User
from django.contrib import messages
import datetime

from adminside.filters import customerFilter
from .encrypt import decrypt, encrypt
from django.template.loader import render_to_string

from accounts.decorators import allowed_users
from accounts.models import *
from .filters import *
from adminside.views import get_page, publish,sendEmail
from .forms import *
from django.conf import settings
import json
from django.http import JsonResponse


# Create your views here.
@allowed_users(['deliveryboy'])
def panel(request):

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
def confirm(request ):
    data = json.loads(request.body)
    duty=DeliveryPickup.objects.filter(id=data['did']).first()

    delivered=OrderStatus.objects.filter(status="delivered").first()
    pickedup=OrderStatus.objects.filter(status="pickedup").first()
    
    productHasOrder=ProductHasOrder.objects.filter(id=duty.order.id).first()

    oid=encrypt(duty.order.id)
    uid=encrypt(duty.order.order.customer.user.id)

    if productHasOrder.status.status=="delivered":
        template=render_to_string('deliveryboy/reviewEmail.html',{'name':duty.order.order.customer.user.username,'product':duty.order.product.name,'uid':uid,'siteUrl':settings.SITE_URL,'oid':oid})
        sendEmail(request,duty.order.order.customer.user,template)
        productHasOrder.status=pickedup
        print(duty.order.order.customer.user.username,"hello")
    else:
        productHasOrder.status=delivered

    productHasOrder.save()

    duty.iscompleted=True
    duty.save()

    context = {
                'success': True
    }
    return JsonResponse(context)

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

def productReview(request,user=None,oid=None):

    uid=decrypt(user)
    orid=decrypt(oid)
    
    user=User.objects.filter(id=uid).first()
    orderTran=ProductHasOrder.objects.filter(id=orid).first()
    product=Product.objects.filter(id=orderTran.product.id).first()
    
    rating=FeedbackRating.objects.filter(orderProduct=orderTran).first()
    print(rating)
    context={
        'user':user.id,
        'orid':orid,
        'product':product,
    }

    if request.user.is_authenticated:
        if request.user == user:
            if rating!=None:
                return HttpResponse("your review saved successfully............")
            return render(request,"deliveryboy/review.html",context)
        else:
            return HttpResponse("you are not authorized")
    return HttpResponse("you are not authorized")

@allowed_users(['customer'])
def addReview(request,user=None,oid=None):
    rating=request.POST.get('rating')
    comment=request.POST.get('comment')
    user=request.POST.get('user')
    orid=request.POST.get('orid')
    product=int(request.POST.get('product'))

    customer=Customer.objects.filter(user=user).first()
    orderTran=ProductHasOrder.objects.filter(id=orid).first()
    product=Product.objects.filter(id=product).first()

    FeedbackRating.objects.create(comment=comment,rating=rating,customer=customer,product=product,orderProduct=orderTran,publish=False)
   
    return redirect(request.META['HTTP_REFERER'])
    
