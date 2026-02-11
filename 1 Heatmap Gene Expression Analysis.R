normalized_counts_for_HBR_vs_UHR_samples <- "https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/refs/heads/main/Python/Dataset/hbr_uhr_top_deg_normalized_counts.csv"

normalized_counts_for_HBR_vs_UHR_samples <- read.csv(normalized_counts_for_HBR_vs_UHR_samples)

head(normalized_counts_for_HBR_vs_UHR_samples)

colnames(normalized_counts_for_HBR_vs_UHR_samples)

library(pheatmap)

pheatmap (mat = normalized_counts_for_HBR_vs_UHR_samples[, 2:7], #used the columns with the numerical values
         legend = T, #to create a legend
         labels_row = normalized_counts_for_HBR_vs_UHR_samples$X, #to create labels for the rows
         #colorRampPalette(c(rgb(0,0,1,1), rgb(0,0,1,0)), alpha = TRUE)(8), #to create a blue gradient
         border_color = 'black', #to change the border color to black
         fontsize_row = 12, #to make the gene names more prominent
         angle_col = 45, #to increase readability of col names by changing the angle by 45 degrees 
         na_col = "black", # to ferret out any invalid cells
         main = 'Headmap for HBR vs UHR',
         color = hcl.colors(50, "BluYl"))

#credit: source for blue color gradient - https://rdrr.io/r/grDevices/colorRamp.html from my web search for creeating a blue gradient
