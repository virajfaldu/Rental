from traceback import print_tb
from django import template

from accounts.models import DeliveryBoy, DeliveryPickup

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
def total(object):
    tot_charge=totalDeliveryCharge(object)+totalDeposit(object)+totalRent(object)
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
def moneyToPay(object):
    tot_charge=ctotalDeliveryCharge(object)+ctotalDeposit(object)+ctotalRent(object)
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


    