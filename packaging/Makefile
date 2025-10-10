
PART := xcvc1902-vsvd1760-2MP-e-S
PLATFORM := xilinx_vck5000_gen4x8_qdma_2_202220_1

axi_stream_example.xsa: axi_stream_example.xo connectivity.cfg
	v++ -l --kernel_frequency 100 --platform $(PLATFORM) -t hw -s -g --config connectivity.cfg -o axi_stream_example.xsa axi_stream_example.xo

axi_stream_example.xo: pack_kernel.tcl ../sus_codegen.sv
	rm -rf pack_prj
	mkdir pack_prj
	cd pack_prj; vivado -mode batch -source ../pack_kernel.tcl -tclargs $(PART); cd .. 

clean:
	rm -f vivado* *.log axi_stream_example.*
	rm -rf pack_prj .Xil .ipcache _x logs
