


# from rest_framework import serializers
# from django.contrib.auth.models import User
# from django.contrib.auth import authenticate
# from django.utils import timezone
# from .models import Note, Comment

# # Serializer for user creation (signup)
# class UserCreateSerializer(serializers.ModelSerializer):
#     password = serializers.CharField(write_only=True)

#     class Meta:
#         model = User
#         fields = ['username', 'password']

#     def create(self, validated_data):
#         user = User.objects.create_user(
#             username=validated_data['username'],
#             password=validated_data['password']
#         )
#         return user

# # Serializer for displaying user info
# class UserSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = User
#         fields = ['id', 'username']

# class LoginSerializer(serializers.Serializer):
#     username = serializers.CharField()
#     password = serializers.CharField()

#     def validate(self, data):
#         username = data.get('username')
#         password = data.get('password')

#         if username and password:
#             user = authenticate(username=username, password=password)
#             if user:
#                 if user.is_active:
#                     data['user'] = user
#                 else:
#                     raise serializers.ValidationError('User account is disabled.')
#             else:
#                 raise serializers.ValidationError('Invalid credentials.')
#         else:
#             raise serializers.ValidationError('Must include username and password.')

#         return data

# class CommentSerializer(serializers.ModelSerializer):
#     user = UserSerializer(read_only=True)
#     author = serializers.ReadOnlyField(source='user.username')

#     class Meta:
#         model = Comment
#         fields = ['id', 'note', 'user', 'author', 'text', 'created_at']
#         read_only_fields = ['id', 'user', 'author', 'created_at']

# class NoteCreateSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Note
#         fields = ['id', 'title', 'content', 'is_page', 'is_shared', 'category', 'created_at', 'last_modified']
#         read_only_fields = ['id', 'created_at', 'last_modified']

#     def validate_title(self, value):
#         if not value.strip():
#             raise serializers.ValidationError("Title cannot be empty.")
#         return value.strip()

#     def validate_content(self, value):
#         if value and not value.strip():
#             raise serializers.ValidationError("Content cannot be empty.")
#         return value.strip() if value else value

# class NoteUpdateSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Note
#         fields = ['title', 'content', 'is_page', 'is_shared', 'category']

#     def validate_title(self, value):
#         if value is not None and not value.strip():
#             raise serializers.ValidationError("Title cannot be empty.")
#         return value.strip() if value else value

#     def validate_content(self, value):
#         if value is not None and not value.strip():
#             raise serializers.ValidationError("Content cannot be empty.")
#         return value.strip() if value else value

#     def update(self, instance, validated_data):
#         instance.title = validated_data.get('title', instance.title)
#         instance.content = validated_data.get('content', instance.content)
#         instance.category = validated_data.get('category', instance.category)
#         instance.is_page = validated_data.get('is_page', instance.is_page)
#         instance.is_shared = validated_data.get('is_shared', instance.is_shared)
#         instance.save()  # last_modified is updated automatically
#         return instance

# class NoteSerializer(serializers.ModelSerializer):
#     title = serializers.CharField(max_length=255, required=True)
#     user = UserSerializer(read_only=True)
#     comments = CommentSerializer(many=True, read_only=True)
#     comments_count = serializers.SerializerMethodField()
#     word_count = serializers.ReadOnlyField()
#     character_count = serializers.ReadOnlyField()
#     time_ago = serializers.SerializerMethodField()
#     can_edit = serializers.SerializerMethodField()
#     can_delete = serializers.SerializerMethodField()
#     is_owner = serializers.SerializerMethodField()

#     class Meta:
#         model = Note
#         fields = [
#             'id', 'title', 'content', 'user', 'category', 'is_page', 'is_shared',
#             'created_at', 'last_modified', 'comments', 'comments_count', 'word_count',
#             'character_count', 'time_ago', 'can_edit', 'can_delete', 'is_owner'
#         ]
#         read_only_fields = ['id', 'created_at', 'last_modified', 'user', 'word_count', 'character_count']

#     def get_comments_count(self, obj):
#         return obj.comments.count()

#     def get_time_ago(self, obj):
#         now = timezone.now()
#         diff = now - obj.last_modified

#         if diff.days > 0:
#             return f"Updated {diff.days} day{'s' if diff.days > 1 else ''} ago"
#         elif diff.seconds > 3600:
#             hours = diff.seconds // 3600
#             return f"Updated {hours} hour{'s' if hours > 1 else ''} ago"
#         elif diff.seconds > 60:
#             minutes = diff.seconds // 60
#             return f"Updated {minutes} minute{'s' if minutes > 1 else ''} ago"
#         else:
#             return "Just updated"

