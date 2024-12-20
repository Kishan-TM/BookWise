from django.shortcuts import get_object_or_404, render,redirect
from .models import *
from .serializers import *
from rest_framework.permissions import IsAuthenticated,AllowAny,IsAdminUser
from rest_framework.response import Response
from rest_framework import status,viewsets,generics
from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework.views import APIView
from rest_framework_simplejwt.tokens import RefreshToken,UntypedToken,AccessToken
from rest_framework_simplejwt.exceptions import InvalidToken, TokenError
from django.contrib.auth.models import User
from rest_framework.exceptions import AuthenticationFailed
from rest_framework.exceptions import NotFound
from django.db.models.signals import post_save
from django.dispatch import receiver
from .permissions import *
from rest_framework.viewsets import ReadOnlyModelViewSet
from rest_framework.decorators import action

user = get_user_model()


class CustomTokenObtainPairView(TokenObtainPairView):
    serializer_class = CustomTokenObtainPairSerializer


class CommonRegistrationView(APIView):
    permission_classes = [AllowAny]

    def post(self,request,*args,**kwargs):
        serializer = CommonSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            response_data = {
                "status": "success",
                "message": "registered successfully",
            }
            return Response(response_data,status=status.HTTP_200_OK)
        else:
            response_data = {
                "status": "Failed",
                "message": "Invalid registration details",
            }
            return Response(response_data,status=status.HTTP_400_BAD_REQUEST)
        

class UserRegistrationView(viewsets.ModelViewSet):
    queryset = UserReg.objects.all()
    permission_classes = [AllowAny]
    serializer_class = UserRegistrationSerializer
    http_method_names = ['post']
    def create(self,request,*args,**kwargs):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            self.perform_create(serializer)
            response_data = {
                "status": "success",
                "message": "User created successfuly"
            }
            return Response(response_data,status=status.HTTP_200_OK)
        else:
            response_data = {
                "status": "failed",
                "message": "Invalid Details"
            }
            return Response(response_data,status=status.HTTP_400_BAD_REQUEST)




class AddCourseView(viewsets.ModelViewSet):
    queryset = Course.objects.all()
    serializer_class = AddCourseSerializer
    permission_classes = [IsAdminUser] 
    http_method_names = ['post']

    def create(self, request, *args, **kwargs):
        # Check if the user is an admin
        if not request.user.is_superuser:
            return Response({"detail": "You do not have permission to perform this action."}, status=status.HTTP_403_FORBIDDEN)

        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            self.perform_create(serializer)
            response_data = {
                'status': 'success',
                'message': 'Course created successfully'
            }
            return Response(response_data, status=status.HTTP_201_CREATED)  # Use 201 for resource creation
        else:
            response_data = {
                'status': 'failed',
                'errors': serializer.errors  # Include error details for debugging
            }
            return Response(response_data, status=status.HTTP_400_BAD_REQUEST)
        
class AddSemesterView(viewsets.ModelViewSet):
    queryset=Semester.objects.all()
    serializer_class=SemesterSerializer
    permission_classes = [IsAdminUser] 
    http_method_names = ['post']

    def create(self,request,*args,**kwargs):
        if not request.user.is_superuser:
            return Response({"detail": "You do not have permission to perform this action."}, status=status.HTTP_403_FORBIDDEN)
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            self.perform_create(serializer)
            response_data = {
                'status': 'success',
                'message': 'Semester created successfully'
            }
            return Response(response_data, status=status.HTTP_201_CREATED)  # Use 201 for resource creation
        else:
            response_data = {
                'status': 'failed',
                'errors': serializer.errors  # Include error details for debugging
            }
            return Response(response_data, status=status.HTTP_400_BAD_REQUEST)
        
class AddSubjectView(viewsets.ModelViewSet):
    queryset=Subject.objects.all()
    serializer_class=SubjectSerializer
    permission_classes=[IsAdminUser]
    http_method_names=['post']

    def create(self, request, *args, **kwargs):
        if not request.user.is_superuser:
            return Response({"detail": "You do not have permission to perform this action."}, status=status.HTTP_403_FORBIDDEN)
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            self.perform_create(serializer)
            response_data = {
                'status': 'success',
                'message': 'Subject created successfully'
            }
            return Response(response_data, status=status.HTTP_201_CREATED)  # Use 201 for resource creation
        else:
            response_data = {
                'status': 'failed',
                'errors': serializer.errors  # Include error details for debugging
            }
            return Response(response_data, status=status.HTTP_400_BAD_REQUEST)
        


class ViewCourseView(viewsets.ModelViewSet):
    queryset = Course.objects.all()
    serializer_class = AddCourseSerializer
    permission_classes = [AllowAny]

    def  list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)
    

