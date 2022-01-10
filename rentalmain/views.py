from django.shortcuts import render

from accounts.decorators import allowed_users,notAllowed_users

# Create your views here.
@notAllowed_users(allowed_roles=['deliveryboy'])
def home(request):
    return render(request,'home.html')
