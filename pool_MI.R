
# Pooled estimates

# Pooled estimates of HRs were obtained using mice package as follows:
# Model fits from 5 imputed datasets were saved into a list. This was converted to a "mira" object 
# using as.mira() function. Results were then combined using pool() function to obtain pooled estimates
# according to Rubin's rule.

# Read a list of fitted object
# convert to mira using as.mira(), then pool()

# Require mice package
library(mice)

# saveRDS(MI1_unadj, file = "MI1_unadj.rds")
# saveRDS(MI2_unadj, file = "MI2_unadj.rds")
# saveRDS(MI3_unadj, file = "MI3_unadj.rds")
# saveRDS(MI4_unadj, file = "MI4_unadj.rds")
# saveRDS(MI5_unadj, file = "MI5_unadj.rds")

MI1_unadj <- readRDS("MI1_unadj.rds")
MI2_unadj <- readRDS("MI2_unadj.rds")
MI3_unadj <- readRDS("MI3_unadj.rds")
MI4_unadj <- readRDS("MI4_unadj.rds")
MI5_unadj <- readRDS("MI5_unadj.rds")

# saveRDS(MI_mv1a_mod, file = "MI_mv1a_mod.rds")
# saveRDS(MI_mv2a_mod, file = "MI_mv2a_mod.rds")
# saveRDS(MI_mv2c_mod, file = "MI_mv2c_mod.rds")
# saveRDS(MI_mv3_mod, file = "MI_mv3_mod.rds")

MI_mv1a_mod <- readRDS("MI_mv1a_mod.rds")
MI_mv2a_mod <- readRDS("MI_mv2a_mod.rds")
MI_mv2c_mod <- readRDS("MI_mv2c_mod.rds")
MI_mv3_mod  <- readRDS("MI_mv3_mod.rds")

# saveRDS(MI1_mv1a_trend, file = "MI1_mv1a_trend.rds")
# saveRDS(MI2_mv1a_trend, file = "MI2_mv1a_trend.rds")
# saveRDS(MI3_mv1a_trend, file = "MI3_mv1a_trend.rds")
# saveRDS(MI4_mv1a_trend, file = "MI4_mv1a_trend.rds")
# saveRDS(MI5_mv1a_trend, file = "MI5_mv1a_trend.rds")

MI1_mv1a_trend <- readRDS("MI1_mv1a_trend.rds")
MI2_mv1a_trend <- readRDS("MI2_mv1a_trend.rds")
MI3_mv1a_trend <- readRDS("MI3_mv1a_trend.rds")
MI4_mv1a_trend <- readRDS("MI4_mv1a_trend.rds")
MI5_mv1a_trend <- readRDS("MI5_mv1a_trend.rds")

# saveRDS(MI1_mv2a_trend, file = "MI1_mv2a_trend.rds")
# saveRDS(MI2_mv2a_trend, file = "MI2_mv2a_trend.rds")
# saveRDS(MI3_mv2a_trend, file = "MI3_mv2a_trend.rds")
# saveRDS(MI4_mv2a_trend, file = "MI4_mv2a_trend.rds")
# saveRDS(MI5_mv2a_trend, file = "MI5_mv2a_trend.rds")

MI1_mv2a_trend <- readRDS("MI1_mv2a_trend.rds")
MI2_mv2a_trend <- readRDS("MI2_mv2a_trend.rds")
MI3_mv2a_trend <- readRDS("MI3_mv2a_trend.rds")
MI4_mv2a_trend <- readRDS("MI4_mv2a_trend.rds")
MI5_mv2a_trend <- readRDS("MI5_mv2a_trend.rds")

# saveRDS(MI1_mv2c_trend, file = "MI1_mv2c_trend.rds")
# saveRDS(MI2_mv2c_trend, file = "MI2_mv2c_trend.rds")
# saveRDS(MI3_mv2c_trend, file = "MI3_mv2c_trend.rds")
# saveRDS(MI4_mv2c_trend, file = "MI4_mv2c_trend.rds")
# saveRDS(MI5_mv2c_trend, file = "MI5_mv2c_trend.rds")

MI1_mv2c_trend <- readRDS("MI1_mv2c_trend.rds")
MI2_mv2c_trend <- readRDS("MI2_mv2c_trend.rds")
MI3_mv2c_trend <- readRDS("MI3_mv2c_trend.rds")
MI4_mv2c_trend <- readRDS("MI4_mv2c_trend.rds")
MI5_mv2c_trend <- readRDS("MI5_mv2c_trend.rds")

