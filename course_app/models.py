from django.db import models
from django.contrib.auth.models import AbstractUser
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.core.validators import MaxValueValidator, MinValueValidator
# Create your models here.


class CustomUser(AbstractUser):
    phone_number = models.CharField(max_length=15,blank=True,null=True)

class UserReg(models.Model):
    user = models.OneToOneField(CustomUser,on_delete=models.CASCADE,related_name='user')
    name = models.CharField(max_length=100,default='')

class Course(models.Model):
    course_name = models.CharField(max_length=100)
    # course_description = models.CharField(max_length=200)
    # duration = models.CharField(max_length=50)
    # image = models.ImageField(upload_to='course_images')
    
class Semester(models.Model):
    course = models.ForeignKey(Course, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)

class Subject(models.Model):
    course=models.ForeignKey(Course,on_delete=models.CASCADE)
    semester=models.ForeignKey(Semester,on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    content = models.FileField(upload_to='subject_content/')


class Review(models.Model):     
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='reviews')
    course = models.ForeignKey(Course, on_delete=models.CASCADE, related_name='reviews')
    review_text = models.TextField()
    rating = models.PositiveIntegerField(default=1, validators=[MaxValueValidator(5), MinValueValidator(1)])
    created_at = models.DateTimeField(auto_now_add=True)
