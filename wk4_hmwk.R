library(tmap)
library(sf)
library(here)
library(countrycode)


world_shape <- st_read(here::here("World","World_Countries_Generalized.shp"))

world_shape$ISO3C <- countrycode(world_shape$COUNTRY, origin= 'country.name', destination = 'iso3c')

GII <- read.csv(here::here('GII2.csv'))

world_shape <- merge(world_shape, GII, by.x = 'ISO3C', by.y='countryIsoCode')

world_shape$diff <- world_shape$X2019 - world_shape$X2010