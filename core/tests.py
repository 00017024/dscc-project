import pytest
from django.test import TestCase
from django.contrib.auth.models import User
from .models import Post, Tag


@pytest.mark.django_db
def test_user_creation():
    user = User.objects.create_user(username="testuser", password="pass123")
    assert user.username == "testuser"


@pytest.mark.django_db
def test_post_creation():
    user = User.objects.create_user(username="author", password="pass123")
    post = Post.objects.create(title="Test Post", content="Content", author=user)
    assert post.title == "Test Post"


@pytest.mark.django_db
def test_tag_relationship():
    user = User.objects.create_user(username="author2", password="pass123")
    post = Post.objects.create(title="Tagged Post", content="Content", author=user)
    tag = Tag.objects.create(name="Django")
    post.tags.add(tag)
    assert tag in post.tags.all()


@pytest.mark.django_db
def test_post_list_view(client):
    response = client.get("/posts/")
    assert response.status_code == 200


@pytest.mark.django_db
def test_login_view(client):
    response = client.get("/accounts/login/")
    assert response.status_code == 200
