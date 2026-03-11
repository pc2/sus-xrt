# U280
set_part xcu280-fsvh2892-2L-e

create_ip \
        -name ila \
        -vendor xilinx.com \
        -library ip \
        -version 6.2 \
        -module_name ila_crc_counter \
        -dir ./ip_creation

set_property -dict [list \
  CONFIG.C_MONITOR_TYPE {Native} \
  CONFIG.C_NUM_OF_PROBES {20} \
  CONFIG.C_PROBE5_WIDTH {8} \
  CONFIG.C_PROBE11_WIDTH {2} \
  CONFIG.C_PROBE14_WIDTH {5} \
  CONFIG.C_PROBE18_WIDTH {32} \
  CONFIG.C_PROBE19_WIDTH {32} \
  CONFIG.C_DATA_DEPTH {16384} \
  CONFIG.C_TRIGOUT_EN {false} \
  CONFIG.C_TRIGIN_EN {false} \
  CONFIG.C_INPUT_PIPE_STAGES {0} \
  CONFIG.C_EN_STRG_QUAL {1} \
  CONFIG.C_ADV_TRIGGER {true} \
  CONFIG.ALL_PROBE_SAME_MU {true} \
] [get_ips ila_crc_counter]

generate_target all [get_files ./ip_creation/ila_crc_counter/ila_crc_counter.xci]