# Function to calculate HR for substitution
get_est_beta_substitute <- function(bhat, vcov, gram, loc){
  # Point estimate
  est_cbeta <- bhat[loc,] %*% c(1, -gram)
  # 95% CI
  a <- c(1, -gram)
  v <- vcov[c(loc), c(loc)]
  subs_b_var <- t(a) %*% v  %*% a
  ci <- rep(est_cbeta, 2) + qnorm(c(.025, .975)) * rep(sqrt(subs_b_var), 2)
  return(exp(c(est_cbeta, ci)))
}

# Pooling results using mice package: mira

# Model 0: unadjusted
pool_unadj <- function(i){
  c(MI1_unadj[i], MI2_unadj[i], MI3_unadj[i], MI4_unadj[i], MI5_unadj[i]) %>%   
    as.mira() %>% 
    pool() %>% 
    summary(conf.int = TRUE) %>% 
    mutate(estimate = exp(estimate), 
           conf.low = exp(conf.low),
           conf.high = exp(conf.high)) %>% 
    select(term, estimate, p.value, conf.low, conf.high)
}

1:length(MI1_unadj) %>% 
  lapply(pool_unadj) %>% 
  do.call(rbind, .)

# Model 1a
MI_mv1a_mod %>% 
  as.mira() %>% 
  pool() %>% 
  summary(conf.int = TRUE) %>% 
  mutate(estimate = exp(estimate), 
         conf.low = exp(conf.low),
         conf.high = exp(conf.high)) %>% 
  select(term, estimate, p.value, conf.low, conf.high)

# Model 1a trend p-values
pool_trend <- function(i){
  c(MI1_mv1a_trend[i], MI2_mv1a_trend[i], MI3_mv1a_trend[i], MI4_mv1a_trend[i], MI5_mv1a_trend[i]) %>%   
    as.mira() %>% 
    pool() %>% 
    summary(conf.int = TRUE) %>% 
    mutate(estimate = exp(estimate), 
           conf.low = exp(conf.low),
           conf.high = exp(conf.high)) %>% 
    select(term, p.value)
}

1:length(MI1_mv1a_trend) %>% 
  lapply(pool_trend) %>% 
  lapply(slice, n()) %>% 
  do.call(rbind, .)

# Model 2a
MI_mv2a_mod %>% 
  as.mira() %>% 
  pool() %>% 
  summary(conf.int = TRUE) %>% 
  mutate(estimate = exp(estimate), 
         conf.low = exp(conf.low),
         conf.high = exp(conf.high)) %>% 
  select(term, estimate, p.value, conf.low, conf.high)

# Estimated beta
bhat <- MI_mv2a_mod %>% 
  as.mira() %>% 
  pool() %>% 
  summary(conf.int = TRUE) %>% 
  select(estimate)

# Get vcov
fit_mi <- MI_mv2a_mod %>% as.mira()
pooled <- fit_mi %>% pool()
m <- pooled$m
vw <- Reduce("+", lapply(fit_mi$analyses, vcov)) / (m)
b <- pooled$pooled$b 
qbar <- getqbar(pooled)
qhats <- sapply(fit_mi$analyses, coef)
vb <- (1 / (m-1)) * (qhats - qbar) %*% t(qhats - qbar)
vt <- vw + (1 + 1 / (m)) * vb

dim(vt)

colnames(vt)

# Substitution with nuts
# Assume 1 serving of nuts = 14 gram

# Substitute egg 1-3x/month with nuts
# Substitute with nuts 14 gram/d * 2/30
get_est_beta_substitute(bhat, vt, 14 * 2 / 30, c(24, 35))

# Substitute egg 1x/week with nuts
# Substitute with nuts 14 gram/d * 1/7
get_est_beta_substitute(bhat, vt, 14 / 7, c(25, 35))

# Substitute egg 2-4x/week with nuts
# Substitute with nuts 14 gram/d * 3/7
get_est_beta_substitute(bhat, vt, 14 * 3 / 7, c(26, 35))

# Substitute egg 5x/week with nuts
# Substitute with nuts 14 gram/d
get_est_beta_substitute(bhat, vt, 14, c(27, 35))


# Substitution with beans 
# Assume 1 serving of beans = 60 gram

# Substitute egg 1-3x/month with beans
# Substitute with beans 60 gram/d * 2/30
get_est_beta_substitute(bhat, vt, 60 * 2 / 30, c(24, 36))

# Substitute egg 1x/week with beans
# Substitute with beans 60 gram/d * 1/7
get_est_beta_substitute(bhat, vt, 60 / 7, c(25, 36))

# Substitute egg 2-4x/week with beans
# Substitute with beans 60 gram/d * 3/7
get_est_beta_substitute(bhat, vt, 60 * 3 / 7, c(26, 36))

