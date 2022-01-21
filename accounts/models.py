# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from django.contrib.auth.models import User


class City(models.Model):
    city_name = models.CharField(max_length=45)
    state_idstate = models.ForeignKey('State',on_delete=models.CASCADE)

    def __str__(self):
        return self.city_name


class State(models.Model):
    state_name = models.CharField(max_length=45)

    def __str__(self):
        return self.state_name



class Area(models.Model):
    area_name = models.CharField(max_length=45)
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
    company_name = models.CharField(max_length=45,blank=False)
    company_address = models.TextField()
    contact=models.CharField(max_length=10)
    image=models.ImageField(upload_to='users/',default='users/avatar-png-1-original.png')
    is_panding = models.IntegerField(default=True)
    user = models.OneToOneField(User,on_delete=models.CASCADE,blank=True,null=True)  # Field name made lowercase.
    area = models.ForeignKey(Area,on_delete=models.CASCADE,blank=False)
    state = models.ForeignKey(State,on_delete=models.CASCADE,blank=False)
    city=models.ForeignKey(City,on_delete=models.CASCADE,blank=False)

    def __str__(self):
        return self.user.username
        
class Admin(models.Model):
    address = models.TextField()
    contact=models.CharField(max_length=10)
    image=models.ImageField(upload_to='users/',default='users/avatar-png-1-original.png',null=True,blank=True)
    user = models.OneToOneField(User,on_delete=models.CASCADE,blank=True,null=True)  # Field name made lowercase.
    area = models.ForeignKey(Area,on_delete=models.CASCADE)
    state = models.ForeignKey(State,on_delete=models.CASCADE)
    city=models.ForeignKey(City,on_delete=models.CASCADE)

    def __str__(self):
        return self.user.username
        

class DeliveryBoy(models.Model):
    address = models.TextField()
    contact=models.CharField(max_length=10)
    image=models.ImageField(upload_to='users/',default='users/avatar-png-1-original.png')
    user_iduser = models.ForeignKey(AuthUser, db_column='User_idUser',on_delete=models.CASCADE)  # Field name made lowercase.
    area = models.ForeignKey(Area,on_delete=models.CASCADE)
    state = models.ForeignKey(State,on_delete=models.CASCADE)
    city=models.ForeignKey(City,on_delete=models.CASCADE)

    def __str__(self):
        return self.user_iduser.username

class AreaHasDeliveryBoy(models.Model):    
    area_idarea = models.OneToOneField(Area, db_column='area_idarea', primary_key=True,on_delete=models.CASCADE)
    delivery_boy_iddelivery_boy = models.ForeignKey('DeliveryBoy', db_column='delivery_boy_idDelivery_boy',on_delete=models.CASCADE)


    def __str__(self):
        return  f"{self.area_idarea.area} has {self.delivery_boy_iddelivery_boy.user_iduser}"


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
    name = models.CharField(max_length=45)

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
    name = models.CharField(max_length=15,blank=False)
    image = models.ImageField(upload_to ='category/',blank=True,null=True)
    subcategory_idcategory = models.ForeignKey('self', db_column='subcategory_idcategory', blank=True, null=True,on_delete=models.CASCADE)

    def __str__(self):
        return self.name


class Customize(models.Model):
    date = models.DateField(blank=True, null=True)
    user_iduser = models.ForeignKey(AuthUser, db_column='user_idUser',on_delete=models.CASCADE)  # Field name made lowercase.
    product_idproduct = models.ForeignKey('Product', db_column='product_idproduct',on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.user_iduser.username} has requested for{self.product_idproduct.product_name}"


class CustomizeHasHardwares(models.Model):
    customize_idcustomize = models.OneToOneField(Customize, db_column='customize_idcustomize', primary_key=True,on_delete=models.CASCADE)
    hardwares_idhardware = models.ForeignKey('Hardwares', db_column='hardwares_idhardware',on_delete=models.CASCADE)


