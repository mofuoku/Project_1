library(ggplot2)
library(leaflet)
library(googleVis)
library(shiny)
library(shinydashboard)

impact <- read.csv("impact_analysis_2.csv", stringsAsFactors = F)

impact$date <- as.Date(impact$date, '%m/%d/%Y')

scaleDF <- as.data.frame(scale(impact$opd))
names(scaleDF) = "opd_scale"

scaleDF2 <- as.data.frame(scale(impact$nopd))
names(scaleDF2) = "nopd_scale"
# impact = cbind(impact,scaleDF,scaleDF2)

#### # Saudi Scaling
#str(impact)

scaleDF3 <- as.data.frame(scale(impact$spc))
names(scaleDF3) = "spc_scale"


##### WTI Scaling

scaleDF4 <- as.data.frame(scale(impact$spc))
names(scaleDF4) = "wti_pc_scaled"
impact = cbind(impact,scaleDF,scaleDF2,scaleDF3, scaleDF4)