# Define matrix multiplication function using loops
matmul_basic <- function(A, B) {
  # Get dimensions of matrices
  n <- nrow(A)
  m <- ncol(B)
  p <- ncol(A)
  
  # Initialize result matrix with zeros
  C <- matrix(0, n, m)
  
  # Perform multiplication using three nested loops
  for (i in 1:n) {
    for (j in 1:m) {
      sum <- 0
      for (k in 1:p) {
        sum <- sum +  A[i, k] * B[k, j]
      }
      C[i,j] <- sum
    }
  }
  return(C)
}

# Test with random matrices
set.seed(123)
A <- matrix(rnorm(10 * 784), nrow = 10, ncol = 784)
B <- matrix(rnorm(784 * 10), nrow = 784, ncol = 10)

# Timing the loop-based matrix multiplication
system.time(C <- matmul_basic(A, B))*1000.0

# Compare with built-in matrix multiplication for reference
system.time(C_builtin <- A %*% B)*1000.0

# Load the package
library(microbenchmark)

# preallocate 
C <- matrix(0, 10,10)
C_builtin <- matrix(0,10,10)
# Use microbenchmark for more precise timing
microbenchmark(
  C = matmul_basic(A, B),
  C_builtin = A %*% B,
  times = 10
)

# result:  
#Unit: microseconds
#      expr      min       lq      mean    median       uq      max neval
#         C 2497.392 2610.183 2771.6205 2731.7275 2913.665 3131.621    10
# C_builtin   37.187   39.114   41.2993   40.5695   42.640   48.462    10