from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from accounts.models import *



class RQProductForm(forms.ModelForm):

    class Meta:
        model = Customize
        fields = ['product_name','description']
