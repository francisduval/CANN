dbfictif <- tar_read(dbfictif)

data1 <- dbfictif[1:40000,]
data2 <- dbfictif[40001:80000,]

###

df1 <- 
  data1 %>%
  select(expo, freq_paiement:cheveux) 
glimpse(df1)

install.packages('skimr')
skimr::skim(df1)
  
rec_class <-
  recipe(~ ., data = df1) %>%
  step_impute_mode(sexe) %>% 
  step_other(all_nominal(), threshold = 0.05) %>%
  step_dummy(all_nominal()) %>%
  prep()

x_cols <- juice(rec_class)
nombrecol <- ncol(x_cols)

colnames(dbfictif)

###

db_fictif_ds <- Dataset(data1)

mlp <- PoissonMLP_1L(input_size = nombrecol, n_1L = 4)
mlp$forward(db_fictif_ds$x[1:2, ])

Mod <- PoissonMLP$new(spec=PoissonMLP_1L, dataset=Dataset)

Mod$train(train=data1, valid=data2, epochs=5, lr_start=0.01, factor=0.5, patience=2, batch = 64, input_size = nombrecol, n_1L = 4)

Mod$plot_training()
Mod$print_metrics()

db_fictif_ds$x
