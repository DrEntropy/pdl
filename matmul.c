#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define ROWS_A 10
#define COLS_A 784
#define ROWS_B 784
#define COLS_B 10

// Typedef to define matrix types with fixed dimensions
typedef double MatrixA[ROWS_A][COLS_A];
typedef double MatrixB[ROWS_B][COLS_B];
typedef double MatrixC[ROWS_A][COLS_B];

// Function to generate a matrix with random values
void generate_random_matrix(double* matrix, int rows, int cols) {
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            matrix[i * cols + j] = (double)rand() / RAND_MAX * 2.0 - 1.0;  // Random values between -1 and 1
        }
    }
}

// Function to multiply two matrices
void matrix_multiply(double* A, double* B, double* C, int rows_a, int cols_a, int rows_b, int cols_b) {
    for (int i = 0; i < rows_a; i++) {
        for (int j = 0; j < cols_b; j++) {
            C[i * cols_b + j] = 0.0;
            for (int k = 0; k < cols_a; k++) {
                C[i * cols_b + j] += A[i * cols_a + k] * B[k * cols_b + j];
            }
        }
    }
}

int main() {
    // Seed for random number generation
    srand(time(NULL));

    // Initialize matrices
    MatrixA A;
    MatrixB B;
    MatrixC C;

    // Generate random matrices A and B
    generate_random_matrix((double*)A, ROWS_A, COLS_A);
    generate_random_matrix((double*)B, ROWS_B, COLS_B);

    // Measure start time
    clock_t start = clock();

    // Perform matrix multiplication
    matrix_multiply((double*)A, (double*)B, (double*)C, ROWS_A, COLS_A, ROWS_B, COLS_B);

    // Measure end time
    clock_t end = clock();

    // Calculate and print the elapsed time
    double time_taken = ((double)(end - start)) / CLOCKS_PER_SEC;
    printf("Matrix multiplication took %f microseconds\n", time_taken*1e6);

    return 0;
}
