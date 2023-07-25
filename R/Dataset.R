Dataset <- 
  dataset(
    name = "Dataset",
    
    initialize = function(df) {
      data <- self$prepare_data(df)
      
      self$x <- data$x
      self$y <- data$y
    },
    
    .getitem = function(i) {
      list(
        x = self$x[i, ],
        y = self$y[i, ]
      )
    },
    
    .length = function() {
      self$y$size()[[1]]
    },
    
    prepare_data = function(df) {
      
      df1 <- 
        df %>%
        select(expo, freq_paiement, an_naissance, annee_veh, annee_permis, sexe, voiture) 

      y_col <- as.matrix(df$nb.sin)
      
      rec_class <-
        recipe(~ ., data = df1) %>%
        step_impute_mode(sexe) %>% 
        step_other(all_nominal(), threshold = 0.05) %>%
        step_dummy(all_nominal()) %>%
        prep()
      
      x_cols <- juice(rec_class) %>% as.matrix()
    
      
      list(
        x = torch_tensor(x_cols),
        y = torch_tensor(y_col)
      )
    }
  )
