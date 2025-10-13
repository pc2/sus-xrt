PART := xcvc1902-vsvd1760-2MP-e-S
PLATFORM := xilinx_vck5000_gen4x8_qdma_2_202220_1

packaging/axi_stream_example.xo: packaging/pack_kernel.tcl sus_codegen.sv
	make -C packaging axi_stream_example.xo PART=$(PART) PLATFORM=$(PLATFORM)

hls/output_kernel.xo: hls/output_kernel.cpp
	make -C hls output_kernel.xo PART=$(PART) PLATFORM=$(PLATFORM)

hw/overlay.xclbin: hls/output_kernel.xo packaging/axi_stream_example.xo
	make -C hw overlay.xclbin PART=$(PART) PLATFORM=$(PLATFORM)

sw/main.x: sw/main.cpp
	make -C sw main.x

sus_codegen.sv: axi.sus
	echo $$PATH
	sus_compiler axi.sus --codegen --standalone axi_ctrl_slave_example --standalone-file sus_codegen.sv

clean:
	rm -f sus_codegen.sv
	make -C packaging clean
	make -C hls clean
	make -C hw clean
