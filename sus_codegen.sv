// THIS IS A GENERATED FILE (Generated at 2025-10-16T15:36:16+02:00)
// This file was generated with SUS Compiler 0.3.4 () built at 2025-10-15_01:40:37 
// combined_axi_ctrl_reader_writer #()
module combined_axi_ctrl_reader_writer(
	input aclk,
	input wire aresetn,
	input wire[11:0] s_axi_control_awaddr,
	input wire s_axi_control_awvalid,
	output /*mux_wire*/ logic s_axi_control_awready,
	input wire[31:0] s_axi_control_wdata,
	input wire[3:0] s_axi_control_wstrb,
	input wire s_axi_control_wvalid,
	output /*mux_wire*/ logic s_axi_control_wready,
	output /*mux_wire*/ logic[1:0] s_axi_control_bresp,
	output /*mux_wire*/ logic s_axi_control_bvalid,
	input wire s_axi_control_bready,
	input wire[11:0] s_axi_control_araddr,
	input wire s_axi_control_arvalid,
	output /*mux_wire*/ logic s_axi_control_arready,
	output /*mux_wire*/ logic[31:0] s_axi_control_rdata,
	output /*mux_wire*/ logic[1:0] s_axi_control_rresp,
	output /*mux_wire*/ logic s_axi_control_rvalid,
	input wire s_axi_control_rready,
	output /*mux_wire*/ logic m_axi_awvalid,
	input wire m_axi_awready,
	output /*mux_wire*/ logic[63:0] m_axi_awaddr,
	output /*mux_wire*/ logic[7:0] m_axi_awlen,
	output /*mux_wire*/ logic[1:0] m_axi_awburst,
	output /*mux_wire*/ logic m_axi_wvalid,
	input wire m_axi_wready,
	output /*mux_wire*/ logic[31:0] m_axi_wdata,
	output /*mux_wire*/ logic[3:0] m_axi_wstrb,
	output /*mux_wire*/ logic m_axi_wlast,
	input wire m_axi_bvalid,
	output /*mux_wire*/ logic m_axi_bready,
	output /*mux_wire*/ logic m_axi_arvalid,
	input wire m_axi_arready,
	output /*mux_wire*/ logic[63:0] m_axi_araddr,
	output /*mux_wire*/ logic[7:0] m_axi_arlen,
	output /*mux_wire*/ logic[1:0] m_axi_arburst,
	input wire m_axi_rvalid,
	output /*mux_wire*/ logic m_axi_rready,
	input wire[31:0] m_axi_rdata,
	input wire m_axi_rlast
);

