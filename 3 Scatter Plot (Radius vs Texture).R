breast_cancer_wisconsin_dataset <- 'https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/refs/heads/main/Python/Dataset/data-3.csv'
bcwd <- read.csv(breast_cancer_wisconsin_dataset)
head(bcwd)
dim(bcwd)

ggplot(data = bcwd, 
       aes(x = radius_mean, y = texture_mean, col = diagnosis))+
  scale_color_manual(values = c('lightblue', 'orange'), 
                     labels = c("Malignant", "Benign")) + 
  labs(color = 'Diagnosis', #legend_title, 
       x = expression("Mean Radius"), 
       y = expression("Mean Texture")) +
  ggtitle('Scatterplot of Diagnosis Results') + #main title for the graph 
  geom_point(size = 2) +
  theme_classic()
