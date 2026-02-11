#importing the packages
install.packages('igraph')
library(igraph)
install.packages("networkD3")
library(networkD3)
library(dplyr)
library(tidyr)
library(readxl)
library(openxlsx)

# importing the relevant dataset from the complete file
sheet_g <- read.xlsx('/Users/hemisangani/HackBio/hb_stage_2.xlsx', sheet = 'g', rowNames = T)

# converting to adjacency matrix
sheet_g <- as.matrix(sheet_g, rowNames = 1)


cell_to_cell_interaction_network <- graph_from_adjacency_matrix (
                                       sheet_g,
                                       mode = "directed", # arrows are directed to show how cells influence each other
                                       weighted = TRUE, # to create weighted arrows based on strength of interaction
                                       diag = FALSE
                                       ) 

plot (
      cell_to_cell_interaction_network, # dataset to graph
      vertex.color= 'pink', # changing from the default vertex color
      edge.arrow.size = E(cell_to_cell_interaction_network)$size, # to set edge arrow length proportional to weight
      edge.arrow.width = E(cell_to_cell_interaction_network)$size # to set edge arrow width proportional to weight
      )