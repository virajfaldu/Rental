from django.urls import path
from . import views
from django.conf.urls.static import static
from django.conf import settings


urlpatterns=[
    path('',views.adminpannel,name="adminpannel"),

]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)