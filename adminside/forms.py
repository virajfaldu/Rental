from dataclasses import field
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from accounts.models import *

class userForm(forms.ModelForm):

    class Meta:
        model=User
        fields=['first_name','last_name','email']

class passwordForm(UserCreationForm):

    class Meta:
        model=User
        fields=['password1','password2']

class adminForm(forms.ModelForm):

    class Meta:
        model=Admin
        fields=['image','address','contact','state','city','area']

class categoryForm(forms.ModelForm):

    class Meta:
        model=Category
        fields=['name','image']

class subCategoryForm(forms.ModelForm):

    class Meta:
        model=Category
        fields=['name','image','subcategory_idcategory']

    def __init__(self,*args,**kwargs):
        super().__init__(*args,**kwargs)
        self.fields['subcategory_idcategory'].queryset=Category.objects.filter(subcategory_idcategory__isnull=True)
       







