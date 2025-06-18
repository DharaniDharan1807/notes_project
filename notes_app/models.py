

# from django.db import models
# from django.contrib.auth.models import User
# from django.utils import timezone

# class Note(models.Model):
#     user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='notes')
#     title = models.CharField(max_length=255)
#     content = models.TextField(blank=True)
#     # is_page = models.BooleanField(default=False)
#     is_shared = models.BooleanField(default=False)
#     last_modified = models.DateTimeField(auto_now=True)
#     created_at = models.DateTimeField(auto_now_add=True)
#     # category = models.CharField(max_length=100, default='Uncategorized')  # Add category field

#     def __str__(self):
#         return self.title

#     @property
#     def word_count(self):
#         if self.content:
#             return len(self.content.split())
#         return 0
    
#     @property
#     def character_count(self):
#         return len(self.content) if self.content else 0

# class Comment(models.Model):
#     note = models.ForeignKey(Note, on_delete=models.CASCADE, related_name='comments')
#     user = models.ForeignKey(User, on_delete=models.CASCADE)
#     text = models.TextField()
#     created_at = models.DateTimeField(auto_now_add=True)
    
#     class Meta:
#         ordering = ['-created_at']
    
#     def __str__(self):
#         return f"Comment by {self.user.username} on {self.note.title}"


from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone

class Note(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='notes')
    title = models.CharField(max_length=255)
    content = models.TextField(blank=True)
    is_page = models.BooleanField(default=False)
    is_shared = models.BooleanField(default=False)
    last_modified = models.DateTimeField(auto_now=True)
    created_at = models.DateTimeField(auto_now_add=True)
    #category = models.CharField(max_length=100, default='Uncategorized')

    def __str__(self):
        return self.title

    @property
    def word_count(self):
        if self.content:
            return len(self.content.split())
        return 0
    
    @property
    def character_count(self):
        return len(self.content) if self.content else 0

class Comment(models.Model):
    note = models.ForeignKey(Note, on_delete=models.CASCADE, related_name='comments')
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    text = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        ordering = ['-created_at']
    
    def __str__(self):
        return f"Comment by {self.user.username} on {self.note.title}"