rm(list=ls(all=TRUE))
require('bit64')
require('data.table')
require('readr')
require('plyr')
require('formattable')
require("corrplot")
require('caret')
require('Information')
require('smbinning')

specify_decimal <- function(x, k) format(round(x, k), nsmall=k)
setwd('\\\\hbeu.adroot.hsbc/gb001/Redir GB Users GMO/43978667/Documents/data/pre del/lm')

str_data<- 'lm3_d25.csv'
df <- fread(str_data)
basic_count <-nrow(df[df$prod_mkr1 == 'BASIC',])
standard_count <- nrow(df[df$prod_mkr1 == 'STANDARD',])
premier_count <- nrow(df[df$prod_mkr1 == 'PREMIER',])

df$new_target <- abs(df$target-1)

result = smbinning(df=df,y="new_target",x="prod_mkr1")
woe <- result$ivtable
smbinning.plot(result,option="dist") 
smbinning.plot(result,option="badrate") 
smbinning.plot(result,option="WoE")




v = varclus(data.matrix(df3))

IV <- create_infotables(data = df3,y = "del_status")
IV_summary <- IV$Summary
print(head(IV$Summary))
# plotting a single variable
plot_infotables(IV,"acct_cr_rting_m6")
plot_infotables(IV,"minbal_b3")
plot_infotables(IV,"avg_bal_m7")
plot_infotables(IV,"act_bal_m7")
plot_infotables(IV,"no_of_dr_tran_m1")
plot_infotables(IV,"days_open")

plot_infotables(IV,IV$Summary$Variable[1:6],same_scales = TRUE)
MultiPlot(IV,IV$Summary$Variable[1:6],same_scales = TRUE)
