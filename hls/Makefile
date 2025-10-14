
output_kernel_$(TARGET).xo: output_kernel.cpp
	v++ --platform $(PLATFORM) -t $(TARGET) -s -g --kernel output_kernel -c -o output_kernel_$(TARGET).xo --log_dir ./logs output_kernel.cpp

clean:
	rm -rf .Xil _x logs 
	rm -f output_kernel.x* xcd.log
