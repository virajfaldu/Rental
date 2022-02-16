# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from ctypes.wintypes import SIZE
import datetime
from msilib.schema import PublishComponent
from operator import truediv, truth
from pyexpat import model
from xml.etree.ElementInclude import default_loader
from django.db import models
from django.contrib.auth.models import User


class City(models.Model):
    city_name = models.CharField(max_length=45,unique=True)
    state_idstate = models.ForeignKey('State',on_delete=models.CASCADE)

    def __str__(self):
        return self.city_name


class State(models.Model):
    state_name = models.CharField(max_length=45,unique=True)
    def __str__(self):
        return self.state_name



class Area(models.Model):
    area_name = models.CharField(max_length=45,unique=True)
    pincode = models.IntegerField()
    city_idcity = models.ForeignKey('City', db_column='city_idcity',on_delete=models.CASCADE)

    def __str__(self):
        return self.area_name


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    def __str__(self):
        return self.username


class Customer(models.Model):
    company_name = models.CharField(max_length=45,blank=False,unique=True)
    company_address = models.TextField()
    contact=models.CharField(max_length=10)
    image=models.ImageField(upload_to='users/',default='users/avatar-png-1-original.png')
    is_pending = models.BooleanField(default=True)
    user = models.OneToOneField(User,on_delete=models.CASCADE,blank=True,null=True)  # Field name made lowercase.
    area = models.ForeignKey(Area,on_delete=models.SET_NULL,blank=False,null=True)
    state = models.ForeignKey(State,on_delete=models.SET_NULL,blank=False,null=True)
    city=models.ForeignKey(City,on_delete=models.SET_NULL,blank=False,null=True)

    def __str__(self):
        return self.company_name
        
class Admin(models.Model):
    address = models.TextField()
    contact=models.CharField(max_length=10)
    image=models.ImageField(upload_to='users/',default='users/avatar-png-1-original.png',null=True,blank=True)
    user = models.OneToOneField(User,on_delete=models.CASCADE,blank=True,null=True)  # Field name made lowercase.
    area = models.ForeignKey(Area,on_delete=models.SET_NULL,blank=False,null=True)
    state = models.ForeignKey(State,on_delete=models.SET_NULL,blank=False,null=True)
    city=models.ForeignKey(City,on_delete=models.SET_NULL,blank=False,null=True)

    def __str__(self):
        return self.user.username
        

class DeliveryBoy(models.Model):
    address = models.TextField()
    contact=models.CharField(max_length=10,blank=True)
    image=models.ImageField(upload_to='users/',default='users/avatar-png-1-original.png')
    user=models.OneToOneField(User,on_delete=models.CASCADE,blank=True,null=True)
    state = models.ForeignKey(State,on_delete=models.SET_NULL,blank=False,null=True)
    city=models.ForeignKey(City,on_delete=models.SET_NULL,blank=False,null=True)
    area = models.ForeignKey(Area,on_delete=models.SET_NULL,blank=False,null=True)

    def __str__(self):
        return self.user.username

class AreaHasDeliveryBoy(models.Model):    

    class Meta:
        unique_together = (('deliveryboy', 'area'),)

    area = models.ForeignKey(Area,on_delete=models.CASCADE)
    deliveryboy = models.ForeignKey('DeliveryBoy',on_delete=models.CASCADE)

    def __str__(self):
        return  f"{self.deliveryboy.user.username} has {self.area.area_name}"


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup,on_delete=models.CASCADE)
    permission = models.ForeignKey('AuthPermission',on_delete=models.CASCADE)

class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType',on_delete=models.CASCADE)
    codename = models.CharField(max_length=100)


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser,on_delete=models.CASCADE)
    group = models.ForeignKey(AuthGroup,on_delete=models.CASCADE)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser,on_delete=models.CASCADE)
    permission = models.ForeignKey(AuthPermission,on_delete=models.CASCADE)


