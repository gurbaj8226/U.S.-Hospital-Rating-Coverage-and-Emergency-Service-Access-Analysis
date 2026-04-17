from sqlalchemy import create_engine
from sqlalchemy.engine import URL
from src.config import DB_USERNAME, DB_PASSWORD, DB_HOST, DB_PORT, DB_NAME

def get_engine():
    connection_url = URL.create(
        "mysql+pymysql",
        username=DB_USERNAME,
        password=DB_PASSWORD,
        host=DB_HOST,
        port=int(DB_PORT),
        database=DB_NAME
    )
    return create_engine(connection_url)

def export_dataframe(df, table_name, if_exists="replace"):
    engine = get_engine()
    df.to_sql(
        name=table_name,
        con=engine,
        if_exists=if_exists,
        index=False
    )