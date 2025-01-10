# Generated by Django 5.1.4 on 2025-01-10 09:05

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('course_app', '0016_alter_subject_course'),
    ]

    operations = [
        migrations.AlterField(
            model_name='module',
            name='subject',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='modules', to='course_app.subject'),
        ),
        migrations.AlterField(
            model_name='subject',
            name='course',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='course_app.course'),
        ),
    ]
