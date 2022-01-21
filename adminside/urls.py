from django.urls import path
from . import views
from django.conf.urls.static import static
from django.conf import settings


urlpatterns=[
    path('',views.adminpannel,name="adminpannel"),
    path('profile',views.profile,name="profile"),

    path('manageCustomer',views.manageCustomer,name="manageCustomer"),
    path('customerRQ',views.customerRQ,name="customerRQ"),
    path('action/<int:pk>/<str:permission>/<str:model>',views.action,name="action"),


    path('manageDeliveryBoy',views.manageDeliveryBoy,name="manageDeliveryBoy"),
    path('addDeliveryBoy',views.addDeliveryBoy,name="addDeliveryBoy"),
    
    path('manageOrder',views.manageOrder,name="manageOrder"),
    path('cancelOrder',views.cancelOrder,name="cancelOrder"),
    path('extendRent',views.extendRent,name="extendRent"),


    path('manageProduct',views.manageProduct,name="manageProduct"),
    path('manageCategory',views.manageCategory,name="manageCategory"),
    path('manageSubCategory',views.manageSubCategory,name="manageSubCategory"),
    path('manageOffers',views.manageOffers,name="manageOffers"),
    path('manageBrand',views.manageBrand,name="manageBrand"),
    path('manageProductReview',views.manageProductReview,name="manageProductReview"),

    
    path('cutomizeProductRq',views.cutomizeProductRq,name="cutomizeProductRq"),
    
    path('profile/imageUpload',views.imageUpload,name="imageUpload"),

]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)