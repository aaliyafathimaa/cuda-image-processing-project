# CUDA Image Processing Project

## Project Description
This project demonstrates GPU-based image processing using CUDA.

The CUDA kernel performs image inversion by processing pixel values in parallel on the GPU.

Each pixel value is transformed using:

new_pixel = 255 - old_pixel

This demonstrates parallel GPU computation for image processing tasks.

## Technologies Used
- CUDA
- C++
- NVIDIA GPU

## Dataset
Synthetic grayscale image data (1024 x 1024 pixels)

## Execution
Compile:
nvcc image_processing.cu -o image_processing

Run:
./image_processing

Expected Output:
CUDA image processing completed successfully.
Processed 1048576 pixels using GPU.

## GPU Usage
This project uses a CUDA kernel to process over 1 million pixels in parallel.
