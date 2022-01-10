from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import *

class SignupForm(UserCreationForm):

    class Meta:
        model=User
        fields=['first_name','last_name','username','email','password1','password2']


class ProfileForm(forms.ModelForm):

    class Meta:
        model=Customer
        fields=['company_name','company_address','state','city','area','user']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.fields['city'].queryset = City.objects.none()
        if 'state' in self.data:
            try:
                state = int(self.data.get('state'))
                self.fields['city'].queryset = City.objects.filter(state_idstate=state)
            except (ValueError, TypeError):
                pass  # invalid input from the client; ignore and fallback to empty City queryset
        elif self.instance.pk:
            self.fields['city'].queryset = self.instance.state.city_set.order_by('city_name')

        self.fields['area'].queryset = Area.objects.none()
        if 'city' in self.data:
            try:
                city = int(self.data.get('city'))
                self.fields['area'].queryset = Area.objects.filter(city_idcity=city)
            except (ValueError, TypeError):
                pass  # invalid input from the client; ignore and fallback to empty City queryset
        elif self.instance.pk:
            self.fields['area'].queryset = self.instance.city.area_set.order_by('area_name')






