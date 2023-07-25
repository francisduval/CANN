dbfictif <- tar_read(dbfictif)

data1 <- dbfictif[1:4000,]
data2 <- dbfictif[4001:8000,]

###

df1 <- 
  data1 %>%
  select(expo, freq_paiement, an_naissance, annee_veh, annee_permis, sexe, voiture) 

rec_class <-
  recipe(~ ., data = df1) %>%
  step_impute_mode(sexe) %>% 
  step_other(all_nominal(), threshold = 0.05) %>%
  step_dummy(all_nominal()) %>%
  prep()

x_cols <- juice(rec_class)
nombrecol <- ncol(x_cols)
###

db_fictif_ds <- Dataset(data1)

mlp <- PoissonMLP_1L(input_size = nombrecol, n_1L = 4)
mlp$forward(db_fictif_ds$x[1:2, ])

Mod <- PoissonMLP$new(spec=PoissonMLP_1L, dataset=Dataset)

Mod$train(train=data1, valid=data2, epochs=20, lr_start=0.01, factor=0.5, patience=2, batch = 64, input_size = nombrecol, n_1L = 4)

Mod$plot_training()
Mod$print_metrics()

db_fictif_ds$x
