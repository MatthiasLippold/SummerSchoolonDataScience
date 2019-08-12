
# Read libraries

require(ggplot2)
require(lme4)

# Read Data

data <- read.csv(file = "country_data.csv", header = T)


# Select Data from Canada
Canada <- data[data$country == "Canada", ]

# Save Data from Canada
write.csv(Canada, file = "Canada.csv", row.names = FALSE)

# Plot Data Canada
ggplot(data = Canada, aes(x = year, y = lifeExp)) +
  geom_point() +
  geom_line() 
ggsave("life_exspecatancy_Cananda.png")


# Impact of Population 

# Note, causation does not imply causality 

mod1<-lmer(lifeExp~pop+(1|country),data=data) # Model

summary(mod1)


