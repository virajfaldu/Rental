# Generated by Django 3.2 on 2022-02-06 04:50

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0009_alter_customize_pending'),
    ]

    operations = [
        migrations.RenameField(
            model_name='customize',
            old_name='pending',
            new_name='status',
        ),
    ]
