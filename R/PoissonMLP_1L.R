PoissonMLP_1L <- 
  nn_module(
    "PoissonMLP_1L",
    
    initialize = function(input_size, n_1L) {
      self$bn0 = nn_batch_norm1d(input_size)
      self$linear1 = nn_linear(input_size, n_1L)
      self$bn1 = nn_batch_norm1d(n_1L)
      self$linear2 = nn_linear(n_1L, 1)
    },
    
    forward = function(x) {
      x %>% 
        self$bn0() %>%
        self$linear1() %>% 
        nnf_relu() %>%
        self$bn1() %>%
        self$linear2() %>% 
        nnf_softplus()
    }
  )