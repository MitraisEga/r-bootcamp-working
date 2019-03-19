source("R/lib.init.R")
library("plumber")

api <- plumb("R/API.R")
api$run(port=10000)