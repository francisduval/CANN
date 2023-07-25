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
      y_col <- as.matrix(df$nb.sin)
      x_cols <- 
        df %>%
        select(expo, freq_paiement) %>%
        as.matrix()
      
      list(
        x = torch_tensor(x_cols),
        y = torch_tensor(y_col)
      )
    }
  )
