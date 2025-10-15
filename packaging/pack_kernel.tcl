create_project sus_kernel ./sus_kernel -part [lindex $argv 0]

add_files -norecurse \
{
    ../../sus_codegen.sv \
}

# ???
update_compile_order -fileset sources_1

#                                             ???                ???           ???               ??? 
ipx::package_project -root_dir ./sus_kernel_ip -vendor pc2-sus-experiments -library spherical-transform-tests -taxonomy /UserIP -import_files

#                                ???
#ipx::infer_bus_interface ap_clk  xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]
#ipx::infer_bus_interface aresetn xilinx.com:signal:reset_rtl:1.0 [ipx::current_core]

set_property ipi_drc {ignore_freq_hz false} [ipx::current_core]
set_property sdx_kernel true [ipx::current_core]
set_property sdx_kernel_type rtl [ipx::current_core]
set_property vitis_drc {ctrl_protocol ap_ctrl_hs} [ipx::current_core]
set_property ipi_drc {ignore_freq_hz true} [ipx::current_core]

# s_axi_control MUST be named as such
#ipx::associate_bus_interfaces -busif s_axi_control -clock ap_clk [ipx::current_core]
#ipx::associate_bus_interfaces -busif outstream -clock ap_clk [ipx::current_core]
#ipx::associate_bus_interfaces -busif m_axi -clock ap_clk [ipx::current_core]

#ipx::associate_bus_interfaces -clock ap_clk -reset aresetn [ipx::current_core]






# Address offset in bytes???
ipx::add_register CTRL [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]
set_property description    {Control Signals} [ipx::get_registers CTRL -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property address_offset {0x00}            [ipx::get_registers CTRL -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property size           {32}              [ipx::get_registers CTRL -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]

# ipx::add_register IN_A [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]
# set_property description    {Input A}         [ipx::get_registers IN_A -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
# set_property address_offset {0x10}            [ipx::get_registers IN_A -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
# set_property size           {32}              [ipx::get_registers IN_A -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]

# ipx::add_register IN_B [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]
# set_property description    {Input B}         [ipx::get_registers IN_B -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
# set_property address_offset {0x14}            [ipx::get_registers IN_B -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
# set_property size           {32}              [ipx::get_registers IN_B -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]

# ipx::add_register OUT_C [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]
# set_property description    {Output C}        [ipx::get_registers OUT_C -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
# set_property address_offset {0x18}            [ipx::get_registers OUT_C -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
# set_property size           {32}              [ipx::get_registers OUT_C -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]

ipx::add_register ADDR_A [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]
set_property description    {buffer addr A }    [ipx::get_registers ADDR_A  -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property address_offset {0x010}             [ipx::get_registers ADDR_A  -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property size           {64}                [ipx::get_registers ADDR_A  -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]

ipx::add_register ADDR_B [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]
set_property description    {buffer addr B }    [ipx::get_registers ADDR_B  -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property address_offset {0x018}             [ipx::get_registers ADDR_B  -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property size           {64}                [ipx::get_registers ADDR_B  -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]

ipx::add_register ADDR_C [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]
set_property description    {buffer addr C }    [ipx::get_registers ADDR_C  -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property address_offset {0x020}             [ipx::get_registers ADDR_C  -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property size           {64}                [ipx::get_registers ADDR_C  -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]

ipx::add_register ADDR_D [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]
set_property description    {buffer addr D }    [ipx::get_registers ADDR_D  -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property address_offset {0x028}             [ipx::get_registers ADDR_D  -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property size           {64}                [ipx::get_registers ADDR_D  -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]


ipx::add_register_parameter ASSOCIATED_BUSIF [ipx::get_registers ADDR_A -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property value          {m_axi}          [ipx::get_register_parameters ASSOCIATED_BUSIF     \
                                    -of_objects [ipx::get_registers ADDR_A                      \
                                    -of_objects [ipx::get_address_blocks reg0                      \
                                    -of_objects [ipx::get_memory_maps s_axi_control                 \
                                    -of_objects [ipx::current_core]]]]]

ipx::add_register_parameter ASSOCIATED_BUSIF [ipx::get_registers ADDR_B -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property value          {m_axi}          [ipx::get_register_parameters ASSOCIATED_BUSIF     \
                                    -of_objects [ipx::get_registers ADDR_B                      \
                                    -of_objects [ipx::get_address_blocks reg0                      \
                                    -of_objects [ipx::get_memory_maps s_axi_control                 \
                                    -of_objects [ipx::current_core]]]]]

ipx::add_register_parameter ASSOCIATED_BUSIF [ipx::get_registers ADDR_C -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property value          {m_axi}          [ipx::get_register_parameters ASSOCIATED_BUSIF     \
                                    -of_objects [ipx::get_registers ADDR_C                      \
                                    -of_objects [ipx::get_address_blocks reg0                      \
                                    -of_objects [ipx::get_memory_maps s_axi_control                 \
                                    -of_objects [ipx::current_core]]]]]

ipx::add_register_parameter ASSOCIATED_BUSIF [ipx::get_registers ADDR_D -of_objects [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]]
set_property value          {m_axi}          [ipx::get_register_parameters ASSOCIATED_BUSIF     \
                                    -of_objects [ipx::get_registers ADDR_D                      \
                                    -of_objects [ipx::get_address_blocks reg0                      \
                                    -of_objects [ipx::get_memory_maps s_axi_control                 \
                                    -of_objects [ipx::current_core]]]]]


ipx::add_bus_parameter DATA_WIDTH [ipx::get_bus_interfaces m_axi -of_objects [ipx::current_core]]
set_property value           {32} [ipx::get_bus_parameters DATA_WIDTH -of_objects [ipx::get_bus_interfaces m_axi -of_objects [ipx::current_core]]]



set_property core_revision 2 [ipx::current_core]
#ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces clk -of_objects [ipx::current_core]]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::check_integrity -kernel -xrt [ipx::current_core]
ipx::save_core [ipx::current_core]

package_xo -xo_path ../sus_kernel.xo -kernel_name sus_kernel -ctrl_protocol ap_ctrl_hs -ip_directory ./sus_kernel_ip -output_kernel_xml ../sus_kernel.xml


