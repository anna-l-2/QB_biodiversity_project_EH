library(readxl)
library(tibble)
library(dplyr)
library(tidyr)
library(vegan)
library(ggplot2)
library(tidyverse)

#Visualization of species present 
dim(tree.species.df)
myco.df.all <-rbind(invasive.myco.df, ninvasive.myco.df)

ggplot(invasive.myco.df) +
  aes(x = Plot_ID, y = MycoType, color = SPCD) +
  geom_jitter() +  
  xlab("Plot ID") +
  ylab("Mycorrhizal Association") +
  ggtitle("Distribution of Mycorrhizal Type by Species in Invasive Plots") +
  theme_minimal()

ggplot(ninvasive.myco.df) +
  aes(x = Plot_ID, y = MycoType, color = SPCD) +
  geom_jitter() +  
  xlab("Plot ID") +
  ylab("Mycorrhizal Association") +
  ggtitle("Distribution of Mycorrhizal Type by Species in NonInvasive Plots") +
  theme_minimal()





