from django.urls import path
from . import views
from django.conf.urls.static import static
from django.conf import settings


urlpatterns=[
    
    path('',views.home,name="home"),


    path('productdetail/<int:pk>',views.productDetail,name="productDetail"),
    path('categorydetail/<int:pk>',views.categoryDetail,name="categoryDetail"),
    path('allproducts',views.categoryDetail,name="categoryDetail"),
    
    path('requestproduct',views.requestProduct,name="requestProduct"),

    path('addtocart/<int:pk>',views.addToCart,name="addToCart"),
    path('cartview',views.cartView,name="cartView"),
    path('cartview/removecart/<int:pk>',views.removeCart,name="removeCart"),
    path('cartview/updateqty/<int:pk>',views.updateQty,name="updateQty"),

   
    path('quickview/<int:pk>',views.quickView,name="quickView"),

    path('placeOrder',views.placeOrder,name="placeOrder"),

    path('aboutus',views.aboutus,name="aboutus"),
    path('contactus',views.contactus,name="contactus"),

    path('orderhistory',views.orderHistory,name="orderHistory"),
    path('orderhistory/orderview/<int:oid>',views.orderView,name="orderView"),

    path('orderhistory/cancellation/<int:odid>',views.cancellation,name="cancellation"),

]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)