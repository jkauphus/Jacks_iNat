source("inat.R")

library(dplyr)

# How do I want to express the count data

pie<-count(my_obs,iconic_taxon_name)

# Compute percentages
pie$fraction <- pie$n / sum(pie$n)

# Compute the cumulative percentages (top of each rectangle)
pie$ymax <- cumsum(pie$fraction)

# Compute the bottom of each rectangle
pie$ymin <- c(0, head(pie$ymax, n=-1))

# Compute label position
pie$labelPosition <- (pie$ymax + pie$ymin) / 2

# Compute a good label
pie$label <- paste0(pie$iconic_taxon_name, ": ", pie$n)

# Make the plot
plot<-ggplot(pie, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=iconic_taxon_name)) +
  geom_rect() +
  geom_text( x= 4.8, aes(y=labelPosition, label=label, color=iconic_taxon_name), size=4, angle = 30) +
  scale_color_manual(values = c("white","purple", "yellow", "pink", "red", "lightblue", "sandybrown", "green", "black", "brown"))+
  scale_fill_manual(values = c("white","purple", "yellow", "pink", "red", "lightblue", "sandybrown", "green", "black", "brown"))+
  coord_polar(theta="y") +
  xlim(c(-1, 4)) +
  theme_void() +
  theme(legend.position = "none")