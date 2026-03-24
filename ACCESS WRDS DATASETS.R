#-------------------------------------------------------------------------------
# START ------------------------------------------------------------------------
#-------------------------------------------------------------------------------

# LOAD PACKAGES
library(tidyverse)
library(RPostgres)
library(tidyfinance)

user <- "USERNAME"
password <- "PASSWORD"

# CREATE CONNECTION
wrds <- dbConnect(
  Postgres(),
  host = "wrds-pgdata.wharton.upenn.edu",
  dbname = "wrds",
  port = 9737,
  sslmode = "require",
  user = user,
  password = password
)

set_wrds_credentials()

wrds <- get_wrds_connection()

SCHEMA <- "optionm_all"

# https://wrds-www.wharton.upenn.edu/data-dictionary/optionm_all/
# ALL TABLES WITHIN SCHEMA
dbListObjects(wrds, Id(schema = SCHEMA))

TABLE <- "opprcd2025"

option_file_2025 <- tbl(wrds, I(paste0(SCHEMA, ".", TABLE)))

# DISCONNECT
dbDisconnect(wrds)

#-------------------------------------------------------------------------------
# END --------------------------------------------------------------------------
#-------------------------------------------------------------------------------
