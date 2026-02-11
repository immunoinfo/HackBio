# installing packages 
install.packages("tidyverse")
library(tidyverse)
install.packages("dplyr")
install.packages("ggplot2")
library(ggplot2)
install.packages("xlsx")
library(xlsx)
library(readxl)
library(openxlsx)

# importing the complete dataset
hb_stage_2 <- read.xlsx('/Users/hemisangani/HackBio/hb_stage_2.xlsx')

# importing the relevant dataset i.e. the first sheet from the excel file
sheet_a <- read.xlsx('/Users/hemisangani/HackBio/hb_stage_2.xlsx', sheet = 'a')
sheet_a <- data.frame(sheet_a)
head(sheet_a)

ggplot(data = sheet_a,
       aes ( x = as.character(cell_type), y = new_ratio, fill=cell_type) # to create multiple box plots for each cell type
) +
  geom_boxplot() + 
  labs(x = '', y='Ratio') + # remove the x label, rename the y axis label
  theme (
    axis.text.x = element_text(angle=90, vjust=.5, hjust=1), # to rotate labels by 90 degrees
    axis.line = element_line(color='black'), # to  define the axes graph lines
    legend.position="none", # to remove the legend
    plot.background = element_rect(fill="#ffffff"), # to create a neutral background
    panel.grid.major = element_blank(), # to remove major gridlines
    panel.grid.minor = element_blank(), # to remove minor gridlines
    panel.border = element_blank() # to remove the border lines
    )
