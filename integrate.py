# This snippet loads a sample file of our CodingActivity Data and converts it to a time-series matrix

import pandas as pd
import numpy as np

# Load CSV file containing trend ranking data
df = pd.read_csv('https://storage.googleapis.com/antedata_open/AllDat_excerpt_ticker.csv')

# Filter timeseries where source is 'Aggregate' and get TrendRank values 
df = df[df['source'] == 'Aggregate'][['date', 'ticker', 'TrendRank']]

# Reshape data from long to wide format (pivot table)
df = df.pivot(index='date', columns='ticker', values='TrendRank')

# Convert date column to datetime format
df.index = pd.to_datetime(df.index)

# Display first few rows
print(df.head())
