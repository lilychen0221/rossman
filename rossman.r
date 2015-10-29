install.packages("reader")
install.packages("randomForest")
library(reader)
library(randomForest)


train <- read.csv("train.csv")
test <- read.csv("test.csv")
store<-read.csv("store.csv")

train1 <- merge(train, store)
test1 <- merge(test, store)

train1[is.na(train1)] <- 0
test1[is.na(test1)] <- 0

names(train1)
## display structure
str(train1)
summary(train1)

names(test1)
str(test1)
summary(test1)

# remove the data when store does not open and sales is 0
train1 <- train1[ which(train1$Open=='1'),]
train1 <- train1[ which(train1$Sales!='0'),]

train1$Date = as.Date(as.character(train1$Date))
test1$Date = as.Date(as.character(test1$Date))

train1$month <- as.numeric(format(train1$Date, "%m"))
train1$year <- as.numeric(format(train1$Date, "%y"))
train1$day <- as.numeric(format(train1$Date, "%d"))

test1$month <- as.numeric(format(test1$Date, "%m"))
test1$year <- as.numeric(format(test1$Date, "%y"))
test1$day <- as.numeric(format(test1$Date, "%d"))

# remove column3 "Date" and coulumn8(StateHoliday) in training set
# remove column4 "Date" and coulumn7(StateHoliday) in training set

train <- train1[,-c(3,8)]
test <- test1[,-c(4,7)]
## the column3"DayOfWeek" and column4"Sales" are numeric, change others into factor
feature.names <- names(train2)[c(1,2,6,8:12,14:19)]
feature.names

for (f in feature.names){
        if (class(train2[f])=="character"){
                levels <- unique(c(train2[[f]], test2[[f]]))
                train2[f] <- as.numeric(factor(train2[[f]], levels=levels))
                test2[[f]]  <- as.numeric(factor(test2[[f]],  levels=levels))               
        }        
}

names(train)
names(test)

length(unique(train$Store))

clf <- randomForest(train[,feature.names],
                    
                    )






