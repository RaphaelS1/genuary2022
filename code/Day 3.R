library(ggplot2)

shift = 10

ggplot(data.frame(x = 42, y = 42)) +
  geom_point(aes(x = x, y = y), fill = "white", color = "white", size = 1e-10000) +
  geom_text(aes(x = x + shift, y = y + shift), label = "You", color = "white") +
  geom_segment(aes(x = x + shift - 2, y = y + shift - 2, xend = x + 2, yend = y + 2),
                  arrow = arrow(length = unit(0.3, "cm")), color = "white") +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),
    axis.title = element_blank(),
    axis.ticks = element_blank(),
    axis.text = element_blank(),
    plot.background = element_rect(fill = "black")
  ) +
  coord_cartesian(c(-100, 100), c(-100, 100))
