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



######### Backtest 
SIG <- df

# create long/short portfolio of best/worst ranked
SIG[,] <- rowRanks( SIG, ties.method="random" )
SIG[SIG < (0.2*ncol(SIG)) ] <- -0.03; SIG[SIG > (0.8*ncol(SIG)) ] <- 0.03; SIG[SIG>1] <- 0

# harmonize columns of Signal and Price
cn <- unique( colnames(SIG)[ which( colnames(SIG) %in% colnames(PRIX)) ] )
SIG <- SIG[,cn]; PRIX <- PRIX[,cn]

# calculate backtest returns
OUT <- merge(stats::lag(SIG,1),PRIX, all=F)  # Achtung: stats::lag=4 (stats::lag = 2)  ; noch stats::lag -1 wenn 4 months holding
for (col in seq(1: dim(SIG)[2]   )) {
  OUT[,col] <- OUT[,col] * OUT[,col+dim(SIG)[2]] 
}
OUT <- tail( OUT[,1:dim(SIG)[2]] ,-3) 
plot(cumsum(rowSums(OUT)))






