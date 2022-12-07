# e using simulations
# e is the smallest number n such that the sum of first n numbers drawn from a 
# the uniform distribution is greater than 1

# Perform the trials 10, 100, ..., 10^logRange times each 
logRange <- 5
stochasticE <- c()

for (powerNum in 1:logRange){

  trialNum <- 10^powerNum
  valuesOfE <- c()
  
  for (i in 1:trialNum){
  
  sumOfNums <- 0
  runNum <- 0
  
    while (sumOfNums <= 1){
      
      sumOfNums = sumOfNums + runif(1)
      runNum <- runNum + 1
      
    }
  
    valuesOfE <- append(valuesOfE, runNum)
  
  }
  
  # Take the mean as the value of e 
  stochasticE <- append(stochasticE, mean(valuesOfE))
}

plot(1:logRange, stochasticE, type = 'l', xlab = 'log(trialNum)')
text(1:logRange, stochasticE, stochasticE, col = 'blue')
