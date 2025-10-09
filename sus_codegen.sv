// THIS IS A GENERATED FILE (Generated at 2025-10-08T23:52:46+02:00)
// This file was generated with SUS Compiler 0.3.2 (c03e217393468a2bbaddabb4691db9b59a788351) built at 2025-10-08T21:34:20+02:00
// axi_ctrl_slave_example #()
module axi_ctrl_slave_example(
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
	input wire s_axi_control_rready
);

/*mux_wire*/ logic _axi_control_aresetn;
wire _axi_control_awready;
wire _axi_control_wready;
wire[1:0] _axi_control_bresp;
wire _axi_control_bvalid;
wire _axi_control_arready;
wire[31:0] _axi_control_rdata;
wire[1:0] _axi_control_rresp;
wire _axi_control_rvalid;
/*mux_wire*/ logic[11:0] _axi_control_awaddr;
/*mux_wire*/ logic _axi_control_awvalid;
/*mux_wire*/ logic[31:0] _axi_control_wdata;
/*mux_wire*/ logic[3:0] _axi_control_wstrb;
/*mux_wire*/ logic _axi_control_wvalid;
/*mux_wire*/ logic _axi_control_bready;
/*mux_wire*/ logic[11:0] _axi_control_araddr;
/*mux_wire*/ logic _axi_control_arvalid;
/*mux_wire*/ logic _axi_control_rready;
wire _axi_control_start;
/*mux_wire*/ logic[31:0] a;
wire[31:0] _axi_control_input_regs[1:0];
wire[31:0] _19 = _axi_control_input_regs[0];
/*mux_wire*/ logic[31:0] _BitsToUInt_bits;
wire[31:0] _BitsToUInt_value;
/*mux_wire*/ logic[31:0] b;
wire[31:0] _20 = _axi_control_input_regs[1];
/*mux_wire*/ logic[31:0] _BitsToUInt_2_bits;
wire[31:0] _BitsToUInt_2_value;
/*mux_wire*/ logic[31:0] c;
wire[32:0] _23;
assign _23 = a + b;
wire[31:0] _24;
assign _24 = _23 % 33'd4294967296;
/*mux_wire*/ logic[31:0] _UIntToBits_value;
wire[31:0] _UIntToBits_bits;
wire[31:0] _26[0:0];
assign _26[0] = _UIntToBits_bits;
/*mux_wire*/ logic _axi_control_finish;
/*mux_wire*/ logic[31:0] _axi_control_output_regs[0:0];
axi_ctrl_slave__NUM_INPUT_REGS2_NUM_OUTPUT_REGS1_ADDR_WIDTH12_AXI_WIDTH32 axi_control(
	.aclk(aclk),
	.aresetn(_axi_control_aresetn),
	.awaddr(_axi_control_awaddr),
	.awvalid(_axi_control_awvalid),
	.awready(_axi_control_awready),
	.wdata(_axi_control_wdata),
	.wstrb(_axi_control_wstrb),
	.wvalid(_axi_control_wvalid),
	.wready(_axi_control_wready),
	.bresp(_axi_control_bresp),
	.bvalid(_axi_control_bvalid),
	.bready(_axi_control_bready),
	.araddr(_axi_control_araddr),
	.arvalid(_axi_control_arvalid),
	.arready(_axi_control_arready),
	.rdata(_axi_control_rdata),
	.rresp(_axi_control_rresp),
	.rvalid(_axi_control_rvalid),
	.rready(_axi_control_rready),
	.input_regs(_axi_control_input_regs),
	.start(_axi_control_start),
	.finish(_axi_control_finish),
	.output_regs(_axi_control_output_regs)
);
BitsToUInt__NUM_BITS32 BitsToUInt(
	.clk(aclk),
	.bits(_BitsToUInt_bits),
	.value(_BitsToUInt_value)
);
BitsToUInt__NUM_BITS32 BitsToUInt_2(
	.clk(aclk),
	.bits(_BitsToUInt_2_bits),
	.value(_BitsToUInt_2_value)
);
UIntToBits__NUM_BITS32 UIntToBits(
	.clk(aclk),
	.value(_UIntToBits_value),
	.bits(_UIntToBits_bits)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_axi_control_aresetn = 1'bx;
	_axi_control_aresetn = aresetn;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	s_axi_control_awready = 1'bx;
	s_axi_control_awready = _axi_control_awready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	s_axi_control_wready = 1'bx;
	s_axi_control_wready = _axi_control_wready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	s_axi_control_bresp = 2'bxx;
	s_axi_control_bresp = _axi_control_bresp;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	s_axi_control_bvalid = 1'bx;
	s_axi_control_bvalid = _axi_control_bvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	s_axi_control_arready = 1'bx;
	s_axi_control_arready = _axi_control_arready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	s_axi_control_rdata = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	s_axi_control_rdata = _axi_control_rdata;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	s_axi_control_rresp = 2'bxx;
	s_axi_control_rresp = _axi_control_rresp;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	s_axi_control_rvalid = 1'bx;
	s_axi_control_rvalid = _axi_control_rvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_axi_control_awaddr = 12'dx;
	_axi_control_awaddr = s_axi_control_awaddr;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_axi_control_awvalid = 1'bx;
	_axi_control_awvalid = s_axi_control_awvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_axi_control_wdata = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	_axi_control_wdata = s_axi_control_wdata;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_axi_control_wstrb = 4'bxxxx;
	_axi_control_wstrb = s_axi_control_wstrb;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_axi_control_wvalid = 1'bx;
	_axi_control_wvalid = s_axi_control_wvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_axi_control_bready = 1'bx;
	_axi_control_bready = s_axi_control_bready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_axi_control_araddr = 12'dx;
	_axi_control_araddr = s_axi_control_araddr;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_axi_control_arvalid = 1'bx;
	_axi_control_arvalid = s_axi_control_arvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_axi_control_rready = 1'bx;
	_axi_control_rready = s_axi_control_rready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	a = 32'dx;
	if(_axi_control_start) a = _BitsToUInt_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitsToUInt_bits = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_axi_control_start) _BitsToUInt_bits = _19;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	b = 32'dx;
	if(_axi_control_start) b = _BitsToUInt_2_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitsToUInt_2_bits = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_axi_control_start) _BitsToUInt_2_bits = _20;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	c = 32'dx;
	if(_axi_control_start) c = _24;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_value = 32'dx;
	if(_axi_control_start) _UIntToBits_value = c;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_axi_control_finish = 1'bx;
	_axi_control_finish = 1'b0;
	if(_axi_control_start) _axi_control_finish = 1'b1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_axi_control_output_regs = '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx};
	for(int _v0 = 0; _v0 < 1; _v0 = _v0 + 1) begin
