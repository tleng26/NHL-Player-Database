library(tidyverse)
stats = read_csv("skaters_2021.csv")

stats = stats |>
  select(name, team, situation, position, icetime, I_F_points, I_F_goals)

write_csv(x = stats, file = "skaters_2021.csv")

stats = stats |>
  filter(icetime > 3000) |>
  filter(situation == "all")
  ggplot(stats, aes(x = name, y = I_F_points)) +
    geom_bar(stat = "identity", fill = "black", width = 0.5) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
    xlab("Player") +
    ylab("Points")
View(stats)

