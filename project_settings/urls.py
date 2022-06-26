from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('eth_crawler/', include('eth_crawler.urls')),
    path('admin/', admin.site.urls),
]