from django.contrib import messages
from django.contrib.auth.models import Group
from django.http.response import HttpResponse
from django.shortcuts import render,redirect
from django.contrib.auth.decorators import login_required

from accounts.decorators import allowed_users # for use a decorators
from .forms import *
# Create your views here.
@login_required(login_url='/account/signin')
@allowed_users(allowed_roles=['admin'])
def adminpannel(request):
    return render(request,'index.html')


