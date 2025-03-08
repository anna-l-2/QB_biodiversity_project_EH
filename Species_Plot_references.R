library("readxl")

#original 
tree <-read.csv("TREE.csv")
print(tree)
tree.species.df <-data.frame(Plot_ID = c(tree$PLOT),
                             Species_ID =c(tree$SPCD))
print(tree.species.df)

tree.ss.df <- as.data.frame.matrix(table(tree.species.df$Plot_ID, tree.species.df$Species_ID))
tree.ss.df <- rownames_to_column(tree.ss.df, var = "Plot_ID")
print(tree.ss.df)

#Plot ID Code 
plotID.master <-read_xlsx(path = "PLOT.xlsx")
print(plotID.master)

#Species ID
speciesID.master <-read_xlsx(path = "REF_SPECIES.xlsx")
print(speciesID.mater)
