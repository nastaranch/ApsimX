rm(list=ls())
library(hydroGOF)

x_simple <- c(0.00,1.00,2.00,3.00,4.00,5.00,6.00,7.00,8.00,9.00)
y_simple <- c(0.00,1.00,2.00,3.00,4.00,5.00,6.00,7.00,8.00,9.00)

x_actual_small <- c(246.30,228.30,181.70,169.40,170.20,172.20,163.40,156.70,159.30,156.60,217.90,175.50,265.40,233.80,203.30,186.20,224.40)
y_actual_small <- c(243.80,193.80,179.80,177.70,215.20,192.70,191.60,176.90,169.20,168.00,194.30,170.00,261.90,222.20,196.80,187.70,220.30)

x_actual_large <- c(127.14,93.24,67.74,49.44,40.86,31.97,24.66,16.48,10.86,8.75,7.86,105.04,57.95,48.56,29.30,131.30,115.02,102.29,74.14,59.46,45.36,32.63,18.94,12.93,11.08,9.05,56.48,32.40,38.56,49.27,174.27,161.40,158.37,123.78,112.62,93.18,75.48,55.16,37.24,32.97,22.04,109.99,86.03,101.59,104.40,185.71,176.96,175.12,152.27,151.87,142.40,133.77,123.86,111.26,114.40,100.63,182.92,163.29,169.17,183.58,185.62,177.89,174.24,155.99,157.41,150.96,144.01,132.22,120.82,125.53,114.20,179.51,164.13,162.40,170.51,190.24,182.05,178.10,159.18,160.71,154.59,145.42,136.15,124.35,128.24,119.20,179.51,167.95,167.68,177.54)
y_actual_large <- c(136.12,117.44,99.14,72.32,59.69,37.96,19.39,6.06,1.47,2.50,0.42,52.99,40.59,43.71,53.33,154.99,155.97,151.49,131.85,129.85,106.14,69.66,34.00,16.88,14.58,8.51,80.31,67.11,75.72,121.65,176.61,171.45,165.34,149.64,144.66,127.01,106.31,80.08,57.27,46.75,33.77,105.80,92.83,101.17,147.20,186.34,178.90,172.08,159.61,156.48,144.15,132.15,120.84,114.41,113.48,108.23,162.26,150.66,154.53,171.67,186.34,178.90,172.08,159.61,156.48,144.15,132.15,120.84,114.41,113.48,109.91,163.81,153.29,157.45,168.07,192.45,192.57,195.08,192.13,192.50,191.19,189.60,171.32,140.59,126.22,116.57,169.88,158.88,162.67,172.79)

x_minimal <- c(0.00,1.00,2.00,3.00)
y_minimal <- c(0.00,1.00,2.00,3.00)

x_random <- c(0.13,342.52,540.40,426.49,247.70,0.00,191.90,573.72,81.27,37.93,193.70,76.18,735.26,178.23,95.70,762.93,118.37,31.35,15.39,98.49,645.01,478.97,119.66,59.43,1.66)
y_random <- c(0.86,124.14,6.59,609.92,272.22,232.50,183.71,326.95,303.37,311.03,116.34,77.23,79.16,197.10,600.43,75.01,326.15,0.06,218.99,695.35,51.26,206.28,23.92,10.36,130.04)

x_large_values <- c(1.00,2.00,3.00,4.00,5.00,6.00,7.00,8.00,9.00,10.00,11.00,12.00,13.00,14.00,15.00,16.00,17.00,18.00,19.00,20.00,21.00,22.00,23.00,24.00,25.00,26.00,27.00,28.00,29.00,30.00,31.00,32.00,33.00,34.00,35.00,36.00,37.00,38.00,39.00,40.00,41.00,42.00,43.00,44.00,45.00,46.00,47.00,48.00,49.00,50.00)
y_large_values <- c(6.36,8.08,10.27,13.06,16.60,21.10,26.83,34.10,43.36,55.12,70.07,89.07,113.23,143.95,182.99,232.63,295.73,375.94,477.92,607.55,772.35,981.85,1248.18,1586.74,2017.14,2564.29,3259.85,4144.09,5268.17,6697.15,8513.75,10823.10,13758.86,17490.93,22235.33,28266.65,35933.95,45681.01,58071.94,73823.91,93848.58,119304.93,151666.29,192805.64,245104.01,311588.26,396106.31,503549.81,640137.27,813773.96)

