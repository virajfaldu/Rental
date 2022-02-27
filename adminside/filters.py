from dataclasses import field
import django
from accounts.models import *
import django_filters
from django_filters import ModelChoiceFilter,DateFilter,CharFilter
from django.forms import DateInput


class productFilter(django_filters.FilterSet):
    
    category = Category.objects.filter(subcategory_idcategory=None).all()
    subCategory = Category.objects.exclude(subcategory_idcategory=None).all()

    category = ModelChoiceFilter(queryset=category)
    subcategory = ModelChoiceFilter(queryset=subCategory)

    class Meta:
        model=Product
        fields=['name','brand','category']

class customerFilter(django_filters.FilterSet):

    company_name=CharFilter(field_name='company_name',lookup_expr='icontains')
    fromdate = DateFilter(field_name='user__date_joined',lookup_expr='gte',widget=DateInput(attrs={'type': 'date'}))
    todate=DateFilter(field_name='user__date_joined',lookup_expr='lte',widget=DateInput(attrs={'type': 'date'}))
    
    class Meta:
        model=Customer
        fields=['area','state','city','user__is_active']

class deliveryBoyFilter(django_filters.FilterSet):
    
    fromdate = DateFilter(field_name='user__date_joined',lookup_expr='gte',widget=DateInput(attrs={'type': 'date'}))
    todate=DateFilter(field_name='user__date_joined',lookup_expr='lte',widget=DateInput(attrs={'type': 'date'}))
    class Meta:
        model=DeliveryBoy
        fields=['user__username','area','state','city','user__is_active']

class reviewsFilter(django_filters.FilterSet):

    company=CharFilter(field_name='customer__company_name',lookup_expr='icontains')

    class Meta:
        model=FeedbackRating
        fields=['date','publish','product__name']

class orderFilter(django_filters.FilterSet):

    fromdate = DateFilter(field_name='date',lookup_expr='gte',widget=DateInput(attrs={'type': 'date'}))
    todate=DateFilter(field_name='date',lookup_expr='lte',widget=DateInput(attrs={'type': 'date'}))
    company=CharFilter(field_name='customer__company_name',lookup_expr='icontains')

    class Meta:
        model=Order
        fields=['customer__company_name','customer__city','customer__area']

class productHasOrderFilter(django_filters.FilterSet):

    company=CharFilter(field_name='order__customer__company_name',lookup_expr='icontains')
    fromdate = DateFilter(field_name='cancel_date',lookup_expr='gte',widget=DateInput(attrs={'type': 'date'}))
    todate=DateFilter(field_name='cancel_date',lookup_expr='lte',widget=DateInput(attrs={'type': 'date'}))

    class Meta:
        model=ProductHasOrder
        fields=['cancel_date','cancelpay']

class orderReportFilter(django_filters.FilterSet):

    fromdate = DateFilter(field_name='date',lookup_expr='gte',widget=DateInput(attrs={'type': 'date'}))
    todate=DateFilter(field_name='date',lookup_expr='lte',widget=DateInput(attrs={'type': 'date'}))

    class Meta:
        model=Order
        fields=['date']

