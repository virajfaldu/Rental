from asyncio.windows_events import NULL
from cgi import print_directory
from multiprocessing import context
from django.contrib import messages
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.contrib.auth.models import User
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, JsonResponse
import json
from django.apps import apps


from accounts.decorators import admin_only  # for use a decorators
from .forms import *
from accounts.models import *


@admin_only
def adminpannel(request):

    return render(request, 'index.html', {'index': True})


@admin_only
def manageCustomer(request):

    # customers=Customer.objects.filter(is_panding=False).all()
    customers = get_page(request, Customer.objects.filter(is_panding=False))
    content = {
        'customers': customers,
        'mcustomer': True
    }
    return render(request, 'customer/customer.html', content)


@admin_only
def customerRQ(request):

    customers = get_page(request, Customer.objects.filter(is_panding=True))
    content = {
        'customers': customers,
        'mcustomer': True
    }
    return render(request, 'customer/customerRQ.html', content)


@admin_only
def action(request, pk, permission,model):

    if request.method == 'POST':
        if permission == "accept":
            customer = Customer.objects.get(id=pk)
            customer.is_panding = False
            customer.user.is_active = True
            customer.user.save()
            customer.save()
            messages.success(request, "User Permitted")

        elif permission == "delete":
            data = json.loads(request.body)
            print(model)
            try:
                if model == 'User':        
                    User.objects.filter(id=data['uid']).delete()
                else:
                    Model = apps.get_model('accounts', model)  
                    Model.objects.filter(id=data['uid']).delete()

                messages.success(request, f"{model} deleted successfully")
                context = {
                    'success': True
                }
                return JsonResponse(context)
            except Exception as e:
                print(e)
                messages.warning(request, "user not deleted")
                context = {
                    'success': False
                }
                return JsonResponse(context)

        elif permission == "block":
            customer = Customer.objects.get(id=pk)
            customer.user.is_active = False
            customer.user.save()
            messages.success(request, "User Blocked Successfully")

        elif permission == "unblock":
            customer = Customer.objects.get(id=pk)
            customer.user.is_active = True
            customer.user.save()
            messages.success(request, "User Activated Successfully")

        return redirect(request.META['HTTP_REFERER'])
    return redirect(request.META['HTTP_REFERER'])


@admin_only
def manageDeliveryBoy(request):
    return render(request, 'deliveryboy/manageDeliveryBoy.html', {'mdeliveryboy': True})


@admin_only
def addDeliveryBoy(request):
    return render(request, 'deliveryboy/addDeliveryBoy.html', {'mdeliveryboy': True})


@admin_only
def manageOrder(request):
    return render(request, 'order/manageOrder.html', {'morder': True})


@admin_only
def cancelOrder(request):
    return render(request, 'order/cancelOrder.html', {'morder': True})


@admin_only
def extendRent(request):
    return render(request, 'order/exRentDur.html', {'morder': True})


@admin_only
def manageProduct(request):
    return render(request, 'product/manageProduct.html', {'mproduct': True})


@admin_only
def manageCategory(request):
    print("category")
    category=Category.objects.filter(subcategory_idcategory=None).all()
    subCategory=Category.objects.exclude(subcategory_idcategory=None).all()
    catForm = categoryForm()
    subCatForm = subCategoryForm()

    if request.method == 'POST':
        catForm = categoryForm(request.POST,request.FILES)

        if catForm.is_valid():
            catForm.save()
            messages.success(request, "Category Added Successfully")
            return redirect('manageCategory')

    content = {
    'catForm': catForm,
    'subCatForm': subCatForm,
    'category':category,
    'subCategory':subCategory,
    'mproduct': True,
    }

    return render(request, 'product/manageCategory.html', content)


@admin_only
def manageSubCategory(request):

    category=Category.objects.filter(subcategory_idcategory=None).all()
    subCategory=Category.objects.exclude(subcategory_idcategory=None).all()
    subCatForm = subCategoryForm()
    catForm = categoryForm()

    if request.method == 'POST':
        subCatForm = subCategoryForm(request.POST,request.FILES)

        if subCatForm.is_valid():
            subCatForm.save()
            messages.success(request, "SubCategory Added Successfully")
            return redirect('manageCategory')
        return redirect('manageCategory')

    content = {
    'catForm': catForm,
    'subCatForm': subCatForm,
    'category':category,
    'subCategory':subCategory,
    'mproduct': True,
    }

    return render(request, 'product/manageCategory.html', content)


@admin_only
def manageOffers(request):
    return render(request, 'product/manageOffer.html', {'mproduct': True})


@admin_only
def manageBrand(request):
    return render(request, 'product/manageBrand.html', {'mproduct': True})


@admin_only
def manageProductReview(request):
    return render(request, 'product/manageReview.html', {'mproduct': True})


@admin_only
def cutomizeProductRq(request):
    return render(request, 'customizeRQ.html', {'mcustomerRQ': True})


@admin_only
def profile(request):

    admin = Admin.objects.filter(user=request.user).first()
    admin_fm = adminForm(instance=admin)
    user_fm = userForm(instance=request.user)
    pass_Form=passwordForm()

    if request.method == 'POST':

        if "password1" in request.POST:
            pass_Form=passwordForm(request.POST,instance=request.user)

            if pass_Form.is_valid():
                pass_Form.save()
                messages.success(request, "Password Changed Sucessfully")
                return redirect('signin')
            else:
                messages.warning(request, "Something Went To Wrong")

            return redirect('profile')

        else:
            admin_fm = adminForm(request.POST, instance=admin)
            user_fm = userForm(request.POST, instance=request.user)

            context = {
                'userForm': user_fm,
                'adminForm': admin_fm,
                'admin': admin,
                'passForm':pass_Form
            }

            email = request.POST['email']
            if email == '':
                    messages.warning(request, "Email Cannot Empty")
                    return render(request, 'profile.html', context)
            else:
                if User.objects.filter(email=email).exists() and request.user.email != email:
                    messages.warning(request, "Email already exist")
                    return render(request, 'profile.html', context)

            if admin_fm.is_valid() and user_fm.is_valid():
                user_fm.save()
                admin_fm.save()
                messages.success(request, "Records Save Successfully")
                return redirect(request.META['HTTP_REFERER'])

    context = {
        'userForm': user_fm,
        'adminForm': admin_fm,
        'admin': admin,
        'passForm':pass_Form
    }             
    return render(request, 'profile.html', context)


def imageUpload(request):

    if request.method == "POST":

        admin = Admin.objects.get(user=request.user)
        admin.image = request.FILES.get('image')
        admin.save()
        messages.success(request, "Records Save Successfully")
    return redirect('profile')


def get_page(request, user_obj):
    all_user = Paginator(user_obj.all(), 1)
    page = request.GET.get('page')

    try:
        users = all_user.page(page)
    except EmptyPage:
        users = all_user.page(all_user.num_pages)
    except PageNotAnInteger:
        users = all_user.page(1)

    return users
