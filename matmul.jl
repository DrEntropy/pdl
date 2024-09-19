# Import necessary library
using Random, Statistics, BenchmarkTools

# Set the random seed for reproducibility (optional)
Random.seed!(42)
#This is 10,000 times faster then the naive python version
# Create two random matrices (normal distribution, mean 0, sd 1)
A = randn(10, 784)  # 1000x1000 matrix with mean 0, sd 1
B = randn(784, 10)

# Time the multiplication of the two matrices

# Initialize the result matrix with zeros
C = zeros(10, 10)

# Time the multiplication of the two matrices using three nested loops
using BenchmarkTools

# In python this took 500 ms on my macbook 

@btime begin
      for i in 1:size(A, 1)  # Loop over the rows of A
          for j in 1:size(B, 2)  # Loop over the columns of B
             for k in 1:size(A, 2)  # Loop over the columns of A and rows of B
                C[i, j] += A[i, k] * B[k, j]  # Compute the dot product
            end
        end
    end
end
# result was 5.5 ms.  Numba did this same thing in 50 microsecods!!!  

@btime  C = A*B;
# result was 6 microseconds.  This is comparable to pytorch buildin (not on gpu) 