class Brand(models.Model):
    name = models.CharField(max_length=15,unique=True)

    def __str__(self):
        return self.name

class Cart(models.Model):
    customer_idcustomer = models.OneToOneField('Customer', db_column='customer_idCustomer', primary_key=True,on_delete=models.CASCADE)  # Field name made lowercase.
    product_idproduct = models.ForeignKey('Product', db_column='product_idproduct',on_delete=models.CASCADE)
    quantity = models.IntegerField()
    start_date = models.DateField()
    end_date = models.DateField()
    rent_amount = models.IntegerField()
    deposit = models.IntegerField()
    delivery_pickup_charges = models.IntegerField()

    def __str__(self):
        return f"{self.customer_idcustomer.user_iduser.username} has {self.product_idproduct.product_name}"



class Category(models.Model):
    name = models.CharField(max_length=15,blank=False,unique=True)
    image = models.ImageField(upload_to ='category/')
    subcategory_idcategory = models.ForeignKey('self', blank=True, null=True,on_delete=models.CASCADE)

    def __str__(self):
        return self.name

STATUS_CHOICES = (
    ("pending", "pending"),
    ("declined", "declined"),
    ("accepted", "accepted"),
)

class Customize(models.Model):
    date = models.DateField(blank=True, null=True)
    product_name = models.CharField(max_length=75)
    description = models.TextField(max_length=350)
    customer = models.ForeignKey(Customer,on_delete=models.CASCADE)  # Field name made lowercase.
    status=models.CharField(max_length=10,default='pending',choices = STATUS_CHOICES,blank=True, null=True)

    def __str__(self):
        return f"{self.customer.user.username} has requested for {self.product_name}"


# class CustomizeHasHardwares(models.Model):
#     customize_idcustomize = models.OneToOneField(Customize, db_column='customize_idcustomize', primary_key=True,on_delete=models.CASCADE)
#     hardwares_idhardware = models.ForeignKey('Hardwares', db_column='hardwares_idhardware',on_delete=models.CASCADE)


class DeliveryPickup(models.Model):
    dutydate=models.DateField(default=datetime.datetime.now)
    pickup = models.BooleanField(default=False)
    deliveryboy = models.ForeignKey(DeliveryBoy,on_delete=models.CASCADE)  # Field name made lowercase.
    order = models.ForeignKey('ProductHasOrder',on_delete=models.CASCADE,related_name='deliverypickup')
    iscompleted=models.BooleanField(default=False)

    def __str__(self):
        return f"duty aisgn to {self.deliveryboy} for {self.order}"


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', blank=True, null=True,on_delete=models.CASCADE)
    user = models.ForeignKey(AuthUser,on_delete=models.CASCADE)


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

class FeedbackRating(models.Model):
    date = models.DateField()
    comment = models.TextField(max_length=200, blank=True, null=True)
    rating = models.FloatField(blank=True, null=True)
    publish=models.BooleanField()
    customer = models.ForeignKey(Customer,on_delete=models.CASCADE)  # Field name made lowercase.
    product = models.ForeignKey('Product',on_delete=models.CASCADE)



# class HardwareDetails(models.Model):
#     hardware_details = models.CharField(max_length=45, blank=True, null=True)
#     hardwares_idhardware = models.ForeignKey('Hardwares', db_column='hardwares_idhardware',on_delete=models.CASCADE)



# class Hardwares(models.Model):
#     hardware_name = models.CharField(max_length=15)



class Offers(models.Model):
    discount_name = models.CharField(max_length=45)
    start_date = models.DateField()
    end_date = models.DateField()
    discount = models.FloatField()



class Order(models.Model):
    date = models.DateField()
    tot_amount = models.IntegerField()
    customer = models.ForeignKey(Customer,on_delete=models.CASCADE)  # Field name made lowercase.
    returndeposite=models.BooleanField(blank=True,null=True,default=False)


    def __str__(self):
        return self.customer.company_name

