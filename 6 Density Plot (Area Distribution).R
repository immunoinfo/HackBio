area <- density(bcwd$area_mean)
class(area)
plot(area)
area_df <- data.frame(area)

ggplot( bcwd, aes(x=area_mean, fill = diagnosis)) + #to create density plot on area by diagnosis
        geom_density(alpha = 0.5) + # to create semi-transparent plots so we can see the overlapping areas
        labs (fill='Diagnosis', x = expression('Mean Area'), y = expression('Density') ) + #labels for legend and the axes
        ggtitle('Density Plots for Mean Area By Diagnosis') + #main title for the graph
        theme(plot.title = element_text(hjust = 0.5) )   #to center the title
