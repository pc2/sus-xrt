

packaging/axi_stream_example.xsa: packaging/axi_stream_example.xo packaging/connectivity.cfg
	make -C packaging axi_stream_example.xsa

packaging/axi_stream_example.xo: packaging/pack_kernel.tcl sus_codegen.sv 
	make -C packaging axi_stream_example.xo 

sus_codegen.sv: axi.sus
	sus_compiler axi.sus --codegen --standalone axi_ctrl_slave_example --standalone-file sus_codegen.sv

clean:
	rm -f sus_codegen.sv
	make -C packaging clean
