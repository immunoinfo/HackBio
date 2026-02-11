#importing the packages
library(readxl)
library(openxlsx)
library(pheatmap)

#importing the dataset
sheet_d_1 <- read.xlsx('/Users/hemisangani/HackBio/hb_stage_2.xlsx', sheet = 'd_1')
sheet_d_1 <- data.frame(sheet_d_1)
head(sheet_d_1)


pheatmap (
          sheet_d_1[, 2:8], # to visualize the samples across different timepoints
          cluster_rows = F, # no clustering across rows
          cluster_cols = F, # no clustering across columns
          labels_row = sheet_d_1$pathway # using the first column as labels for the rows
)