#     def get_can_edit(self, obj):
#         request = self.context.get('request')
#         return (
#             request
#             and request.user
#             and (request.user == obj.user or request.user.is_staff)
#         )

#     def get_can_delete(self, obj):
#         request = self.context.get('request')
#         return (
#             request
#             and request.user
#             and (request.user == obj.user or request.user.is_staff)
#         )

#     def get_is_owner(self, obj):
#         request = self.context.get('request')
#         return request and request.user and request.user == obj.user

# class NoteListSerializer(serializers.ModelSerializer):
#     user = serializers.StringRelatedField()
#     comments_count = serializers.SerializerMethodField()
#     word_count = serializers.ReadOnlyField()
#     time_ago = serializers.SerializerMethodField()
#     can_edit = serializers.SerializerMethodField()
#     can_delete = serializers.SerializerMethodField()

#     class Meta:
#         model = Note
#         fields = [
#             'id', 'title', 'user', 'category', 'is_page', 'is_shared',
#             'created_at', 'last_modified', 'comments_count', 'word_count',
#             'time_ago', 'can_edit', 'can_delete'
#         ]
#         read_only_fields = ['id', 'created_at', 'last_modified', 'user', 'word_count']

#     def get_comments_count(self, obj):
#         return obj.comments.count()

#     def get_time_ago(self, obj):
#         now = timezone.now()
#         diff = now - obj.last_modified

#         if diff.days > 0:
#             return f"{diff.days}d ago"
#         elif diff.seconds > 3600:
#             hours = diff.seconds // 3600
#             return f"{hours}h ago"
#         elif diff.seconds > 60:
#             minutes = diff.seconds // 60
#             return f"{minutes}m ago"
#         else:
#             return "Just now"

#     def get_can_edit(self, obj):
#         request = self.context.get('request')
#         return (
#             request
#             and request.user
#             and (request.user == obj.user or request.user.is_staff)
#         )

#     def get_can_delete(self, obj):
#         request = self.context.get('request')
#         return (
#             request
#             and request.user
#             and (request.user == obj.user or request.user.is_staff)
#         )

# class NoteDeleteSerializer(serializers.Serializer):
#     confirm_delete = serializers.BooleanField(default=False)

#     def validate_confirm_delete(self, value):
#         if not value:
#             raise serializers.ValidationError(
#                 "Please confirm deletion by setting confirm_delete to true."
#             )
#         return value

from rest_framework import serializers
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from django.utils import timezone
from .models import Note, Comment

CATEGORIES = ['Programming', 'Ideas', 'Personal', 'Work']

class UserCreateSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = User
        fields = ['username', 'password']

    def create(self, validated_data):
        user = User.objects.create_user(
            username=validated_data['username'],
            password=validated_data['password']
        )
        return user

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username']

class LoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()

    def validate(self, data):
        username = data.get('username')
        password = data.get('password')

        if username and password:
            user = authenticate(username=username, password=password)
            if user:
                if user.is_active:
                    data['user'] = user
                else:
                    raise serializers.ValidationError('User account is disabled.')
            else:
                raise serializers.ValidationError('Invalid credentials.')
        else:
            raise serializers.ValidationError('Must include username and password.')

        return data

class CommentSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True)
    author = serializers.ReadOnlyField(source='user.username')

    class Meta:
        model = Comment
        fields = ['id', 'note', 'user', 'author', 'text', 'created_at']
        read_only_fields = ['id', 'user', 'author', 'created_at']

class NoteCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Note
        fields = ['id', 'title', 'content', 'is_page', 'is_shared', 'category', 'created_at', 'last_modified']
        read_only_fields = ['id', 'created_at', 'last_modified']

    def validate_title(self, value):
        if not value.strip():
            raise serializers.ValidationError("Title cannot be empty.")
        return value.strip()

    def validate_content(self, value):
        if value and not value.strip():
            raise serializers.ValidationError("Content cannot be empty.")
        return value.strip() if value else value

    def validate_category(self, value):
        if value and value not in CATEGORIES and value != 'Uncategorized':
            raise serializers.ValidationError(f"Category must be one of: {', '.join(CATEGORIES + ['Uncategorized'])}")
        return value

class NoteUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Note
        fields = ['title', 'content', 'is_page', 'is_shared', 'category']

    def validate_title(self, value):
        if value is not None and not value.strip():
            raise serializers.ValidationError("Title cannot be empty.")
        return value.strip() if value else value

    def validate_content(self, value):
        if value is not None and not value.strip():
            raise serializers.ValidationError("Content cannot be empty.")
        return value.strip() if value else value

    def validate_category(self, value):
        if value and value not in CATEGORIES and value != 'Uncategorized':
            raise serializers.ValidationError(f"Category must be one of: {', '.join(CATEGORIES + ['Uncategorized'])}")
        return value

    def update(self, instance, validated_data):
        instance.title = validated_data.get('title', instance.title)
        instance.content = validated_data.get('content', instance.content)
        instance.category = validated_data.get('category', instance.category)
        instance.is_page = validated_data.get('is_page', instance.is_page)
        instance.is_shared = validated_data.get('is_shared', instance.is_shared)
        instance.save()
        return instance

class NoteSerializer(serializers.ModelSerializer):
    title = serializers.CharField(max_length=255, required=True)
    user = UserSerializer(read_only=True)
    comments = CommentSerializer(many=True, read_only=True)
    comments_count = serializers.SerializerMethodField()
    word_count = serializers.ReadOnlyField()
    character_count = serializers.ReadOnlyField()
    time_ago = serializers.SerializerMethodField()
    can_edit = serializers.SerializerMethodField()
    can_delete = serializers.SerializerMethodField()
    is_owner = serializers.SerializerMethodField()

    class Meta:
        model = Note
        fields = [
            'id', 'title', 'content', 'user', 'category', 'is_page', 'is_shared',
            'created_at', 'last_modified', 'comments', 'comments_count', 'word_count',
            'character_count', 'time_ago', 'can_edit', 'can_delete', 'is_owner'
        ]
        read_only_fields = ['id', 'created_at', 'last_modified', 'user', 'word_count', 'character_count']

    def get_comments_count(self, obj):
        return obj.comments.count()

    def get_time_ago(self, obj):
        now = timezone.now()
        diff = now - obj.last_modified

        if diff.days > 0:
            return f"Updated {diff.days} day{'s' if diff.days > 1 else ''} ago"
        elif diff.seconds > 3600:
            hours = diff.seconds // 3600
            return f"Updated {hours} hour{'s' if hours > 1 else ''} ago"
        elif diff.seconds > 60:
            minutes = diff.seconds // 60
            return f"Updated {minutes} minute{'s' if minutes > 1 else ''} ago"
        else:
            return "Just updated"

    def get_can_edit(self, obj):
        request = self.context.get('request')
        return (
            request
            and request.user
            and (request.user == obj.user or request.user.is_staff)
        )

    def get_can_delete(self, obj):
        request = self.context.get('request')
        return (
            request
            and request.user
            and (request.user == obj.user or request.user.is_staff)
        )

    def get_is_owner(self, obj):
        request = self.context.get('request')
        return request and request.user and request.user == obj.user

class NoteListSerializer(serializers.ModelSerializer):
    user = serializers.StringRelatedField()
    comments_count = serializers.SerializerMethodField()
    word_count = serializers.ReadOnlyField()
    time_ago = serializers.SerializerMethodField()
    can_edit = serializers.SerializerMethodField()
    can_delete = serializers.SerializerMethodField()

    class Meta:
        model = Note
        fields = [
            'id', 'title', 'user', 'category', 'is_page', 'is_shared',
            'created_at', 'last_modified', 'comments_count', 'word_count',
            'time_ago', 'can_edit', 'can_delete'
        ]
        read_only_fields = ['id', 'created_at', 'last_modified', 'user', 'word_count']

    def get_comments_count(self, obj):
        return obj.comments.count()

    def get_time_ago(self, obj):
        now = timezone.now()
        diff = now - obj.last_modified

        if diff.days > 0:
            return f"{diff.days}d ago"
        elif diff.seconds > 3600:
            hours = diff.seconds // 3600
            return f"{hours}h ago"
        elif diff.seconds > 60:
            minutes = diff.seconds // 60
            return f"{minutes}m ago"
        else:
            return "Just now"

    def get_can_edit(self, obj):
        request = self.context.get('request')
        return (
            request
            and request.user
            and (request.user == obj.user or request.user.is_staff)
        )

    def get_can_delete(self, obj):
        request = self.context.get('request')
        return (
            request
            and request.user
            and (request.user == obj.user or request.user.is_staff)
        )

class NoteDeleteSerializer(serializers.Serializer):
    confirm_delete = serializers.BooleanField(default=False)

    def validate_confirm_delete(self, value):
        if not value:
            raise serializers.ValidationError(
                "Please confirm deletion by setting confirm_delete to true."
            )
        return value