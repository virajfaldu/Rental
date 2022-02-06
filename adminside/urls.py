from django.urls import path
from . import views
from django.conf.urls.static import static
from django.conf import settings


urlpatterns=[
    path('',views.adminpanel,name="adminpanel"),
    path('profile',views.profile,name="profile"),

    path('managecustomer',views.manageCustomer,name="manageCustomer"),
    path('customerRQ',views.customerRQ,name="customerRQ"),
    path('action/<int:pk>/<str:permission>/<str:model>',views.action,name="action"),
    path('action/<int:pk>/<str:permission>',views.action,name="action"),


    path('managedeliveryboy',views.manageDeliveryBoy,name="manageDeliveryBoy"),
    path('managedeliveryboy/asignarea/<int:pk>',views.asignArea,name="asignArea"),
    path('ajax/load-cities/', views.load_cities, name='ajax_load_cities'),
    path('ajax/load-area/', views.load_area, name='ajax_load_area'),
    
    path('manageorder',views.manageOrder,name="manageOrder"),
    path('manageorderdetails/<int:orderid>',views.manageOrderDetails,name="manageOrderDetails"),
    path('manageorderdetails/asigndelivery',views.asignDelivery,name="asignDelivery"),
    path('manageorderdetails/asignpickup',views.asignPickup,name="asignPickup"),
    path('manageorderdetails/changestatus',views.changeStatus,name="changeStatus"),
    
    
    path('cancelorder',views.cancelOrder,name="cancelOrder"),
    path('cancelorder/cancelorderdetails/<int:orderid>',views.cancelOrderDetails,name="cancelOrderDetails"),
    path('cancelorder/payback/<int:orderid>',views.payBack,name="payBack"),
    path('cancelorder/payback/<int:orderid>/<str:view>',views.payBack,name="payBack"),

    path('pickeduporders',views.pickedUpOrder,name="pickedUpOrder"),
    path('pickeduporders/orderdetails/<int:orderid>',views.manageOrderDetails,name="pickedupOrderDetails"),
    path('pickeduporders/returndeposit/<int:orderid>',views.returnDeposit,name="returnDeposit"),
    

    path('extendrent',views.extendRent,name="extendRent"),


    path('manageproduct',views.manageProduct,name="manageProduct"),
    path('manageproduct/editproduct/<int:proid>',views.manageProduct,name="editProduct"),
    path('manageproduct/productDetails/<int:pk>',views.productDetails,name="productDetails"),

    path('categorypage',views.categoryPage,name="categoryPage"),
    path('savecategory',views.manageCategory,name="saveCategory"),
    path('editcategory/<int:catid>',views.manageCategory,name="editCategory"),
    path('savesubcategory',views.manageSubCategory,name="saveSubCategory"),
    path('editsubcategory/<int:scatid>',views.manageSubCategory,name="editSubCategory"),
    path('ajax/load-subcategory', views.load_subCategory, name='ajax_load_subCategory'),
        
    path('manageoffers',views.manageOffers,name="manageOffers"),

    path('managebrand',views.manageBrand,name="manageBrand"),
    path('editbrand/<int:brandid>',views.manageBrand,name="editBrand"),
    
    path('manageproductreview',views.manageProductReview,name="manageProductReview"),
    path('getComment/<int:reviewid>',views.manageProductReview,name="getComment"),
    path('publish',views.publish,name="publish"),

    
    path('customizeproductrq',views.customizeProductRq,name="customizeProductRq"),
    path('customizeproductrq/<int:pk>',views.customizeProductRq,name="getDetails"),
    path('customizeproductrq/acceptproductRq/<int:pk>',views.acceptProductRq,name="acceptProductRq"),
    path('customizeproductrq/declineproductRq/<int:pk>',views.declineProductRq,name="declineProductRq"),


    path('profile/imageupload',views.imageUpload,name="imageUpload"),

]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)