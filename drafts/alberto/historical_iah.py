# %%
# IMPORT MODULES
import pandas as pd
import os
import glob
import csv

# %%
# IMPORT FILE PATHS 
active_project = "../rawdata/iahhist/"

file_paths = glob.glob(os.path.join(active_project, "*.csv"))

# %%
# setting up the list for all raw dfs
all_df = []

# listing turning movement counts as current 
current_csv_list = []

for file in file_paths:
    current_csv_list.append(file)

# %%
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
        return (file_path, f"Error parsing CSV: {str(e)}")  # Return tuple with file path and error message
    except FileNotFoundError:
        return (file_path, "File not found")  # Return tuple with file path and error message

# %%
## validating dataframes - sometimes there's errors

for file_path in current_csv_list:
    imp_df = read_csv(file_path)  # Assign the returned DataFrame to imp_df
    all_df.append(imp_df)  # Append imp_df to all_df

valid_dfs = [df for df in all_df if isinstance(df, pd.DataFrame)]  # Filter out non-DataFrame objects

# %%
## modify each dataframe

def modify_in_df(df):
 # modifications to the df go here
    raw_data_startrow = df.index[df.iloc[:, 0].str.startswith("Carrier Code")].tolist()[0]
    raw_data = df.iloc[raw_data_startrow:, :]  # Extract from the starting row onwards
    raw_data.reset_index(drop=True, inplace=True)
    raw_data = raw_data.rename(columns={raw_data.columns[0]:"rawdata"})
    raw_table = raw_data["rawdata"].str.split(',',expand=True) #split columns
    raw_header = raw_table.iloc[0]
    raw_table.columns = raw_header  # Set the new header
    raw_table = raw_table.iloc[1:]  # Remove the first row
    return raw_table 

# %%
## loop through dataframes

modified_df_list = []  # List to store the modified DataFrames
error_log = []  # List to store the error details
df = pd.DataFrame()

for i in range(len(valid_dfs)):
    try:
        df = valid_dfs[i]  # Retrieve the DataFrame by index
        modified_df = modify_in_df(df) # use this step to Modify the DataFrame
        modified_df_list.append(modified_df)  # Append the modified DataFrame to the list
    except Exception as e:
        error_log.append((i, str(e)))  # Log the index and error message

# %%
big_df = pd.concat(modified_df_list, ignore_index=True)


# %%
big_df = big_df.apply(lambda x: x.str.strip('"'))

aih_hist = big_df


