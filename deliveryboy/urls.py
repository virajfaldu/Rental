from django.urls import path
from . import views

urlpatterns=[
    path('',views.panel,name="panel"),

    path('duty/',views.duty,name="duty"),
    path('duty/confirm/',views.confirm,name="confirm"),
    path('duty/address/<int:dutyid>',views.duty,name="address"),


    path('history',views.history,name="history"),

    path('profile',views.boyProfile,name="boyProfile"),
    path('profile/imageUpload',views.imgUpload,name="imgUpload"),

    path('productReview/<str:user>/<str:oid>',views.productReview,name="productReview"),
    path('productReview/addReview',views.addReview,name="addReview"),
    
]