# Libraries
library(ggplot2)
library(dplyr)
library(readxl)
library(openxlsx)

# importing the dataset
sheet_e <- read.xlsx('/Users/hemisangani/HackBio/hb_stage_2.xlsx', sheet = 'e')
sheet_e <- data.frame(sheet_e)
head(sheet_e)


ggplot(
      sheet_e, # to choose the dataset to plot
      aes(x = half_life, y = alpha, size = count) # to choose the axes, weighted size by count
      ) +
  geom_point(alpha = 0.6, aes(colour = stage)) + # set level of transparency of the bubbles, color of the bubble based on stage
  scale_size(range = c(.1, 10), name="Count") + # range of the size of the bubbles, name of the legend for the weighted counts
  labs(
    x = 'Half Life ',
    y = 'Alpha Life',
  ) +
  xlim (0,50) + # to set the range for the x axis
  ylim (0,2.2) + # to set the range for the y axis
  theme(legend.position = c(0.9, 0.3), # to bring the legend boxes inside the graph plot area
        legend.background = element_rect(fill = "white", color = "black") 
  )
