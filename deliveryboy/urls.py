from django.urls import path
from . import views
from adminside import views as admin

urlpatterns=[
    path('',views.home,name="home"),

    path('duty',views.duty,name="duty"),
    path('duty/confirm/<int:dutyid>',views.confirm,name="confirm"),
    path('duty/address/<int:dutyid>',views.duty,name="address"),


    path('history',views.history,name="history"),

    path('profile',views.boyProfile,name="boyProfile"),
    path('profile/imageUpload',views.imgUpload,name="imgUpload"),
]