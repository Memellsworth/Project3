import os
from zipfile import ZipFile

import numpy as np
import pandas as pd
from sqlalchemy import create_engine

from config import db_user, db_password, db_host, db_port, db_name

data_path = os.path.join("data")

def extract():
    if os.path.exists(os.path.join(data_path, "2022_delays.csv")):
        print("Data present skipping extraction ⏩")
    else:
        print(f"Extraction from {data_path} complete ✅")

def transform():
    delays_df = pd.read_csv(os.path.join(data_path, "2022_delays.csv"), index_col="id")
    # Add the year column
    delays_df.drop(index=delays_df[delays_df["year"] == 2022].index, inplace=True)

# Generate the "mean" for delays
    delays_df_cleaned = delays_df[[
        'carrier_name',
        'carrier_delay',
        'arr_delay',
        'weather_delay',
        'nas_delay',
        'security_delay',
        'late_aircraft_delay'
    ]].groupby("carrier_name").agg(["mean"])
    delays_df_cleaned.columns = [f"{column[0]}_{column[1]}" if type(column) is tuple else column for column in
                          delays_df_cleaned.columns]
    
# Generate the "min", "max" for weather delays
    delays_df_cleaned_1 = delays_df[[
        'month',
        'weather_delay'
    ]].groupby("month").agg(["max", "mean"])
    delays_df_cleaned_1.columns = [f"{column[0]}_{column[1]}" if type(column) is tuple else column for column in
                          delays_df_cleaned_1.columns] 


    print(f"Transformation complete ✅")  

    return delays_df 

def load(df, table_name):
    engine = create_engine(f"postgresql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}")
    connection = engine.connect()
    df.to_sql(table_name, connection, if_exists="replace")
    print(f"Loading into {db_name}.{table_name} complete ✅")