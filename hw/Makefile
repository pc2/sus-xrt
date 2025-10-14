
overlay_$(TARGET).xclbin: overlay_$(TARGET).xsa
	v++ -p --platform $(PLATFORM) -t $(TARGET) -o overlay_$(TARGET).xclbin overlay_$(TARGET).xsa --package.boot_mode=ospi

overlay_$(TARGET).xsa: connectivity.cfg ../hls/output_kernel_$(TARGET).xo ../packaging/sus_kernel.xo
	v++ -l --kernel_frequency 100 --platform $(PLATFORM) -t $(TARGET) -s -g --config connectivity.cfg -o overlay_$(TARGET).xsa ../hls/output_kernel_$(TARGET).xo ../packaging/sus_kernel.xo

clean:
	rm -f *_$(TARGET).xsa* *_$(TARGET).xclbin* *.log v++* vitis_analyzer* *.ltx
	rm -rf .ipcache _x 
