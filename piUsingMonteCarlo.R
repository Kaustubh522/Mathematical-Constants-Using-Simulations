# Value of Pi using Monte Carlo
# Throwing marbles in square of side 1, count how many fall inside a circle inscribed in it

# We throw 10, 100, ..., 10^logRange marbles respectively in each round
logRange <- 6

# Array to store the values of pi we get for different number of marbles thrown
monteCarloPi <- c()

distanceFromOrigin <-  function(x, y) {
  sqrt(x^2 + y^2)
}

# Throw marbles 10, 100, ..., 10^logRange times each
for (powerNum in 1:logRange){

  # No. of marbles 
  marbleNum <- 10^powerNum
  inCircle <- 0
  
  # Throw marbles in the square
  randomPoints <-  array(runif(marbleNum*2), dim = c(marbleNum, 2))
  
  # Count no. of marbles in the circle
  for (i in 1:nrow(randomPoints)){
    if (distanceFromOrigin(randomPoints[i, 1], randomPoints[i, 2]) < 1){
      inCircle <- inCircle + 1
    }
  
  }
  
  # Calculate the value of pi and append it to the array 
  monteCarloPi <- append(monteCarloPi, (inCircle*4)/marbleNum)

}

plot(1:logRange, monteCarloPi, type = 'l', xlab = 'log(marbleNum)')
text(1:logRange, monteCarloPi, monteCarloPi, col = 'blue')
