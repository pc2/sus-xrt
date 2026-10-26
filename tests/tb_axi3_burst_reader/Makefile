

sus_codegen.sv: ../../axi_memory.sus ../../axi_stream.sus ../../xrt.sus
	sus_compiler ../../axi_memory.sus ../../axi_stream.sus ../../xrt.sus -o sus_codegen.sv \
		--top "axi3_burst_reader#(AXI_WIDTH: 256, MAX_IN_FLIGHT: 192, ADDR_WIDTH: 64, ADDR_ALIGN: 4, COUNT_TO: pow2#(E: 16), ExtraDataT: type bool[0])"

test: sus_codegen.sv testbench.sv sim.tcl
	vivado -mode batch -source sim.tcl
