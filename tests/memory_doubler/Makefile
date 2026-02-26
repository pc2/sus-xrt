# Default target if none specified
TARGET ?= VCK5000
# VCK5000
PART_VCK5000 := xcvc1902-vsvd1760-2MP-e-S
PLATFORM_VCK5000 := xilinx_vck5000_gen4x8_qdma_2_202220_1

# U280
PART_U280 := xcu280-fsvh2892-2L-e
PLATFORM_U280 := xilinx_u280_gen3x16_xdma_1_202211_1

# Select configuration
PART := $(PART_$(TARGET))
PLATFORM := $(PLATFORM_$(TARGET))

U280/sus_codegen.sv: ../../axi.sus top.sus sus-float/UltraScalePlus/fp_wrappers.sus sus-float/fp_custom.sus
	mkdir -p $(TARGET)
	sus_compiler ../../axi.sus top.sus sus-float/UltraScalePlus/fp_wrappers.sus sus-float/fp_custom.sus -o U280/sus_codegen.sv --top all_doubler_benchmarks

VCK5000/sus_codegen.sv: ../../axi.sus top.sus sus-float/Versal/fp_wrappers.sus sus-float/fp_custom.sus
	mkdir -p $(TARGET)
	sus_compiler ../../axi.sus top.sus sus-float/Versal/fp_wrappers.sus sus-float/fp_custom.sus -o VCK5000/sus_codegen.sv --top all_doubler_benchmarks

XOS_VCK := $(TARGET)/memory_doubler_32.xo $(TARGET)/memory_doubler_64.xo $(TARGET)/memory_doubler_128.xo $(TARGET)/memory_doubler_256.xo $(TARGET)/memory_doubler_512.xo
LOCAL_XOS := ../memory_doubler_32.xo ../memory_doubler_64.xo ../memory_doubler_128.xo ../memory_doubler_256.xo ../memory_doubler_512.xo

$(TARGET)/memory_doubler_%.xo: pack_kernel.tcl $(TARGET)/sus_codegen.sv
	mkdir -p $(TARGET)
	rm -f $(TARGET)/memory_doubler_$*.xo
	rm -rf $(TARGET)/pack_prj$*
	mkdir $(TARGET)/pack_prj$*
	cd $(TARGET)/pack_prj$*;\
	vivado -mode batch -source ../../pack_kernel.tcl -tclargs $(PART) $* ../memory_doubler_$*.xo

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
	g++ -g -O3 -std=c++17 -I$(XILINX_XRT)/include -L$(XILINX_XRT)/lib -lxrt_coreutil -pthread main.cpp -o main.x

clean:
	rm -rf VCK5000
	rm -rf U280
	rm -f sus_codegen.sv
	rm -f main.x

.PHONY: clean
