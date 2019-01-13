summary_stat_gaussian = function(X,y){
  ss <- data.frame(t(apply(X, 2, FUN=function(x){
    fit <- lm(y~x)
    summary(fit)$coefficients[2,]
  })))
  names(ss) <- c("effect", "se", "t", "pval")
  return(ss)
}

summary_stat_logistic = function(X,y){
  ss <- data.frame(t(apply(X, 2, FUN=function(x){
    fit <- glm(y~x, family = 'binomial')
    summary(fit)$coefficients[2,]
  })))
  names(ss) <- c("effect", "se", "z", "pval")
  return(ss)
}