all:
	nvcc image_processing.cu -o image_processing

run:
	./image_processing
