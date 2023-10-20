
#import ggplot library
library(ggplot2)
library(readxl)

#read excel datasets
ChicagoRedStars <- read_excel('ChicagoRedStars.xlsx')
GothamFC <- read_excel('GothamFC.xlsx')
OrlandoPride <- read_excel('OrlandoPride.xlsx')

#2

#Combining three teams' player stats into one dataset
nwsl_stats <- bind_rows(ChicagoRedStars, GothamFC, OrlandoPride)

#Display histogram of age distribution of players
nwsl_ggplot <- ggplot(nwsl_stats)
nwsl_ggplot + geom_histogram(aes(Age)) + labs(title = "Distribution of Ages of NWSL Soccer Teams") 

#3

#sets na values of minutes played to 0
nwsl_stats$Min[is.na(nwsl_stats$Min)] <- 0

#seed makes random number the same every time for reproducibility
set.seed(15)

#finds random player in dataset
random_player <- nwsl_stats[sample(1:nrow(nwsl_stats), 1), ]

#makes scatter plot of minutes played vs Goals Scored
plot(nwsl_stats$Min, nwsl_stats$Gls...9, main = "Minutes Played Vs Goals", xlab = "Minutes", ylab = "Goals", pch = 20)

#Finds x and y value of random player
x <- random_player$Min
y <- random_player$Gls...9

#Highlights random player point blue and prints their name above point
points(x ,y, col = 'blue', pch = 20)
text(x, y + 0.5, labels = random_player$Player, cex = 0.9 )
