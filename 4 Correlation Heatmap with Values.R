#radius_mean, texture_mean, perimeter_mean, area_mean, smoothness_mean, compactness_mean
colnames(bcwd)
#creating a smaller data frame with the 6 columns of interest
bcwd_subset <- data.frame(bcwd$radius_mean, bcwd$texture_mean, bcwd$perimeter_mean, bcwd$area_mean, bcwd$smoothness_mean, bcwd$compactness_mean)
dim(bcwd_subset)
head(bcwd_subset)

#creating a correlation matriz
correlation_matrix = cor(bcwd_subset)
print(correlation_matrix)

library(pheatmap) #has to be downloaded each time


pheatmap(mat = correlation_matrix,
         display_numbers = TRUE, # to print the correlation indices on top of the colors
         number_color = "black", # to choose the color of the printed numbers
         fontsize_number = 10,   # to choose the size of the printed numbers
         border_color = 'black',
         legend = T,             # to create a legend
         main = 'Correlation Heatmap with Values'
         )

         