# class ViewSemesterView(viewsets.ModelViewSet):
#     queryset=Semester.objects.all()
#     serializer_class=SemesterSerializer
#     permission_classes=[AllowAny]

#     def list(self, request, *args, **kwargs):
#         course_id=request.data.get('id')
#         course= Course.objects.filter(id=course_id)
#         return super().list(course, *args, **kwargs)


from rest_framework.response import Response
from rest_framework import status

class ViewSemesterView(viewsets.ModelViewSet):
    queryset = Semester.objects.all()
    serializer_class = SemesterSerializer
    permission_classes = [AllowAny]

    def list(self, request, *args, **kwargs):
        # Fetch course_id from query parameters
        course_id = request.query_params.get('id')  # Use query params for GET request
        
        if course_id:
            # Filter semesters based on the course_id
            filtered_semesters = self.queryset.filter(course__id=course_id)
            serializer = self.get_serializer(filtered_semesters, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        else:
            # Return all semesters if no course_id is provided
            return super().list(request, *args, **kwargs)



    
class ViewSubjectView(viewsets.ModelViewSet):
    queryset=Subject.objects.all()
    serializer_class=SubjectSerializer
    permission_classes=[AllowAny]

    def list(self, request, *args, **kwargs):
        # Fetch course_id from query parameters
        semester_id = request.query_params.get('id')  # Use query params for GET request
        
        if semester_id:
            # Filter semesters based on the course_id
            filtered_subjects = self.queryset.filter(semester_id=semester_id)
            serializer = self.get_serializer(filtered_subjects, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        else:
            # Return all semesters if no course_id is provided
            return super().list(request, *args, **kwargs)

class UpdateCourseView(generics.UpdateAPIView):
    serializer_class = EditCourseSerializer
    permission_classes = [IsAdminUser]
    queryset = Course.objects.all()

    def update(self, request, *args, **kwargs):
        token = request.headers.get('Authorization')
        if not token:
            return Response({"detail": "Token is required."}, status=status.HTTP_400_BAD_REQUEST)

        try:
            # Remove 'Bearer ' prefix and validate the token
            token = token.replace('Bearer ','')
            validated_token = UntypedToken(token)
            user = CustomUser.objects.get(id=validated_token['user_id'])

            # Check if the user is an admin
            if not user.is_superuser:  # You can change this to `user.is_staff` if needed
                return Response({"detail": "You do not have permission to perform this action."}, status=status.HTTP_403_FORBIDDEN)

        except (InvalidToken, CustomUser.DoesNotExist):
            return Response({"detail": "Invalid token or user does not exist."}, status=status.HTTP_400_BAD_REQUEST)

        # Retrieve the course_id from the request data
        course_id = request.data.get('course_id')
        if not course_id:
            return Response({"detail": "Course ID is required."}, status=status.HTTP_400_BAD_REQUEST)

        # Fetch the course instance using the provided course_id
        course = get_object_or_404(Course, id=course_id)

        # Update the Course instance with the provided data
        serializer = self.get_serializer(course, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)

        return Response({"detail": "Course updated successfully.", "course": serializer.data}, status=status.HTTP_200_OK)

class UpdateSemesterView(generics.UpdateAPIView):
    serializer_class = SemesterSerializer
    permission_classes = [IsAdminUser]
    queryset = Semester.objects.all()

    def update(self, request, *args, **kwargs):
        # Extract the token
        token = request.headers.get('Authorization')
        if not token:
            return Response({"detail": "Token is required."}, status=status.HTTP_400_BAD_REQUEST)

        try:
            # Validate token
            if not token.startswith('Bearer '):
                raise InvalidToken("Invalid token format")
            token = token.replace('Bearer ', '')

            validated_token = UntypedToken(token)
            user_id = validated_token.get('user_id')
            if not user_id:
                return Response({"detail": "Invalid token."}, status=status.HTTP_400_BAD_REQUEST)

            user = CustomUser.objects.get(id=user_id)

            # Check admin privileges
            if not user.is_superuser:
                return Response({"detail": "You do not have permission to perform this action."},
                                status=status.HTTP_403_FORBIDDEN)

        except InvalidToken:
            return Response({"detail": "Invalid token."}, status=status.HTTP_400_BAD_REQUEST)
        except CustomUser.DoesNotExist:
            return Response({"detail": "User does not exist."}, status=status.HTTP_404_NOT_FOUND)

        # Retrieve and validate the semester instance
        semester_id = request.data.get('semester_id')
        if not semester_id:
            return Response({"detail": "Semester ID is required."}, status=status.HTTP_400_BAD_REQUEST)

        semester = get_object_or_404(Semester, id=semester_id)

        # Update the Semester instance with the provided data
        serializer = self.get_serializer(semester, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)

        return Response({"detail": "Semester updated successfully.", "semester": serializer.data},
                        status=status.HTTP_200_OK)

class UpdateSubjectView(generics.UpdateAPIView):
    serializer_class=SubjectSerializer
    permission_classes=[IsAdminUser]
    queryset=Subject.objects.all()
    def update(self, request, *args, **kwargs):
        # Extract the token
        token = request.headers.get('Authorization')
        if not token:
            return Response({"detail": "Token is required."}, status=status.HTTP_400_BAD_REQUEST)

        try:
            # Validate token
            if not token.startswith('Bearer '):
                raise InvalidToken("Invalid token format")
            token = token.replace('Bearer ', '')

            validated_token = UntypedToken(token)
            user_id = validated_token.get('user_id')
            if not user_id:
                return Response({"detail": "Invalid token."}, status=status.HTTP_400_BAD_REQUEST)

            user = CustomUser.objects.get(id=user_id)

            # Check admin privileges
            if not user.is_superuser:
                return Response({"detail": "You do not have permission to perform this action."},
                                status=status.HTTP_403_FORBIDDEN)

        except InvalidToken:
            return Response({"detail": "Invalid token."}, status=status.HTTP_400_BAD_REQUEST)
        except CustomUser.DoesNotExist:
            return Response({"detail": "User does not exist."}, status=status.HTTP_404_NOT_FOUND)

        # Retrieve and validate the semester instance
        subject_id = request.data.get('subject_id')
        if not subject_id:
            return Response({"detail": "Subject ID is required."}, status=status.HTTP_400_BAD_REQUEST)

        subject = get_object_or_404(Subject, id=subject_id)

        # Update the Semester instance with the provided data
        serializer = self.get_serializer(subject, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)

        return Response({"detail": "Subject updated successfully.", "subject": serializer.data},
                        status=status.HTTP_200_OK)

class ViewCourseReviewView(viewsets.ModelViewSet):
    queryset = Review.objects.all()
    serializer_class = AddCourseSerializer
    permission_classes = [AllowAny]

    def  list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)


class DeleteCourseView(generics.DestroyAPIView):
    queryset = Course.objects.all()
    serializer_class = AddCourseSerializer
    permission_classes = [IsAdminUser] 

    def delete(self, request, *args, **kwargs):
        try:
            # Get the course object based on the provided ID (in the URL)
            course_id = request.data.get('course_id')
            course = get_object_or_404(Course, id=course_id)
            course.delete()  # Perform the deletion
            return Response(
                {
                    "status": "success",
                    "message": "Course deleted successfully."
                },
                status=status.HTTP_200_OK
            )
        except Course.DoesNotExist:
            return Response(
                {
                    "status": "failed",
                    "message": "Course not found."
                },
                status=status.HTTP_404_NOT_FOUND
            )
        except Exception as e:
            return Response(
                {
                    "status": "failed",
                    "message": str(e)
                },
                status=status.HTTP_400_BAD_REQUEST
            )

class DeleteSemesterView(generics.DestroyAPIView):
    queryset=Semester.objects.all()
    serializer_class=SemesterSerializer
    permission_classes=[IsAdminUser]
    def delete(self, request, *args, **kwargs):
        try:
            semester_id= request.data.get('semester_id')
            semester=get_object_or_404(Semester,id=semester_id)
            semester.delete()
            return Response(
                {
                    "status": "success",
                    "message": "Semester deleted successfully."
                },
                status=status.HTTP_200_OK
            )
        except Semester.DoesNotExist:
            return Response(
                {
                    "status": "failed",
                    "message": "Semester not found."
                },
                status=status.HTTP_404_NOT_FOUND
            )
        except Exception as e:
            return Response(
                {
                    "status": "failed",
                    "message": str(e)
                },
                status=status.HTTP_400_BAD_REQUEST
            )

class DeleteSubjectView(generics.DestroyAPIView):
    queryset=Subject.objects.all()
    serializer_class=SubjectSerializer
    permission_classes=[IsAdminUser]
    def delete(self, request, *args, **kwargs):
        try:
            subject_id= request.data.get('subject_id')
            subject=get_object_or_404(Subject,id=subject_id)
            subject.delete()
            return Response(
                {
                    "status": "success",
                    "message": "Subject deleted successfully."
                },
                status=status.HTTP_200_OK
            )
        except Subject.DoesNotExist:
            return Response(
                {
                    "status": "failed",
                    "message": "Subject not found."
                },
                status=status.HTTP_404_NOT_FOUND
            )
        except Exception as e:
            return Response(
                {
                    "status": "failed",
                    "message": str(e)
                },
                status=status.HTTP_400_BAD_REQUEST
            )

class CreateReviewView(generics.CreateAPIView):
    queryset = Review.objects.all()
    serializer_class = ReviewSerializer
    permission_classes = [AllowAny]  # Only authenticated users can add reviews

    def perform_create(self, serializer):
        # Automatically associate the logged-in user with the review
        serializer.save(user=self.request.user)

class AddSubjectView(viewsets.ModelViewSet):
    queryset=Subject.objects.all()
    serializer_class=SubjectSerializer
    permission_classes=[IsAdminUser]
    http_method_names=['post']

    def create(self, request, *args, **kwargs):
        if not request.user.is_superuser:
            return Response({"detail": "You do not have permission to perform this action."}, status=status.HTTP_403_FORBIDDEN)
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            self.perform_create(serializer)
            response_data = {
                'status': 'success',
                'message': 'Subject created successfully'
            }
            return Response(response_data, status=status.HTTP_201_CREATED)  # Use 201 for resource creation
        else:
            response_data = {
                'status': 'failed',
                'errors': serializer.errors  # Include error details for debugging
            }
            return Response(response_data, status=status.HTTP_400_BAD_REQUEST)

class ViewCourseReviewView(viewsets.ModelViewSet):
    queryset = Review.objects.all()
    serializer_class = ViewReviewSerializer
    permission_classes = [AllowAny]

    def list(self, request, *args, **kwargs):
        
        course_id = request.data.get('id')
        review = Review.objects.filter(course_id=course_id)
        return super().list(review, *args, **kwargs)
    


class DeleteReviewView(generics.DestroyAPIView):
    queryset = Review.objects.all()
    serializer_class = ViewReviewSerializer
    permission_classes = [IsAdminUser] 

    def delete(self, request, *args, **kwargs):
        try:
            # Get the course object based on the provided ID (in the URL)
            review_id = request.data.get('review_id')
            review = get_object_or_404(Review, id=review_id)
            review.delete()  # Perform the deletion
            return Response(
                {
                    "status": "success",
                    "message": "Review deleted successfully."
                },
                status=status.HTTP_200_OK
            )
        except Course.DoesNotExist:
            return Response(
                {
                    "status": "failed",
                    "message": "Review not found."
                },
                status=status.HTTP_404_NOT_FOUND
            )
        except Exception as e:
            return Response(
                {
                    "status": "failed",
                    "message": str(e)
                },
                status=status.HTTP_400_BAD_REQUEST
            )
        
# class BrowseCourseView(viewsets.ModelViewSet):
#     queryset=Course.objects.all()
#     serializer_class=AddCourseSerializer
#     permission_classes=[AllowAny]

#     def  list(self, request, *args, **kwargs):
#         name=request.data.get('course_name')

#         if name:
#             course= Course.objects.filter(course_name=name)
#         else:
#             course=Course.objects.all()
#         serializer=self.get_serializer(course, many=True)
#         return Response (serializer.data,status=status.HTTP_200_OK)
    
class BrowseCourseView(viewsets.ModelViewSet):
    queryset = Course.objects.all()
    serializer_class = EditCourseSerializer
    permission_classes = [AllowAny]

    def list(self, request, *args, **kwargs):
        name = request.query_params.get('course_name', None)
        print("Query parameter received:", name)  # Debugging
        
        if name:
            courses = Course.objects.filter(course_name__icontains=name)
            print("Filtered courses:", courses)  # Debugging
        else:
            courses = Course.objects.all()
            print("All courses:", courses)  # Debugging

        serializer = self.get_serializer(courses, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    
# class BrowseCourseView(viewsets.ModelViewSet):
#     queryset = Course.objects.all()
#     serializer_class = EditCourseSerializer
#     permission_classes = [AllowAny]

#     def list(self, request, *args, **kwargs):
#         """
#         Handles course browsing with optional filtering by course name.
#         """
#         course_name = request.query_params.get('course_name', None)

#         if course_name:
#             # Filter courses by name (case-insensitive, partial match)
#             courses = Course.objects.filter(course_name__icontains=course_name)
#             # Debugging statement (can be removed in production)
#             print(f"Filtered courses for name '{course_name}': {courses.count()}")
#         else:
#             # Retrieve all courses
#             courses = self.queryset
#             # Debugging statement (can be removed in production)
#             print(f"All courses count: {courses.count()}")

#         serializer = self.get_serializer(courses, many=True)
#         return Response(serializer.data, status=status.HTTP_200_OK)


    # @action(detail=True, methods=['get'])
    # def semesters(self, request, pk=None):
    #     course = self.get_object()
    #     semesters = Semester.objects.filter(course=course)
    #     serializer = SemesterSerializer(semesters, many=True)
    #     return Response(serializer.data)

    # @action(detail=True, methods=['get'])
    # def subjects(self, request, pk=None):
    #     course = self.get_object()
    #     subjects = Subject.objects.filter(course=course)
    #     serializer = SubjectSerializer(subjects, many=True)
    #     return Response(serializer.data)



