library(ggplot2)

coord = 5
x0 = y0 = -coord
x1 = coord
n = 100
y1 = sample(c(coord, coord + runif(n - 1)/ 5), n)

limits = 10
p = ggplot(data.frame(x0, x1, y0, y1)) +
  geom_rect(aes(xmin = x0, ymin = y0, xmax = x1, ymax = y1), alpha = 0, color = "black") +
  lims(x = c(-limits, limits), y = c(-limits, limits)) +
  theme_minimal() +
  facet_wrap(factor(y1, levels = y1) ~ .) +
  theme(panel.grid = element_blank(), text = element_blank(),
        panel.spacing = unit(-7, "mm"))
ggsave("Day5.png", p, device = "png", width = 4, height = 4, bg = "white")
