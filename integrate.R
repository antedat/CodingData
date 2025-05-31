require(tidyr)
require(xts)

#### Load & prepare Data 
df <- read.csv( "https://storage.googleapis.com/antedata_open/AllDat_excerpt_ticker.csv")

# filter timeseries: source= "Aggregate", itemn= "TrendRank" 
df <- spread( df[ which(df$source == "Aggregate"),c("date","ticker","TrendRank") ], key="ticker", value="TrendRank")

# format as Timeseries
df <- as.xts( df[,2:ncol(df)] , order.by=as.Date(df[,1]) )
