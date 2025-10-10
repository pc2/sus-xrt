
overlay.xclbin: overlay.xsa
	v++ -p --platform $(PLATFORM) -t hw -o overlay.xclbin overlay.xsa --package.boot_mode=ospi

overlay.xsa: connectivity.cfg ../hls/output_kernel.xo ../packaging/axi_stream_example.xo
	v++ -l --kernel_frequency 100 --platform $(PLATFORM) -t hw -s -g --config connectivity.cfg -o overlay.xsa ../hls/output_kernel.xo ../packaging/axi_stream_example.xo

clean:
	rm -f *.xsa* *.xclbin* *.log v++* vitis_analyzer* *.ltx
	rm -rf .ipcache _x 