if(_axi_control_start) _axi_control_output_regs[_v0] = _26[_v0];
end
end
endmodule

// axi_ctrl_slave #(NUM_INPUT_REGS: 2, NUM_OUTPUT_REGS: 1, ADDR_WIDTH: 12, AXI_WIDTH: 32)
module axi_ctrl_slave__NUM_INPUT_REGS2_NUM_OUTPUT_REGS1_ADDR_WIDTH12_AXI_WIDTH32(
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
	output /*state*/ logic[31:0] input_regs[1:0],
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
assign _31 = stored_addr < 3'd6;
wire _32;
assign _32 = _28 & _31;
/*mux_wire*/ logic[0:0] write_idx;
/*mux_wire*/ logic[9:0] _unsafe_int_cast_in;
wire[2:0] _unsafe_int_cast_out;
wire[0:0] _34;
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
/*mux_wire*/ logic[31:0] regs_read_multiplexer[2:0];
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
wire _71;
assign _71 = read_addr >= 3'd4;
wire _74;
assign _74 = read_addr < 3'd7;
wire _75;
assign _75 = _71 & _74;
/*mux_wire*/ logic[1:0] read_idx;
/*mux_wire*/ logic[9:0] _unsafe_int_cast_2_in;
wire[2:0] _unsafe_int_cast_2_out;
wire[1:0] _77;
assign _77 = _unsafe_int_cast_2_out - 3'd4;
wire[31:0] _79 = regs_read_multiplexer[read_idx];
localparam[1:0] RESP_OKAY_4 = 2'b00;
wire _82;
assign _82 = rready & rvalid;
wire _85;
assign _85 = !aresetn;
/*mux_wire*/ logic _Repeat_2_v;
wire[31:0] _Repeat_2_result;
/*mux_wire*/ logic[31:0] _Repeat_3_v;
wire[31:0] _Repeat_3_result[1:0];
/*mux_wire*/ logic _Repeat_4_v;
wire[31:0] _Repeat_4_result;
/*mux_wire*/ logic[31:0] _Repeat_5_v;
wire[31:0] _Repeat_5_result[0:0];
unsafe_int_cast__FROM_I0_TO_I1024_FROM4_TO6 unsafe_int_cast(
	.clk(aclk),
	.in(_unsafe_int_cast_in),
	.out(_unsafe_int_cast_out)
);
Repeat__Ttypebool____SIZE28 Repeat(
	.clk(aclk),
	.v(_Repeat_v),
	.result(_Repeat_result)
);
unsafe_int_cast__FROM_I0_TO_I1024_FROM4_TO7 unsafe_int_cast_2(
	.clk(aclk),
	.in(_unsafe_int_cast_2_in),
	.out(_unsafe_int_cast_2_out)
);
Repeat__Ttypebool____SIZE32 Repeat_2(
	.clk(aclk),
	.v(_Repeat_2_v),
	.result(_Repeat_2_result)
);
Repeat__Ttypebool____32__SIZE2 Repeat_3(
	.clk(aclk),
	.v(_Repeat_3_v),
	.result(_Repeat_3_result)
);
Repeat__Ttypebool____SIZE32 Repeat_4(
	.clk(aclk),
	.v(_Repeat_4_v),
	.result(_Repeat_4_result)
);
Repeat__Ttypebool____32__SIZE1 Repeat_5(
	.clk(aclk),
	.v(_Repeat_5_v),
	.result(_Repeat_5_result)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	awready = 1'bx;
	awready = 1'b0;
	awready = _6;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	wready = 1'bx;
	wready = 1'b0;
	wready = _10;
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
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	arready = 1'bx;
	arready = 1'b0;
	arready = _57;
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
end
always_ff @(posedge aclk) begin
	for(int _v0 = 0; _v0 < 1; _v0 = _v0 + 1) begin
if(finish) stored_output_regs[_v0] <= output_regs[_v0];
end
	for(int _v0 = 0; _v0 < 1; _v0 = _v0 + 1) begin
if(_85) stored_output_regs[_v0] <= _Repeat_5_result[_v0];
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
	for(int _v0 = 0; _v0 < 2; _v0 = _v0 + 1) begin
if(_85) input_regs[_v0] <= _Repeat_3_result[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	start = 1'bx;
	start = 1'b0;
	if(_20) if(_22) if(_25) start = 1'b1;
end
always_ff @(posedge aclk) begin
	if(_20) if(_22) if(_25) reg_ctrl_ap_idle <= 1'b0;
	if(finish) reg_ctrl_ap_idle <= 1'b0;
	if(_85) reg_ctrl_ap_idle <= 1'b1;
end
always_ff @(posedge aclk) begin
	if(_61) if(_65) reg_ctrl_ap_done <= 1'b0;
	if(finish) reg_ctrl_ap_done <= 1'b1;
	if(_85) reg_ctrl_ap_done <= 1'b0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	reg_ctrl_ap_ready = 1'bx;
	reg_ctrl_ap_ready = reg_ctrl_ap_done;
end
always_ff @(posedge aclk) begin
	if(_20) if(_22) if(_25) reg_ctrl_ap_start <= 1'b1;
	if(finish) reg_ctrl_ap_start <= 1'b0;
	if(_85) reg_ctrl_ap_start <= 1'b0;
end
always_ff @(posedge aclk) begin
	if(_15) stored_addr <= _17;
end
always_ff @(posedge aclk) begin
	if(_15) stored_addr_valid <= 1'b1;
	if(_20) stored_addr_valid <= 1'b0;
	if(_85) stored_addr_valid <= 1'b0;
end
always_ff @(posedge aclk) begin
	if(_20) last_bresp <= RESP_SLVERR;
	if(_20) if(_22) last_bresp <= RESP_OKAY;
	if(_20) if(_32) last_bresp <= RESP_OKAY_2;
end
always_ff @(posedge aclk) begin
	if(_20) last_werr_valid <= 1'b1;
	if(_49) last_werr_valid <= 1'b0;
	if(_85) last_werr_valid <= 1'b0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	write_idx = 1'dx;
	if(_20) if(_32) write_idx = _34;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_in = 10'dx;
	if(_20) if(_32) _unsafe_int_cast_in = stored_addr;
end
always_ff @(posedge aclk) begin
	if(_61) last_rdata_valid <= 1'b1;
	if(_82) last_rdata_valid <= 1'b0;
	if(_85) last_rdata_valid <= 1'b0;
end
always_ff @(posedge aclk) begin
	if(_61) if(_65) last_rdata[0] <= reg_ctrl_ap_start;
	if(_61) if(_65) last_rdata[1] <= reg_ctrl_ap_done;
	if(_61) if(_65) last_rdata[2] <= reg_ctrl_ap_idle;
	if(_61) if(_65) last_rdata[3] <= reg_ctrl_ap_ready;
	for(int _v0 = 0; _v0 < 28; _v0 = _v0 + 1) begin
if(_61) if(_65) last_rdata[4 + _v0] <= _Repeat_result[_v0];
end
	if(_61) if(_75) last_rdata <= _79;
end
always_ff @(posedge aclk) begin
	if(_61) last_rresp <= RESP_SLVERR_2;
	if(_61) if(_65) last_rresp <= RESP_OKAY_3;
	if(_61) if(_75) last_rresp <= RESP_OKAY_4;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	regs_read_multiplexer = '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx};
	for(int _v0 = 0; _v0 < 2; _v0 = _v0 + 1) begin
regs_read_multiplexer[_v0] = input_regs[_v0];
end
	for(int _v0 = 0; _v0 < 1; _v0 = _v0 + 1) begin
regs_read_multiplexer[2 + _v0] = stored_output_regs[_v0];
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
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	read_idx = 2'dx;
	if(_61) if(_75) read_idx = _77;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_2_in = 10'dx;
	if(_61) if(_75) _unsafe_int_cast_2_in = read_addr;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_2_v = 1'bx;
	if(_85) _Repeat_2_v = 1'b0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_3_v = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_85) _Repeat_3_v = _Repeat_2_result;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_4_v = 1'bx;
	if(_85) _Repeat_4_v = 1'b0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_5_v = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_85) _Repeat_5_v = _Repeat_4_result;
end
endmodule

// BitsToUInt #(NUM_BITS: 32)
module BitsToUInt__NUM_BITS32(
	input clk,
	input wire[31:0] bits,
	output /*mux_wire*/ logic[31:0] value
);

	assign value = bits;
endmodule

// UIntToBits #(NUM_BITS: 32)
module UIntToBits__NUM_BITS32(
	input clk,
	input wire[31:0] value,
	output /*mux_wire*/ logic[31:0] bits
);

	assign bits = value;
endmodule

// unsafe_int_cast #(FROM_I: 0, TO_I: 1024, FROM: 4, TO: 6)
module unsafe_int_cast__FROM_I0_TO_I1024_FROM4_TO6(
	input clk,
	input wire[9:0] in,
	output /*mux_wire*/ logic[2:0] out
);

	assign out = in;
endmodule

// Repeat #(T: type bool #(), SIZE: 28)
module Repeat__Ttypebool____SIZE28(
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

// unsafe_int_cast #(FROM_I: 0, TO_I: 1024, FROM: 4, TO: 7)
module unsafe_int_cast__FROM_I0_TO_I1024_FROM4_TO7(
	input clk,
	input wire[9:0] in,
	output /*mux_wire*/ logic[2:0] out
);

	assign out = in;
endmodule

// Repeat #(T: type bool #(), SIZE: 32)
module Repeat__Ttypebool____SIZE32(
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

// Repeat #(T: type bool #()[32], SIZE: 2)
module Repeat__Ttypebool____32__SIZE2(
	input clk,
	input wire[31:0] v,
	output /*mux_wire*/ logic[31:0] result[1:0]
);

always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	result = '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx};
	result[0] = v;
	result[1] = v;
end
endmodule

// Repeat #(T: type bool #()[32], SIZE: 1)
module Repeat__Ttypebool____32__SIZE1(
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

