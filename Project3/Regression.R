

s1 <- lm(`Annual Per Capita Cost - Direct` ~ ADP, data = state_data)
s2 <- lm(`Annual Per Capita Cost - Indirect` ~ ADP, data = state_data)
s3 <- lm(`Annual Per Capita Cost - Total` ~ ADP, data = state_data)
summary(s1)
summary(s2)
summary(s3)


p1 <- lm(`Annual Per Capita Cost - Direct` ~ ADP, data = private_data)
p2 <- lm(`Annual Per Capita Cost - Indirect` ~ ADP, data = private_data)
p3 <- lm(`Annual Per Capita Cost - Total` ~ ADP, data = private_data)
summary(p1)
summary(p2)
summary(p3)


