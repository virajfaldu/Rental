from django.contrib import messages
from django.contrib.auth.models import Group
from django.shortcuts import render,redirect
from django.contrib.auth import authenticate,login as auth_login,logout as auth_logout
from django.contrib.auth.decorators import login_required

from .decorators import * # for use a decorators
from .forms import *
from .models import Customer
# Create your views here.

@isAuthenticated
def signup(request):

 
    u_fm = SignupForm()
    p_fm = ProfileForm()
    if request.method == 'POST':

        u_fm = SignupForm(request.POST) 
        p_fm = ProfileForm(request.POST) 

        email=request.POST['email']

        if email!='':
            if User.objects.filter(email=email).exists():
                messages.warning(request,"Email already exist")
                return render(request,'account/signup.html',{'user_fm':u_fm,'profileForm':p_fm})

        if u_fm.is_valid() and p_fm.is_valid():

            user=u_fm.save()
            user.is_active=False
            user.save() 

            group=Group.objects.get(name='customer')
            user.groups.add(group)
            Profile=p_fm.save()
            Profile.user=user
            Profile.save()

            return render(request,'account/signup.html',{'registered':True,'user_fm':u_fm,'profileForm':p_fm})

    return render(request,'account/signup.html',{'user_fm':u_fm,'profileForm':p_fm})

def load_cities(request):
    state_id = request.GET.get('state')
    cities = City.objects.filter(state_idstate=state_id)
    return render(request, 'load_cities.html', {'cities': cities})
def load_area(request):
    city_id = request.GET.get('city')
    area = Area.objects.filter(city_idcity=city_id)
    return render(request, 'load_area.html', {'areas': area})

@isAuthenticated
def login(request):

    if request.method=='POST':
        
        username=request.POST['username']
        password=request.POST['password']

        user=authenticate(request,username=username,password=password)

        if user is not None:
            
            auth_login(request,user)
            return redirect('/')

        else:
            messages.warning(request,"Invalid credentials")
    return render(request,'account/signin.html')

def logout(request):
    if request.user.is_authenticated:
        auth_logout(request)
        return redirect('signin')
    else:
        return redirect('signin')
