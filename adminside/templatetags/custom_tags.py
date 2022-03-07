import imp
from django import template
import math
from datetime import datetime

from accounts.models import DeliveryPickup

register = template.Library()

@register.filter
def totalRent(object):
    tot_rent=0
    for obj in object:
        if obj.status.status!="cancelled":
            tot_rent+=obj.rent_price
    return tot_rent

@register.filter
def totalDeposit(object):
    tot_dep=0
    for obj in object:
        if obj.status.status!="cancelled":
            tot_dep+=obj.deposit
    return tot_dep

@register.filter
def totalDeliveryCharge(object):
    tot_charge=0
    for obj in object:
        if obj.status.status!="cancelled":
            tot_charge+=obj.delivery_pickup_charge
    return tot_charge

@register.filter
def productTotal(object):
    tot_charge=object.rent_amount+object.deposit+object.delivery_pickup_charges
    return tot_charge

@register.filter
def getTax(cart):
    return math.floor(((totalDeliveryCharge(cart)+totalDeposit(cart)+totalRent(cart))*18)/100)

@register.filter
def total(object):
    tot_charge=math.floor(totalDeliveryCharge(object)+totalDeposit(object)+totalRent(object)+getTax(object))
    return tot_charge

# --------------for cancel order--------------

@register.filter
def ctotalRent(object):
    tot_rent=0
    for obj in object:
        if obj.status.status=="cancelled":
            tot_rent+=obj.rent_price
    return tot_rent

@register.filter
def ctotalDeposit(object):
    tot_dep=0
    for obj in object:
        if obj.status.status=="cancelled":
            tot_dep+=obj.deposit
    return tot_dep

@register.filter
def ctotalDeliveryCharge(object):
    tot_charge=0
    for obj in object:
        if obj.status.status=="cancelled":
            tot_charge+=obj.delivery_pickup_charge
    return tot_charge

@register.filter
def cTax(object):
    tot_tax=((ctotalDeliveryCharge(object)+ctotalDeposit(object)+ctotalRent(object))*18)/100
    return tot_tax
@register.filter
def moneyToPay(object):
    tot_charge=ctotalDeliveryCharge(object)+ctotalDeposit(object)+ctotalRent(object)+cTax(object)
    return tot_charge

@register.filter
def getBoy(object,args):
    
    if args=="delivery":
        deliveryboy = DeliveryPickup.objects.filter(order=object,pickup=False).first()
        if deliveryboy!=None:
            return deliveryboy.deliveryboy
        else:
            return ""
    elif args=="pickup":
        deliveryboy = DeliveryPickup.objects.filter(order=object,pickup=True).first()
        if deliveryboy!=None:
            return deliveryboy.deliveryboy
        else:
            return ""   

# --------------for customer side --------------

@register.filter
def times(number, minus=0):
    return range(number-minus)

@register.filter
def qty(number):
    return range(1,number+1)

@register.filter
def getAvgRating(reviews):
    rating = 0
    if reviews:
        for review in reviews:
            rating += review.rating
        return math.floor(rating/len(reviews))
    else:
        return rating

@register.filter
def getTotalRent(cart):

    totalRent = 0
    for c in cart:
        totalRent+=c.rent_amount
    return totalRent

@register.filter
def getTotalDeposit(cart):

    totalDeposit = 0
    for c in cart:
        totalDeposit+=c.deposit
    return totalDeposit

@register.filter
def getTotalDelivery(cart):

    totalDelivery = 0
    for c in cart:
        totalDelivery+=c.delivery_pickup_charges
    return totalDelivery

@register.filter
def tax(cart):
    return math.floor(((getTotalDelivery(cart)+getTotalDeposit(cart)+getTotalRent(cart))*18)/100)

@register.filter
def grandTotal(cart):

    return math.floor(getTotalDelivery(cart)+getTotalDeposit(cart)+getTotalRent(cart)+tax(cart))

@register.filter
def getDays(sDate,eDate):

    delta = eDate-sDate
    return delta.days+1

@register.filter
def has_group(user, group_name):
    return user.groups.filter(name=group_name).exists() 


