#install packages
install.packages("xlsx")
install.packages("tidyverse")
install.packages("dplyr")
install.packages("ggplot2")
library(ggplot2)
library(readxl)

#importing the relevant dataset from the complete file
sheet_f <- read_xlsx('/Users/hemisangani/HackBio/hb_stage_2.xlsx', sheet = 'f')
sheet_f <- data.frame(sheet_f)
head(sheet_f)

# choosing timpoints 0hr and 72hrs
mini_sheet_f <- sheet_f [c(1,2,7,8), ]
mini_sheet_f

ggplot (mini_sheet_f, #dataset
       aes (fill= cell_type, # stacking by type of cell B or Plasmablast
            y = proportion, 
            x = stage)) + 
  labs (x = '', y = 'Proportion') + # to remove the x axis label, to add the y axis label
  geom_bar(position='stack', stat='identity') + # to create a stacked barchart
  scale_fill_manual('', values=c('coral2', 'steelblue')) + # to add legend with color palette for the stacks 
  ylim (0.00, 0.30) + 
  theme (plot.background = element_rect(fill="#ffffff"), # to create a neutral background
         panel.grid.major = element_blank(), # to remove major gridlines
         panel.grid.minor = element_blank(), # to remove minor gridlines
         axis.line.y = element_line(color='black') ) # to define the y axis line 