# Substitute egg 5x/beans with beans
# Substitute with nuts 60 gram/d
get_est_beta_substitute(bhat, vt, 60, c(27, 36))

# Model 2a trend p-values
pool_trend <- function(i){
  c(MI1_mv2a_trend[i], MI2_mv2a_trend[i], MI3_mv2a_trend[i], MI4_mv2a_trend[i], MI5_mv2a_trend[i]) %>%   
    as.mira() %>% 
    pool() %>% 
    summary(conf.int = TRUE) %>% 
    mutate(estimate = exp(estimate), 
           conf.low = exp(conf.low),
           conf.high = exp(conf.high)) %>% 
    select(term, p.value)
}

1:length(MI1_mv2a_trend) %>% 
  lapply(pool_trend) %>% 
  lapply(slice, n()) %>% 
  do.call(rbind, .)

# Model 2c
MI_mv2c_mod %>% 
  as.mira() %>% 
  pool() %>% 
  summary(conf.int = TRUE) %>% 
  mutate(estimate = exp(estimate), 
         conf.low = exp(conf.low),
         conf.high = exp(conf.high)) %>% 
  select(term, estimate, p.value, conf.low, conf.high)

# Estimated beta
bhat <- MI_mv2c_mod %>% 
  as.mira() %>% 
  pool() %>% 
  summary(conf.int = TRUE) %>% 
  select(estimate)

# Get vcov
fit_mi <- MI_mv2c_mod %>% as.mira()
pooled <- fit_mi %>% pool()
m <- pooled$m
vw <- Reduce("+", lapply(fit_mi$analyses, vcov)) / (m)
b <- pooled$pooled$b 
qbar <- getqbar(pooled)
qhats <- sapply(fit_mi$analyses, coef)
vb <- (1 / (m-1)) * (qhats - qbar) %*% t(qhats - qbar)
vt <- vw + (1 + 1 / (m)) * vb

dim(vt)

colnames(vt)

# Substitution with nuts
# Assume 1 serving of nuts = 14 gram

# Substitute egg 1-3x/month with nuts
# Substitute with nuts 14 gram/d * 2/30
get_est_beta_substitute(bhat, vt, 14 * 2 / 30, c(32, 43))

# Substitute egg 1x/week with nuts
# Substitute with nuts 14 gram/d * 1/7
get_est_beta_substitute(bhat, vt, 14 / 7, c(33, 43))

# Substitute egg 2-4x/week with nuts
# Substitute with nuts 14 gram/d * 3/7
get_est_beta_substitute(bhat, vt, 14 * 3 / 7, c(34, 43))

# Substitute egg 5x/week with nuts
# Substitute with nuts 14 gram/d
get_est_beta_substitute(bhat, vt, 14, c(35, 43))

exp(bhat[43,] * 14)

# Substitution with beans 
# Assume 1 serving of beans = 60 gram

# Substitute egg 1-3x/month with beans
# Substitute with beans 60 gram/d * 2/30
get_est_beta_substitute(bhat, vt, 60 * 2 / 30, c(32, 44))

# Substitute egg 1x/week with beans
# Substitute with beans 60 gram/d * 1/7
get_est_beta_substitute(bhat, vt, 60 / 7, c(33, 44))

# Substitute egg 2-4x/week with beans
# Substitute with beans 60 gram/d * 3/7
get_est_beta_substitute(bhat, vt, 60 * 3 / 7, c(34, 44))

# Substitute egg 5x/beans with beans
# Substitute with nuts 60 gram/d
get_est_beta_substitute(bhat, vt, 60, c(35, 44))


# Model 2c trend p-values
pool_trend <- function(i){
  c(MI1_mv2c_trend[i], MI2_mv2c_trend[i], MI3_mv2c_trend[i], MI4_mv2c_trend[i], MI5_mv2c_trend[i]) %>%   
    as.mira() %>% 
    pool() %>% 
    summary(conf.int = TRUE) %>% 
    mutate(estimate = exp(estimate), 
           conf.low = exp(conf.low),
           conf.high = exp(conf.high)) %>% 
    select(term, p.value)
}

1:length(MI1_mv2c_trend) %>% 
  lapply(pool_trend) %>% 
  lapply(slice, n()) %>% 
  do.call(rbind, .)

# Model 3 
MI_mv3_mod %>% 
  as.mira() %>% 
  pool() %>% 
  summary(conf.int = TRUE) %>% 
  mutate(estimate = exp(estimate), 
         conf.low = exp(conf.low),
         conf.high = exp(conf.high)) %>% 
  select(term, estimate, p.value, conf.low, conf.high)
