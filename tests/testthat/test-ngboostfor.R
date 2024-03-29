# A unit test for NGBforecast class
if(require(testthat)){
  test_that("tests for some arguments in NGBforecast", {

    if_not_ngboost_exist_skip()

    model <- NGBforecast$new(Dist = Dist("LogNormal"),
                             Base = sklearner(),
                             Score = Scores("LogScore"),
                             natural_gradient = TRUE,
                             n_estimators = 200,
                             learning_rate =  0.1,
                             minibatch_frac = 1,
                             col_sample = 1,
                             verbose = TRUE,
                             verbose_eval = 100,
                             tol = 1e-5)

    model$fit(y = AirPassengers, seasonal = TRUE, max_lag = 12, xreg = NULL,
              early_stopping_rounds = 10L, K = 5)


    fc <- c(model$forecast(h = 2, level = c(90, 80), xreg = NULL)$mean)

    expect_equal(fc, c(454.3927, 425.1821), tolerance = 4)

  })
  
  test_that("tests for non-seasonal NGBforecast", {
    
    if_not_ngboost_exist_skip()
    
    model <- NGBforecast$new(Dist = Dist("LogNormal"),
                             Base = sklearner(),
                             Score = Scores("LogScore"),
                             natural_gradient = TRUE,
                             n_estimators = 200,
                             learning_rate =  0.1,
                             minibatch_frac = 1,
                             col_sample = 1,
                             verbose = TRUE,
                             verbose_eval = 100,
                             tol = 1e-5)
    
    model$fit(y = AirPassengers, seasonal = FALSE, max_lag = 12, xreg = NULL, 
              early_stopping_rounds = 10L)
    
    
    fc <- c(model$forecast(h = 2, level = c(90, 80), xreg = NULL)$mean)
    
    expect_equal(fc, c(468, 461), tolerance = 5)
    
  })
  
  test_that("tests for non-seasonal xreg NGBforecast", {
    
    if_not_ngboost_exist_skip()
    
    model <- NGBforecast$new(Dist = Dist("LogNormal"),
                             Base = sklearner(),
                             Score = Scores("LogScore"),
                             natural_gradient = TRUE,
                             n_estimators = 200,
                             learning_rate =  0.1,
                             minibatch_frac = 1,
                             col_sample = 1,
                             verbose = TRUE,
                             verbose_eval = 100,
                             tol = 1e-5)
    
    xreg <- matrix(rnorm(length(AirPassengers)*2, mean = 3), ncol = 2)
    newxreg <- matrix(rnorm(4, mean = 3), ncol = 2)
    
    model$fit(y = AirPassengers, seasonal = FALSE, max_lag = 12, xreg = xreg, 
              early_stopping_rounds = 10L)
    
    
    fc <- c(model$forecast(h = 2, level = c(90, 80), xreg = newxreg)$mean)
    
    expect_equal(fc, c(463, 461), tolerance = 5)
    
  })
  
  test_that("tests for seasonal xreg NGBforecast", {
    
    if_not_ngboost_exist_skip()
    
    model <- NGBforecast$new(Dist = Dist("LogNormal"),
                             Base = sklearner(),
                             Score = Scores("LogScore"),
                             natural_gradient = TRUE,
                             n_estimators = 200,
                             learning_rate =  0.1,
                             minibatch_frac = 1,
                             col_sample = 1,
                             verbose = TRUE,
                             verbose_eval = 100,
                             tol = 1e-5)
    
    xreg <- matrix(rnorm(length(AirPassengers)*2, mean = 3), ncol = 2)
    newxreg <- matrix(rnorm(4, mean = 3), ncol = 2)
    
    model$fit(y = AirPassengers, seasonal = TRUE, max_lag = 12, xreg = xreg, 
              early_stopping_rounds = 10L)
    
    
    fc <- c(model$forecast(h = 2, level = c(90, 80), xreg = newxreg)$mean)
    
    expect_equal(fc, c(470, 463), tolerance = 5)
    
  })
  
}
