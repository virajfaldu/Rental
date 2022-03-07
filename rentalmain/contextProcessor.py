import imp

from django.conf import settings
from accounts.decorators import notAllowed_users
from accounts.models import *
from django.shortcuts import render
import math

# @notAllowed_users(roles=['deliveryboy'])
def general(request):

    category = Category.objects.filter(
        subcategory_idcategory=None).all().order_by('id')
    subCategory = Category.objects.exclude(
        subcategory_idcategory=None).all().order_by('id')

    if request.user.is_authenticated and request.user.groups.filter(name='customer'): 
        cart=Cart.objects.filter(customer=request.user.customer).all().order_by('id').reverse()
        numCart=cart.count() 
        totalAmount=0
        for c in cart:
            totalAmount+=c.rent_amount+c.deposit+c.delivery_pickup_charges

        totalAmount=math.floor(totalAmount+((totalAmount*18)/100))

        context = {
            'category': category,
            'subCategory': subCategory,
            'numCart':numCart,
            'cart':cart,
            'totalAmount':totalAmount
        }
        return context

    context = {
        'category': category,
        'subCategory': subCategory,
        'siteUrl':settings.SITE_URL
    }

    return context