# Options =======================================================================================================================
tar_option_set(
  garbage_collection = T,
  memory = "transient",
  format = "qs",
  workspace_on_error = F,
  iteration = "list"
)


# Targets =======================================================================================================================
list(
  
  # -----------------------------------------------------------------------------------------------------------------------------
  # Préparation des données -----------------------------------------------------------------------------------------------------
  # -----------------------------------------------------------------------------------------------------------------------------
  
  tar_target(dbfictif_file, here("data", "db_fictif.csv"), format = "file"),
  tar_target(dbfictif, read_csv(dbfictif_file))
)