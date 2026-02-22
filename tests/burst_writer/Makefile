PART := xcvc1902-vsvd1760-2MP-e-S
PLATFORM := xilinx_vck5000_gen4x8_qdma_2_202220_1

sus_codegen.sv: ../../axi.sus top.sus
	mkdir -p target
	sus_compiler ../../axi.sus top.sus -o sus_codegen.sv --top all_write_benchmarks

burst_writer%.xo: pack_kernel.tcl sus_codegen.sv
	rm -f burst_writer$*.xo
	rm -rf target/pack_prj$*
	mkdir target/pack_prj$*
	cd target/pack_prj$*;\
	vivado -mode batch -source ../../pack_kernel.tcl -tclargs $(PART) $*

overlay_hw_emu.xclbin: connectivity.cfg burst_writer32.xo burst_writer64.xo burst_writer128.xo burst_writer256.xo burst_writer512.xo
	rm -rf target/overlay_hw_emu_prj
	mkdir target/overlay_hw_emu_prj
	cd target/overlay_hw_emu_prj &&\
	v++ -l --kernel_frequency 450 --platform $(PLATFORM) -t hw_emu -s -g --config ../../connectivity.cfg -o overlay_hw_emu.xsa ../../burst_writer32.xo ../../burst_writer64.xo ../../burst_writer128.xo ../../burst_writer256.xo ../../burst_writer512.xo &&\
	v++ -p --platform $(PLATFORM) -t hw_emu -o ../../overlay_hw_emu.xclbin overlay_hw_emu.xsa --package.boot_mode=ospi

overlay_hw.xclbin: connectivity.cfg burst_writer32.xo burst_writer64.xo burst_writer128.xo burst_writer256.xo burst_writer512.xo
	rm -rf target/overlay_hw_prj
	mkdir target/overlay_hw_prj
	cd target/overlay_hw_prj &&\
	v++ -l --kernel_frequency 450 --platform $(PLATFORM) -t hw -s -g --config ../../connectivity.cfg -o overlay_hw.xsa ../../burst_writer32.xo ../../burst_writer64.xo ../../burst_writer128.xo ../../burst_writer256.xo ../../burst_writer512.xo &&\
	v++ -p --platform $(PLATFORM) -t hw -o ../../overlay_hw.xclbin overlay_hw.xsa --package.boot_mode=ospi
	xclbinutil --info -i overlay_hw.xclbin

main.x: main.cpp
	g++ -g -std=c++17 -I$(XILINX_XRT)/include -L$(XILINX_XRT)/lib -lxrt_coreutil -pthread main.cpp -o main.x

test_emu: main.x overlay_hw_emu.xclbin
	./main.x u

test_emu_waveform: main.x overlay_hw_emu.xclbin
	@echo "Running ./main.x u (timeout 5 minutes)..."
	#source ../setup_vck_emu.sh -s on
	@TMP_LOG=$$(mktemp); \
	if timeout --signal=TERM --kill-after=0 1m ./main.x u 2>&1 | tee $$TMP_LOG; then \
		echo "Program finished."; \
	else \
		echo "Program timed out after 5 minutes (killed)."; \
	fi; \
	SIM_PATH=$$(grep -oP 'Path of the simulation directory : \K.*' $$TMP_LOG | tail -n1); \
	if [ -z "$$SIM_PATH" ]; then \
		echo "Error: Could not find simulation directory in output."; \
		cat $$TMP_LOG; \
		rm -f $$TMP_LOG; \
		exit 1; \
	fi; \
	echo "Found simulation path: $$SIM_PATH"
	@echo "Launching xsim detached..."
	@setsid xsim -gui $$SIM_PATH/*.wdb >/dev/null 2>&1 &
	rm -f $$TMP_LOG

clean:
	rm -rf target
	rm -f sus_codegen.sv
	rm -f *.xo
	rm -f *.xclbin
	rm -f main.x

.PHONY: clean test_emu_waveform
