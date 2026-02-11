ggplot(data = bcwd,
       aes(x = smoothness_mean, y = compactness_mean, col = diagnosis)) +
       scale_color_manual(values = c('orange', 'lightblue'), #to assign colors based on diagnosis
                   labels = c('Benign', 'Malignant')) + #labels for the legend
       labs(title = 'Scatterplot of Smoothness vs Compactness',
       color = 'Diagnosis', #legend title, 
       x = expression("Mean Smoothness"), y = expression("Mean Compactness")) + #renaming the axes
       ggtitle('Scatterplot of Smoothness vs Compactness') + #main title for the graph
       theme(plot.title = element_text(hjust = 0.5),) + #centering the title
       geom_point(size = 2)
