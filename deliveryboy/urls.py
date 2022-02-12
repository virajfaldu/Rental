from django.urls import path
from . import views
from adminside import views as admin

urlpatterns=[
    path('',views.home,name="home"),

    path('duty',views.duty,name="duty"),
    path('duty/dutyDetails/<int:orderid>',views.dutyDetails,name="dutyDetails"),
    path('duty/dutyDetails/changestatus',views.changeStatus,name="changestatus"),


    path('profile',views.profile,name="profile"),
    path('profile/imageUpload',views.imageUpload,name="imageUpload"),
]