
axi_stream_example.xo: pack_kernel.tcl ../sus_codegen.sv
	rm -rf pack_prj
	mkdir pack_prj
	rm -f axi_stream_example.*
	cd pack_prj; vivado -mode batch -source ../pack_kernel.tcl -tclargs $(PART); cd .. 

clean:
	rm -f vivado* *.log axi_stream_example.*
	rm -rf pack_prj .Xil .ipcache _x logs