x_neg <- c(-20.00,-19.00,-18.00,-17.00,-16.00,-15.00,-14.00,-13.00,-12.00,-11.00,-10.00,-9.00,-8.00,-7.00,-6.00,-5.00,-4.00,-3.00,-2.00,-1.00,0.00,1.00,2.00,3.00,4.00,5.00,6.00,7.00,8.00,9.00,10.00,11.00,12.00,13.00,14.00,15.00,16.00,17.00,18.00,19.00,20.00)
y_neg <- c(-7620.00,-6517.00,-5526.00,-4641.00,-3856.00,-3165.00,-2562.00,-2041.00,-1596.00,-1221.00,-910.00,-657.00,-456.00,-301.00,-186.00,-105.00,-52.00,-21.00,-6.00,-1.00,0.00,3.00,14.00,39.00,84.00,155.00,258.00,399.00,584.00,819.00,1110.00,1463.00,1884.00,2379.00,2954.00,3615.00,4368.00,5219.00,6174.00,7239.00, 8420.00)

# edge tests
x_single <- 0
y_single <- 0

x_uncor <- c(1,1,2,2)
y_uncor <- c(1,2,1,2)

# Slope, intercept and standard errors of same
simple_lm       <- lm(y_simple ~ x_simple)
actual_small_lm <- lm(y_actual_small ~ x_actual_small)
actual_large_lm <- lm(y_actual_large ~ x_actual_large)
minimal_lm      <- lm(y_minimal ~ x_minimal)
random_lm       <- lm(y_random ~ x_random)
large_values_lm <- lm(y_large_values ~ x_large_values)
neg_lm          <- lm(y_neg ~ x_neg)
single_lm       <- lm(y_single ~ x_single)
uncor_lm        <- lm(y_uncor ~ x_uncor)

summary(simple_lm)
summary(actual_small_lm)
summary(actual_large_lm)
summary(minimal_lm)
summary(random_lm)
summary(large_values_lm)
summary(neg_lm)
summary(single_lm)
summary(uncor_lm)

#need for sig figs for SEslope
summary(simple_lm)[4]
summary(actual_small_lm)[4]
summary(actual_large_lm)[4]
summary(minimal_lm)[4]
summary(random_lm)[4]
summary(large_values_lm)[4]
summary(neg_lm)[4]
summary(single_lm)[4]
summary(uncor_lm)[4]

# RMSE
rmse(y_simple, x_simple)
rmse(y_actual_small, x_actual_small)
rmse(y_actual_large, x_actual_large)
rmse(y_minimal, x_minimal)
rmse(y_random, x_random)
rmse(y_large_values, x_large_values)
rmse(y_neg, x_neg)
rmse(y_single, x_single)
rmse(y_uncor, x_uncor)

# NSE
NSE(y_simple, x_simple)
NSE(y_actual_small, x_actual_small)
NSE(y_actual_large, x_actual_large)
NSE(y_minimal, x_minimal)
NSE(y_random, x_random)
NSE(y_large_values, x_large_values)
NSE(y_neg, x_neg)
NSE(y_single, x_single)
NSE(y_uncor, x_uncor)

# ME
me(y_simple, x_simple)
me(y_actual_small, x_actual_small)
me(y_actual_large, x_actual_large)
me(y_minimal, x_minimal)
me(y_random, x_random)
me(y_large_values, x_large_values)
me(y_neg, x_neg)
me(y_single, x_single)
me(y_uncor, x_uncor)

# MAE
mae(y_simple, x_simple)
mae(y_actual_small, x_actual_small)
mae(y_actual_large, x_actual_large)
mae(y_minimal, x_minimal)
mae(y_random, x_random)
mae(y_large_values, x_large_values)
mae(y_neg, x_neg)
mae(y_single, x_single)
mae(y_uncor, x_uncor)

# RSR
rsr(y_simple, x_simple)
rsr(y_actual_small, x_actual_small)
rsr(y_actual_large, x_actual_large)
rsr(y_minimal, x_minimal)
rsr(y_random, x_random)
rsr(y_large_values, x_large_values)
rsr(y_neg, x_neg)
rsr(y_single, x_single)
rsr(y_uncor, x_uncor)
