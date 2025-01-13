from django.db import models
from django.contrib.auth.models import AbstractUser
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.core.validators import MaxValueValidator, MinValueValidator


class CustomUser(AbstractUser):
    phone_number = models.CharField(max_length=15,blank=True,null=True)

class UserReg(models.Model):
    user = models.OneToOneField(CustomUser,on_delete=models.CASCADE,related_name='user')
    name = models.CharField(max_length=100,default='')


class Course(models.Model):
    course_name = models.CharField(max_length=100)
    university= models.CharField(max_length=100)
    image= models.FileField(upload_to='course_image',null=True)
    description = models.CharField(max_length=600)
    published_at=models.DateTimeField(auto_now_add=True)

class Semester(models.Model):
    id = models.AutoField(primary_key=True)
    course = models.ForeignKey(Course, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)

class Subject(models.Model):
    course=models.ForeignKey(Course,on_delete=models.CASCADE)
    semester=models.ForeignKey(Semester,on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    description=models.CharField(max_length=600)
    

class Module(models.Model):
    subject=models.ForeignKey(Subject, related_name='modules',on_delete=models.CASCADE)
    name=models.CharField(max_length=100)
    content = models.FileField(upload_to='subject_content/')
    #summary = models.TextField(null=True, blank=True)
    
class Question(models.Model):
    title=models.CharField(max_length=100)
    questions= models.FileField(upload_to='Questions')

class Review(models.Model):     
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='reviews')
    course = models.ForeignKey(Course, on_delete=models.CASCADE, related_name='reviews')
    review_text = models.TextField()
    rating = models.PositiveIntegerField(default=1, validators=[MaxValueValidator(5), MinValueValidator(1)])
    created_at = models.DateTimeField(auto_now_add=True)
