
output_kernel.xo: output_kernel.cpp
	v++ --platform $(PLATFORM) -t hw -s -g --kernel output_kernel -c -o output_kernel.xo --log_dir ./logs output_kernel.cpp

clean:
	rm -rf .Xil _x logs 
	rm -f output_kernel.x* xcd.log
