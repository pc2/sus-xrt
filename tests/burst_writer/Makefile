# Default target if none specified
TARGET ?= VCK5000
# hw, hw_emu, sw, sw_emu
MODE ?= hw

# VCK5000
PART_VCK5000 := xcvc1902-vsvd1760-2MP-e-S
PLATFORM_VCK5000 := xilinx_vck5000_gen4x8_qdma_2_202220_1

# U280
PART_U280 := xcu280-fsvh2892-2L-e
PLATFORM_U280 := xilinx_u280_gen3x16_xdma_1_202211_1

# Select configuration
PART := $(PART_$(TARGET))
PLATFORM := $(PLATFORM_$(TARGET))

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

# VCK5000/overlay_hw.xclbin  or VCK5000/overlay_hw_emu.xclbin
VCK5000/overlay_%.xclbin: vck5000_connectivity.cfg $(XOS_VCK)
	rm -f $(TARGET)/overlay_$*.xclbin
	rm -rf $(TARGET)/overlay_$*_prj
	mkdir $(TARGET)/overlay_$*_prj
	cd $(TARGET)/overlay_$*_prj &&\
	v++ -l --platform $(PLATFORM) -t $* -s -g --config ../../vck5000_connectivity.cfg -o overlay_$*.xsa $(LOCAL_XOS) &&\
	v++ -p --platform $(PLATFORM) -t $* -o ../overlay_$*.xclbin overlay_$*.xsa --package.boot_mode=ospi
	xclbinutil --info -i $(TARGET)/overlay_$*.xclbin

# VCK5000/overlay_hw.xclbin  or VCK5000/overlay_hw_emu.xclbin
U280/overlay_%.xclbin: u280_connectivity.cfg $(XOS_VCK)
	rm -f $(TARGET)/overlay_$*.xclbin
	rm -rf $(TARGET)/overlay_$*_prj
	mkdir $(TARGET)/overlay_$*_prj
	cd $(TARGET)/overlay_$*_prj &&\
	v++ -l --platform $(PLATFORM) -t $* -s -g --config ../../u280_connectivity.cfg -o ../overlay_$*.xclbin $(LOCAL_XOS)
	xclbinutil --info -i $(TARGET)/overlay_$*.xclbin

main.x: main.cpp
	g++ -g -std=c++17 -I$(XILINX_XRT)/include -L$(XILINX_XRT)/lib -lxrt_coreutil -pthread main.cpp -o main.x

clean:
	rm -rf VCK5000
	rm -rf U280
	rm -f sus_codegen.sv
	rm -f main.x

.PHONY: clean
