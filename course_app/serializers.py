from .models import *
from rest_framework import serializers
from django.contrib.auth import get_user_model
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from django.utils.translation import gettext_lazy as _

User = get_user_model()


class CustomTokenObtainPairSerializer(TokenObtainPairSerializer):
    def validate(self, attrs):
        data = super().validate(attrs)
        data["user"] = {
            "id": self.user.id,
            "username": self.user.username,
            "email": self.user.email,
        }
        return data


class CommonSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = User  # Ensure this is pointing to your CustomUser model
        fields = ("username", "email", "password", "phone_number",)

    def create(self, validated_data):
        password = validated_data.pop("password")
        user = User(**validated_data)
        user.set_password(password)
        user.save()
        return user

class UserRegistrationSerializer(serializers.ModelSerializer):
    user = CommonSerializer()  # Correctly defined as a nested serializer

    class Meta:
        model = UserReg  # Ensure UserReg is correctly related to User
        fields = '__all__'

    def create(self, validated_data):
        # Pop out the nested 'user' data
        user_data = validated_data.pop("user")
        phone_number = validated_data.get("phone_number")

        # Inject additional data into user_data if necessary
        if phone_number:
            user_data['phone_number'] = phone_number

        # Validate and create the 'user' using CommonSerializer
        serializer = CommonSerializer(data=user_data)
        serializer.is_valid(raise_exception=True)  # Ensure it raises an error if invalid
        user = serializer.save()  # Save the User model instance

        # Create UserReg object and associate it with the saved user
        user_reg = UserReg.objects.create(user=user, **validated_data)
        return user_reg
    


from rest_framework import serializers
from .models import Course

class AddCourseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Course
        fields = "__all__"

    def validate_image(self, value):
        if not value:
            raise serializers.ValidationError("Image is required.")
        return value

class EditCourseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Course
        fields = '__all__'

class SemesterSerializer(serializers.ModelSerializer):
    class Meta:
        model= Semester
        fields= ['course','name']

class SubjectSerializer(serializers.ModelSerializer):
    class Meta:
        model =Subject
        fields='__all__'

# class ReviewSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Review
#         fields = ['user', 'course', 'review_text', 'rating', 'created_at']
#         read_only_fields = ['created_at']  # We do not want users to set the creation time manually

#     def validate(self, data):
#         user = data.get('user')
#         course = data.get('course')

#         # Ensure the user hasn't already reviewed the course
#         if Review.objects.filter(user=user, course=course).exists():
#             raise serializers.ValidationError("You have already reviewed this course.")
        
#         return data
from rest_framework import serializers
from .models import Review

class ReviewSerializer(serializers.ModelSerializer):
    user_id = serializers.IntegerField(source='user.id', read_only=True)  # Include user ID explicitly in the response

    class Meta:
        model = Review
        fields = ['user', 'user_id', 'course', 'review_text', 'rating', 'created_at']
        read_only_fields = ['created_at', 'user']  # We do not want users to set the user manually

    def validate(self, data):
        user = data.get('user')
        course = data.get('course')

        # Ensure the user hasn't already reviewed the course
        if Review.objects.filter(user=user, course=course).exists():
            raise serializers.ValidationError("You have already reviewed this course.")
        
        return data


# class ViewReviewSerializer(serializers.ModelSerializer):
#     class Meta:
#         models = Review
#         fields = '__all__'

class ViewReviewSerializer(serializers.ModelSerializer):
    class Meta:
        model = Review  # Ensure this is 'model' (singular)
        fields = '__all__'  # Or specify the fields explicitly if needed
