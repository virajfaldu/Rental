from itertools import product
from socketserver import ThreadingMixIn
from django.shortcuts import render


from accounts.models import *
from accounts.decorators import allowed_users, notAllowed_users

# Create your views here.


@notAllowed_users(allowed_roles=['deliveryboy'])
def home(request):

    category = Category.objects.filter(
        subcategory_idcategory=None).all().order_by('id')
    subCategory = Category.objects.exclude(
        subcategory_idcategory=None).all().order_by('id')

    newProducts = Product.objects.all().order_by('id').reverse()[:5]
    topRatedProducts = Product.objects.filter(id__in=FeedbackRating.objects.filter(rating__in=[5,4]).distinct().values("product"))[:6]
    trendingCat=Category.objects.exclude(subcategory_idcategory=None).order_by('id').reverse()[:5]
    products=Product.objects.all()
    brands=Brand.objects.all()

    context = {
        'category': category,
        'subCategory': subCategory,
        'newProducts': newProducts,
        'topRatedProducts':topRatedProducts,
        'trendingCat':trendingCat,
        'products':products,
        'brands':brands
    }

    return render(request, 'home/index.html', context)
