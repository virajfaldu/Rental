from dataclasses import field, fields
from unicodedata import category
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from accounts.models import *


class userForm(forms.ModelForm):

    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'email']


class adminForm(forms.ModelForm):

    class Meta:
        model = Admin
        fields = ['image', 'address', 'contact', 'state', 'city', 'area']


class passwordForm(UserCreationForm):

    class Meta:
        model = User
        fields = ['password1', 'password2']


class DeliveryBoyForm(UserCreationForm):

    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'username',
                  'email', 'password1', 'password2']


class ProfileForm(forms.ModelForm):
    class Meta:
        model = DeliveryBoy
        fields = '__all__'

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.fields['city'].queryset = City.objects.none()
        if 'state' in self.data:
            try:
                state = int(self.data.get('state'))
                self.fields['city'].queryset = City.objects.filter(
                    state_idstate=state)
            except (ValueError, TypeError):
                pass  # invalid input from the client; ignore and fallback to empty City queryset
        elif self.instance.pk:
            self.fields['city'].queryset = self.instance.state.city_set.order_by(
                'city_name')

        self.fields['area'].queryset = Area.objects.none()
        if 'city' in self.data:
            try:
                city = int(self.data.get('city'))
                self.fields['area'].queryset = Area.objects.filter(
                    city_idcity=city)
            except (ValueError, TypeError):
                pass  # invalid input from the client; ignore and fallback to empty City queryset
        elif self.instance.pk:
            self.fields['area'].queryset = self.instance.city.area_set.order_by(
                'area_name')


class categoryForm(forms.ModelForm):

    class Meta:
        model = Category
        fields = ['name', 'image']


class subCategoryForm(forms.ModelForm):

    class Meta:
        model = Category
        fields = ['name', 'image', 'subcategory_idcategory']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['subcategory_idcategory'].queryset = Category.objects.filter(
            subcategory_idcategory__isnull=True)


class productForm(forms.ModelForm):

    class Meta:
        model = Product
        fields = '__all__'

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['category'].queryset = Category.objects.filter(
            subcategory_idcategory__isnull=True)
        self.fields['subcategory'].queryset = Category.objects.filter(
            subcategory_idcategory__isnull=False)

        self.fields['subcategory'].queryset = Category.objects.none()
        if 'category' in self.data:
            try:
                category = int(self.data.get('category'))
                self.fields['subcategory'].queryset = Category.objects.filter(
                    subcategory_idcategory=category)
            except (ValueError, TypeError):
                pass  # invalid input from the client; ignore and fallback to empty City queryset
        elif self.instance.id:
            self.fields['subcategory'].queryset = Category.objects.filter(
                subcategory_idcategory=self.instance.category)


class imageForm(forms.ModelForm):

    class Meta:
        model = Image
        fields = '__all__'


class brandForm(forms.ModelForm):

    class Meta:
        model = Brand
        fields = '__all__'

class payBackForm(forms.ModelForm):

    class Meta:
        model = PayBack
        fields = '__all__'
