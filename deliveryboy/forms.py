from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from accounts.models import *

class userForm(forms.ModelForm):

    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'email']


class deliveryBoyForm(forms.ModelForm):

    class Meta:
        model = DeliveryBoy
        fields = "__all__"