/*mux_wire*/ logic _ctrl_aresetn;
wire _ctrl_awready;
wire _ctrl_wready;
wire[1:0] _ctrl_bresp;
wire _ctrl_bvalid;
wire _ctrl_arready;
wire[31:0] _ctrl_rdata;
wire[1:0] _ctrl_rresp;
wire _ctrl_rvalid;
/*mux_wire*/ logic[11:0] _ctrl_awaddr;
/*mux_wire*/ logic _ctrl_awvalid;
/*mux_wire*/ logic[31:0] _ctrl_wdata;
/*mux_wire*/ logic[3:0] _ctrl_wstrb;
/*mux_wire*/ logic _ctrl_wvalid;
/*mux_wire*/ logic _ctrl_bready;
/*mux_wire*/ logic[11:0] _ctrl_araddr;
/*mux_wire*/ logic _ctrl_arvalid;
/*mux_wire*/ logic _ctrl_rready;
/*mux_wire*/ logic _reader_aresetn;
/*mux_wire*/ logic _writer_aresetn;
wire _writer_awvalid;
wire[63:0] _writer_awaddr;
wire[7:0] _writer_awlen;
wire[1:0] _writer_awburst;
wire _writer_wvalid;
wire[31:0] _writer_wdata;
wire[3:0] _writer_wstrb;
wire _writer_wlast;
wire _writer_bready;
/*mux_wire*/ logic _writer_awready;
/*mux_wire*/ logic _writer_wready;
/*mux_wire*/ logic _writer_bvalid;
wire _reader_arvalid;
wire[63:0] _reader_araddr;
wire[7:0] _reader_arlen;
wire[1:0] _reader_arburst;
wire _reader_rready;
/*mux_wire*/ logic _reader_arready;
/*mux_wire*/ logic _reader_rvalid;
/*mux_wire*/ logic[31:0] _reader_rdata;
/*mux_wire*/ logic _reader_rlast;
/*state*/ logic[1:0] addr_state;
/*state*/ logic[2:0] data_state;
/*mux_wire*/ logic[63:0] addr_a_bits;
wire[31:0] _ctrl_input_regs[7:0];
wire[31:0] _42 = _ctrl_input_regs[0];
wire[31:0] _43 = _ctrl_input_regs[1];
/*mux_wire*/ logic[63:0] addr_b_bits;
wire[31:0] _44 = _ctrl_input_regs[2];
wire[31:0] _45 = _ctrl_input_regs[3];
/*mux_wire*/ logic[63:0] addr_c_bits;
wire[31:0] _46 = _ctrl_input_regs[4];
wire[31:0] _47 = _ctrl_input_regs[5];
/*mux_wire*/ logic[63:0] addr_d_bits;
wire[31:0] _48 = _ctrl_input_regs[6];
wire[31:0] _49 = _ctrl_input_regs[7];
wire _51;
assign _51 = addr_state == 1'd1;
/*mux_wire*/ logic[63:0] _BitsToUInt_bits;
wire[63:0] _BitsToUInt_value;
/*mux_wire*/ logic _reader_request;
/*mux_wire*/ logic[63:0] _reader_addr;
wire _reader_fire;
wire _56;
assign _56 = addr_state == 2'd2;
/*mux_wire*/ logic[63:0] _BitsToUInt_2_bits;
wire[63:0] _BitsToUInt_2_value;
/*state*/ logic[31:0] stored_a[7:0];
/*state*/ logic[31:0] stored_b[7:0];
/*mux_wire*/ logic[31:0] c[7:0];
/*mux_wire*/ logic[31:0] d[7:0];
wire[31:0] _59 = stored_a[0];
wire[31:0] _60 = stored_b[0];
wire[32:0] _61;
assign _61 = _59 + _60;
wire[31:0] _62;
assign _62 = _61 % 33'd4294967296;
wire[31:0] _63 = stored_a[0];
wire[31:0] _64 = stored_b[0];
wire[63:0] _65;
assign _65 = _63 * _64;
wire[31:0] _66;
assign _66 = _65 % 33'd4294967296;
wire[31:0] _67 = stored_a[1];
wire[31:0] _68 = stored_b[1];
wire[32:0] _69;
assign _69 = _67 + _68;
wire[31:0] _70;
assign _70 = _69 % 33'd4294967296;
wire[31:0] _71 = stored_a[1];
wire[31:0] _72 = stored_b[1];
wire[63:0] _73;
assign _73 = _71 * _72;
wire[31:0] _74;
assign _74 = _73 % 33'd4294967296;
wire[31:0] _75 = stored_a[2];
wire[31:0] _76 = stored_b[2];
wire[32:0] _77;
assign _77 = _75 + _76;
wire[31:0] _78;
assign _78 = _77 % 33'd4294967296;
wire[31:0] _79 = stored_a[2];
wire[31:0] _80 = stored_b[2];
wire[63:0] _81;
assign _81 = _79 * _80;
wire[31:0] _82;
assign _82 = _81 % 33'd4294967296;
wire[31:0] _83 = stored_a[3];
wire[31:0] _84 = stored_b[3];
wire[32:0] _85;
assign _85 = _83 + _84;
wire[31:0] _86;
assign _86 = _85 % 33'd4294967296;
wire[31:0] _87 = stored_a[3];
wire[31:0] _88 = stored_b[3];
wire[63:0] _89;
assign _89 = _87 * _88;
wire[31:0] _90;
assign _90 = _89 % 33'd4294967296;
wire[31:0] _91 = stored_a[4];
wire[31:0] _92 = stored_b[4];
wire[32:0] _93;
assign _93 = _91 + _92;
wire[31:0] _94;
assign _94 = _93 % 33'd4294967296;
wire[31:0] _95 = stored_a[4];
wire[31:0] _96 = stored_b[4];
wire[63:0] _97;
assign _97 = _95 * _96;
wire[31:0] _98;
assign _98 = _97 % 33'd4294967296;
wire[31:0] _99 = stored_a[5];
wire[31:0] _100 = stored_b[5];
wire[32:0] _101;
assign _101 = _99 + _100;
wire[31:0] _102;
assign _102 = _101 % 33'd4294967296;
wire[31:0] _103 = stored_a[5];
wire[31:0] _104 = stored_b[5];
wire[63:0] _105;
assign _105 = _103 * _104;
wire[31:0] _106;
assign _106 = _105 % 33'd4294967296;
wire[31:0] _107 = stored_a[6];
wire[31:0] _108 = stored_b[6];
wire[32:0] _109;
assign _109 = _107 + _108;
wire[31:0] _110;
assign _110 = _109 % 33'd4294967296;
wire[31:0] _111 = stored_a[6];
wire[31:0] _112 = stored_b[6];
wire[63:0] _113;
assign _113 = _111 * _112;
wire[31:0] _114;
assign _114 = _113 % 33'd4294967296;
wire[31:0] _115 = stored_a[7];
wire[31:0] _116 = stored_b[7];
wire[32:0] _117;
assign _117 = _115 + _116;
wire[31:0] _118;
assign _118 = _117 % 33'd4294967296;
wire[31:0] _119 = stored_a[7];
wire[31:0] _120 = stored_b[7];
wire[63:0] _121;
assign _121 = _119 * _120;
wire[31:0] _122;
assign _122 = _121 % 33'd4294967296;
wire _124;
assign _124 = data_state == 1'd1;
/*mux_wire*/ logic success;
/*mux_wire*/ logic[31:0] data[7:0];
/*mux_wire*/ logic _reader_read;
wire _reader_read_valid;
wire[31:0] _reader_data[7:0];
wire _130;
assign _130 = data_state == 2'd2;
/*mux_wire*/ logic success_2;
/*mux_wire*/ logic[31:0] data_2[7:0];
wire _135;
assign _135 = data_state == 2'd3;
/*mux_wire*/ logic[63:0] _BitsToUInt_3_bits;
wire[63:0] _BitsToUInt_3_value;
/*mux_wire*/ logic _writer_write;
/*mux_wire*/ logic[63:0] _writer_addr;
/*mux_wire*/ logic[31:0] _writer_data[7:0];
wire _writer_write_success;
wire _141;
assign _141 = data_state == 3'd4;
/*mux_wire*/ logic[63:0] _BitsToUInt_4_bits;
wire[63:0] _BitsToUInt_4_value;
wire _146;
assign _146 = data_state == 3'd5;
wire _writer_has_outstanding_writes;
wire _148;
assign _148 = !_writer_has_outstanding_writes;
/*mux_wire*/ logic _ctrl_finish;
/*mux_wire*/ logic[31:0] _ctrl_output_regs[0:0];
localparam[31:0] _151[0:0] = '{32'b11011110101011011011111011101111};
wire _ctrl_start;
wire _153;
assign _153 = !aresetn;
axi_ctrl_slave_NUM_INPUT_REGS_8_NUM_OUTPUT_REGS_1_ADDR_WIDTH_12_AXI_WIDTH_32 ctrl(
	.aclk(aclk),
	.aresetn(_ctrl_aresetn),
	.awaddr(_ctrl_awaddr),
	.awvalid(_ctrl_awvalid),
	.awready(_ctrl_awready),
	.wdata(_ctrl_wdata),
	.wstrb(_ctrl_wstrb),
	.wvalid(_ctrl_wvalid),
	.wready(_ctrl_wready),
	.bresp(_ctrl_bresp),
	.bvalid(_ctrl_bvalid),
	.bready(_ctrl_bready),
	.araddr(_ctrl_araddr),
	.arvalid(_ctrl_arvalid),
	.arready(_ctrl_arready),
	.rdata(_ctrl_rdata),
	.rresp(_ctrl_rresp),
	.rvalid(_ctrl_rvalid),
	.rready(_ctrl_rready),
	.input_regs(_ctrl_input_regs),
	.start(_ctrl_start),
	.finish(_ctrl_finish),
	.output_regs(_ctrl_output_regs)
);
axi_memory_reader_T_type_int_FROM_0_TO_4294967296_8 reader(
	.aclk(aclk),
	.aresetn(_reader_aresetn),
	.arvalid(_reader_arvalid),
	.arready(_reader_arready),
	.araddr(_reader_araddr),
	.arlen(_reader_arlen),
	.arburst(_reader_arburst),
	.rvalid(_reader_rvalid),
	.rready(_reader_rready),
	.rdata(_reader_rdata),
	.rlast(_reader_rlast),
	.request(_reader_request),
	.addr(_reader_addr),
	.fire(_reader_fire),
	.read(_reader_read),
	.read_valid(_reader_read_valid),
	.data(_reader_data)
);
axi_memory_writer_T_type_int_FROM_0_TO_4294967296_8 writer(
	.aclk(aclk),
	.aresetn(_writer_aresetn),
	.awvalid(_writer_awvalid),
	.awready(_writer_awready),
	.awaddr(_writer_awaddr),
	.awlen(_writer_awlen),
	.awburst(_writer_awburst),
	.wvalid(_writer_wvalid),
	.wready(_writer_wready),
	.wdata(_writer_wdata),
	.wstrb(_writer_wstrb),
	.wlast(_writer_wlast),
	.bvalid(_writer_bvalid),
	.bready(_writer_bready),
	.has_outstanding_writes(_writer_has_outstanding_writes),
	.write(_writer_write),
	.addr(_writer_addr),
	.data(_writer_data),
	.write_success(_writer_write_success)
);
BitsToUInt_NUM_BITS_64 BitsToUInt(
	.clk(aclk),
	.bits(_BitsToUInt_bits),
	.value(_BitsToUInt_value)
);
BitsToUInt_NUM_BITS_64 BitsToUInt_2(
	.clk(aclk),
	.bits(_BitsToUInt_2_bits),
	.value(_BitsToUInt_2_value)
);
BitsToUInt_NUM_BITS_64 BitsToUInt_3(
	.clk(aclk),
	.bits(_BitsToUInt_3_bits),
	.value(_BitsToUInt_3_value)
);
BitsToUInt_NUM_BITS_64 BitsToUInt_4(
	.clk(aclk),
	.bits(_BitsToUInt_4_bits),
	.value(_BitsToUInt_4_value)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_ctrl_aresetn = 1'bx;
	_ctrl_aresetn = aresetn;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_ctrl_aresetn = _ctrl_aresetn;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	s_axi_control_awready = 1'bx;
	s_axi_control_awready = _ctrl_awready;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	s_axi_control_awready = s_axi_control_awready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	s_axi_control_wready = 1'bx;
	s_axi_control_wready = _ctrl_wready;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	s_axi_control_wready = s_axi_control_wready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	s_axi_control_bresp = 2'bxx;
	s_axi_control_bresp = _ctrl_bresp;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	s_axi_control_bvalid = 1'bx;
	s_axi_control_bvalid = _ctrl_bvalid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	s_axi_control_bvalid = s_axi_control_bvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	s_axi_control_arready = 1'bx;
	s_axi_control_arready = _ctrl_arready;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	s_axi_control_arready = s_axi_control_arready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	s_axi_control_rdata = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	s_axi_control_rdata = _ctrl_rdata;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	s_axi_control_rresp = 2'bxx;
	s_axi_control_rresp = _ctrl_rresp;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	s_axi_control_rvalid = 1'bx;
	s_axi_control_rvalid = _ctrl_rvalid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	s_axi_control_rvalid = s_axi_control_rvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_ctrl_awaddr = 12'dx;
	_ctrl_awaddr = s_axi_control_awaddr;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_ctrl_awvalid = 1'bx;
	_ctrl_awvalid = s_axi_control_awvalid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_ctrl_awvalid = _ctrl_awvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_ctrl_wdata = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	_ctrl_wdata = s_axi_control_wdata;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_ctrl_wstrb = 4'bxxxx;
	_ctrl_wstrb = s_axi_control_wstrb;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_ctrl_wvalid = 1'bx;
	_ctrl_wvalid = s_axi_control_wvalid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_ctrl_wvalid = _ctrl_wvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_ctrl_bready = 1'bx;
	_ctrl_bready = s_axi_control_bready;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_ctrl_bready = _ctrl_bready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_ctrl_araddr = 12'dx;
	_ctrl_araddr = s_axi_control_araddr;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_ctrl_arvalid = 1'bx;
	_ctrl_arvalid = s_axi_control_arvalid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_ctrl_arvalid = _ctrl_arvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_ctrl_rready = 1'bx;
	_ctrl_rready = s_axi_control_rready;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_ctrl_rready = _ctrl_rready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_reader_aresetn = 1'bx;
	_reader_aresetn = aresetn;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_reader_aresetn = _reader_aresetn;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_writer_aresetn = 1'bx;
	_writer_aresetn = aresetn;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_writer_aresetn = _writer_aresetn;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	m_axi_awvalid = 1'bx;
	m_axi_awvalid = _writer_awvalid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	m_axi_awvalid = m_axi_awvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	m_axi_awaddr = 64'dx;
	m_axi_awaddr = _writer_awaddr;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	m_axi_awlen = 8'dx;
	m_axi_awlen = _writer_awlen;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	m_axi_awburst = 2'bxx;
	m_axi_awburst = _writer_awburst;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	m_axi_wvalid = 1'bx;
	m_axi_wvalid = _writer_wvalid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	m_axi_wvalid = m_axi_wvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	m_axi_wdata = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	m_axi_wdata = _writer_wdata;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	m_axi_wstrb = 4'bxxxx;
	m_axi_wstrb = _writer_wstrb;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	m_axi_wlast = 1'bx;
	m_axi_wlast = _writer_wlast;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	m_axi_wlast = m_axi_wlast;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	m_axi_bready = 1'bx;
	m_axi_bready = _writer_bready;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	m_axi_bready = m_axi_bready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_writer_awready = 1'bx;
	_writer_awready = m_axi_awready;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_writer_awready = _writer_awready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_writer_wready = 1'bx;
	_writer_wready = m_axi_wready;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_writer_wready = _writer_wready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_writer_bvalid = 1'bx;
	_writer_bvalid = m_axi_bvalid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_writer_bvalid = _writer_bvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	m_axi_arvalid = 1'bx;
	m_axi_arvalid = _reader_arvalid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	m_axi_arvalid = m_axi_arvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	m_axi_araddr = 64'dx;
	m_axi_araddr = _reader_araddr;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	m_axi_arlen = 8'dx;
	m_axi_arlen = _reader_arlen;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	m_axi_arburst = 2'bxx;
	m_axi_arburst = _reader_arburst;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	m_axi_rready = 1'bx;
	m_axi_rready = _reader_rready;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	m_axi_rready = m_axi_rready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_reader_arready = 1'bx;
	_reader_arready = m_axi_arready;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_reader_arready = _reader_arready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_reader_rvalid = 1'bx;
	_reader_rvalid = m_axi_rvalid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_reader_rvalid = _reader_rvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_reader_rdata = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	_reader_rdata = m_axi_rdata;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_reader_rlast = 1'bx;
	_reader_rlast = m_axi_rlast;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_reader_rlast = _reader_rlast;
end
always_ff @(posedge aclk) begin
	if(_51) if(_reader_fire) addr_state <= 2'd2;
	if(!_51) if(_56) if(_reader_fire) addr_state <= 1'd0;
	if(_ctrl_start) addr_state <= 1'd1;
	if(_153) addr_state <= 1'd0;
end
always_ff @(posedge aclk) begin
	if(_124) if(success) data_state <= 2'd2;
	if(!_124) if(_130) if(success_2) data_state <= 2'd3;
	if(!_124) if(!_130) if(_135) if(_writer_write_success) data_state <= 3'd4;
	if(!_124) if(!_130) if(!_135) if(_141) if(_writer_write_success) data_state <= 3'd5;
	if(!_124) if(!_130) if(!_135) if(!_141) if(_146) if(_148) data_state <= 1'd0;
	if(_ctrl_start) data_state <= 1'd1;
	if(_153) data_state <= 1'd0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	addr_a_bits = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
addr_a_bits[_v0] = _42[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
addr_a_bits[32 + _v0] = _43[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	addr_b_bits = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
addr_b_bits[_v0] = _44[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
addr_b_bits[32 + _v0] = _45[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	addr_c_bits = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
addr_c_bits[_v0] = _46[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
addr_c_bits[32 + _v0] = _47[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	addr_d_bits = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
addr_d_bits[_v0] = _48[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
addr_d_bits[32 + _v0] = _49[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitsToUInt_bits = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_51) _BitsToUInt_bits = addr_a_bits;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_reader_request = 1'bx;
	_reader_request = 1'b0;
	if(_51) _reader_request = 1'b1;
	if(!_51) if(_56) _reader_request = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_reader_request = _reader_request;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_reader_addr = 64'dx;
	if(_51) _reader_addr = _BitsToUInt_value;
	if(!_51) if(_56) _reader_addr = _BitsToUInt_2_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitsToUInt_2_bits = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(!_51) if(_56) _BitsToUInt_2_bits = addr_b_bits;
end
always_ff @(posedge aclk) begin
	for(int _v0 = 0; _v0 < 8; _v0 = _v0 + 1) begin
if(_124) if(success) stored_a[_v0] <= data[_v0];
end
end
always_ff @(posedge aclk) begin
	for(int _v0 = 0; _v0 < 8; _v0 = _v0 + 1) begin
if(!_124) if(_130) if(success_2) stored_b[_v0] <= data_2[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	c = '{32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx};
	c[0] = _62;
	c[1] = _70;
	c[2] = _78;
	c[3] = _86;
	c[4] = _94;
	c[5] = _102;
	c[6] = _110;
	c[7] = _118;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	d = '{32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx};
	d[0] = _66;
	d[1] = _74;
	d[2] = _82;
	d[3] = _90;
	d[4] = _98;
	d[5] = _106;
	d[6] = _114;
	d[7] = _122;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	success = 1'bx;
	if(_124) success = _reader_read_valid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	success = success;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	data = '{32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx};
	for(int _v0 = 0; _v0 < 8; _v0 = _v0 + 1) begin
if(_124) data[_v0] = _reader_data[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_reader_read = 1'bx;
	_reader_read = 1'b0;
	if(_124) _reader_read = 1'b1;
	if(!_124) if(_130) _reader_read = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_reader_read = _reader_read;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	success_2 = 1'bx;
	if(!_124) if(_130) success_2 = _reader_read_valid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	success_2 = success_2;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	data_2 = '{32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx};
	for(int _v0 = 0; _v0 < 8; _v0 = _v0 + 1) begin
if(!_124) if(_130) data_2[_v0] = _reader_data[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitsToUInt_3_bits = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(!_124) if(!_130) if(_135) _BitsToUInt_3_bits = addr_c_bits;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_writer_write = 1'bx;
	_writer_write = 1'b0;
	if(!_124) if(!_130) if(_135) _writer_write = 1'b1;
	if(!_124) if(!_130) if(!_135) if(_141) _writer_write = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_writer_write = _writer_write;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_writer_addr = 64'dx;
	if(!_124) if(!_130) if(_135) _writer_addr = _BitsToUInt_3_value;
	if(!_124) if(!_130) if(!_135) if(_141) _writer_addr = _BitsToUInt_4_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_writer_data = '{32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx};
	for(int _v0 = 0; _v0 < 8; _v0 = _v0 + 1) begin
if(!_124) if(!_130) if(_135) _writer_data[_v0] = c[_v0];
end
	for(int _v0 = 0; _v0 < 8; _v0 = _v0 + 1) begin
if(!_124) if(!_130) if(!_135) if(_141) _writer_data[_v0] = d[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitsToUInt_4_bits = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(!_124) if(!_130) if(!_135) if(_141) _BitsToUInt_4_bits = addr_d_bits;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_ctrl_finish = 1'bx;
	_ctrl_finish = 1'b0;
	if(!_124) if(!_130) if(!_135) if(!_141) if(_146) if(_148) _ctrl_finish = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_ctrl_finish = _ctrl_finish;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_ctrl_output_regs = '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx};
	for(int _v0 = 0; _v0 < 1; _v0 = _v0 + 1) begin
if(!_124) if(!_130) if(!_135) if(!_141) if(_146) if(_148) _ctrl_output_regs[_v0] = _151[_v0];
end
end
endmodule

// BitsToUInt #(NUM_BITS: 64)
module BitsToUInt_NUM_BITS_64(
	input clk,
	input wire[63:0] bits,
	output /*mux_wire*/ logic[63:0] value
);

	assign value = bits;
endmodule

// axi_memory_writer #(T: type int #(FROM: 0, TO: 4294967296)[8])
module axi_memory_writer_T_type_int_FROM_0_TO_4294967296_8(
	input aclk,
	input wire aresetn,
	output /*mux_wire*/ logic awvalid,
	input wire awready,
	output /*mux_wire*/ logic[63:0] awaddr,
	output /*mux_wire*/ logic[7:0] awlen,
	output /*mux_wire*/ logic[1:0] awburst,
	output /*mux_wire*/ logic wvalid,
	input wire wready,
	output /*mux_wire*/ logic[31:0] wdata,
	output /*mux_wire*/ logic[3:0] wstrb,
	output /*mux_wire*/ logic wlast,
	input wire bvalid,
	output /*mux_wire*/ logic bready,
	output /*mux_wire*/ logic has_outstanding_writes,
	input wire write,
	input wire[63:0] addr,
	input wire[31:0] data[7:0],
	output /*mux_wire*/ logic write_success
);

genvar _g0;
/*state*/ logic[255:0] writing_data;
/*state*/ logic writing_data_valid;
/*state*/ logic[7:0] num_outstanding_writes;
wire _4;
assign _4 = num_outstanding_writes != 1'd0;
/*state*/ logic[2:0] cur_data_chunk;
/*mux_wire*/ logic[31:0] parts[7:0];
wire[31:0] _5;
generate
for(_g0 = 0; _g0 < 32; _g0 = _g0 + 1) begin
assign _5[_g0] = writing_data[_g0];
end
endgenerate
wire[31:0] _6;
generate
for(_g0 = 0; _g0 < 32; _g0 = _g0 + 1) begin
assign _6[_g0] = writing_data[32 + _g0];
end
endgenerate
wire[31:0] _7;
generate
for(_g0 = 0; _g0 < 32; _g0 = _g0 + 1) begin
assign _7[_g0] = writing_data[64 + _g0];
end
endgenerate
wire[31:0] _8;
generate
for(_g0 = 0; _g0 < 32; _g0 = _g0 + 1) begin
assign _8[_g0] = writing_data[96 + _g0];
end
endgenerate
wire[31:0] _9;
generate
for(_g0 = 0; _g0 < 32; _g0 = _g0 + 1) begin
assign _9[_g0] = writing_data[128 + _g0];
end
endgenerate
wire[31:0] _10;
generate
for(_g0 = 0; _g0 < 32; _g0 = _g0 + 1) begin
assign _10[_g0] = writing_data[160 + _g0];
end
endgenerate
wire[31:0] _11;
generate
for(_g0 = 0; _g0 < 32; _g0 = _g0 + 1) begin
assign _11[_g0] = writing_data[192 + _g0];
end
endgenerate
wire[31:0] _12;
generate
for(_g0 = 0; _g0 < 32; _g0 = _g0 + 1) begin
assign _12[_g0] = writing_data[224 + _g0];
end
endgenerate
wire[31:0] _14 = parts[cur_data_chunk];
localparam[3:0] _15 = 4'b1111;
wire _18;
assign _18 = cur_data_chunk < 3'd7;
wire _19;
assign _19 = !_18;
wire _22;
assign _22 = wvalid & wready;
wire _24;
assign _24 = !wlast;
wire[3:0] _27;
assign _27 = cur_data_chunk + 1'd1;
/*mux_wire*/ logic[3:0] _unsafe_int_cast_in;
wire[2:0] _unsafe_int_cast_out;
wire _30;
assign _30 = awvalid & awready;
localparam[1:0] _34 = 2'b01;
wire _37;
assign _37 = !writing_data_valid;
wire _40;
assign _40 = num_outstanding_writes < 8'd255;
wire _41;
assign _41 = _37 & _40;
wire _44;
assign _44 = awvalid & awready;
wire _47;
assign _47 = awvalid & awready;
/*mux_wire*/ logic[31:0] _transmute_to_bits_value[7:0];
wire[255:0] _transmute_to_bits_bits;
wire _51;
assign _51 = awvalid & awready;
wire _54;
assign _54 = bvalid & bready;
wire _55;
assign _55 = !_54;
wire _56;
assign _56 = _51 & _55;
/*mux_wire*/ logic[7:0] _unsafe_int_cast_2_in;
wire[7:0] _unsafe_int_cast_2_out;
wire[7:0] _59;
assign _59 = _unsafe_int_cast_2_out + 1'd1;
wire _62;
assign _62 = bvalid & bready;
wire _65;
assign _65 = awvalid & awready;
wire _66;
assign _66 = !_65;
wire _67;
assign _67 = _62 & _66;
/*mux_wire*/ logic[7:0] _unsafe_int_cast_3_in;
wire[7:0] _unsafe_int_cast_3_out;
wire[7:0] _70;
assign _70 = _unsafe_int_cast_3_out - 1'd1;
wire _72;
assign _72 = !aresetn;
unsafe_int_cast_FROM_I_1_TO_I_9_FROM_0_TO_7 unsafe_int_cast(
	.clk(aclk),
	.in(_unsafe_int_cast_in),
	.out(_unsafe_int_cast_out)
);
transmute_to_bits_T_type_int_FROM_0_TO_4294967296_8 transmute_to_bits(
	.clk(aclk),
	.value(_transmute_to_bits_value),
	.bits(_transmute_to_bits_bits)
);
unsafe_int_cast_FROM_I_0_TO_I_256_FROM_0_TO_255 unsafe_int_cast_2(
	.clk(aclk),
	.in(_unsafe_int_cast_2_in),
	.out(_unsafe_int_cast_2_out)
);
unsafe_int_cast_FROM_I_0_TO_I_256_FROM_1_TO_256 unsafe_int_cast_3(
	.clk(aclk),
	.in(_unsafe_int_cast_3_in),
	.out(_unsafe_int_cast_3_out)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	awvalid = 1'bx;
	if(write) awvalid = _41;
	if(!write) awvalid = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	awvalid = awvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	awaddr = 64'dx;
	if(write) awaddr = addr;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	awlen = 8'dx;
	if(write) awlen = 3'd7;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	awburst = 2'bxx;
	if(write) awburst = _34;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	wvalid = 1'bx;
	wvalid = writing_data_valid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	wvalid = wvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	wdata = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	wdata = _14;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	wstrb = 4'bxxxx;
	wstrb = _15;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	wlast = 1'bx;
	wlast = _19;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	wlast = wlast;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	bready = 1'bx;
	bready = _4;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	bready = bready;
end
always_ff @(posedge aclk) begin
	if(write) if(_47) writing_data <= _transmute_to_bits_bits;
end
always_ff @(posedge aclk) begin
	if(_22) if(!_24) writing_data_valid <= 1'b0;
	if(write) if(_47) writing_data_valid <= 1'b1;
	if(_72) writing_data_valid <= 1'b0;
end
always_ff @(posedge aclk) begin
	if(_56) num_outstanding_writes <= _59;
	if(!_56) if(_67) num_outstanding_writes <= _70;
	if(_72) num_outstanding_writes <= 1'd0;
end
always_ff @(posedge aclk) begin
	if(_22) if(_24) cur_data_chunk <= _unsafe_int_cast_out;
	if(_30) cur_data_chunk <= 1'd0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	parts = '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx};
	parts[0] = _5;
	parts[1] = _6;
	parts[2] = _7;
	parts[3] = _8;
	parts[4] = _9;
	parts[5] = _10;
	parts[6] = _11;
	parts[7] = _12;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_in = 4'dx;
	if(_22) if(_24) _unsafe_int_cast_in = _27;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	has_outstanding_writes = 1'bx;
	has_outstanding_writes = bready;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	has_outstanding_writes = has_outstanding_writes;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	write_success = 1'bx;
	if(write) write_success = _44;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	write_success = write_success;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_transmute_to_bits_value = '{32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx};
	for(int _v0 = 0; _v0 < 8; _v0 = _v0 + 1) begin
if(write) if(_47) _transmute_to_bits_value[_v0] = data[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_2_in = 8'dx;
	if(_56) _unsafe_int_cast_2_in = num_outstanding_writes;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_3_in = 8'dx;
	if(!_56) if(_67) _unsafe_int_cast_3_in = num_outstanding_writes;
end
endmodule

// unsafe_int_cast #(FROM_I: 0, TO_I: 256, FROM: 1, TO: 256)
module unsafe_int_cast_FROM_I_0_TO_I_256_FROM_1_TO_256(
	input clk,
	input wire[7:0] in,
	output /*mux_wire*/ logic[7:0] out
);

	assign out = in;
endmodule

// unsafe_int_cast #(FROM_I: 0, TO_I: 256, FROM: 0, TO: 255)
module unsafe_int_cast_FROM_I_0_TO_I_256_FROM_0_TO_255(
	input clk,
	input wire[7:0] in,
	output /*mux_wire*/ logic[7:0] out
);

	assign out = in;
endmodule

// transmute_to_bits #(T: type int #(FROM: 0, TO: 4294967296)[8])
module transmute_to_bits_T_type_int_FROM_0_TO_4294967296_8(
	input clk,
	input wire[31:0] value[7:0],
	output /*mux_wire*/ logic[255:0] bits
);

genvar _g0;
generate
for(_g0 = 0; _g0 < 8; _g0 = _g0 + 1) begin
assign bits[(_g0) * 32 +: 32] = value[_g0];
end
endgenerate
endmodule

// unsafe_int_cast #(FROM_I: 1, TO_I: 9, FROM: 0, TO: 7)
module unsafe_int_cast_FROM_I_1_TO_I_9_FROM_0_TO_7(
	input clk,
	input wire[3:0] in,
	output /*mux_wire*/ logic[2:0] out
);

	assign out = in;
endmodule

// axi_memory_reader #(T: type int #(FROM: 0, TO: 4294967296)[8])
module axi_memory_reader_T_type_int_FROM_0_TO_4294967296_8(
	input aclk,
	input wire aresetn,
	output /*mux_wire*/ logic arvalid,
	input wire arready,
	output /*mux_wire*/ logic[63:0] araddr,
	output /*mux_wire*/ logic[7:0] arlen,
	output /*mux_wire*/ logic[1:0] arburst,
	input wire rvalid,
	output /*mux_wire*/ logic rready,
	input wire[31:0] rdata,
	input wire rlast,
	input wire request,
	input wire[63:0] addr,
	output /*mux_wire*/ logic fire,
	input wire read,
	output /*mux_wire*/ logic read_valid,
	output /*mux_wire*/ logic[31:0] data[7:0]
);

localparam[1:0] _3 = 2'b01;
/*mux_wire*/ logic do_read;
/*mux_wire*/ logic do_read_was_valid;
/*mux_wire*/ logic[255:0] do_read_data;
/*state*/ logic[2:0] stored_part_idx;
/*state*/ logic[31:0] stored_parts[6:0];
wire _7;
assign _7 = stored_part_idx < 3'd7;
/*mux_wire*/ logic[2:0] idx;
/*mux_wire*/ logic[2:0] _unsafe_int_cast_in;
wire[2:0] _unsafe_int_cast_out;
wire[2:0] _14;
assign _14 = idx + 1'd1;
wire _19;
assign _19 = rready & rvalid;
wire[31:0] _21 = stored_parts[0];
wire[31:0] _22 = stored_parts[1];
wire[31:0] _23 = stored_parts[2];
wire[31:0] _24 = stored_parts[3];
wire[31:0] _25 = stored_parts[4];
wire[31:0] _26 = stored_parts[5];
wire[31:0] _27 = stored_parts[6];
wire _30;
assign _30 = !aresetn;
/*mux_wire*/ logic[255:0] _transmute_from_bits_bits;
wire[31:0] _transmute_from_bits_value[7:0];
unsafe_int_cast_FROM_I_0_TO_I_8_FROM_0_TO_7 unsafe_int_cast(
	.clk(aclk),
	.in(_unsafe_int_cast_in),
	.out(_unsafe_int_cast_out)
);
transmute_from_bits_T_type_int_FROM_0_TO_4294967296_8 transmute_from_bits(
	.clk(aclk),
	.bits(_transmute_from_bits_bits),
	.value(_transmute_from_bits_value)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	arvalid = 1'bx;
	if(request) arvalid = 1'b1;
	if(!request) arvalid = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	arvalid = arvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	araddr = 64'dx;
	if(request) araddr = addr;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	arlen = 8'dx;
	if(request) arlen = 3'd7;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	arburst = 2'bxx;
	if(request) arburst = _3;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	rready = 1'bx;
	rready = 1'b0;
	if(_7) rready = 1'b1;
	if(!_7) rready = do_read;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	rready = rready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	fire = 1'bx;
	if(request) fire = arready;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	fire = fire;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	do_read = 1'bx;
	if(read) do_read = 1'b1;
	if(!read) do_read = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	do_read = do_read;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	do_read_was_valid = 1'bx;
	if(_7) do_read_was_valid = 1'b0;
	if(!_7) do_read_was_valid = rvalid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	do_read_was_valid = do_read_was_valid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	do_read_data = 256'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(!_7) if(_19) do_read_data[_v0] = _21[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(!_7) if(_19) do_read_data[32 + _v0] = _22[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(!_7) if(_19) do_read_data[64 + _v0] = _23[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(!_7) if(_19) do_read_data[96 + _v0] = _24[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(!_7) if(_19) do_read_data[128 + _v0] = _25[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(!_7) if(_19) do_read_data[160 + _v0] = _26[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(!_7) if(_19) do_read_data[192 + _v0] = _27[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(!_7) if(_19) do_read_data[224 + _v0] = rdata[_v0];
end
end
always_ff @(posedge aclk) begin
	if(_7) if(rvalid) stored_part_idx <= _14;
	if(!_7) if(_19) stored_part_idx <= 1'd0;
	if(_30) stored_part_idx <= 1'd0;
end
always_ff @(posedge aclk) begin
	if(_7) if(rvalid) stored_parts[idx] <= rdata;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	idx = 3'dx;
	if(_7) if(rvalid) idx = _unsafe_int_cast_out;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_in = 3'dx;
	if(_7) if(rvalid) _unsafe_int_cast_in = stored_part_idx;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	read_valid = 1'bx;
	if(read) read_valid = do_read_was_valid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	read_valid = read_valid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	data = '{32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx};
	for(int _v0 = 0; _v0 < 8; _v0 = _v0 + 1) begin
if(read) if(do_read_was_valid) data[_v0] = _transmute_from_bits_value[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_transmute_from_bits_bits = 256'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(read) if(do_read_was_valid) _transmute_from_bits_bits = do_read_data;
end
endmodule

// transmute_from_bits #(T: type int #(FROM: 0, TO: 4294967296)[8])
module transmute_from_bits_T_type_int_FROM_0_TO_4294967296_8(
	input clk,
	input wire[255:0] bits,
	output /*mux_wire*/ logic[31:0] value[7:0]
);

genvar _g0;
generate
for(_g0 = 0; _g0 < 8; _g0 = _g0 + 1) begin
assign value[_g0] = bits[(_g0) * 32 +: 32];
end
endgenerate
endmodule

// unsafe_int_cast #(FROM_I: 0, TO_I: 8, FROM: 0, TO: 7)
module unsafe_int_cast_FROM_I_0_TO_I_8_FROM_0_TO_7(
	input clk,
	input wire[2:0] in,
	output /*mux_wire*/ logic[2:0] out
);

	assign out = in;
endmodule

// axi_ctrl_slave #(NUM_INPUT_REGS: 8, NUM_OUTPUT_REGS: 1, ADDR_WIDTH: 12, AXI_WIDTH: 32)
module axi_ctrl_slave_NUM_INPUT_REGS_8_NUM_OUTPUT_REGS_1_ADDR_WIDTH_12_AXI_WIDTH_32(
	input aclk,
	input wire aresetn,
	input wire[11:0] awaddr,
	input wire awvalid,
	output /*mux_wire*/ logic awready,
	input wire[31:0] wdata,
	input wire[3:0] wstrb,
	input wire wvalid,
	output /*mux_wire*/ logic wready,
	output /*mux_wire*/ logic[1:0] bresp,
	output /*mux_wire*/ logic bvalid,
	input wire bready,
	input wire[11:0] araddr,
	input wire arvalid,
	output /*mux_wire*/ logic arready,
	output /*mux_wire*/ logic[31:0] rdata,
	output /*mux_wire*/ logic[1:0] rresp,
	output /*mux_wire*/ logic rvalid,
	input wire rready,
	output /*state*/ logic[31:0] input_regs[7:0],
	output /*mux_wire*/ logic start,
	input wire finish,
	input wire[31:0] output_regs[0:0]
);

genvar _g0;
/*state*/ logic[31:0] stored_output_regs[0:0];
/*state*/ logic reg_ctrl_ap_idle;
/*state*/ logic reg_ctrl_ap_done;
/*mux_wire*/ logic reg_ctrl_ap_ready;
/*state*/ logic reg_ctrl_ap_start;
/*state*/ logic[9:0] stored_addr;
/*state*/ logic stored_addr_valid;
/*state*/ logic[1:0] last_bresp;
/*state*/ logic last_werr_valid;
wire _4;
assign _4 = !stored_addr_valid;
wire _6;
assign _6 = _4 & aresetn;
wire _9;
assign _9 = !last_werr_valid;
wire _10;
assign _10 = stored_addr_valid & _9;
wire _15;
assign _15 = awready & awvalid;
wire[9:0] _17;
assign _17 = awaddr / 3'd4;
wire _20;
assign _20 = wready & wvalid;
localparam[1:0] RESP_SLVERR = 2'b10;
wire _22;
assign _22 = stored_addr == 1'd0;
wire _23 = wstrb[0];
wire _24 = wdata[0];
wire _25;
assign _25 = _23 & _24;
localparam[1:0] RESP_OKAY = 2'b00;
wire _28;
assign _28 = stored_addr >= 3'd4;
wire _31;
assign _31 = stored_addr < 4'd12;
wire _32;
assign _32 = _28 & _31;
/*mux_wire*/ logic[2:0] write_idx;
/*mux_wire*/ logic[9:0] _unsafe_int_cast_in;
wire[3:0] _unsafe_int_cast_out;
wire[2:0] _34;
assign _34 = _unsafe_int_cast_out - 3'd4;
wire _35 = wstrb[0];
wire[7:0] _37;
generate
for(_g0 = 0; _g0 < 8; _g0 = _g0 + 1) begin
assign _37[_g0] = wdata[_g0];
end
endgenerate
wire _38 = wstrb[1];
wire[7:0] _40;
generate
for(_g0 = 0; _g0 < 8; _g0 = _g0 + 1) begin
assign _40[_g0] = wdata[8 + _g0];
end
endgenerate
wire _41 = wstrb[2];
wire[7:0] _43;
generate
for(_g0 = 0; _g0 < 8; _g0 = _g0 + 1) begin
assign _43[_g0] = wdata[16 + _g0];
end
endgenerate
wire _44 = wstrb[3];
wire[7:0] _46;
generate
for(_g0 = 0; _g0 < 8; _g0 = _g0 + 1) begin
assign _46[_g0] = wdata[24 + _g0];
end
endgenerate
localparam[1:0] RESP_OKAY_2 = 2'b00;
wire _49;
assign _49 = bready & bvalid;
/*state*/ logic last_rdata_valid;
/*state*/ logic[31:0] last_rdata;
/*state*/ logic[1:0] last_rresp;
/*mux_wire*/ logic[31:0] regs_read_multiplexer[8:0];
wire _55;
assign _55 = !last_rdata_valid;
wire _57;
assign _57 = _55 & aresetn;
wire _61;
assign _61 = arready & arvalid;
localparam[1:0] RESP_SLVERR_2 = 2'b10;
/*mux_wire*/ logic[9:0] read_addr;
wire[9:0] _63;
assign _63 = araddr / 3'd4;
wire _65;
assign _65 = read_addr == 1'd0;
/*mux_wire*/ logic _Repeat_v;
wire[27:0] _Repeat_result;
localparam[1:0] RESP_OKAY_3 = 2'b00;
wire _72;
assign _72 = read_addr >= 3'd4;
wire _75;
assign _75 = read_addr < 4'd13;
wire _76;
assign _76 = _72 & _75;
/*mux_wire*/ logic[3:0] read_idx;
/*mux_wire*/ logic[9:0] _unsafe_int_cast_2_in;
wire[3:0] _unsafe_int_cast_2_out;
wire[3:0] _78;
assign _78 = _unsafe_int_cast_2_out - 3'd4;
wire[31:0] _80 = regs_read_multiplexer[read_idx];
localparam[1:0] RESP_OKAY_4 = 2'b00;
wire _83;
assign _83 = rready & rvalid;
wire _86;
assign _86 = !aresetn;
/*mux_wire*/ logic _Repeat_2_v;
wire[31:0] _Repeat_2_result;
/*mux_wire*/ logic[31:0] _Repeat_3_v;
wire[31:0] _Repeat_3_result[7:0];
/*mux_wire*/ logic _Repeat_4_v;
wire[31:0] _Repeat_4_result;
/*mux_wire*/ logic[31:0] _Repeat_5_v;
wire[31:0] _Repeat_5_result[0:0];
unsafe_int_cast_FROM_I_0_TO_I_1024_FROM_4_TO_12 unsafe_int_cast(
	.clk(aclk),
	.in(_unsafe_int_cast_in),
	.out(_unsafe_int_cast_out)
);
Repeat_T_type_bool_SIZE_28 Repeat(
	.clk(aclk),
	.v(_Repeat_v),
	.result(_Repeat_result)
);
unsafe_int_cast_FROM_I_0_TO_I_1024_FROM_4_TO_13 unsafe_int_cast_2(
	.clk(aclk),
	.in(_unsafe_int_cast_2_in),
	.out(_unsafe_int_cast_2_out)
);
Repeat_T_type_bool_SIZE_32 Repeat_2(
	.clk(aclk),
	.v(_Repeat_2_v),
	.result(_Repeat_2_result)
);
Repeat_T_type_bool_32_SIZE_8 Repeat_3(
	.clk(aclk),
	.v(_Repeat_3_v),
	.result(_Repeat_3_result)
);
Repeat_T_type_bool_SIZE_32 Repeat_4(
	.clk(aclk),
	.v(_Repeat_4_v),
	.result(_Repeat_4_result)
);
Repeat_T_type_bool_32_SIZE_1 Repeat_5(
	.clk(aclk),
	.v(_Repeat_5_v),
	.result(_Repeat_5_result)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	awready = 1'bx;
	awready = 1'b0;
	awready = _6;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	awready = awready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	wready = 1'bx;
	wready = 1'b0;
	wready = _10;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	wready = wready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	bresp = 2'bxx;
	bresp = last_bresp;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	bvalid = 1'bx;
	bvalid = 1'b0;
	bvalid = last_werr_valid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	bvalid = bvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	arready = 1'bx;
	arready = 1'b0;
	arready = _57;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	arready = arready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	rdata = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	rdata = last_rdata;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	rresp = 2'bxx;
	rresp = last_rresp;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	rvalid = 1'bx;
	rvalid = 1'b0;
	rvalid = last_rdata_valid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	rvalid = rvalid;
end
always_ff @(posedge aclk) begin
	for(int _v0 = 0; _v0 < 1; _v0 = _v0 + 1) begin
if(finish) stored_output_regs[_v0] <= output_regs[_v0];
end
	for(int _v0 = 0; _v0 < 1; _v0 = _v0 + 1) begin
if(_86) stored_output_regs[_v0] <= _Repeat_5_result[_v0];
end
end
always_ff @(posedge aclk) begin
	for(int _v0 = 0; _v0 < 8; _v0 = _v0 + 1) begin
if(_20) if(_32) if(_35) input_regs[write_idx][_v0] <= _37[_v0];
end
	for(int _v0 = 0; _v0 < 8; _v0 = _v0 + 1) begin
if(_20) if(_32) if(_38) input_regs[write_idx][8 + _v0] <= _40[_v0];
end
	for(int _v0 = 0; _v0 < 8; _v0 = _v0 + 1) begin
if(_20) if(_32) if(_41) input_regs[write_idx][16 + _v0] <= _43[_v0];
end
	for(int _v0 = 0; _v0 < 8; _v0 = _v0 + 1) begin
if(_20) if(_32) if(_44) input_regs[write_idx][24 + _v0] <= _46[_v0];
end
	for(int _v0 = 0; _v0 < 8; _v0 = _v0 + 1) begin
if(_86) input_regs[_v0] <= _Repeat_3_result[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	start = 1'bx;
	start = 1'b0;
	if(_20) if(_22) if(_25) start = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	start = start;
end
always_ff @(posedge aclk) begin
	if(_20) if(_22) if(_25) reg_ctrl_ap_idle <= 1'b0;
	if(_61) if(_65) if(reg_ctrl_ap_done) reg_ctrl_ap_idle <= 1'b1;
	if(finish) reg_ctrl_ap_idle <= 1'b0;
	if(_86) reg_ctrl_ap_idle <= 1'b1;
end
always_ff @(posedge aclk) begin
	if(_61) if(_65) reg_ctrl_ap_done <= 1'b0;
	if(finish) reg_ctrl_ap_done <= 1'b1;
	if(_86) reg_ctrl_ap_done <= 1'b0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	reg_ctrl_ap_ready = 1'bx;
	reg_ctrl_ap_ready = reg_ctrl_ap_done;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	reg_ctrl_ap_ready = reg_ctrl_ap_ready;
end
always_ff @(posedge aclk) begin
	if(_20) if(_22) if(_25) reg_ctrl_ap_start <= 1'b1;
	if(finish) reg_ctrl_ap_start <= 1'b0;
	if(_86) reg_ctrl_ap_start <= 1'b0;
end
always_ff @(posedge aclk) begin
	if(_15) stored_addr <= _17;
end
always_ff @(posedge aclk) begin
	if(_15) stored_addr_valid <= 1'b1;
	if(_20) stored_addr_valid <= 1'b0;
	if(_86) stored_addr_valid <= 1'b0;
end
always_ff @(posedge aclk) begin
	if(_20) last_bresp <= RESP_SLVERR;
	if(_20) if(_22) last_bresp <= RESP_OKAY;
	if(_20) if(_32) last_bresp <= RESP_OKAY_2;
end
always_ff @(posedge aclk) begin
	if(_20) last_werr_valid <= 1'b1;
	if(_49) last_werr_valid <= 1'b0;
	if(_86) last_werr_valid <= 1'b0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	write_idx = 3'dx;
	if(_20) if(_32) write_idx = _34;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_in = 10'dx;
	if(_20) if(_32) _unsafe_int_cast_in = stored_addr;
end
always_ff @(posedge aclk) begin
	if(_61) last_rdata_valid <= 1'b1;
	if(_83) last_rdata_valid <= 1'b0;
	if(_86) last_rdata_valid <= 1'b0;
end
always_ff @(posedge aclk) begin
	if(_61) if(_65) last_rdata[0] <= reg_ctrl_ap_start;
	if(_61) if(_65) last_rdata[1] <= reg_ctrl_ap_done;
	if(_61) if(_65) last_rdata[2] <= reg_ctrl_ap_idle;
	if(_61) if(_65) last_rdata[3] <= reg_ctrl_ap_ready;
	for(int _v0 = 0; _v0 < 28; _v0 = _v0 + 1) begin
if(_61) if(_65) last_rdata[4 + _v0] <= _Repeat_result[_v0];
end
	if(_61) if(_76) last_rdata <= _80;
end
always_ff @(posedge aclk) begin
	if(_61) last_rresp <= RESP_SLVERR_2;
	if(_61) if(_65) last_rresp <= RESP_OKAY_3;
	if(_61) if(_76) last_rresp <= RESP_OKAY_4;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	regs_read_multiplexer = '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx};
	for(int _v0 = 0; _v0 < 8; _v0 = _v0 + 1) begin
regs_read_multiplexer[_v0] = input_regs[_v0];
end
	for(int _v0 = 0; _v0 < 1; _v0 = _v0 + 1) begin
regs_read_multiplexer[8 + _v0] = stored_output_regs[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	read_addr = 10'dx;
	if(_61) read_addr = _63;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_v = 1'bx;
	if(_61) if(_65) _Repeat_v = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_Repeat_v = _Repeat_v;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	read_idx = 4'dx;
	if(_61) if(_76) read_idx = _78;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_2_in = 10'dx;
	if(_61) if(_76) _unsafe_int_cast_2_in = read_addr;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_2_v = 1'bx;
	if(_86) _Repeat_2_v = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_Repeat_2_v = _Repeat_2_v;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_3_v = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_86) _Repeat_3_v = _Repeat_2_result;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_4_v = 1'bx;
	if(_86) _Repeat_4_v = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_Repeat_4_v = _Repeat_4_v;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_5_v = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_86) _Repeat_5_v = _Repeat_4_result;
end
endmodule

// Repeat #(T: type bool #()[32], SIZE: 1)
module Repeat_T_type_bool_32_SIZE_1(
	input clk,
	input wire[31:0] v,
	output /*mux_wire*/ logic[31:0] result[0:0]
);

always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	result = '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx};
	result[0] = v;
end
endmodule

// Repeat #(T: type bool #()[32], SIZE: 8)
module Repeat_T_type_bool_32_SIZE_8(
	input clk,
	input wire[31:0] v,
	output /*mux_wire*/ logic[31:0] result[7:0]
);

always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	result = '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx};
	result[0] = v;
	result[1] = v;
	result[2] = v;
	result[3] = v;
	result[4] = v;
	result[5] = v;
	result[6] = v;
	result[7] = v;
end
endmodule

// Repeat #(T: type bool #(), SIZE: 32)
module Repeat_T_type_bool_SIZE_32(
	input clk,
	input wire v,
	output /*mux_wire*/ logic[31:0] result
);

always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	result = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	result[0] = v;
	result[1] = v;
	result[2] = v;
	result[3] = v;
	result[4] = v;
	result[5] = v;
	result[6] = v;
	result[7] = v;
	result[8] = v;
	result[9] = v;
	result[10] = v;
	result[11] = v;
	result[12] = v;
	result[13] = v;
	result[14] = v;
	result[15] = v;
	result[16] = v;
	result[17] = v;
	result[18] = v;
	result[19] = v;
	result[20] = v;
	result[21] = v;
	result[22] = v;
	result[23] = v;
	result[24] = v;
	result[25] = v;
	result[26] = v;
	result[27] = v;
	result[28] = v;
	result[29] = v;
	result[30] = v;
	result[31] = v;
end
endmodule

// unsafe_int_cast #(FROM_I: 0, TO_I: 1024, FROM: 4, TO: 13)
module unsafe_int_cast_FROM_I_0_TO_I_1024_FROM_4_TO_13(
	input clk,
	input wire[9:0] in,
	output /*mux_wire*/ logic[3:0] out
);

	assign out = in;
endmodule

// Repeat #(T: type bool #(), SIZE: 28)
module Repeat_T_type_bool_SIZE_28(
	input clk,
	input wire v,
	output /*mux_wire*/ logic[27:0] result
);

always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	result = 28'bxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	result[0] = v;
	result[1] = v;
	result[2] = v;
	result[3] = v;
	result[4] = v;
	result[5] = v;
	result[6] = v;
	result[7] = v;
	result[8] = v;
	result[9] = v;
	result[10] = v;
	result[11] = v;
	result[12] = v;
	result[13] = v;
	result[14] = v;
	result[15] = v;
	result[16] = v;
	result[17] = v;
	result[18] = v;
	result[19] = v;
	result[20] = v;
	result[21] = v;
	result[22] = v;
	result[23] = v;
	result[24] = v;
	result[25] = v;
	result[26] = v;
	result[27] = v;
end
endmodule

// unsafe_int_cast #(FROM_I: 0, TO_I: 1024, FROM: 4, TO: 12)
module unsafe_int_cast_FROM_I_0_TO_I_1024_FROM_4_TO_12(
	input clk,
	input wire[9:0] in,
	output /*mux_wire*/ logic[3:0] out
);

	assign out = in;
endmodule

