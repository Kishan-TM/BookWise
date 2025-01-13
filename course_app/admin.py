from django.contrib import admin
from .models import *
# Register your models here.

class CourseAdmin(admin.ModelAdmin):
    list_display = ('course_name','university','image','description','published_at')
    search_fields = ('course_name', 'university')  # Searchable fields
    fields = ('course_name', 'university', 'image', 'description')  # Specify fields for editing

class SemesterAdmin(admin.ModelAdmin):
    list_display = ('course', 'name')
    list_filter=('name',)
    search_fields = ('name', 'course__course_name')
    fields = ('course', 'name')

class SubjectAdmin(admin.ModelAdmin):
    list_display = ('name','course','semester','description')
    list_filter=('semester',)
    search_fields = ('name', 'course__course_name', 'semester__name')
    fields = ('name', 'course', 'semester', 'description')

class ModuleAdmin(admin.ModelAdmin):
    list_display = ('subject','name','content')
    list_filter=('subject',)
    search_fields = ('name', 'subject__name')
    fields = ('subject', 'name','content')

class ReviewAdmin(admin.ModelAdmin):
    list_display=('user','course','review_text','rating','created_at')
    list_filter=('course',)

class QuestionAdmin(admin.ModelAdmin):
    list_display=('title','questions')

admin.site.register(Course,CourseAdmin)
admin.site.register(Semester,SemesterAdmin)
admin.site.register(Subject,SubjectAdmin)
admin.site.register(Module,ModuleAdmin)
admin.site.register(Review,ReviewAdmin)
admin.site.register(Question,QuestionAdmin)

