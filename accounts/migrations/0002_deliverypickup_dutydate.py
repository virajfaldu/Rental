# Generated by Django 3.2 on 2022-02-13 04:47

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='deliverypickup',
            name='dutydate',
            field=models.DateField(default=datetime.datetime.now),
        ),
    ]
