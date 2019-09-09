#install.packages("faraway")
#install.packages("ggplot2")
#install.packages("corrplot")
#install.packages('Amelia')
#install.packages('caret')
#install.packages('caTools')
# install.packages("dplyr")
# install.packages("ggthemes")
# install.packages("reshape2")

library(faraway)
library(ggplot2)
library(dplyr)
library(ggthemes)
library(reshape2)


data(package='faraway')
data('worldcup')
dim(worldcup)
View(worldcup)
# below image means that with increse in time there is chance of getting more shots
plot(worldcup$Time,worldcup$Shots)
# implement with ggplot
p = ggplot(worldcup,aes(x = Time,y = Shots)) 
p+geom_point()+ ggtitle("Time vs shots")
class(p)
summary(p)

worldcup %>% ggplot(aes(x = Time,y = Shots))+ geom_point()
#  could not find function "%>%"
# install.packages("dplyr")
worldcup %>% 
  ggplot(aes(Shots)) +
  geom_histogram(bins = 13)

levels(worldcup$Position)
#Position is a discrete value , search for discrete sectio on chitsheet for plotting 
worldcup %>% 
  ggplot(aes(Position))+
  geom_bar()

worldcup %>% ggplot(aes(x = Time,y = Shots,color = Position,size = Passes,shape = Team))+
  geom_point()

# facet_wrap(~variable) will return a symmetrical matrix of plots for the number of levels of variable .
# facet_grid(.~variable) will return facets equal to the levels of variable distributed horizontally. 
# facet_grid(variable~.) will return facets equal to the levels of variable distributed vertically.

worldcup %>% ggplot(aes(x = Time,y = Shots,color = Position,size = Passes,shape = Team))+
  geom_point()+
  facet_wrap(~Position)
  #  facet_grid(~Position)

# ? # separate by team now as all team are part of Position

worldcup %>% 
  filter(Team  %in% c('Brazil','Spain')) %>% 
  ggplot(aes(x = Time,y = Shots,color = Position,size = Passes,shape = Team))+
  geom_point()+
  facet_wrap(~Position)

worldcup %>% 
  filter(Team  %in% c('Brazil','Spain')) %>% 
  ggplot(aes(x = Time,y = Shots,color = Position))+
  geom_point()+
  facet_grid(~Position)

worldcup %>% 
  filter(Team  %in% c('Brazil','Spain')) %>% 
  ggplot(aes(x = Time,y = Shots,color = Position))+
  geom_point()+
  facet_grid(Team~ Position)
# to Support excel
# install.packages('ggthemes')
library(ggthemes)
# get theme pkg mostly used for better representation by economist
worldcup %>% 
  filter(Team %in% c('Brazil','Spain'))  %>% 
  ggplot(aes(x=Time, y=Passes,color = Position))+
  geom_point()+
  facet_grid(Team~Position) +
  theme_excel()+
  theme_economist()

# find avg no of shots played by brazil vs Spain

worldcup %>% 
  filter(Team %in% c('Brazil','Spain'))  %>% 
  group_by(Team,Position) %>% 
  summarise(Avg.Shots = mean(Shots)) %>% 
  ggplot(aes(x=Position, y=Avg.Shots,fill = Team))+
  geom_bar(stat = 'identity',position = 'dodge')

#install.packages("reshape2")
library(reshape2)

worldcup %>% 
  filter(Team %in% c('Brazil','Spain'))  %>% 
  group_by(Team, Position) %>% 
  summarise(Avg.Shots = mean(Shots)) %>% 
  dcast(Position ~ Team,value.var = "Avg.Shots")
