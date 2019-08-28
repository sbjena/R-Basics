
library(ggplot2)
library(dplyr)
library(sqldf)
sessionInfo()
data("diamonds")
head(diamonds)
diamonds %>% head(100)
diamonds %>% dim()
diamonds %>% tail()
diamonds %>% head(95) %>% tail(5)
diamonds %>% head(8) %>% tail(6)
diamonds %>% ggplot(aes(x = x,y = y)) + geom_point()

# sql query

# sqldf("select count(*) from diamonds where cut='Premium'")

class(diamonds)
names(diamonds)
# 1 find diamonds bigger the 20 with y >20
y_big = diamonds$y >20
diamonds[y_big,]
diamonds$y[y_big] = NA
# 2 find dimetions equal to zero with y =0

y_Zero = diamonds$y == 0
diamonds[y_Zero,]
diamonds$y[y_big] = NA

# 3 find dimenations equal to zero with x = 0
x_Zero = diamonds$x ==0
diamonds[x_Zero,]
diamonds$x[x_zero] = NA

# 4 remove dimentions greater then  9 with y > 9
y_Nine = diamonds$y > 9 
diamonds[y_Nine,]
diamonds$y[y_Nine] = NA
# 5 remove dimantions greater the 9 with x >9
x_Nine = diamonds$x > 9
diamonds[x_Nine,]
diamonds$x[x_Nine] = NA
diamonds %>% ggplot(aes(x = x,y = y)) + geom_point()

