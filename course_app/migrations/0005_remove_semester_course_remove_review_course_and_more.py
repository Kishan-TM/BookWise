# Generated by Django 5.1.3 on 2024-12-30 08:49

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('course_app', '0004_course_description_course_image_course_university'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='semester',
            name='course',
        ),
        migrations.RemoveField(
            model_name='review',
            name='course',
        ),
        migrations.RemoveField(
            model_name='subject',
            name='course',
        ),
        migrations.RemoveField(
            model_name='review',
            name='user',
        ),
        migrations.RemoveField(
            model_name='subject',
            name='semester',
        ),
        migrations.RemoveField(
            model_name='userreg',
            name='user',
        ),
        migrations.DeleteModel(
            name='Course',
        ),
        migrations.DeleteModel(
            name='Review',
        ),
        migrations.DeleteModel(
            name='Semester',
        ),
        migrations.DeleteModel(
            name='Subject',
        ),
        migrations.DeleteModel(
            name='UserReg',
        ),
    ]
