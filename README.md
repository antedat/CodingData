# Coding Data
AnteData compiles unique data about IT companies. This information gives an advantage over other market participants and drives profitable trading strategies. We observe and measure the digital footprints of software buyers and their coding activity on different web-platforms: Jobs, Searches, Repositories, Q&A, Apps. 

You can subscribe to our data and integrate it into your financial models.

# Data Dictionary

|Field | Details	| Example|
|---|---|---|
|date | Release Date weekly on Mondays | 2025-01-20|
|ticker | Ticker | HUBS|
|BBticker | Bloomberg Ticker | HUBS|
|Source | For Example Jobs, Repo, etc. or Aggregate | Jobs|
|RawCount | Raw Count of Observations | 24|
|ActChng |	Change in Activity, standardized (normal distributed) | -0.03|
|TrendRank |	Trend of Activity, ranked against universe (0-100%) | 84%|

For a detailed explanation of the data fields, please read the technical description:
https://github.com/antedat/CodingData/blob/main/docs/Technical%20Documentation.pdf

# Delivery of Data

Data Excerpts are openly accessible from GoogleCloud: <br>
  https://storage.googleapis.com/antedata_open/AllDat_excerpt_time.csv
  https://storage.googleapis.com/antedata_open/AllDat_excerpt_ticker.csv

To test our full data sample, please sign a standard data test license with us: bd@antedata.ch

# Integration of Data – Creating Timeseries 

loading and transforming the data to timeseries:
the files integrate.R and integrate.py contains simple examples 

# Contact
If you have technical questions, please don’t hesitate to contact:
Florian.Boehringer@antedata.ch
+41 78 69 111 67





