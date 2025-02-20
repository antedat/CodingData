require(tidyr)
require(xts)

#### Load & prepare Data 
df <- read.csv( "https://storage.googleapis.com/antedata_fine/101/AllDat.csv")

# filter timeseries: source= "Aggregate", itemn= "TrendRank" 
df <- spread( df[ which(df$source == "Aggregate"),c("date","ticker","TrendRank") ], key="ticker", value="TrendRank")

# format as Timeseries
df <- as.xts( df[,2:ncol(df)] , order.by=as.Date(df[,1]) )

# use signal on fridays
index(df) <- index(df) + 4


