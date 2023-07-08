> casual documentation of the team's approach to data ETL 

#### data sources 

Bureau of Transportation Statistics

> [https://www.transtats.bts.gov/OT_Delay/OT_DelayCause1.asp?20=E](https://www.transtats.bts.gov/OT_Delay/OT_DelayCause1.asp?20=E)
> 
> [https://www.transtats.bts.gov/ontime/departures.aspx](https://www.transtats.bts.gov/ontime/departures.aspx)
> 
> [https://www.transtats.bts.gov/DL_SelectFields.aspx?gnoyr_VQ=FGJ&QO_fu146_anzr=b0-gvzr](https://www.transtats.bts.gov/DL_SelectFields.aspx?gnoyr_VQ=FGJ&QO_fu146_anzr=b0-gvzr)


#### getting started 

![[Pasted image 20230705224155.png]]

Before we could figure out the [[web scraping]] component, the team first manually downloaded monthly batches of data for the entire state of Texas from the site. This way we could have easy access to the attributes, as well as getting acclimated to the way BTS recorded flight data. 

![[Pasted image 20230705224216.png]]

##### Extraction, Transform and Loading operational databases

preparing the datasets, exploring through the available information. some considerations:

- years
- level of aggregation
- geographical region

The team's current direction is to tackle:

1. All carriers from AIH with outgoing flights

**Subregion**: Texas 
**Flight type**: Intl & domestic


back to [[Project Development Journal Entries]]
