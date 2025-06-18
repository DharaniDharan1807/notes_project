# from django.shortcuts import get_object_or_404
# from django.db.models import Q
# from django.contrib.auth.models import User
# from django.contrib.auth import authenticate, login, logout
# from rest_framework import generics, status, permissions
# from rest_framework.views import APIView
# from rest_framework.decorators import api_view, permission_classes
# from rest_framework.response import Response
# from rest_framework.authtoken.models import Token
# from rest_framework.permissions import IsAuthenticated, AllowAny
# from .models import Note, Comment
# from .serializers import (
#     NoteListSerializer, NoteSerializer, NoteCreateSerializer,
#     NoteUpdateSerializer, NoteDeleteSerializer, CommentSerializer,
#     UserSerializer, LoginSerializer
# )

# class IsOwnerOrAdmin(permissions.BasePermission):
#     def has_object_permission(self, request, view, obj):
#         if request.user.is_staff or request.user.is_superuser:
#             return True
#         return request.user == obj.user

# class UserCreateView(generics.CreateAPIView):
#     queryset = User.objects.all()
#     serializer_class = UserSerializer
#     permission_classes = [AllowAny]

#     def perform_create(self, serializer):
#         user = serializer.save()
#         token, created = Token.objects.get_or_create(user=user)
#         login(self.request, user)
#         self.token = token.key

#     def create(self, request, *args, **kwargs):
#         serializer = self.get_serializer(data=request.data)
#         serializer.is_valid(raise_exception=True)
#         self.perform_create(serializer)
#         headers = self.get_success_headers(serializer.data)
#         return Response({
#             'user': {'id': serializer.instance.id, 'username': serializer.data['username']},
#             'token': self.token,
#             'message': 'User created successfully'
#         }, status=status.HTTP_201_CREATED, headers=headers)

# class LoginView(generics.GenericAPIView):
#     serializer_class = LoginSerializer
#     permission_classes = [AllowAny]

#     def post(self, request, *args, **kwargs):
#         serializer = self.get_serializer(data=request.data)
#         serializer.is_valid(raise_exception=True)
#         user = serializer.validated_data['user']
#         token, created = Token.objects.get_or_create(user=user)
#         login(request, user)
#         return Response({
#             'token': token.key,
#             'user': {'id': user.id, 'username': user.username},
#             'message': 'Login successful'
#         }, status=status.HTTP_200_OK)

# @api_view(["POST"])
# @permission_classes([IsAuthenticated])
# def logout_view(request):
#     request.user.auth_token.delete()
#     logout(request)
#     return Response({"message": "Logout successful"}, status=status.HTTP_200_OK)

# @api_view(["GET"])
# @permission_classes([IsAuthenticated])
# def user_profile(request):
#     return Response(UserSerializer(request.user).data)

# class NoteListCreateView(generics.ListCreateAPIView):
#     serializer_class = NoteListSerializer
#     permission_classes = [IsAuthenticated]

#     def get_queryset(self):
#         user = self.request.user
#         queryset = Note.objects.filter(user=user)
#         # Search functionality
#         search = self.request.query_params.get("search", None)
#         if search:
#             queryset = queryset.filter(
#                 Q(title__icontains=search) | Q(content__icontains=search)
#             )
#         # Filtering by title and is_page
#         title = self.request.query_params.get('title', None)
#         is_page = self.request.query_params.get('is_page', None)
#         if title is not None:
#             queryset = queryset.filter(title=title)
#         if is_page is not None:
#             queryset = queryset.filter(is_page=is_page.lower() == 'true')
#         return queryset.order_by('-last_modified')

#     def get_serializer_class(self):
#         if self.request.method == 'POST':
#             return NoteCreateSerializer
#         return NoteListSerializer

#     def perform_create(self, serializer):
#         serializer.save(user=self.request.user)

#     def create(self, request, *args, **kwargs):
#         serializer = self.get_serializer(data=request.data)
#         if not serializer.is_valid():
#             print("Serializer errors:", serializer.errors)  # Log errors
#             return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
#         self.perform_create(serializer)
#         headers = self.get_success_headers(serializer.data)
#         return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

# class NoteRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
#     serializer_class = NoteSerializer
#     permission_classes = [IsAuthenticated, IsOwnerOrAdmin]

#     def get_queryset(self):
#         return Note.objects.filter(user=self.request.user)

#     def get_serializer_class(self):
#         if self.request.method in ['PUT', 'PATCH']:
#             return NoteUpdateSerializer
#         elif self.request.method == 'DELETE':
#             return NoteDeleteSerializer
#         return NoteSerializer

