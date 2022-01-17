from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from accounts.models import *

class UserForm(forms.ModelForm):

    class Meta:
        model=User
        fields=['first_name','last_name','email']

class AdminForm(forms.ModelForm):

    class Meta:
        model=Admin
        fields=['image','address','contact','state','city','area']







