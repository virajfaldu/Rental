from django import forms
from django.contrib.auth.models import User
from accounts.models import *

class userBoyForm(forms.ModelForm):

    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'email']


class boyForm(forms.ModelForm):

   class Meta:
        model = DeliveryBoy
        fields = ['image', 'address', 'contact', 'state', 'city', 'area']