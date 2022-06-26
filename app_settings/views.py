from django.shortcuts import render
from django.http import HttpResponse
from .forms import FirstRequest
import requests
from bs4 import BeautifulSoup


def index(request):
    if request.method == "POST":
        wallet = request.POST.get("wallet")
        st_block = request.POST.get("st_block")
        api_key = "78YX364M8GS8XQ6TH3MGPXBV24PRQUXPB7"
        url = 'https://api.etherscan.io/api?module=account&action=txlist&address=' + wallet + '&startblock=' + st_block + '&endblock=&page=&offset=&sort=asc&apikey=' + api_key
        api_response = requests.get(url)
        soup = BeautifulSoup(api_response.text, 'xml')
#        blocks = soup.findALL('{/"blockNumber/"')
        
        return HttpResponse(api_response.text)
    else:
        userform = FirstRequest()
        return render(request, "index.html", {"form": userform})