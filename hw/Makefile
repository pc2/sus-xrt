
overlay_$(TARGET).xclbin: overlay_$(TARGET).xsa
	v++ -p --platform $(PLATFORM) -t $(TARGET) -o overlay_$(TARGET).xclbin overlay_$(TARGET).xsa --package.boot_mode=ospi

overlay_$(TARGET).xsa: connectivity.cfg ../packaging/*.xo # ../hls/output_kernel_$(TARGET).xo
	v++ -l --kernel_frequency 400 --platform $(PLATFORM) -t $(TARGET) -s -g --config connectivity.cfg -o overlay_$(TARGET).xsa ../packaging/sus_bench_burst32.xo ../packaging/sus_bench_burst64.xo ../packaging/sus_bench_burst128.xo ../packaging/sus_bench_burst256.xo ../packaging/sus_bench_burst512.xo
#../hls/output_kernel_$(TARGET).xo

clean:
	rm -f *_$(TARGET).xsa* *_$(TARGET).xclbin* *.log v++* vitis_analyzer* *.ltx
	rm -rf .ipcache _x 
