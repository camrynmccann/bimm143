#' ---
#' title: "Class 05 Data Visualization"
#' author: "Camryn McCann A15437387"
#' ---

# Class 05 Data Visualization

# Must first call to load ggplot2
library(ggplot2)

# Every ggplot has a data + aes + geoms
ggplot(data = cars) +
  aes(x=speed, y=dist) + 
  geom_point(data = cars) +
  geom_smooth(data = cars) 

# Change to linear model
ggplot(data = cars) +
  aes(x=speed, y=dist) + 
  geom_point(data = cars) +
  geom_smooth(method = "lm") 

# Store plot as an object
p <- ggplot(data = cars) +
  aes(x=speed, y=dist) + 
  geom_point(data = cars) +
  geom_smooth(method = "lm", se = FALSE) 

# Label the plot
p + labs(title="My Nice Plot",x = "Speed (MPH)", y = "Distance (ft)") 

#Base graphics are shorter, for quick visualizations
plot(cars)

# Access and read the data set
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

# Seeing how many
nrow(genes)
ncol(genes)

# Access one column + summarize its data
table(genes$State)
table(genes$State)/nrow(genes) * 100
round (table(genes$State)/nrow(genes) * 100, 2)

# Back to plots
ggplot(genes) + aes(x = Condition1 , y = Condition2, col=State) + 
  geom_point(data=genes)
z <- ggplot(genes) + aes(x = Condition1 , y = Condition2, col=State) + 
  geom_point(data=genes)


#Customize Plot
z + scale_color_manual(values = c("purple", "aquamarine", "green")) + 
  labs(title ="Gene Expression Changes Upon Drug Treatment", 
       x = "Control(no drug)", y = "Drug Treatment")
