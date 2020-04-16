library(here)

source(here("R/02-child.R"))

## Read the North Carolina shapefile into R
nc <- st_read(system.file("shape/nc.shp", package="sf"), quiet = TRUE)
## Plot it and fill by area
plot(nc["AREA"])