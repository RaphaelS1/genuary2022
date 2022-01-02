library(ggplot2)
set.seed(1)

n = 7500
limit = 4
x = y = numeric(n)

for (i in seq(2, n)) {
  x[i] = max(min(x[i - 1] + rnorm(1), limit + 4), -limit)
  y[i] = max(min(y[i - 1] + rnorm(1), limit), -limit)
}

ggplot(data.frame(x, y)) +
  geom_path(aes(x = x, y = y)) +
  theme_bw() +
  theme(
    panel.grid = element_blank(),
    axis.title = element_blank(),
    axis.ticks = element_blank(),
    axis.text = element_blank(),
    plot.background = element_rect(fill = "black")
  )
