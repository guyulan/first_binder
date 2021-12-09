library(tidyverse)

mpg %>%
  group_by(manufacturer) %>%
  summarise(mean_hwy = mean(hwy), sd_hwy = sd(hwy), number = n())

mpg %>%
  group_by(manufacturer) %>%
  summarise(mean_hwy = mean(hwy), sd_hwy = sd(hwy), number = n()) %>%
  arrange(-mean_hwy)

mpg %>% 
  group_by(manufacturer) %>%
  summarise_at(c("displ", "cty", "hwy"), mean, na.rm = TRUE)

mpg %>% 
  group_by(manufacturer) %>%
  summarise_if(is.numeric, mean, na.rm = TRUE)
mpg %>% 
  group_by(manufacturer) %>%
  mutate(mean_hwy = mean(hwy), sd_hwy = sd(hwy))

mpg %>% 
  group_by(manufacturer) %>%
  mutate(mean_hwy = mean(hwy), sd_hwy = sd(hwy)) %>%
  select(-class, -trans)

mpg_with_mean <- mpg %>% 
  group_by(manufacturer) %>%
  mutate(mean_hwy = mean(hwy), sd_hyw = sd(hwy)) %>%
  ungroup() %>%
  select(-class, -trans)
head(mpg_with_mean)
str(mpg_with_mean)

starwars %>%
  filter(!is.na(height)) %>%
  filter(species == "Human") %>%
  summarise(max_height = max(height))

