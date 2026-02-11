#importing packages 
install.packages('ggplot2')
library(ggplot2)
library(tidyverse) # includes ggplot2, for data visualisation. dplyr, for data manipulation.
library(RColorBrewer) # for a colourful plot
install.packages("ggrepel") # for nice annotations, not a library its a package

# importing the dataset
differential_expression_results_chromosome_22 <- 'https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/refs/heads/main/Python/Dataset/hbr_uhr_deg_chr22_with_significance.csv'
diff_exp_res_chr_22 <- read.csv(differential_expression_results_chromosome_22)
head(diff_exp_res_chr_22)

ggplot (data = diff_exp_res_chr_22, 
        aes (x = log2FoldChange, y = X.log10PAdj, col = significance) ) + 
  scale_color_manual(values = c("#FFDB6D", "grey", "#00AFBB"),
                     labels = c("Downregulated", "Not Significant", "Upregulated")) +
  labs(color = 'Significance', #legend_title, 
       x = expression("log"[2]*"FC"), y = expression("-log"[10]*"adjusted-p-value")) +
  geom_vline(xintercept = c(-1, 1), col = "gray", linetype = 'dashed') + # for dotted lines at x +- 1
  ggtitle('Differential Gene Expression in Chromosome 22') + #main title for the graph
  geom_point(size = 2) # geom_point at the very end becase we want the dots to be on top of the lines, not underneath it
