#The program was used to prepare the dataset before creating the data visualizations and 
#to estimathe the Monthly Loan Payment using linear regression model

library(lubridate)
library(ggplot2)
library(dplyr)

setwd("/Users/yanndupis/Documents/Data_Science/Udacity/nano-degree/P6-Data Visualization")

#import the data set
pr <- read.csv("prosperLoanData.csv",sep=",")

#Select the variables that is going to be used for the visuals 
pr_col <-c("ListingKey","Term","LoanOriginationDate",
           "LoanOriginalAmount","MonthlyLoanPayment",
           "ProsperScore")

#Create a subset with variables selected
pr_sub <- pr[pr_col]

#We want to create visuals only for loans issued in 2013
pr_sub <- subset(pr_sub,year(LoanOriginationDate)==2013)

#Convert term from numeric to factor
pr_sub$Term <- as.factor(pr_sub$Term)

#In order no to have 11 different colors in our visuals based on the Prosper Score, we can create
#three buckets that represents low risk, medium risk, high risk
for (i in  1:nrow(pr_sub)) {
if (pr_sub$ProsperScore[i] > 8) {
  pr_sub$ProsperRisk[i]  ="Score >= 9"
} else if (pr_sub$ProsperScore[i]  >= 6) {
  pr_sub$ProsperRisk[i]  ="6 <= Score <= 8"
} else if (pr_sub$ProsperScore[i]  >= 3){
  pr_sub$ProsperRisk[i]  ="3 <= Score <= 5"
}
  else {
    pr_sub$ProsperRisk[i]  ="1 <= Score <= 2"
  }
}

#For the second graph, we only want to display the 36-month loans with highest score
#and 60-month loans with lowest score
pr_sub2 <- subset(pr_sub, (Term==36 & ProsperRisk=="Score >= 9" & LoanOriginalAmount<=15000 ) |
                    (Term==60 & ProsperRisk=="1 <= Score <= 2" & LoanOriginalAmount<=15000))


#Convert LoanOriginationDate to data format "%Y-%m-%d %H:%M:%S"
pr_sub$LoanOriginationDate <- as.Date(pr_sub$LoanOriginationDate, 
                                      format = "%Y-%m-%d %H:%M:%S") 


#Create bins of size $5000 for Loan Original Amount
label <- c("0K-4.9K","5K-9.9K","10K-14.9K","15K-19.9K","20K-24.9K","25K-29.9K","30K-35k")
pr_sub$LoanOriginalAmount_bins <-cut(pr_sub$LoanOriginalAmount,breaks = seq(0,35000,5000),labels=label)


#Compute average Montly Loan Payment by Prosper Score by term and by Loan Origination Amount buckets
avg_payment_amt<- pr_sub %>%
  group_by(LoanOriginalAmount_bins ,ProsperRisk,Term) %>%
  summarise(monthlypayment_mean = mean(MonthlyLoanPayment, na.rm = TRUE),
    count_loan = n()
  )

#Because of technical reasons, even if there aren't 12-month loans with loans greater than 25K we need
#to indicate it in the dataset
avg_payment_amt<-rbind(avg_payment_amt,
data.frame(LoanOriginalAmount_bins = "25K-29.9K", ProsperRisk = "1 <= Score <= 2",Term=12,
           monthlypayment_mean=0,count_loan=0),
data.frame(LoanOriginalAmount_bins = "30K-35k", ProsperRisk = "1 <= Score <= 2",Term=12,
           monthlypayment_mean=0,count_loan=0),

data.frame(LoanOriginalAmount_bins = "25K-29.9K", ProsperRisk = "3 <= Score <= 5",Term=12,
           monthlypayment_mean=0,count_loan=0),
data.frame(LoanOriginalAmount_bins = "25K-29.9K", ProsperRisk = "6 <= Score <= 8",Term=12,
           monthlypayment_mean=0,count_loan=0),
data.frame(LoanOriginalAmount_bins = "25K-29.9K", ProsperRisk = "Score >= 9",Term=12,
           monthlypayment_mean=0,count_loan=0),

data.frame(LoanOriginalAmount_bins = "30K-35k", ProsperRisk = "3 <= Score <= 5",Term=12,
           monthlypayment_mean=0,count_loan=0),
data.frame(LoanOriginalAmount_bins = "30K-35k", ProsperRisk = "6 <= Score <= 8",Term=12,
           monthlypayment_mean=0,count_loan=0),
data.frame(LoanOriginalAmount_bins = "30K-35k", ProsperRisk = "Score >= 9",Term=12,
           monthlypayment_mean=0,count_loan=0))

#We need to add a mapping to the term for technical reasons
for (i in  1:nrow(avg_payment_amt)) {
  if (avg_payment_amt$Term[i] =="12" ) {
    avg_payment_amt$Term_num[i]  =1
  } else if (avg_payment_amt$Term[i] =="36") {
    avg_payment_amt$Term_num[i]  =2
  } else if (avg_payment_amt$Term[i] == "60"){
    avg_payment_amt$Term_num[i]  =3
  }
}


#Export the dataset. We only need a sample of the data to identify clusters in the scatter plot. However, 
#the linear regression was run on the entire population to estimate correctly the coefficients.
write.csv(pr_sub[1:1200,],"Prosper_ready.csv")
write.csv(pr_sub2[1:1200,],"Prosper_36_60_lowest_highest.csv")
write.csv(avg_payment_amt,"Prosper_avg_payment_amt.csv")
