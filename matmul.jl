# Import necessary library
using Random, Statistics, BenchmarkTools

# Set the random seed for reproducibility (optional)
Random.seed!(42)
 
# Create two random matrices (normal distribution, mean 0, sd 1)
A ::Matrix{Float64} = randn(10, 784)  # 1000x1000 matrix with mean 0, sd 1
B ::Matrix{Float64} = randn(784, 10)

# Time the multiplication of the two matrices

# Initialize the result matrix with zeros
C ::Matrix{Float64} = zeros(10, 10)

# Time the multiplication of the two matrices using three nested loops
using BenchmarkTools

# In python this took 20 ms on my macbook 

@btime begin
      for i in 1:size(A, 1)  # Loop over the rows of A
          for j in 1:size(B, 2)  # Loop over the columns of B
            @inbounds for k in 1:size(A, 2)  # Loop over the columns of A and rows of B
                C[i, j] += A[i, k] * B[k, j]  # Compute the dot product
            end
        end
    end
end
# result was 50 microseconds.  Numba did this same thing in 50 microsecods 
# not the inner inbounds makes a small difference, 80 microseconds vs 50 microseconds

@btime  C = A*B;
# result was 6 microseconds.  This is comparable to pytorch buildin (not on gpu) 
# Also the c version (-O3) was about 8 microseconds
