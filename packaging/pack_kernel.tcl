create_project axi_stream_example ./axi_stream_example -part [lindex $argv 0]

add_files -norecurse \
{
    ../../sus_codegen.sv \
}

# ???
update_compile_order -fileset sources_1

#                                             ???                ???           ???               ??? 
ipx::package_project -root_dir ./axi_stream_example_ip -vendor pc2-sus-experiments -library spherical-transform-tests -taxonomy /UserIP -import_files

#                                ???
#ipx::infer_bus_interface ap_clk  xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]
#ipx::infer_bus_interface aresetn xilinx.com:signal:reset_rtl:1.0 [ipx::current_core]

set_property ipi_drc {ignore_freq_hz false} [ipx::current_core]
set_property sdx_kernel true [ipx::current_core]
set_property sdx_kernel_type rtl [ipx::current_core]
set_property vitis_drc {ctrl_protocol ap_ctrl_hs} [ipx::current_core]
set_property ipi_drc {ignore_freq_hz true} [ipx::current_core]

#                                    is this name predefined? Does is have to match anything in the source files?
#ipx::associate_bus_interfaces -busif s_axi_control -clock ap_clk [ipx::current_core]
#ipx::associate_bus_interfaces -busif outstream -clock ap_clk [ipx::current_core]

#ipx::associate_bus_interfaces -clock ap_clk -reset aresetn [ipx::current_core]

ipx::add_register CTRL    [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]
ipx::add_register IN_A    [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]
ipx::add_register IN_B    [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]
ipx::add_register OUT_C   [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]

# Address offset in bytes???
set_property description    {Control Signals} [ipx::get_registers CTRL -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property address_offset {0x00}            [ipx::get_registers CTRL -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property size           {32}              [ipx::get_registers CTRL -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]

set_property description    {Input A}         [ipx::get_registers IN_A -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property address_offset {0x10}            [ipx::get_registers IN_A -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property size           {32}              [ipx::get_registers IN_A -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]

set_property description    {Input B}         [ipx::get_registers IN_B -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property address_offset {0x14}            [ipx::get_registers IN_B -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property size           {32}              [ipx::get_registers IN_B -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]

set_property description    {Output C}        [ipx::get_registers OUT_C -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property address_offset {0x18}            [ipx::get_registers OUT_C -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property size           {32}              [ipx::get_registers OUT_C -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]

set_property core_revision 2 [ipx::current_core]
#ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces clk -of_objects [ipx::current_core]]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::check_integrity -kernel -xrt [ipx::current_core]
ipx::save_core [ipx::current_core]

package_xo -xo_path ../axi_stream_example.xo -kernel_name axi_stream_example -ctrl_protocol ap_ctrl_hs -ip_directory ./axi_stream_example_ip -output_kernel_xml ../axi_stream_example.xml


