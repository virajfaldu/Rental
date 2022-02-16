from accounts.models import *
import django_filters
from django_filters import ModelChoiceFilter, DateFilter, CharFilter
from django.forms import DateInput


class dutyFilter(django_filters.FilterSet):

    company = CharFilter(
        field_name='order__customer__company_name', lookup_expr='icontains')

    fromdate = DateFilter(field_name='dutydate',lookup_expr='gte',widget=DateInput(attrs={'type': 'date'}))
    todate = DateFilter(field_name='dutydate',lookup_expr='lte', widget=DateInput(attrs={'type': 'date'}))

    class Meta:
        model = DeliveryPickup
        fields = ['order__order__id', 'pickup']
