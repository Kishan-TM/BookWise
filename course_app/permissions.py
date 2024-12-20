from rest_framework import permissions

class IsAdminOrReadOnly(permissions.BasePermission):
    """
    Custom permission to only allow admins to edit an object.
    """

    def has_permission(self, request, view):
        # Allow all users to read
        if request.method in permissions.SAFE_METHODS:
            return True
        # Allow admins to edit
        return request.user and request.user.is_staff
