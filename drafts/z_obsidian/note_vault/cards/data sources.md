> insight on how everything on our dashboard is related 

# Bureau of Transportation Statistics

### Current Data -On-Time : Reporting Carrier On-Time Performance (1987-present)
[https://www.transtats.bts.gov/DL_SelectFields.aspx?gnoyr_VQ=FGJ&QO_fu146_anzr=b0-gvzr](https://www.transtats.bts.gov/DL_SelectFields.aspx?gnoyr_VQ=FGJ&QO_fu146_anzr=b0-gvzr)

**method**: import into db from merged csv 
**objective**: provide a current baseline of all flights that either depart or originate from IAH. 

**Context**: from the downloads page, downloaded the csv's for each month in 2022. Through a batch merger script [[csvglob]]. Then we pull only flights that either originated or arrived at IAH
```python 
truncated_df = raw_table[(raw_table['ORIGIN_AIRPORT_ID'] == '12266') | (raw_table['DEST_AIRPORT_ID'] == '12266')]
```

**output**: .json to be loaded to the databse sql and used to generate charts. 

### Historical Data - Detailed Statistics Departures
https://www.transtats.bts.gov/ontime/departures.aspx 
**method**: python webscraping
**objective**: deeper dive into the particular destination city, and see if there's any trend across airlines servicing that destination as it relates to delay. 

**context**: per the BTS website, there are records from 2023-1987. out of all the airlines domestically servicing flights out of IAH, there are a subset of airlines that have valid dataset. 

``` python
airlines = ["Alaska Airlines Inc. (AS)",
            "American Airlines Inc. (AA)",
            "Delta Airlines Inc. (DL)",
            "Frontier Airlines Inc. (F9)",
            "JetBlue Airways (B6)",
            "Southwest Airlines Co. (WN)",
            "Spirit Airlines (NK)",
            "United Airlines Inc. (UA)",
            "America West Airlines Inc. (HP)",
            "Atlantic Southeast Airlines (EV)",
            "Continental Airlines Inc. (CO)",
            "US Airways Inc. (US)",
            "SkyWest Airlines Inc. (OO)",
            "Republic Airline (YX)",
            "Endeavor Air Inc. (9E)",
            "American Eagle Airlines Inc. (MQ)",
            ]
```

**output**: a dataframe that will be loaded upon the setup of the flask api. CSV to be loaded to the databse sql and used to generate charts. 


# Weather API 


# Geoapify API 

