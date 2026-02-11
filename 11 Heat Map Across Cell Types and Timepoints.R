#importing the packages
library(readxl)
library(openxlsx)
library(pheatmap)

#importing the dataset
sheet_c <- read.xlsx('/Users/hemisangani/HackBio/hb_stage_2.xlsx', sheet = 'c') # to read sheet c
sheet_c <- data.frame(sheet_c)

# to extract the time and cell types data
prematrix_sheet_c <- data.frame(sheet_c[2:50]) 

# annotations dataframe 
# Cell Type - to create blocks of single cell type # Time - to create a pattern of repetition 
ann_df <- data.frame( 
  'CellType' = rep ( c('Macrophage', 'Monocyte', 'Neutrophil', 'NK', 'pDC', 'B', 'T'), c(7,7,7,7,7,7,7) ), 
  'Time' = rep ( c('00h', '02h', '06h', '12h', '24h', '48h', '72h'), rep(1,7)             
  ) 
)

#importing column names from the first column of the original dataset to act as row names for the annotation df
row.names(ann_df) <- colnames(prematrix_sheet_c)

pheatmap(prematrix_sheet_c,
         cluster_rows = T, # to add column clustering
         cluster_cols = F, # to remove column clustering
         border_color = F, # to remove color between cells
         annotation_col = ann_df, # to create the time and cell type annotations
         show_colnames = F, # to remove col names
         show_rownames = F # to remove row names
)