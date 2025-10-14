
sus_kernel.xo: pack_kernel.tcl ../sus_codegen.sv
	rm -rf pack_prj
	mkdir pack_prj
	rm -f sus_kernel.*
	cd pack_prj; vivado -mode batch -source ../pack_kernel.tcl -tclargs $(PART); cd .. 

clean:
	rm -f vivado* *.log sus_kernel.*
	rm -rf pack_prj .Xil .ipcache _x logs
