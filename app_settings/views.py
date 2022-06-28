from django.shortcuts import render
from django.http import HttpResponse
from .forms import FirstRequest
import requests
import pandas as pd
from sqlalchemy import create_engine
import os

def parse(text_srcs):
    if text_srcs[0] == "1":
        blocks = dict(text_srcs[2])
        conn = create_engine('postgresql+psycopg2://' + os.environ.get('POSTGRES_USER') + ':' + os.environ.get('POSTGRES_PASSWORD') + '@db:5432/postgres')
        df = pd.DataFrame(blocks)
        df.to_sql('Blocks', conn, if_exists='replace', index=False)

def index(request):
    if request.method == "POST":
        wallet = request.POST.get("wallet")
        st_block = request.POST.get("st_block")
        api_key = "78YX364M8GS8XQ6TH3MGPXBV24PRQUXPB7"
        url = 'https://api.etherscan.io/api?module=account&action=txlist&address=' + wallet + '&startblock=' + st_block + '&endblock=&page=&offset=&sort=asc&apikey=' + api_key
        api_response = requests.get(url)
        parse(api_response.text)
        return HttpResponse(api_response.text)
    else:
        userform = FirstRequest()
        return render(request, "index.html", {"form": userform})