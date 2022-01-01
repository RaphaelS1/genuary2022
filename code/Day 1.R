library(survival)
library(ggplot2)

df = rats[sample(300, 10000, TRUE), ]
p = survfit(coxph(Surv(time, status) ~ ., data = df), newdata = df)
matplot(p$surv, type = "l", col = (df$sex == "m") + 1, ylab = "S(T)", xlab = "T")

rp = reshape2::melt(p$surv) |>
  dplyr::mutate(
    Var1 = rep(sort(unique(rats$time)), 10000),
    sex = rep(df$sex, each = 56)
  )

ggplot(rp, aes(x = Var1, y = value, group = Var2, color = sex)) +
  geom_step() +
  theme_classic() +
  labs(y = "S(T)", x = "T") +
  scale_color_manual(values = c("m" = "#de7fd3", "f" = "#f2b74a"))