#     def update(self, request, *args, **kwargs):
#         instance = self.get_object()
#         serializer = self.get_serializer(instance, data=request.data, partial=True)
#         if serializer.is_valid():
#             serializer.save()
#             return Response({
#                 "message": "Note updated successfully",
#                 "note": NoteSerializer(instance, context={'request': request}).data
#             }, status=status.HTTP_200_OK)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#     def destroy(self, request, *args, **kwargs):
#         instance = self.get_object()
#         serializer = self.get_serializer(data=request.data)
#         serializer.is_valid(raise_exception=True)
#         note_title = instance.title
#         instance.delete()
#         return Response({
#             "message": f'Note "{note_title}" deleted successfully'
#         }, status=status.HTTP_200_OK)

# class CommentListCreateView(generics.ListCreateAPIView):
#     serializer_class = CommentSerializer
#     permission_classes = [IsAuthenticated]

#     def get_queryset(self):
#         note_id = self.kwargs['note_id']
#         return Comment.objects.filter(note_id=note_id, note__user=self.request.user)

#     def perform_create(self, serializer):
#         note_id = self.kwargs['note_id']
#         note = get_object_or_404(Note, id=note_id, user=self.request.user)
#         serializer.save(user=self.request.user, note=note)

# class CommentDetailView(generics.RetrieveUpdateDestroyAPIView):
#     serializer_class = CommentSerializer
#     permission_classes = [IsAuthenticated]

#     def get_queryset(self):
#         return Comment.objects.filter(user=self.request.user)

#     def update(self, request, *args, **kwargs):
#         instance = self.get_object()
#         if instance.user != request.user:
#             return Response({"detail": "Not allowed"}, status=status.HTTP_403_FORBIDDEN)
#         serializer = self.get_serializer(instance, data=request.data, partial=True)
#         if serializer.is_valid():
#             serializer.save()
#             return Response(serializer.data)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#     def destroy(self, request, *args, **kwargs):
#         instance = self.get_object()
#         if instance.user != request.user:
#             return Response({"detail": "Not allowed"}, status=status.HTTP_403_FORBIDDEN)
#         instance.delete()
#         return Response(status=status.HTTP_204_NO_CONTENT)

# @api_view(["POST"])
# @permission_classes([IsAuthenticated])
# def toggle_note_sharing(request, note_id):
#     note = get_object_or_404(Note, id=note_id, user=request.user)
#     note.is_shared = not note.is_shared
#     note.save()
#     return Response({
#         "is_shared": note.is_shared,
#         "message": "Note sharing updated successfully"
#     })

# @api_view(["GET"])
# @permission_classes([IsAuthenticated])
# def dashboard_stats(request):
#     user_notes = Note.objects.filter(user=request.user)
#     stats = {
#         "total_notes": user_notes.count(),
#         "total_words": sum(note.word_count for note in user_notes),
#         "total_characters": sum(note.character_count for note in user_notes),
#         "shared_notes": user_notes.filter(is_shared=True).count(),
#         "recent_notes": NoteSerializer(
#             user_notes[:5], many=True, context={"request": request}
#         ).data,
#     }
#     return Response(stats)



from rest_framework import generics, permissions, status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from rest_framework.pagination import LimitOffsetPagination
from django.shortcuts import get_object_or_404
from django.db.models import Q
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from .models import Note, Comment
from .serializers import (
    UserCreateSerializer, UserSerializer, LoginSerializer,
    CommentSerializer, NoteSerializer, NoteListSerializer,
    NoteCreateSerializer, NoteUpdateSerializer, NoteDeleteSerializer
)

# Custom Pagination
class CustomLimitOffsetPagination(LimitOffsetPagination):
    default_limit = 20  # Fetch 20 notes at a time
    max_limit = 100

