sysuse auto /*Dataset*/

expand 1000

bootstrap, reps(100) seed(245642649): logistic foreign price-gear_ratio
/*Bootstrap replications*/