class Payment(models.Model):
    date = models.DateField()
    tot_amount = models.IntegerField()
    transaction_id = models.CharField(max_length=45)
    bank_ref_num = models.CharField(max_length=45)
    order = models.ForeignKey(Order,on_delete=models.CASCADE)
    payment_method = models.ForeignKey('PaymentMethod',on_delete=models.CASCADE)
    
    def __str__(self):
        return f'payment by {self.order.customer.company_name} for order date {self.order.date}'


class PaymentMethod(models.Model):
    name = models.CharField(max_length=45)

    def __str__(self):
        return self.name


class Product(models.Model):
    name = models.CharField(max_length=45,unique=True)
    desc = models.TextField(max_length=100, blank=True, null=True)
    quantity = models.IntegerField()
    rent_per_day = models.FloatField()
    rent_per_week = models.FloatField()
    rent_per_month = models.FloatField()
    deposit = models.IntegerField()
    delivery_pickup_charges = models.IntegerField()
    brand = models.ForeignKey(Brand,on_delete=models.SET_NULL,null=True)
    category = models.ForeignKey(Category,on_delete=models.SET_NULL,null=True)
    subcategory = models.ForeignKey(Category,on_delete=models.SET_NULL,blank=True,null=True,related_name='subcategory')

    def __str__(self):
        return self.name


# class ProductHasHardwares(models.Model):
#     product_idproduct = models.OneToOneField(Product, db_column='product_idproduct', primary_key=True,on_delete=models.CASCADE)
#     hardwares_idhardware = models.ForeignKey(Hardwares, db_column='hardwares_idhardware',on_delete=models.CASCADE)


class ProductHasOffers(models.Model):
    product_idproduct = models.OneToOneField(Product, db_column='product_idproduct', primary_key=True,on_delete=models.CASCADE)
    offers_id_offer = models.ForeignKey(Offers, db_column='offers_id_offer',on_delete=models.CASCADE)

class OrderStatus(models.Model):
    DEFAULT_PK=1
    status = models.CharField(max_length=15,unique=True)
    def __str__(self):
        return self.status

class ProductHasOrder(models.Model):
    
    class Meta:
        unique_together = (('order', 'product'),)

    product = models.ForeignKey(Product,on_delete=models.CASCADE)
    order = models.ForeignKey(Order,on_delete=models.CASCADE)
    start_date = models.DateField()
    end_date = models.DateField()
    rent_price = models.IntegerField()
    deposit = models.IntegerField()
    delivery_pickup_charge = models.IntegerField()
    quantity = models.IntegerField()
    status=models.ForeignKey(OrderStatus,default=OrderStatus.DEFAULT_PK,on_delete=models.SET_NULL,null=True)
    cancel_date = models.DateField(blank=True, null=True)
    cancelpay=models.BooleanField(blank=True,null=True,default=False)

    # deliveryboy=models.ForeignKey(DeliveryBoy,on_delete=models.DO_NOTHING,blank=True,null=True)

    def __str__(self):
        return f"{self.order.customer.company_name} ordered {self.product.name}"

class Image(models.Model):
    image = models.ImageField(upload_to ='product/')
    product = models.ForeignKey(Product, db_column='product', blank=True, null=True,on_delete=models.CASCADE)
    

class PayBack(models.Model):
    date = models.DateField(default=datetime.datetime.now,blank=True,null=True)
    amount = models.IntegerField()
    description = models.TextField(max_length=150, blank=True, null=True)
    cancellation = models.BooleanField(default=True,blank=True,null=True)
    cheque_num = models.IntegerField()
    order = models.ForeignKey(Order,on_delete=models.CASCADE,blank=True,null=True)

# class OTP(models.Model):
#     email = models.TextField(max_length=150)
#     otp = models.IntegerField(max_length=6)
#     date = models.DateField(default=datetime.datetime.now,blank=True,null=True)



