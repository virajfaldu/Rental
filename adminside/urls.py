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
    path('ajax/load-cities/', views.load_cities, name='ajax_load_cities'),
    path('ajax/load-area/', views.load_area, name='ajax_load_area'),
    
    path('manageorder',views.manageOrder,name="manageOrder"),
    path('manageorderdetails/<int:orderid>',views.manageOrderDetails,name="manageOrderDetails"),
    path('manageorderdetails/asigndelivery',views.asignDelivery,name="asignDelivery"),
    path('manageorderdetails/changestatus',views.changeStatus,name="changeStatus"),

    path('cancelorder',views.cancelOrder,name="cancelOrder"),
    path('extendrent',views.extendRent,name="extendRent"),


    path('manageproduct',views.manageProduct,name="manageProduct"),
    path('editproduct/<int:proid>',views.manageProduct,name="editProduct"),

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

    
    path('cutomizeproductrq',views.cutomizeProductRq,name="cutomizeProductRq"),


    path('profile/imageupload',views.imageUpload,name="imageUpload"),

]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)