

sus_codegen.sv: testbench.sus ../../axi_memory.sus ../../axi_stream.sus ../../xrt.sus
	sus_compiler testbench.sus ../../axi_memory.sus ../../axi_stream.sus ../../xrt.sus -o sus_codegen.sv

test: sus_codegen.sv testbench.sv sim.tcl
	vivado -mode batch -source sim.tcl
