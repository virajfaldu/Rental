from django.urls import path
from . import views
from django.conf.urls.static import static
from django.conf import settings


urlpatterns=[
    path('',views.adminpannel,name="adminpannel"),
    path('profile',views.profile,name="profile"),
    path('profile/imageupload',views.imageUpload,name="imageUpload"),

]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)