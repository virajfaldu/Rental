from django.contrib import messages
from django.shortcuts import render,redirect
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.contrib.auth.models import User

from accounts.decorators import allowed_users # for use a decorators
from .forms import *
from accounts.models import *


@login_required(login_url='/account/signin')
@allowed_users(allowed_roles=['admin'])
def adminpannel(request):
    return render(request,'index.html')

@login_required(login_url='/account/signin')
@allowed_users(allowed_roles=['admin'])
def profile(request):

    admin=Admin.objects.filter(user=request.user).first()
    admin_fm=AdminForm(instance=admin)   
    user_fm=UserForm(instance=request.user)

    context={
        'userForm':user_fm,
        'adminForm':admin_fm,
        'admin':admin
    } 
    if "password1" in request.POST:
       
        if request.POST['password1']=='' and request.POST['password2']=='':
                messages.error(request,"Enter Valid Password")
        elif request.POST['password1']!=request.POST['password2'] :
                messages.error(request,"Password Does Not Matched")
        else:
            user=User.objects.get(username=request.user)
            user.set_password(request.POST['password1'])
            user.save()
            messages.success(request,"Password Changed Sucessfully")

        return render(request,'profile.html',context)

    if request.method=='POST':
        admin_fm=AdminForm(request.POST,instance=admin)
        user_fm=UserForm(request.POST,instance=request.user)

        email=request.POST['email']
        # checking for email exist or not
        if email!='':
            if User.objects.filter(email=email).exists() and request.user.email!=email:
                messages.warning(request,"Email already exist")
                return render(request,'profile.html',context)
        
        if admin_fm.is_valid() and user_fm.is_valid():
            user_fm.save()
            admin_fm.save()
            messages.info(request,"Records Save Successfully")
            return redirect(request.META['HTTP_REFERER'])
    
    return render(request,'profile.html',context)

def imageUpload(request):
    
    if request.method=="POST":

        admin=Admin.objects.get(user=request.user)
        admin.image=request.FILES.get('image')
        admin.save()
    return redirect('profile')



