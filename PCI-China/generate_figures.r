checkpoint:::checkpoint(
    snapshotDate = utils::packageDescription("RevoUtils")$MRANDate , 
    R.version = "3.5.1")

### Set path
.PATH = getwd()
.ROOT = file.path(.PATH)
.OUTPUT =  file.path(.ROOT,"visualization")    

### library
library(readr)
library(plyr)
library(dplyr)
library(ggplot2)
library(tidyr)
library(zoo)
library(plotly)
library(reshape2)
source("src/visualization.r")

hh = 4

######

data_5y = prepare_data("window_5_years", .ROOT )
data_10y = prepare_data("window_10_years", .ROOT)

ggsave(file.path(.OUTPUT,"diff_wo_events_5y.png"), plot = plot_pci(data_5y,event=FALSE,abs=FALSE) , width=hh*2.4 ,height=1.5*hh)
ggsave(file.path(.OUTPUT,"pci_wo_events_5y.png"), plot = plot_pci(data_5y,event=FALSE,abs=TRUE), width=hh*2.4 ,height=1.5*hh)
ggsave(file.path(.OUTPUT,"diff_with_events_5y.png"), plot = plot_pci(data_5y,event=TRUE,abs=FALSE), width=hh*2.4 ,height=1.5*hh)
ggsave(file.path(.OUTPUT,"pci_with_events_5y.png"), plot = plot_pci(data_5y,event=TRUE,abs=TRUE), width=hh*2.4 ,height=1.5*hh)
ggsave(file.path(.OUTPUT,"F1_two_curves_5y.png"), plot = plot_F1(data_5y), width=hh*2.4 ,height=1.5*hh)

ggsave(file.path(.OUTPUT,"diff_wo_events_10y.png"), plot = plot_pci(data_10y,event=FALSE,abs=FALSE) , width=hh*2.4 ,height=1.5*hh)
ggsave(file.path(.OUTPUT,"pci_wo_events_10y.png"), plot = plot_pci(data_10y,event=FALSE,abs=TRUE), width=hh*2.4 ,height=1.5*hh)
ggsave(file.path(.OUTPUT,"diff_with_events_10y.png"), plot = plot_pci(data_10y,event=TRUE,abs=FALSE), width=hh*2.4 ,height=1.5*hh)
ggsave(file.path(.OUTPUT,"pci_with_events_10y.png"), plot = plot_pci(data_10y,event=TRUE,abs=TRUE), width=hh*2.4 ,height=1.5*hh)
ggsave(file.path(.OUTPUT,"F1_two_curves_10y.png"), plot = plot_F1(data_10y), width=hh*2.4 ,height=1.5*hh)

ggsave(file.path(.OUTPUT,"F1_testing_5yrs_vs_10yrs.png"), plot = plot_compare(data_5y,data_10y,"F1"), width=hh*2.4 ,height=1.5*hh)
ggsave(file.path(.OUTPUT,"pci_wo_events_5yrs_vs_10yrs.png"), plot = plot_compare(data_5y,data_10y,"PCI"), width=hh*2.4 ,height=1.5*hh)



######
######

