from django.urls import path
from . import views
from django.conf.urls.static import static
from django.conf import settings


urlpatterns=[
    path('signup/',views.signup,name="signup"),
    path('signin/',views.login,name="signin"),
    path('logout/',views.logout,name="logout"),

    path('ajax/load-cities/', views.load_cities, name='ajax_load_cities'),
    path('ajax/load-area/', views.load_area, name='ajax_load_area')
]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)