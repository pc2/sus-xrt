
puts {ADDING WAVES}
log_wave [get_objects -r /pfm_top_wrapper/pfm_top_i/pfm_dynamic_inst/burst_writer32_ddr/*]
log_wave [get_objects -r /pfm_top_wrapper/pfm_top_i/pfm_dynamic_inst/burst_writer64_ddr/*]
log_wave [get_objects -r /pfm_top_wrapper/pfm_top_i/pfm_dynamic_inst/burst_writer128_ddr/*]
log_wave [get_objects -r /pfm_top_wrapper/pfm_top_i/pfm_dynamic_inst/burst_writer256_ddr/*]
log_wave [get_objects -r /pfm_top_wrapper/pfm_top_i/pfm_dynamic_inst/burst_writer512_ddr/*]
