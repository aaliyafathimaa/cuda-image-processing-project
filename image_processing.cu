#include <stdio.h>
#include <cuda_runtime.h>

__global__ void invertImage(unsigned char *input, unsigned char *output, int size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < size)
    {
        output[idx] = 255 - input[idx];
    }
}

int main()
{
    const int width = 1024;
    const int height = 1024;
    const int size = width * height;

    unsigned char *h_input = new unsigned char[size];
    unsigned char *h_output = new unsigned char[size];

    for (int i = 0; i < size; i++)
    {
        h_input[i] = i % 256;
    }

    unsigned char *d_input, *d_output;

    cudaMalloc((void**)&d_input, size);
    cudaMalloc((void**)&d_output, size);

    cudaMemcpy(d_input, h_input, size, cudaMemcpyHostToDevice);

    int threads = 256;
    int blocks = (size + threads - 1) / threads;

    invertImage<<<blocks, threads>>>(d_input, d_output, size);

    cudaDeviceSynchronize();

    cudaMemcpy(h_output, d_output, size, cudaMemcpyDeviceToHost);

    printf("CUDA image processing completed successfully.\n");
    printf("Processed %d pixels using GPU.\n", size);

    cudaFree(d_input);
    cudaFree(d_output);

    delete[] h_input;
    delete[] h_output;

    return 0;
}
