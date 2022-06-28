import pandas as pd
from sqlalchemy import create_engine
import os

def parse(text_srcs):
    if text_srcs["status"] == "1":
        blocks = dict(text_srcs["result"])
        conn = create_engine('postgresql+psycopg2://' + os.environ.get('POSTGRES_USER') + ':' + os.environ.get('POSTGRES_PASSWORD') + '@db:5432/postgres')
        df = pd.DataFrame(blocks)
        df.to_sql('Blocks', conn, if_exists='replace', index=False)