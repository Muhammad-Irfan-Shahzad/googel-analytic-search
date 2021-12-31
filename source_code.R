
#title: "Google Search Analytics"

knitr::opts_chunk$set(echo = TRUE)
```


library(ggplot2)
library(scales)

library(gtrendsR)



data_set = gtrends(keyword = "Machine Learning")$interest_by_country
data_set = data_set[-c(3:5)]
data_set = na.omit(data_set)
head(data_set,10)


data_setTemp= head(data_set,10)
ggplot(data_setTemp, aes(x=reorder(location,-hits), y=hits)) +
  geom_bar(stat="identity", fill="steelblue")+ labs(x = "geoName", y = "Machine learning", color = "Legend Title\n")+
theme(axis.text.x = element_text(angle = 90))


data_set = gtrends(keyword = "Machine Learning")$interest_over_time
data_set = data_set[-c(3:7)]
head(data_set,10)
tail(data_set,1)

data_setTemp=data_set
ggplot(data_setTemp, aes(x=date, y=hits)) +
  geom_line(stat="identity",  color="steelblue")+ 
  labs(title="Total Google Searches for Machine Learning",  x = "Year",   y = "Total Count",  color = "Legend Title\n")+
  theme_minimal()


#Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
