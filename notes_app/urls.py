# from django.urls import path
# from .views import (
#     NoteListCreateView, NoteDetailView, CommentListCreateView,
#     CommentDetailView, UserCreateView, LoginView, LogoutView, UserProfile,
#     toggle_note_sharing, dashboard_stats
# )

# urlpatterns = [
#     path('notes/', NoteListCreateView.as_view(), name='note-list-create'),
#     path('notes/<int:pk>/', NoteDetailView.as_view(), name='note-detail'),
#     path('notes/<int:note_id>/comments/', CommentListCreateView.as_view(), name='comment-list-create'),
#     path('comments/<int:pk>/', CommentDetailView.as_view(), name='comment-detail'),
#     path('signup/', UserCreateView.as_view(), name='signup'),
#     path('login/', LoginView.as_view(), name='login'),
#     path('logout/', LogoutView, name='logout'),
#     path('profile/', UserProfile, name='user-profile'),
#     path('notes/<int:note_id>/toggle-sharing/', toggle_note_sharing, name='toggle-note-sharing'),
#     path('dashboard-stats/', dashboard_stats, name='dashboard-stats'),
# ]


from django.urls import path
from .views import (
    NoteListCreateView, NoteDetailView, CommentListCreateView,
    CommentDetailView, UserCreateView, LoginView, LogoutView, UserProfileView,  # Updated to UserProfileView
    ToggleNoteSharingView, DashboardStatsView  # Updated to class-based views
)

urlpatterns = [
    path('notes/', NoteListCreateView.as_view(), name='note-list-create'),
    path('notes/<int:pk>/', NoteDetailView.as_view(), name='note-detail'),
    path('notes/<int:note_id>/comments/', CommentListCreateView.as_view(), name='comment-list-create'),
    path('comments/<int:pk>/', CommentDetailView.as_view(), name='comment-detail'),
    path('signup/', UserCreateView.as_view(), name='signup'),
    path('login/', LoginView.as_view(), name='login'),
    path('logout/', LogoutView.as_view(), name='logout'),  # Added .as_view()
    path('profile/', UserProfileView.as_view(), name='user-profile'),  # Updated to UserProfileView
    path('notes/<int:note_id>/toggle-sharing/', ToggleNoteSharingView.as_view(), name='toggle-note-sharing'),  # Updated to ToggleNoteSharingView
    path('dashboard-stats/', DashboardStatsView.as_view(), name='dashboard-stats'),  # Updated to DashboardStatsView
]