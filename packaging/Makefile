
WIDTHS := 32 64 128 256 512

sus_bench_burst%.xo: pack_kernel.tcl ../sus_codegen.sv
	rm -rf pack_prj$*
	mkdir pack_prj$*
	rm -f sus_bench_burst$*.*
	cd pack_prj$*; vivado -mode batch -source ../pack_kernel.tcl -tclargs $(PART) $*; cd .. 

all: $(foreach W,$(WIDTHS),sus_bench_burst$(W).xo)

clean:
	rm -f vivado* *.log sus_kernel.*
	rm -rf pack_prj .Xil .ipcache _x logs
