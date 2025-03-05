library(readxl)
library(tibble)
library(dplyr)
library(tidyr)
library(vegan)

#getwd()
#setwd("/cloud/project/QB_biodiversity_project_EH/")

#tree data 
tree <-read.csv("TREE.csv")

tree.species.df <-data.frame(Plot_ID = c(tree$PLOT),
                             SPCD =c(tree$SPCD))


tree.species.ss <-as.data.frame.matrix(table(tree.species.df$Plot_ID, tree.species.df$SPCD))
str(tree.species.df) #plot and species id 
#print(tree.species.df)
#print(unique(tree.species.df$SPCD))

#Myco assocaitions
myco <-as.data.frame(read_xlsx("MycoType_ref2.xlsx"))
myco<- myco[,-c(3:7)]
str(myco)
#print(unique(myco$SPCD))


#invasive
#invasive <-read_xlsx("INVASIVE.xlsx")
invasive <-read_xlsx("INVASIVE_SUBPLOT_SPP.xlsx")
str(invasive)
#print(invasive)

#print(unique(invasive.df))

#References
#Plot ID Code 
# plotID.master <-read_xlsx(path = "PLOT.xlsx")
# print(plotID.master)

#Clean- make sure has same species
untree.species <- unique(tree.species.df$SPCD)
unmyco.species <-unique(myco$SPCD)
length(untree.species)
length(unmyco.species)
#print(sort(untree.species))
#print(sort(unmyco.species))
setdiff(untree.species, unmyco.species)

tree.species.df <- tree.species.df %>%
  filter(!SPCD %in% c(999, 998))  


#Filter if species has invasives 

invasive_plots <- unique(invasive$PLOT)
invasive.plots.df <- tree.species.df[tree.species.df$Plot %in% invasive_plots, ]
ninvasive.plots.df <- tree.species.df[!tree.species.df$Plot %in% invasive_plots, ]

# invasive_plots <-as.data.frame(invasive$PLOT)
# invasive_plots <- unique(invasive_plots)
# #print(invasive_plots)
# 
# invasive.plots.df <- data.frame()
# ninvasive.plots.df <- data.frame()
# 
# for (i in seq_len(nrow(tree.species.df))) {  
#   if (tree.species.df$Plot[i] %in% invasive_plots) {  
#     invasive.plots.df <- rbind(invasive.plots.df, tree.species.df[i, ])  
#   } else {  
#     ninvasive.plots.df <- rbind(ninvasive.plots.df, tree.species.df[i, ])  
#   }
# }
# invasive_plots <- unique(invasive.df$Plot_ID)
# print(invasive_plots)
# print(invasive.plots.df)
# print(ninvasive.plots.df)

#site by species invasive
invasive.df <-data.frame(Plot_ID= c(invasive.plots.df$Plot_ID),
                         SPCD =c(invasive.plots.df$SPCD))  
invasive.ss <-as.data.frame.matrix(table(invasive.df$Plot_ID, invasive.df$SPCD))



#AM/ECM

ninvasive.myco.df <- merge(ninvasive.plots.df, myco, by="SPCD", all.x=TRUE, all.y=FALSE)
ninvasive.myco.ss <- as.data.frame.matrix(table(ninvasive.myco.df$Plot_ID, ninvasive.myco.df$MycoType))

ninvasive.ECM.df <- subset(ninvasive.myco.df, ninvasive.myco.df$MycoType==1)
ninvasive.AM.df <- subset(ninvasive.myco.df, ninvasive.myco.df$MycoType==2)
ninvasive.both.df <- subset(ninvasive.myco.df, ninvasive.myco.df$MycoType==3)


invasive.myco.df <-merge(invasive.plots.df, myco, by="SPCD", all.x=TRUE, all.y=FALSE)

invasive.myco.ss <- as.data.frame.matrix(table(invasive.myco.df$Plot_ID, invasive.myco.df$MycoType))
invasive.ECM.df <- subset(invasive.myco.df, invasive.myco.df$MycoType==1)
invasive.AM.df <- subset(invasive.myco.df, invasive.myco.df$MycoType==2)
invasive.both.df <- subset(invasive.myco.df, invasive.myco.df$MycoType==3)

#Site by species noninvasive

ninvasive.AM.ss <- as.data.frame.matrix(table(ninvasive.AM.df$Plot_ID, ninvasive.AM.df$SPCD))
#ninvasive.AM.ss <- rownames_to_column(ninvasive.AM.ss, var = "Plot_ID")
#ninvasive.AM.ss.L <-ninvasive.AM.ss[,-1]

ninvasive.ECM.ss <- as.data.frame.matrix(table(ninvasive.ECM.df$Plot_ID, ninvasive.ECM.df$SPCD))
#ninvasive.ECM.ss <- rownames_to_column(ninvasive.ECM.ss, var = "Plot_ID")
#ninvasive.ECM.ss.L <-ninvasive.ECM.ss[,-1]

# ninvasive.both.ss <- as.data.frame.matrix(table(ninvasive.both.df$Plot_ID, ninvasive.both.df$SPCD))
# ninvasive.both.ss <- rownames_to_column(ninvasive.both.ss, var = "Plot_ID")

#Site by species: Invasive
invasive.AM.ss <- as.data.frame.matrix(table(invasive.AM.df$Plot_ID, invasive.AM.df$SPCD))
#invasive.AM.ss <- rownames_to_column(invasive.AM.ss, var = "Plot_ID")
#invasive.AM.ss <-invasive.AM.ss[,-1]

invasive.ECM.ss <- as.data.frame.matrix(table(invasive.ECM.df$Plot_ID, invasive.ECM.df$SPCD))
# invasive.ECM.ss <- rownames_to_column(invasive.ECM.ss, var = "Plot_ID")
# invasive.ECM.ss.L <-invasive.ECM.ss[,-1]

# invasive.both.ss <- as.data.frame.matrix(table(invasive.both.df$Plot_ID, invasive.both.df$SPCD))
# invasive.both.ss <- rownames_to_column(invasive.both.ss, var = "Plot_ID")


#OVERALL 
# ninvasive.AM.ss
# ninvasive.ECM.ss
# ninvasive.both.ss
# 
# invasive.AM.ss
# invasive.ECM.ss
# invasive.both.ss

