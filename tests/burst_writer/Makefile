
export TMPDIR := /tmp/vivado_$(USER)

$(TMPDIR):
	mkdir -p $(TMPDIR)

# Configurations that change based on the platform
VCK5000/%: TARGET := VCK5000
VCK5000/%: PART := xcvc1902-vsvd1760-2MP-e-S
VCK5000/%: PLATFORM := xilinx_vck5000_gen4x8_qdma_2_202220_1

U280/%: TARGET := U280
U280/%: PART := xcu280-fsvh2892-2L-e
U280/%: PLATFORM := xilinx_u280_gen3x16_xdma_1_202211_1

sus_codegen.sv: ../../axi.sus top.sus
	sus_compiler ../../axi.sus top.sus -o sus_codegen.sv --top all_write_benchmarks

XOS_VCK := $(TARGET)/burst_writer_32.xo $(TARGET)/burst_writer_64.xo $(TARGET)/burst_writer_128.xo $(TARGET)/burst_writer_256.xo $(TARGET)/burst_writer_512.xo
LOCAL_XOS := ../burst_writer_32.xo ../burst_writer_64.xo ../burst_writer_128.xo ../burst_writer_256.xo ../burst_writer_512.xo

$(TARGET)/burst_writer_%.xo: pack_kernel.tcl sus_codegen.sv
	mkdir -p $(TARGET)
	rm -f $(TARGET)/burst_writer_$*.xo
	rm -rf $(TARGET)/pack_prj$*
	mkdir $(TARGET)/pack_prj$*
	cd $(TARGET)/pack_prj$*;\
	vivado -mode batch -source ../../pack_kernel.tcl -tclargs $(PART) $* ../burst_writer_$*.xo

VCK5000/overlay_hw_emu.xclbin: vck5000_connectivity.cfg $(XOS_VCK)
	rm -f $(TARGET)/overlay_hw_emu.xclbin
	rm -rf $(TARGET)/overlay_hw_emu_prj
	mkdir $(TARGET)/overlay_hw_emu_prj
	cd $(TARGET)/overlay_hw_emu_prj &&\
	v++ -l --platform $(PLATFORM) -t hw_emu -s -g --config ../../vck5000_connectivity.cfg -o overlay_hw_emu.xsa $(LOCAL_XOS) &&\
	v++ -p --platform $(PLATFORM) -t hw_emu -o ../overlay_hw_emu.xclbin overlay_hw_emu.xsa --package.boot_mode=ospi

VCK5000/overlay_hw.xclbin: vck5000_connectivity.cfg $(XOS_VCK)
	rm -f $(TARGET)/overlay_hw.xclbin
	rm -rf $(TARGET)/overlay_hw_prj
	mkdir $(TARGET)/overlay_hw_prj
	cd $(TARGET)/overlay_hw_prj &&\
	v++ -l --platform $(PLATFORM) -t hw -s -g --config ../../vck5000_connectivity.cfg -o overlay_hw.xsa $(LOCAL_XOS) &&\
	v++ -p --platform $(PLATFORM) -t hw -o ../overlay_hw.xclbin overlay_hw.xsa --package.boot_mode=ospi
	xclbinutil --info -i $(TARGET)/overlay_hw.xclbin

U280/overlay_hw_emu.xclbin: u280_connectivity.cfg $(XOS_VCK)
	rm -f $(TARGET)/overlay_hw_emu.xclbin
	rm -rf $(TARGET)/overlay_hw_emu_prj
	mkdir $(TARGET)/overlay_hw_emu_prj
	cd $(TARGET)/overlay_hw_emu_prj &&\
	v++ -l --platform $(PLATFORM) -t hw_emu -s -g --config ../../u280_connectivity.cfg -o ../overlay_hw_emu.xclbin $(LOCAL_XOS)

U280/overlay_hw.xclbin: u280_connectivity.cfg $(XOS_VCK)
	rm -f $(TARGET)/overlay_hw.xclbin
	rm -rf $(TARGET)/overlay_hw_prj
	mkdir $(TARGET)/overlay_hw_prj
	cd $(TARGET)/overlay_hw_prj &&\
	v++ -l --platform $(PLATFORM) -t hw -s -g --config ../../u280_connectivity.cfg -o ../overlay_hw.xclbin $(LOCAL_XOS)
	xclbinutil --info -i $(TARGET)/overlay_hw.xclbin

main.x: main.cpp
	g++ -g -O3 -std=c++17 -I$(XILINX_XRT)/include -L$(XILINX_XRT)/lib -lxrt_coreutil -pthread main.cpp -o main.x

.PHONY: _emu
_emu: main.x | $(TMPDIR)
# It appears that the emulation creates .runs in the directory that holds main.x, so we copy it over to /tmp such that the .runs can be safely dropped there. 
# While the temporary directory doesn't seem to improve performance, it does appear that it's less "sticky" than the $PC2HOME filesystem. IE, it's less likely to get stuck undeletable due to xsim and xsimk not dieing
	cp main.x $(TMPDIR)
	cp extra_waves.tcl $(TARGET)/
	cp $(XRT_INI) $(TARGET)/xrt.ini
	cd $(TARGET) &&\
	emconfigutil --platform $(PLATFORM) &&\
	XCL_EMULATION_MODE=hw_emu $(TMPDIR)/main.x u

.PHONY: U280/emulate U280/emulate_batch U280/run
U280/emulate: XRT_INI := xrt_gui.ini
U280/emulate: _emu
U280/emulate_batch: XRT_INI := xrt_batch.ini
U280/emulate_batch: _emu
U280/run: main.x
	cd $(TARGET) && ../main.x a

.PHONY: VCK5000/emulate VCK5000/emulate_batch VCK5000/run
VCK5000/emulate: XRT_INI := xrt_gui.ini
VCK5000/emulate: _emu
VCK5000/emulate_batch: XRT_INI := xrt_batch.ini
VCK5000/emulate_batch: _emu
VCK5000/run: main.x
	cd $(TARGET) && ../main.x a

.PHONY: clean cleantmp
clean: cleantmp
	rm -rf VCK5000
	rm -rf U280
	rm -f sus_codegen.sv
	rm -f main.x
	
cleantmp:
	rm -r $(TMPDIR)

