from unicodedata import name
from django.contrib.auth import views as auth_views
from django.urls import path
from . import views

urlpatterns=[
    path('signup/',views.signup,name="signup"),
    path('signin/',views.login,name="signin"),
    path('logout/',views.logout,name="logout"),

    path('ajax/load-cities/', views.load_cities, name='ajax_load_cities'),
    path('ajax/load-area/', views.load_area, name='ajax_load_area'),

    # password reset
    path('reset_password/', auth_views.PasswordResetView.as_view(template_name="account/forgotPassword/reset_password.html"),name="reset_password"),
    path('reset_password_sent/', auth_views.PasswordResetDoneView.as_view(template_name="account/forgotPassword/password_reset_done.html"),name="password_reset_done"),
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(template_name="account/forgotPassword/password_reset_confirm.html"),name="password_reset_confirm"),
    path('reset_password_complete/', auth_views.PasswordResetCompleteView.as_view(template_name="account/forgotPassword/password_reset_complete.html"),name="password_reset_complete"),

    path('changepassword',auth_views.PasswordChangeView.as_view(),name=" password_change"),
    path('changepassword/done',auth_views.PasswordChangeDoneView.as_view(),name="password_change_done"),
]