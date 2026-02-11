# installing the necessary packages
install.packages("tidyverse")
install.packages("dplyr")
install.packages("ggplot2")
library(ggplot2)
library(tidyverse)
install.packages("readxl")
library(readxl)
library(readxl)
library(openxlsx)

# importing the dataset 
sheet_b <- read.xlsx('/Users/hemisangani/HackBio/hb_stage_2.xlsx', sheet = 'b')
sheet_b <- data.frame(sheet_b)

head(sheet_b)

#converting both axes to a log2scale to better understand the fold change

sheet_b_log <- data.frame (
              'Cell' = sheet_b$cell,
              'Half_Life' = log2(sheet_b$half_life),
              'Alpha_Life' = log2(sheet_b$alpha)
              )

head(sheet_b_log)

# creating groups based on cutoff thresholds for half life and alpha life
group <- ifelse (sheet_b_log$Half_Life > 2.5 & sheet_b_log$Alpha_Life < -3.8, "1",
         ifelse (sheet_b_log$Half_Life < 2.5 & sheet_b_log$Alpha_Life > -3.8, "2", 
                 "3"))

# creating a new data frame with the additional column for the assigned group
sheet_b_log_with_groups <- data.frame(sheet_b_log, group)
head(sheet_b_log_with_groups)


quadrant_plot <- ggplot(sheet_b_log_with_groups, aes(Half_Life, Alpha_Life)) +
  geom_vline(xintercept = 2.5, col = "gray", linetype = 'dashed', linewidth = 1) + # create a threshold for Half Life
  geom_hline(yintercept = -3.8, col = "gray", linetype = 'dashed', linewidth = 1) + # create a threshold for Alpha Life
  xlim(-1,5) + # to define the range for the x axis
  ylim(-10,0) + # to define the range for the y axis 
  labs (x = 'log2(Half life)', y = 'log2(Alpha life)') +
  theme(legend.position="none") + # removes the default legend
  geom_point(aes(color= group) # to color by the assigned groups 
  )

# to annotate the exemplar genes, Camp and Ccr2
quadrant_plot + 
  annotate("text", x = 4.628053931, y = -5.695141734, label = "Camp") + 	
  annotate("text", x = -0.214751779, y = -1.094768012, label = "Ccr2") 	
