calc_efficiency = function(data) {
  data |>
    mutate("offensive efficiency" = round(I_F_points * 1000 / icetime, digits = 2))
}
