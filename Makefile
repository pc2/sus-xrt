TARGET := hw
PART := xcvc1902-vsvd1760-2MP-e-S
PLATFORM := xilinx_vck5000_gen4x8_qdma_2_202220_1

all: hw/overlay_$(TARGET).xclbin

packaging/sus_kernel.xo: packaging/pack_kernel.tcl sus_codegen.sv
	make -C packaging sus_kernel.xo PART=$(PART) PLATFORM=$(PLATFORM) TARGET=$(TARGET)

# hls/output_kernel_$(TARGET).xo: hls/output_kernel.cpp
# 	make -C hls output_kernel_$(TARGET).xo PART=$(PART) PLATFORM=$(PLATFORM) TARGET=$(TARGET)

hw/overlay_$(TARGET).xclbin: packaging/sus_kernel.xo  #hls/output_kernel_$(TARGET).xo 
	make -C hw overlay_$(TARGET).xclbin PART=$(PART) PLATFORM=$(PLATFORM) TARGET=$(TARGET)

sw/main.x: sw/main.cpp
	make -C sw main.x

sus_codegen.sv: axi.sus axi_example.sus
	sus_compiler axi.sus axi_example.sus -o sus_codegen.sv --top combined_axi_ctrl_reader_writer --top test_burst_reader --top all_benchmarks

clean:
	rm -f sus_codegen.sv
	make -C packaging clean
	make -C hls clean
	make -C hw clean
