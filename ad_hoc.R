load("data/dbfictif.Rda")

db_fictif_ds <- Dataset(db.fictif)

mlp <- PoissonMLP_1L(input_size = 2, n_1L = 4)
mlp$forward(db_fictif_ds$x[1:2, ])


