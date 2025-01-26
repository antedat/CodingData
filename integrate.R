require(tidyr)
require(xts)

## Load CSV
df <- read.csv( "https://storage.googleapis.com/antedata_fine/101/AllDat.csv")

# filter timeseries: source= "Aggregate", itemn= "TrendRank" 
df <- spread( df[ which(df$source == "Aggregate"),c("date","ticker","TrendRank") ], key="ticker", value="TrendRank")

# format as Timeseries
df <- as.xts( df[,2:ncol(df)] , order.by=as.Date(df[,1]) )

# use signal on fridays
index(df) <- index(df) + 4

# calculate backtest
df2 <- btest(SIG,PRIX_orig, 0.2 ,lagger=1,comb=F, decay=F, tsiz=0.03)


