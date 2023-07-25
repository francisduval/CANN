source("renv/activate.R")

# Librairies ====================================================================================================================
library(targets)
library(tarchetypes)
library(tidyverse)
library(tidymodels)
library(glmnet)
library(here)
library(fs)
library(qs)
library(lubridate)
library(fastDummies)
library(dtplyr)
library(hms)
library(stringr)
library(dtplyr)
library(conflicted)
library(gee)
library(embed)
library(glue)
library(R6)
library(torch)
library(luz)
library(vip)
library(magrittr)
library(surveillance)
library(MASS)
library(Hmisc)
library(innsight)
library(iml)
library(ggExtra)
library(grid)

# Conflits ======================================================================================================================
conflicted::conflicts_prefer(
  dplyr::filter,
  dplyr::select,
  hms::hms,
  purrr::set_names
)

# Options et thème ==============================================================================================================
options(scipen = 999)
theme_set(theme_bw())

# Lire les fonctions ============================================================================================================
walk(dir_ls("R"), source)
