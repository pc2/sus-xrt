

sus_codegen.sv: ../../axi_memory.sus ../../axi_stream.sus ../../xrt.sus
	sus_compiler ../../axi_memory.sus ../../axi_stream.sus ../../xrt.sus -o sus_codegen.sv \
		--top "axi4_burst_reader#(AXI_WIDTH: 64, ADDR_WIDTH: 64, ADDR_ALIGN: 2, COUNT_TO: pow2#(E: 16), MAX_IN_FLIGHT: 400, ExtraDataT: type bool[0])" \
		--top "axi4_realigning_burst_reader#(T: type bool[32][17], AXI_WIDTH: 512, ADDR_WIDTH: 64, ADDR_ALIGN: 4, COUNT_TO: pow2#(E: 16), MAX_IN_FLIGHT: 400, ExtraDataT: type bool[0])" \
		--top "axi4_realigning_burst_reader#(T: type bool[32][16], AXI_WIDTH: 512, ADDR_WIDTH: 64, ADDR_ALIGN: 64, COUNT_TO: pow2#(E: 16), MAX_IN_FLIGHT: 400, ExtraDataT: type bool[0])"

test: sus_codegen.sv testbench.sv sim.tcl
	vivado -mode batch -source sim.tcl
