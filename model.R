## Run analysis, write model results

## Before:
## After:

# load libraries
library(icesTAF)
library(stockassessment)

# ensure model dir exists
mkdir("model")

# load data required
load("data/data.RData", verbose = TRUE)

# setup configuration
conf <-
  loadConf(
    dat,
    "boot/data/sam_config/model.cfg",
    patch = TRUE
  )

# define parameters
par <- defpar(dat, conf)

# fit model
fit <- sam.fit(dat, conf, par)
#here i get an error, and cannot continue with TAF analysis

# retrospective fits
retro_fit <- retro(fit, year = 5)

# save model fits
save(fit, file = "model/fit.RData")
save(retro_fit, file = "model/retro_fit.RData")