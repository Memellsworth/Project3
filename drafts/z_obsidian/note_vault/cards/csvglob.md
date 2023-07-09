# Importing All of Texas flight delay info into dataframe

### Dependencies
```python
import pandas as pd
import os
import glob
import csv
```

### Glob Importer
```python
# IMPORT FILE PATHS
active_project = "../../../Project3/drafts/rawdata/texas2022/"
csv_output = "../../../Project3/drafts/alberto/texas_2022_delays.csv"
file_paths = glob.glob(os.path.join(active_project, "*.csv"))
```

##### Dataframes out of every csv
```python
# setting up the list for all raw dfs
all_df = []
# listing turning movement counts as current
current_csv_list = []
for file in file_paths:
    current_csv_list.append(file)

# function to read all csvs listed
def read_csv(file_path):
    try:
        imp_df = pd.read_csv(file_path,
                             sep='delimiter',
                             header=None,
                             engine='python'
                            )
        return imp_df #imp_df as in imported dataframe
    except pd.errors.ParserError as e:
        return (file_path, f"Error parsing CSV: {str(e)}")  # Return tuple with file path and error message
    except FileNotFoundError:
        return (file_path, "File not found")  # Return tuple with file path and error message
```

error handling 
```python 
## validating dataframes - sometimes there's errors
for file_path in current_csv_list:
    imp_df = read_csv(file_path)  # Assign the returned DataFrame to imp_df
    all_df.append(imp_df)  # Append imp_df to all_df

valid_dfs = [df for df in all_df if isinstance(df, pd.DataFrame)]  # Filter out non-DataFrame objects
```

bundling 
```python
## loop through dataframes
modified_df_list = []  # List to store the modified DataFrames
error_log = []  # List to store the error details
df = pd.DataFrame()
for i in range(len(valid_dfs)):
    try:
        df = valid_dfs[i]  # Retrieve the DataFrame by index
        modified_df = df # use this step to Modify the DataFrame
        modified_df_list.append(modified_df)  # Append the modified DataFrame to the list
    except Exception as e:
        error_log.append((i, str(e)))  # Log the index and error message

## concatenate through all the lists
big_df = pd.concat(modified_df_list, ignore_index=True)
```

cleaning data 
```python
raw_data_startrow = big_df.index[big_df.iloc[:, 0] == "YEAR,QUARTER,MONTH,FL_DATE,OP_UNIQUE_CARRIER,TAIL_NUM,OP_CARRIER_FL_NUM,ORIGIN_AIRPORT_ID,ORIGIN_AIRPORT_SEQ_ID,ORIGIN_CITY_MARKET_ID,ORIGIN,ORIGIN_CITY_NAME,ORIGIN_STATE_NM,DEST_AIRPORT_ID,DEST_AIRPORT_SEQ_ID,DEST_CITY_MARKET_ID,DEST,DEST_CITY_NAME,DEST_STATE_NM,DEP_DELAY,TAXI_OUT,WHEELS_OFF,WHEELS_ON,TAXI_IN,ARR_DELAY,CANCELLED,CANCELLATION_CODE,DIVERTED,CARRIER_DELAY,WEATHER_DELAY,NAS_DELAY,SECURITY_DELAY,LATE_AIRCRAFT_DELAY,DIV_DISTANCE"].tolist()[0]

raw_data = big_df.iloc[raw_data_startrow:, :]  # Extract from the starting row onwards
raw_data.reset_index(drop=True, inplace=True)
raw_data = raw_data.rename(columns={raw_data.columns[0]:"rawdata"})
raw_table = raw_data["rawdata"].str.split(',',expand=True) #split columns
raw_header = raw_table.iloc[0]
raw_table.columns = raw_header  # Set the new header
raw_table = raw_table.iloc[1:]  # Remove the first row

```