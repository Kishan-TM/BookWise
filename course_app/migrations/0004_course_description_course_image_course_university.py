# Generated by Django 5.1.3 on 2024-12-30 08:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('course_app', '0003_course_published_at'),
    ]

    operations = [
        migrations.AddField(
            model_name='course',
            name='description',
            field=models.CharField(default='', max_length=200),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='course',
            name='image',
            field=models.FileField(default='', upload_to='course_image'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='course',
            name='university',
            field=models.CharField(default='', max_length=100),
            preserve_default=False,
        ),
    ]