class DeliveryPickup(models.Model):
    pickup = models.IntegerField()
    delivery_boy_iddelivery_boy = models.ForeignKey(DeliveryBoy, db_column='delivery_boy_idDelivery_boy',on_delete=models.CASCADE)  # Field name made lowercase.
    order_idorder = models.ForeignKey('Order', db_column='order_idorder',on_delete=models.CASCADE)


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
    feedback_date = models.DateField(blank=True, null=True)
    desc = models.CharField(max_length=45, blank=True, null=True)
    rating = models.FloatField(blank=True, null=True)
    customer_idcustomer = models.ForeignKey(Customer, db_column='customer_idCustomer',on_delete=models.CASCADE)  # Field name made lowercase.
    product_idproduct = models.ForeignKey('Product', db_column='product_idproduct',on_delete=models.CASCADE)


class HardwareDetails(models.Model):
    hardware_details = models.CharField(max_length=45, blank=True, null=True)
    hardwares_idhardware = models.ForeignKey('Hardwares', db_column='hardwares_idhardware',on_delete=models.CASCADE)



class Hardwares(models.Model):
    hardware_name = models.CharField(max_length=15)



class Offers(models.Model):
    discount_name = models.CharField(max_length=45)
    start_date = models.DateField()
    end_date = models.DateField()
    discount = models.FloatField()



class Order(models.Model):
    order_date = models.DateField()
    delivery_address = models.CharField(max_length=75)
    tot_amount = models.IntegerField()
    customer_idcustomer = models.ForeignKey(Customer, db_column='customer_idCustomer',on_delete=models.CASCADE)  # Field name made lowercase.


class Payment(models.Model):
    date = models.DateField()
    tot_amount = models.IntegerField()
    transaction_id = models.CharField(max_length=45)
    bank_ref_num = models.CharField(max_length=45)
    order_idorder = models.ForeignKey(Order, db_column='order_idorder',on_delete=models.CASCADE)
    payment_method_idpayment_method = models.ForeignKey('PaymentMethod', db_column='payment_method_idpayment_method',on_delete=models.CASCADE)


class PaymentMethod(models.Model):
    name = models.CharField(max_length=45)


class Product(models.Model):
    product_name = models.CharField(max_length=45)
    product_desc = models.TextField(max_length=100, blank=True, null=True)
    quantity = models.IntegerField()
    rent_per_day = models.FloatField(blank=True, null=True)
    rent_per_week = models.FloatField(blank=True, null=True)
    rent_per_month = models.FloatField(blank=True, null=True)
    deposit = models.IntegerField()
    delivery_pickup_charges = models.IntegerField()
    brand_idbrand = models.ForeignKey(Brand, db_column='brand_idbrand',on_delete=models.CASCADE)
    category_idcategory = models.ForeignKey(Category, db_column='category_idcategory',on_delete=models.CASCADE)


class ProductHasHardwares(models.Model):
    product_idproduct = models.OneToOneField(Product, db_column='product_idproduct', primary_key=True,on_delete=models.CASCADE)
    hardwares_idhardware = models.ForeignKey(Hardwares, db_column='hardwares_idhardware',on_delete=models.CASCADE)


class ProductHasOffers(models.Model):
    product_idproduct = models.OneToOneField(Product, db_column='product_idproduct', primary_key=True,on_delete=models.CASCADE)
    offers_id_offer = models.ForeignKey(Offers, db_column='offers_id_offer',on_delete=models.CASCADE)


class ProductHasOrder(models.Model):
    product_idproduct = models.OneToOneField(Product, db_column='product_idproduct', primary_key=True,on_delete=models.CASCADE)
    order_idorder = models.ForeignKey(Order, db_column='order_idorder',on_delete=models.CASCADE)
    start_date = models.DateField()
    end_date = models.DateField()
    rent_price = models.IntegerField()
    deposit = models.IntegerField()
    delivery_pickup_charge = models.IntegerField()
    quantity = models.IntegerField()
    order_status = models.CharField(max_length=15)
    cancel_date = models.DateField(blank=True, null=True)
    given_deposit_iddeposit = models.ForeignKey('ReturnDeposit', db_column='given_deposit_iddeposit', blank=True, null=True,on_delete=models.CASCADE)


class Image(models.Model):
    image = models.ImageField(upload_to ='uploads/')
    product_idproduct = models.ForeignKey(Product, db_column='product_idproduct', blank=True, null=True,on_delete=models.CASCADE)
    

class ReturnDeposit(models.Model):
    date = models.DateField()
    deposit_amount = models.IntegerField()
    desc = models.CharField(max_length=45, blank=True, null=True)
    cheque_num = models.IntegerField()


