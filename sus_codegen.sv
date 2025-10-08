// THIS IS A GENERATED FILE (Generated at 2025-10-08T21:37:05+02:00)
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
axi_ctrl_slave__NUM_INPUT_REGS2_NUM_OUTPUT_REGS1_ADDR_WIDTH12 axi_control(
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

// axi_ctrl_slave #(NUM_INPUT_REGS: 2, NUM_OUTPUT_REGS: 1, ADDR_WIDTH: 12)
module axi_ctrl_slave__NUM_INPUT_REGS2_NUM_OUTPUT_REGS1_ADDR_WIDTH12(
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
/*state*/ logic[9:0] wr_stored_addr;
/*state*/ logic[1:0] wstate;
/*state*/ logic[1:0] last_werr;
wire _4;
assign _4 = wstate == 1'd0;
wire[9:0] _7;
assign _7 = awaddr / 3'd5;
wire _9;
assign _9 = wstate == 1'd1;
localparam[1:0] RESP_SLVERR = 2'b10;
wire _12;
assign _12 = wr_stored_addr == 1'd0;
wire _13 = wstrb[0];
wire _14 = wdata[0];
wire _15;
assign _15 = _13 & _14;
localparam[1:0] RESP_OKAY = 2'b00;
wire _19;
assign _19 = wr_stored_addr >= 2'd2;
wire _22;
assign _22 = wr_stored_addr < 3'd4;
wire _23;
assign _23 = _19 & _22;
/*mux_wire*/ logic[0:0] write_idx;
wire[9:0] _25;
assign _25 = araddr / 3'd5;
/*mux_wire*/ logic[9:0] _unsafe_int_cast_in;
wire[1:0] _unsafe_int_cast_out;
wire[0:0] _27;
assign _27 = _unsafe_int_cast_out - 2'd2;
wire _28 = wstrb[0];
wire[7:0] _30;
generate
for(_g0 = 0; _g0 < 8; _g0 = _g0 + 1) begin
assign _30[_g0] = wdata[_g0];
end
endgenerate
wire _31 = wstrb[1];
wire[7:0] _33;
generate
for(_g0 = 0; _g0 < 8; _g0 = _g0 + 1) begin
assign _33[_g0] = wdata[8 + _g0];
end
endgenerate
wire _34 = wstrb[2];
wire[7:0] _36;
generate
for(_g0 = 0; _g0 < 8; _g0 = _g0 + 1) begin
assign _36[_g0] = wdata[16 + _g0];
end
endgenerate
wire _37 = wstrb[3];
wire[7:0] _39;
generate
for(_g0 = 0; _g0 < 8; _g0 = _g0 + 1) begin
assign _39[_g0] = wdata[24 + _g0];
end
endgenerate
localparam[1:0] RESP_OKAY_2 = 2'b00;
wire _41;
assign _41 = wstate == 2'd2;
/*state*/ logic[1:0] rstate;
/*state*/ logic[31:0] last_rdata;
/*state*/ logic[1:0] last_rerr;
/*mux_wire*/ logic[31:0] regs_read_multiplexer[2:0];
wire _47;
assign _47 = rstate == 1'd0;
localparam[1:0] RESP_SLVERR_2 = 2'b10;
wire _50;
assign _50 = araddr == 1'd0;
/*mux_wire*/ logic _Repeat_v;
wire[27:0] _Repeat_result;
localparam[1:0] RESP_OKAY_3 = 2'b00;
wire _57;
assign _57 = araddr >= 2'd2;
wire _60;
assign _60 = araddr < 3'd5;
wire _61;
assign _61 = _57 & _60;
/*mux_wire*/ logic[1:0] read_idx;
/*mux_wire*/ logic[11:0] _unsafe_int_cast_2_in;
wire[2:0] _unsafe_int_cast_2_out;
wire[1:0] _64;
assign _64 = _unsafe_int_cast_2_out - 2'd2;
wire[31:0] _66 = regs_read_multiplexer[read_idx];
localparam[1:0] RESP_OKAY_4 = 2'b00;
wire _68;
assign _68 = rstate == 1'd1;
wire _74;
assign _74 = !aresetn;
/*mux_wire*/ logic _Repeat_2_v;
wire[31:0] _Repeat_2_result;
/*mux_wire*/ logic[31:0] _Repeat_3_v;
wire[31:0] _Repeat_3_result[1:0];
/*mux_wire*/ logic _Repeat_4_v;
wire[31:0] _Repeat_4_result;
/*mux_wire*/ logic[31:0] _Repeat_5_v;
wire[31:0] _Repeat_5_result[0:0];
unsafe_int_cast__FROM_I0_TO_I820_FROM2_TO4 unsafe_int_cast(
	.clk(aclk),
	.in(_unsafe_int_cast_in),
	.out(_unsafe_int_cast_out)
);
Repeat__Ttypebool____SIZE28 Repeat(
	.clk(aclk),
	.v(_Repeat_v),
	.result(_Repeat_result)
);
unsafe_int_cast__FROM_I0_TO_I4096_FROM2_TO5 unsafe_int_cast_2(
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
	if(_4) awready = 1'b1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	wready = 1'bx;
	wready = 1'b0;
	if(!_4) if(_9) wready = 1'b1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	bresp = 2'bxx;
	if(!_4) if(!_9) if(_41) bresp = last_werr;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	bvalid = 1'bx;
	bvalid = 1'b0;
	if(!_4) if(!_9) if(_41) bvalid = 1'b1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	arready = 1'bx;
	arready = 1'b0;
	if(_47) arready = 1'b1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	rdata = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(!_47) if(_68) rdata = last_rdata;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	rresp = 2'bxx;
	if(!_47) if(_68) rresp = last_rerr;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	rvalid = 1'bx;
	rvalid = 1'b0;
	if(!_47) if(_68) rvalid = 1'b1;
end
always_ff @(posedge aclk) begin
	for(int _v0 = 0; _v0 < 1; _v0 = _v0 + 1) begin
if(finish) stored_output_regs[_v0] <= output_regs[_v0];
end
	for(int _v0 = 0; _v0 < 1; _v0 = _v0 + 1) begin
if(_74) stored_output_regs[_v0] <= _Repeat_5_result[_v0];
end
end
always_ff @(posedge aclk) begin
	for(int _v0 = 0; _v0 < 8; _v0 = _v0 + 1) begin
if(!_4) if(_9) if(wvalid) if(_23) if(_28) input_regs[write_idx][_v0] <= _30[_v0];
end
	for(int _v0 = 0; _v0 < 8; _v0 = _v0 + 1) begin
if(!_4) if(_9) if(wvalid) if(_23) if(_31) input_regs[write_idx][8 + _v0] <= _33[_v0];
end
	for(int _v0 = 0; _v0 < 8; _v0 = _v0 + 1) begin
if(!_4) if(_9) if(wvalid) if(_23) if(_34) input_regs[write_idx][16 + _v0] <= _36[_v0];
end
	for(int _v0 = 0; _v0 < 8; _v0 = _v0 + 1) begin
if(!_4) if(_9) if(wvalid) if(_23) if(_37) input_regs[write_idx][24 + _v0] <= _39[_v0];
end
	for(int _v0 = 0; _v0 < 2; _v0 = _v0 + 1) begin
if(_74) input_regs[_v0] <= _Repeat_3_result[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	start = 1'bx;
	start = 1'b0;
	if(!_4) if(_9) if(wvalid) if(_12) if(_15) start = 1'b1;
end
always_ff @(posedge aclk) begin
	if(!_4) if(_9) if(wvalid) if(_12) if(_15) reg_ctrl_ap_idle <= 1'b0;
	if(finish) reg_ctrl_ap_idle <= 1'b0;
	if(_74) reg_ctrl_ap_idle <= 1'b1;
end
always_ff @(posedge aclk) begin
	if(_47) if(arvalid) if(_50) reg_ctrl_ap_done <= 1'b0;
	if(finish) reg_ctrl_ap_done <= 1'b1;
	if(_74) reg_ctrl_ap_done <= 1'b0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	reg_ctrl_ap_ready = 1'bx;
	reg_ctrl_ap_ready = reg_ctrl_ap_done;
end
always_ff @(posedge aclk) begin
	if(!_4) if(_9) if(wvalid) if(_12) if(_15) reg_ctrl_ap_start <= 1'b1;
	if(finish) reg_ctrl_ap_start <= 1'b0;
	if(_74) reg_ctrl_ap_start <= 1'b0;
end
always_ff @(posedge aclk) begin
	if(_4) if(awvalid) wr_stored_addr <= _7;
end
always_ff @(posedge aclk) begin
	if(_4) if(awvalid) wstate <= 1'd1;
	if(!_4) if(_9) if(wvalid) wstate <= 2'd2;
	if(!_4) if(!_9) if(_41) if(bready) wstate <= 1'd0;
	if(!_4) if(!_9) if(!_41) wstate <= 1'd0;
	if(_74) wstate <= 2'd3;
end
always_ff @(posedge aclk) begin
	if(!_4) if(_9) if(wvalid) last_werr <= RESP_SLVERR;
	if(!_4) if(_9) if(wvalid) if(_12) last_werr <= RESP_OKAY;
	if(!_4) if(_9) if(wvalid) if(_23) last_werr <= RESP_OKAY_2;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	write_idx = 1'dx;
	if(!_4) if(_9) if(wvalid) if(_23) write_idx = _27;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_in = 10'dx;
	if(!_4) if(_9) if(wvalid) if(_23) _unsafe_int_cast_in = _25;
end
always_ff @(posedge aclk) begin
	if(_47) if(arvalid) rstate <= 1'd1;
	if(!_47) if(_68) if(rready) rstate <= 1'd0;
	if(!_47) if(!_68) rstate <= 1'd0;
	if(_74) rstate <= 2'd2;
end
always_ff @(posedge aclk) begin
	if(_47) if(arvalid) if(_50) last_rdata[0] <= reg_ctrl_ap_start;
	if(_47) if(arvalid) if(_50) last_rdata[1] <= reg_ctrl_ap_done;
	if(_47) if(arvalid) if(_50) last_rdata[2] <= reg_ctrl_ap_idle;
	if(_47) if(arvalid) if(_50) last_rdata[3] <= reg_ctrl_ap_ready;
	for(int _v0 = 0; _v0 < 28; _v0 = _v0 + 1) begin
if(_47) if(arvalid) if(_50) last_rdata[4 + _v0] <= _Repeat_result[_v0];
end
	if(_47) if(arvalid) if(_61) last_rdata <= _66;
end
always_ff @(posedge aclk) begin
	if(_47) if(arvalid) last_rerr <= RESP_SLVERR_2;
	if(_47) if(arvalid) if(_50) last_rerr <= RESP_OKAY_3;
	if(_47) if(arvalid) if(_61) last_rerr <= RESP_OKAY_4;
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
	_Repeat_v = 1'bx;
	if(_47) if(arvalid) if(_50) _Repeat_v = 1'b0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	read_idx = 2'dx;
	if(_47) if(arvalid) if(_61) read_idx = _64;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_2_in = 12'dx;
	if(_47) if(arvalid) if(_61) _unsafe_int_cast_2_in = araddr;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_2_v = 1'bx;
	if(_74) _Repeat_2_v = 1'b0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_3_v = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_74) _Repeat_3_v = _Repeat_2_result;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_4_v = 1'bx;
	if(_74) _Repeat_4_v = 1'b0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_5_v = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_74) _Repeat_5_v = _Repeat_4_result;
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

// unsafe_int_cast #(FROM_I: 0, TO_I: 820, FROM: 2, TO: 4)
module unsafe_int_cast__FROM_I0_TO_I820_FROM2_TO4(
	input clk,
	input wire[9:0] in,
	output /*mux_wire*/ logic[1:0] out
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

// unsafe_int_cast #(FROM_I: 0, TO_I: 4096, FROM: 2, TO: 5)
module unsafe_int_cast__FROM_I0_TO_I4096_FROM2_TO5(
	input clk,
	input wire[11:0] in,
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