# Custom Permission
class IsOwnerOrAdmin(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        if request.user.is_staff or request.user.is_superuser:
            return True
        return request.user == obj.user

# Authentication Views
class UserCreateView(generics.CreateAPIView):
    queryset = User.objects.all()
    serializer_class = UserCreateSerializer
    permission_classes = [permissions.AllowAny]

    def perform_create(self, serializer):
        user = serializer.save()
        token, created = Token.objects.get_or_create(user=user)
        login(self.request, user)
        self.token = token.key
        self.request.user = user

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response({
            'user': {'id': serializer.instance.id, 'username': serializer.data['username']},
            'token': self.token,
            'message': 'User created successfully'
        }, status=status.HTTP_201_CREATED, headers=headers)

class LoginView(generics.GenericAPIView):
    serializer_class = LoginSerializer
    permission_classes = [permissions.AllowAny]

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        token, created = Token.objects.get_or_create(user=user)
        login(request, user)
        return Response({
            'token': token.key,
            'user': {'id': user.id, 'username': user.username},
            'message': 'Login successful'
        }, status=status.HTTP_200_OK)

# class LogoutView(APIView):
#     permission_classes = [permissions.IsAuthenticated]

#     def post(self, request):
#         request.user.auth_token.delete()
#         logout(request)
#         return Response({"message": "Logout successful"}, status=status.HTTP_200_OK)
class LogoutView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request):
        request.user.auth_token.delete()
        logout(request)
        return Response({"message": "Logout successful"}, status=status.HTTP_200_OK)

class UserProfileView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request):
        return Response(UserSerializer(request.user).data)

# Note Views
class NoteListCreateView(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = NoteListSerializer
    pagination_class = CustomLimitOffsetPagination

    def get_queryset(self):
        user = self.request.user
        queryset = Note.objects.filter(user=user)
        # Search functionality
        search = self.request.query_params.get("search", None)
        if search:
            queryset = queryset.filter(
                Q(title__icontains=search) | Q(content__icontains=search)
            )
        # Filtering by title and is_page
        title = self.request.query_params.get('title', None)
        is_page = self.request.query_params.get('is_page', None)
        if title is not None:
            queryset = queryset.filter(title=title)
        if is_page is not None:
            queryset = queryset.filter(is_page=is_page.lower() == 'true')
        return queryset.order_by('-last_modified')

    def get_serializer_class(self):
        if self.request.method == 'POST':
            return NoteCreateSerializer
        return NoteListSerializer

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if not serializer.is_valid():
            print("Serializer errors:", serializer.errors)  # Log errors
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

class NoteDetailView(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [permissions.IsAuthenticated, IsOwnerOrAdmin]
    serializer_class = NoteSerializer
    lookup_field = 'id'

    def get_queryset(self):
        return Note.objects.filter(user=self.request.user)

    def get_serializer_class(self):
        if self.request.method in ['PUT', 'PATCH']:
            return NoteUpdateSerializer
        elif self.request.method == 'DELETE':
            return NoteDeleteSerializer
        return NoteSerializer

    def update(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response({
                "message": "Note updated successfully",
                "note": NoteSerializer(instance, context={'request': request}).data
            }, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        note_title = instance.title
        instance.delete()
        return Response({
            "message": f'Note "{note_title}" deleted successfully'
        }, status=status.HTTP_200_OK)

# Comment Views
class CommentListCreateView(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = CommentSerializer

    def get_queryset(self):
        note_id = self.kwargs.get('note_id')
        return Comment.objects.filter(note_id=note_id, note__user=self.request.user)

    def perform_create(self, serializer):
        note_id = self.kwargs['note_id']
        note = get_object_or_404(Note, id=note_id, user=self.request.user)
        serializer.save(user=self.request.user, note=note)

class CommentDetailView(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = CommentSerializer
    lookup_field = 'id'

    def get_queryset(self):
        note_id = self.kwargs.get('note_id')
        return Comment.objects.filter(note_id=note_id, note__user=self.request.user)

    def update(self, request, *args, **kwargs):
        instance = self.get_object()
        if instance.user != request.user:
            return Response({"detail": "Not allowed"}, status=status.HTTP_403_FORBIDDEN)
        serializer = self.get_serializer(instance, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        if instance.user != request.user:
            return Response({"detail": "Not allowed"}, status=status.HTTP_403_FORBIDDEN)
        instance.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

# Additional Views
class ToggleNoteSharingView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request, note_id):
        note = get_object_or_404(Note, id=note_id, user=request.user)
        note.is_shared = not note.is_shared
        note.save()
        return Response({
            "is_shared": note.is_shared,
            "message": "Note sharing updated successfully"
        })

class DashboardStatsView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request):
        user_notes = Note.objects.filter(user=request.user)
        stats = {
            "total_notes": user_notes.count(),
            "total_words": sum(note.word_count for note in user_notes),
            "total_characters": sum(note.character_count for note in user_notes),
            "shared_notes": user_notes.filter(is_shared=True).count(),
            "recent_notes": NoteSerializer(
                user_notes[:5], many=True, context={"request": request}
            ).data,
        }
        return Response(stats)