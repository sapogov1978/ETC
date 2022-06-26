from django.urls import path
from eth_crawler import views

urlpatterns = [
    path('', views.index, name='index'),
]