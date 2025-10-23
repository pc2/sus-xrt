// THIS IS A GENERATED FILE (Generated at 2025-10-22T22:49:01+02:00)
// This file was generated with SUS Compiler 0.3.5-devel (ac1e88a2530ac91ae98a068c08cfc1ff21055803) built at 2025-10-19_23:35:11 
// test_burst_reader #()
module test_burst_reader(
	input clk
);

axi_memory_burst_reader_ElemT_type_bool_16_AXI_WIDTH_64_COUNT_TO_65536 reader(
	.aclk(clk),
	.aresetn(),
	.arvalid(),
	.arready(),
	.araddr(),
	.arlen(),
	.arburst(),
	.rvalid(),
	.rready(),
	.rdata(),
	.rlast(),
	.is_ready_to_receive_lots_of_data(),
	.element_packet_valid(),
	.elements(),
	.chunk_offset(),
	.chunk_length(),
	.last(),
	.may_request_new_burst(),
	.request_new_burst(),
	.start_addr(),
	.count()
);
axi_memory_burst_reader_ElemT_type_bool_32_AXI_WIDTH_512_COUNT_TO_65536 fullFatReader(
	.aclk(clk),
	.aresetn(),
	.arvalid(),
	.arready(),
	.araddr(),
	.arlen(),
	.arburst(),
	.rvalid(),
	.rready(),
	.rdata(),
	.rlast(),
	.is_ready_to_receive_lots_of_data(),
	.element_packet_valid(),
	.elements(),
	.chunk_offset(),
	.chunk_length(),
	.last(),
	.may_request_new_burst(),
	.request_new_burst(),
	.start_addr(),
	.count()
);
endmodule

// axi_memory_burst_reader #(ElemT: type bool #()[32], AXI_WIDTH: 512, COUNT_TO: 65536)
module axi_memory_burst_reader_ElemT_type_bool_32_AXI_WIDTH_512_COUNT_TO_65536(
	input aclk,
	input wire aresetn,
	output /*mux_wire*/ logic arvalid,
	input wire arready,
	output /*mux_wire*/ logic[63:0] araddr,
	output /*mux_wire*/ logic[7:0] arlen,
	output /*mux_wire*/ logic[1:0] arburst,
	input wire rvalid,
	output /*mux_wire*/ logic rready,
	input wire[511:0] rdata,
	input wire rlast,
	input wire is_ready_to_receive_lots_of_data,
	output /*mux_wire*/ logic element_packet_valid,
	output /*mux_wire*/ logic[31:0] elements[15:0],
	output /*mux_wire*/ logic[3:0] chunk_offset,
	output /*mux_wire*/ logic[4:0] chunk_length,
	output /*mux_wire*/ logic last,
	output /*mux_wire*/ logic may_request_new_burst,
	input wire request_new_burst,
	input wire[63:0] start_addr,
	input wire[15:0] count
);

/*latency*/ logic _request_new_burst_D1; always_ff @(posedge aclk) begin _request_new_burst_D1 <= request_new_burst; end
localparam[1:0] _1 = 2'b01;
/*state*/ logic[7:0] num_in_flight;
wire[57:0] _cur_start_chunk_addr_old;
/*mux_wire*/ logic[57:0] _BitwiseIntConcat_upper;
/*mux_wire*/ logic[5:0] _BitwiseIntConcat_lower;
wire[63:0] _BitwiseIntConcat_v;
/*latency*/ logic[63:0] __BitwiseIntConcat_v_D0; always_ff @(posedge aclk) begin __BitwiseIntConcat_v_D0 <= _BitwiseIntConcat_v; end
/*mux_wire*/ logic[51:0] cur_burst_addr;
/*mux_wire*/ logic[5:0] cur_align;
/*mux_wire*/ logic[57:0] _BitwiseIntSplit_v;
wire[51:0] _BitwiseIntSplit_upper;
wire[5:0] _BitwiseIntSplit_lower;
/*mux_wire*/ logic[6:0] this_burst_size;
/*mux_wire*/ logic chunks_are_left;
/*latency*/ logic _chunks_are_left_D0; always_ff @(posedge aclk) begin _chunks_are_left_D0 <= chunks_are_left; end
wire[12:0] _num_chunks_left_old;
/*latency*/ logic[12:0] __num_chunks_left_old_N1; always_ff @(posedge aclk) begin __num_chunks_left_old_N1 <= _num_chunks_left_old; end
/*latency*/ logic[12:0] __num_chunks_left_old_D0; always_ff @(posedge aclk) begin __num_chunks_left_old_D0 <= __num_chunks_left_old_N1; end
wire _8;
assign _8 = _num_chunks_left_old > 1'd0;
/*latency*/ logic __8_N1; always_ff @(posedge aclk) begin __8_N1 <= _8; end
/*mux_wire*/ logic[6:0] max_chunks_in_this_burst;
/*latency*/ logic[6:0] _max_chunks_in_this_burst_D0; always_ff @(posedge aclk) begin _max_chunks_in_this_burst_D0 <= max_chunks_in_this_burst; end
wire[6:0] _11;
assign _11 = 7'd64 - cur_align;
wire _14;
assign _14 = __num_chunks_left_old_N1 <= max_chunks_in_this_burst;
/*latency*/ logic __14_D0; always_ff @(posedge aclk) begin __14_D0 <= _14; end
/*mux_wire*/ logic[12:0] _unsafe_int_cast_in;
wire[6:0] _unsafe_int_cast_out;
/*latency*/ logic[6:0] __unsafe_int_cast_out_D0; always_ff @(posedge aclk) begin __unsafe_int_cast_out_D0 <= _unsafe_int_cast_out; end
wire[5:0] _19;
assign _19 = this_burst_size - 1'd1;
wire _num_chunks_left_may_update;
wire _22;
assign _22 = _chunks_are_left_D0 & _num_chunks_left_may_update;
wire _cur_start_chunk_addr_may_update;
wire _24;
assign _24 = _22 & _cur_start_chunk_addr_may_update;
/*mux_wire*/ logic _LatencyOffset_in;
wire _LatencyOffset_out;
wire _26;
assign _26 = _24 & _LatencyOffset_out;
wire _29;
assign _29 = num_in_flight < 8'd128;
wire _30;
assign _30 = _26 & _29;
wire _33;
assign _33 = arready & arvalid;
/*latency*/ logic __33_D1; always_ff @(posedge aclk) begin __33_D1 <= _33; end
/*mux_wire*/ logic[52:0] next_burst_addr;
wire[52:0] _36;
assign _36 = cur_burst_addr + 1'd1;
/*latency*/ logic[52:0] __36_D0; always_ff @(posedge aclk) begin __36_D0 <= _36; end
/*latency*/ logic[52:0] __36_D1; always_ff @(posedge aclk) begin __36_D1 <= __36_D0; end
/*mux_wire*/ logic[52:0] _BitwiseIntConcat_2_upper;
/*mux_wire*/ logic[5:0] _BitwiseIntConcat_2_lower;
wire[58:0] _BitwiseIntConcat_2_v;
/*mux_wire*/ logic[58:0] _unsafe_int_cast_2_in;
wire[57:0] _unsafe_int_cast_2_out;
/*mux_wire*/ logic _cur_start_chunk_addr_update;
/*mux_wire*/ logic[57:0] _cur_start_chunk_addr_new;
/*mux_wire*/ logic[12:0] next_num_chunks_left;
wire signed[13:0] _43;
assign _43 = __num_chunks_left_old_D0 - this_burst_size;
/*mux_wire*/ logic signed[13:0] _unsafe_int_cast_3_in;
wire[12:0] _unsafe_int_cast_3_out;
/*mux_wire*/ logic _num_chunks_left_update;
/*mux_wire*/ logic[12:0] _num_chunks_left_new;
/*mux_wire*/ logic _BoolToInt_i;
wire[0:0] _BoolToInt_o;
wire signed[8:0] _50;
assign _50 = num_in_flight - _BoolToInt_o;
wire _53;
assign _53 = arready & arvalid;
/*mux_wire*/ logic _Ternary_cond;
/*mux_wire*/ logic[6:0] _Ternary_a;
/*mux_wire*/ logic[6:0] _Ternary_b;
wire[6:0] _Ternary_o;
wire signed[8:0] _56;
assign _56 = _50 + _Ternary_o;
/*mux_wire*/ logic signed[8:0] _unsafe_int_cast_4_in;
wire[7:0] _unsafe_int_cast_4_out;
/*state*/ logic[12:0] chunks_left;
/*state*/ logic[4:0] final_chunk_align;
/*state*/ logic[3:0] cur_chunk_align;
/*mux_wire*/ logic[31:0] elements_2[15:0];
/*mux_wire*/ logic[511:0] _transmute_from_bits_bits;
wire[31:0] _transmute_from_bits_value[15:0];
/*mux_wire*/ logic[4:0] num_chunk_elements;
/*mux_wire*/ logic is_last;
wire _61;
assign _61 = chunks_left == 1'd1;
wire signed[5:0] _65;
assign _65 = final_chunk_align - cur_chunk_align;
/*mux_wire*/ logic signed[5:0] _unsafe_int_cast_5_in;
wire[4:0] _unsafe_int_cast_5_out;
wire[4:0] _67;
assign _67 = 5'd16 - cur_chunk_align;
wire signed[13:0] _76;
assign _76 = chunks_left - 1'd1;
/*mux_wire*/ logic signed[13:0] _unsafe_int_cast_6_in;
wire[12:0] _unsafe_int_cast_6_out;
wire _78;
assign _78 = !chunks_are_left;
/*latency*/ logic __78_D0; always_ff @(posedge aclk) begin __78_D0 <= _78; end
wire _80;
assign _80 = __78_D0 & _num_chunks_left_may_update;
wire _82;
assign _82 = _80 & _cur_start_chunk_addr_may_update;
/*mux_wire*/ logic[57:0] chunk_addr;
/*latency*/ logic[57:0] _chunk_addr_D1; always_ff @(posedge aclk) begin _chunk_addr_D1 <= chunk_addr; end
/*mux_wire*/ logic[3:0] element_in_chunk_align;
wire[61:0] _84;
assign _84 = start_addr / 3'd4;
/*mux_wire*/ logic[61:0] _BitwiseIntSplit_2_v;
wire[57:0] _BitwiseIntSplit_2_upper;
wire[3:0] _BitwiseIntSplit_2_lower;
/*mux_wire*/ logic[12:0] chunk_count_bits;
/*mux_wire*/ logic[3:0] final_alignment;
wire[16:0] _87;
assign _87 = count + element_in_chunk_align;
/*mux_wire*/ logic[16:0] _BitwiseIntSplit_3_v;
wire[12:0] _BitwiseIntSplit_3_upper;
wire[3:0] _BitwiseIntSplit_3_lower;
/*mux_wire*/ logic[12:0] num_chunks;
/*mux_wire*/ logic is_no_chunks;
wire _90;
assign _90 = chunk_count_bits == 1'd0;
wire _96;
assign _96 = final_alignment != 1'd0;
/*mux_wire*/ logic _BoolToInt_2_i;
wire[0:0] _BoolToInt_2_o;
wire[12:0] _97;
assign _97 = chunk_count_bits + _BoolToInt_2_o;
wire _103;
assign _103 = !is_no_chunks;
wire _106;
assign _106 = final_alignment == 1'd0;
wire _107;
assign _107 = _103 & _106;
/*mux_wire*/ logic _BoolToInt_3_i;
wire[0:0] _BoolToInt_3_o;
/*mux_wire*/ logic[0:0] _BitwiseIntConcat_3_upper;
/*mux_wire*/ logic[3:0] _BitwiseIntConcat_3_lower;
wire[4:0] _BitwiseIntConcat_3_v;
wire _112;
assign _112 = !aresetn;
/*mux_wire*/ logic _cur_start_chunk_addr_rst;
wire _114;
assign _114 = !aresetn;
/*mux_wire*/ logic _num_chunks_left_rst;
wire _116;
assign _116 = !aresetn;
SlowState_T_type_int_FROM_0_TO_288230376151711744_RESET_TO_0_OLD_DELAY_1_NEW_DELAY_1 cur_start_chunk_addr(
	.clk(aclk),
	.rst(_cur_start_chunk_addr_rst),
	.old(_cur_start_chunk_addr_old),
	.may_update(_cur_start_chunk_addr_may_update),
	.update(_cur_start_chunk_addr_update),
	.new_1(_cur_start_chunk_addr_new)
);
SlowState_T_type_int_FROM_0_TO_4099_RESET_TO_0_OLD_DELAY_2_NEW_DELAY_0 num_chunks_left(
	.clk(aclk),
	.rst(_num_chunks_left_rst),
	.old(_num_chunks_left_old),
	.may_update(_num_chunks_left_may_update),
	.update(_num_chunks_left_update),
	.new_1(_num_chunks_left_new)
);
BitwiseIntConcat_UPPER_TO_288230376151711744_LOWER_BITS_6 BitwiseIntConcat(
	.clk(aclk),
	.upper(_BitwiseIntConcat_upper),
	.lower(_BitwiseIntConcat_lower),
	.v(_BitwiseIntConcat_v)
);
BitwiseIntSplit_TO_288230376151711744_LOWER_BITS_6 BitwiseIntSplit(
	.clk(aclk),
	.v(_BitwiseIntSplit_v),
	.upper(_BitwiseIntSplit_upper),
	.lower(_BitwiseIntSplit_lower)
);
unsafe_int_cast_FROM_I_0_TO_I_4099_FROM_1_TO_65 unsafe_int_cast(
	.clk(aclk),
	.in(_unsafe_int_cast_in),
	.out(_unsafe_int_cast_out)
);
LatencyOffset_T_type_bool_OFFSET_192 LatencyOffset(
	.clk(aclk),
	.in(_LatencyOffset_in),
	.out(_LatencyOffset_out)
);
BitwiseIntConcat_UPPER_TO_4503599627370497_LOWER_BITS_6 BitwiseIntConcat_2(
	.clk(aclk),
	.upper(_BitwiseIntConcat_2_upper),
	.lower(_BitwiseIntConcat_2_lower),
	.v(_BitwiseIntConcat_2_v)
);
unsafe_int_cast_FROM_I_0_TO_I_288230376151711808_FROM_0_TO_288230376151711744 unsafe_int_cast_2(
	.clk(aclk),
	.in(_unsafe_int_cast_2_in),
	.out(_unsafe_int_cast_2_out)
);
unsafe_int_cast_FROM_I_64_TO_I_4098_FROM_0_TO_4099 unsafe_int_cast_3(
	.clk(aclk),
	.in(_unsafe_int_cast_3_in),
	.out(_unsafe_int_cast_3_out)
);
BoolToInt BoolToInt(
	.clk(aclk),
	.i(_BoolToInt_i),
	.o(_BoolToInt_o)
);
Ternary_T_type_int_FROM_0_TO_65 Ternary(
	.clk(aclk),
	.cond(_Ternary_cond),
	.a(_Ternary_a),
	.b(_Ternary_b),
	.o(_Ternary_o)
);
unsafe_int_cast_FROM_I_1_TO_I_256_FROM_0_TO_192 unsafe_int_cast_4(
	.clk(aclk),
	.in(_unsafe_int_cast_4_in),
	.out(_unsafe_int_cast_4_out)
);
transmute_from_bits_T_type_bool_32_16 transmute_from_bits(
	.clk(aclk),
	.bits(_transmute_from_bits_bits),
	.value(_transmute_from_bits_value)
);
unsafe_int_cast_FROM_I_15_TO_I_32_FROM_0_TO_17 unsafe_int_cast_5(
	.clk(aclk),
	.in(_unsafe_int_cast_5_in),
	.out(_unsafe_int_cast_5_out)
);
unsafe_int_cast_FROM_I_1_TO_I_4098_FROM_0_TO_4099 unsafe_int_cast_6(
	.clk(aclk),
	.in(_unsafe_int_cast_6_in),
	.out(_unsafe_int_cast_6_out)
);
BitwiseIntSplit_TO_4611686018427387904_LOWER_BITS_4 BitwiseIntSplit_2(
	.clk(aclk),
	.v(_BitwiseIntSplit_2_v),
	.upper(_BitwiseIntSplit_2_upper),
	.lower(_BitwiseIntSplit_2_lower)
);
BitwiseIntSplit_TO_65551_LOWER_BITS_4 BitwiseIntSplit_3(
	.clk(aclk),
	.v(_BitwiseIntSplit_3_v),
	.upper(_BitwiseIntSplit_3_upper),
	.lower(_BitwiseIntSplit_3_lower)
);
BoolToInt BoolToInt_2(
	.clk(aclk),
	.i(_BoolToInt_2_i),
	.o(_BoolToInt_2_o)
);
BoolToInt BoolToInt_3(
	.clk(aclk),
	.i(_BoolToInt_3_i),
	.o(_BoolToInt_3_o)
);
BitwiseIntConcat_UPPER_TO_2_LOWER_BITS_4 BitwiseIntConcat_3(
	.clk(aclk),
	.upper(_BitwiseIntConcat_3_upper),
	.lower(_BitwiseIntConcat_3_lower),
	.v(_BitwiseIntConcat_3_v)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	arvalid = 1'bx;
	arvalid = _30;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	arvalid = arvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	araddr = 64'dx;
	araddr = __BitwiseIntConcat_v_D0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	arlen = 8'dx;
	arlen = _19;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	arburst = 2'bxx;
	arburst = _1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	rready = 1'bx;
	rready = aresetn;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	rready = rready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	element_packet_valid = 1'bx;
	element_packet_valid = 1'b0;
	if(rvalid) element_packet_valid = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	element_packet_valid = element_packet_valid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	elements = '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx};
	for(int _v0 = 0; _v0 < 16; _v0 = _v0 + 1) begin
if(rvalid) elements[_v0] = elements_2[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	chunk_offset = 4'dx;
	if(rvalid) chunk_offset = cur_chunk_align;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	chunk_length = 5'dx;
	if(rvalid) chunk_length = num_chunk_elements;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	last = 1'bx;
	if(rvalid) last = is_last;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	last = last;
end
always_ff @(posedge aclk) begin
	num_in_flight <= _unsafe_int_cast_4_out;
	if(_116) num_in_flight <= 1'd0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntConcat_upper = 58'dx;
	_BitwiseIntConcat_upper = _cur_start_chunk_addr_old;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntConcat_lower = 6'dx;
	_BitwiseIntConcat_lower = 1'd0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	cur_burst_addr = 52'dx;
	cur_burst_addr = _BitwiseIntSplit_upper;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	cur_align = 6'dx;
	cur_align = _BitwiseIntSplit_lower;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntSplit_v = 58'dx;
	_BitwiseIntSplit_v = _cur_start_chunk_addr_old;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	this_burst_size = 7'dx;
	if(_chunks_are_left_D0) if(__14_D0) this_burst_size = __unsafe_int_cast_out_D0;
	if(_chunks_are_left_D0) if(!__14_D0) this_burst_size = _max_chunks_in_this_burst_D0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	chunks_are_left = 1'bx;
	chunks_are_left = __8_N1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	chunks_are_left = chunks_are_left;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	max_chunks_in_this_burst = 7'dx;
	if(chunks_are_left) max_chunks_in_this_burst = _11;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_in = 13'dx;
	if(chunks_are_left) if(_14) _unsafe_int_cast_in = __num_chunks_left_old_N1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_in = 1'bx;
	_LatencyOffset_in = is_ready_to_receive_lots_of_data;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_LatencyOffset_in = _LatencyOffset_in;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	next_burst_addr = 53'dx;
	if(__33_D1) next_burst_addr = __36_D1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntConcat_2_upper = 53'dx;
	if(__33_D1) _BitwiseIntConcat_2_upper = next_burst_addr;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntConcat_2_lower = 6'dx;
	if(__33_D1) _BitwiseIntConcat_2_lower = 1'd0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_2_in = 59'dx;
	if(__33_D1) _unsafe_int_cast_2_in = _BitwiseIntConcat_2_v;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_cur_start_chunk_addr_update = 1'bx;
	_cur_start_chunk_addr_update = 1'b0;
	if(_33) _cur_start_chunk_addr_update = 1'b1;
	if(request_new_burst) _cur_start_chunk_addr_update = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_cur_start_chunk_addr_update = _cur_start_chunk_addr_update;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_cur_start_chunk_addr_new = 58'dx;
	if(__33_D1) _cur_start_chunk_addr_new = _unsafe_int_cast_2_out;
	if(_request_new_burst_D1) _cur_start_chunk_addr_new = _chunk_addr_D1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	next_num_chunks_left = 13'dx;
	if(_33) next_num_chunks_left = _unsafe_int_cast_3_out;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_3_in = 14'sdx;
	if(_33) _unsafe_int_cast_3_in = _43;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_num_chunks_left_update = 1'bx;
	_num_chunks_left_update = 1'b0;
	if(_33) _num_chunks_left_update = 1'b1;
	if(request_new_burst) _num_chunks_left_update = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_num_chunks_left_update = _num_chunks_left_update;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_num_chunks_left_new = 13'dx;
	if(_33) _num_chunks_left_new = next_num_chunks_left;
	if(request_new_burst) _num_chunks_left_new = num_chunks;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BoolToInt_i = 1'bx;
	_BoolToInt_i = rvalid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_BoolToInt_i = _BoolToInt_i;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Ternary_cond = 1'bx;
	_Ternary_cond = _53;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_Ternary_cond = _Ternary_cond;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Ternary_a = 7'dx;
	_Ternary_a = this_burst_size;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Ternary_b = 7'dx;
	_Ternary_b = 1'd0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_4_in = 9'sdx;
	_unsafe_int_cast_4_in = _56;
end
always_ff @(posedge aclk) begin
	if(rvalid) chunks_left <= _unsafe_int_cast_6_out;
	if(request_new_burst) chunks_left <= num_chunks;
end
always_ff @(posedge aclk) begin
	if(request_new_burst) final_chunk_align <= _BitwiseIntConcat_3_v;
end
always_ff @(posedge aclk) begin
	if(rvalid) cur_chunk_align <= 1'd0;
	if(request_new_burst) cur_chunk_align <= element_in_chunk_align;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	elements_2 = '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx};
	for(int _v0 = 0; _v0 < 16; _v0 = _v0 + 1) begin
if(rvalid) elements_2[_v0] = _transmute_from_bits_value[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_transmute_from_bits_bits = 512'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(rvalid) _transmute_from_bits_bits = rdata;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	num_chunk_elements = 5'dx;
	if(rvalid) if(is_last) num_chunk_elements = _unsafe_int_cast_5_out;
	if(rvalid) if(!is_last) num_chunk_elements = _67;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	is_last = 1'bx;
	if(rvalid) is_last = _61;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	is_last = is_last;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_5_in = 6'sdx;
	if(rvalid) if(is_last) _unsafe_int_cast_5_in = _65;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_6_in = 14'sdx;
	if(rvalid) _unsafe_int_cast_6_in = _76;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_request_new_burst = 1'bx;
	may_request_new_burst = _82;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_request_new_burst = may_request_new_burst;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	chunk_addr = 58'dx;
	if(request_new_burst) chunk_addr = _BitwiseIntSplit_2_upper;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	element_in_chunk_align = 4'dx;
	if(request_new_burst) element_in_chunk_align = _BitwiseIntSplit_2_lower;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntSplit_2_v = 62'dx;
	if(request_new_burst) _BitwiseIntSplit_2_v = _84;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	chunk_count_bits = 13'dx;
	if(request_new_burst) chunk_count_bits = _BitwiseIntSplit_3_upper;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	final_alignment = 4'dx;
	if(request_new_burst) final_alignment = _BitwiseIntSplit_3_lower;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntSplit_3_v = 17'dx;
	if(request_new_burst) _BitwiseIntSplit_3_v = _87;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	num_chunks = 13'dx;
	if(request_new_burst) if(is_no_chunks) num_chunks = 1'd1;
	if(request_new_burst) if(!is_no_chunks) num_chunks = _97;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	is_no_chunks = 1'bx;
	if(request_new_burst) is_no_chunks = _90;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	is_no_chunks = is_no_chunks;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BoolToInt_2_i = 1'bx;
	if(request_new_burst) if(!is_no_chunks) _BoolToInt_2_i = _96;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_BoolToInt_2_i = _BoolToInt_2_i;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BoolToInt_3_i = 1'bx;
	if(request_new_burst) _BoolToInt_3_i = _107;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_BoolToInt_3_i = _BoolToInt_3_i;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntConcat_3_upper = 1'dx;
	if(request_new_burst) _BitwiseIntConcat_3_upper = _BoolToInt_3_o;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_BitwiseIntConcat_3_upper = _BitwiseIntConcat_3_upper;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntConcat_3_lower = 4'dx;
	if(request_new_burst) _BitwiseIntConcat_3_lower = final_alignment;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_cur_start_chunk_addr_rst = 1'bx;
	_cur_start_chunk_addr_rst = _112;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_cur_start_chunk_addr_rst = _cur_start_chunk_addr_rst;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_num_chunks_left_rst = 1'bx;
	_num_chunks_left_rst = _114;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_num_chunks_left_rst = _num_chunks_left_rst;
end
endmodule

// BitwiseIntConcat #(UPPER_TO: 2, LOWER_BITS: 4)
module BitwiseIntConcat_UPPER_TO_2_LOWER_BITS_4(
	input clk,
	input wire[0:0] upper,
	input wire[3:0] lower,
	output /*mux_wire*/ logic[4:0] v
);

/*mux_wire*/ logic[4:0] v_bits;
/*mux_wire*/ logic[3:0] _UIntToBits_value;
wire[3:0] _UIntToBits_bits;
/*mux_wire*/ logic[0:0] _UIntToBits_2_value;
wire[0:0] _UIntToBits_2_bits;
/*mux_wire*/ logic[4:0] _transmute_from_bits_bits;
wire[4:0] _transmute_from_bits_value;
UIntToBits_NUM_BITS_4 UIntToBits(
	.clk(clk),
	.value(_UIntToBits_value),
	.bits(_UIntToBits_bits)
);
UIntToBits_NUM_BITS_1 UIntToBits_2(
	.clk(clk),
	.value(_UIntToBits_2_value),
	.bits(_UIntToBits_2_bits)
);
transmute_from_bits_T_type_int_FROM_0_TO_32 transmute_from_bits(
	.clk(clk),
	.bits(_transmute_from_bits_bits),
	.value(_transmute_from_bits_value)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v = 5'dx;
	v = _transmute_from_bits_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v_bits = 5'bxxxxx;
	for(int _v0 = 0; _v0 < 4; _v0 = _v0 + 1) begin
v_bits[_v0] = _UIntToBits_bits[_v0];
end
	for(int _v0 = 0; _v0 < 1; _v0 = _v0 + 1) begin
v_bits[4 + _v0] = _UIntToBits_2_bits[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_value = 4'dx;
	_UIntToBits_value = lower;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_2_value = 1'dx;
	_UIntToBits_2_value = upper;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_UIntToBits_2_value = _UIntToBits_2_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_transmute_from_bits_bits = 5'bxxxxx;
	_transmute_from_bits_bits = v_bits;
end
endmodule

// transmute_from_bits #(T: type int #(FROM: 0, TO: 32))
module transmute_from_bits_T_type_int_FROM_0_TO_32(
	input clk,
	input wire[4:0] bits,
	output /*mux_wire*/ logic[4:0] value
);

assign value = bits;
endmodule

// UIntToBits #(NUM_BITS: 4)
module UIntToBits_NUM_BITS_4(
	input clk,
	input wire[3:0] value,
	output /*mux_wire*/ logic[3:0] bits
);

	assign bits = value;
endmodule

// BitwiseIntSplit #(TO: 65551, LOWER_BITS: 4)
module BitwiseIntSplit_TO_65551_LOWER_BITS_4(
	input clk,
	input wire[16:0] v,
	output /*mux_wire*/ logic[12:0] upper,
	output /*mux_wire*/ logic[3:0] lower
);

genvar _g0;
/*mux_wire*/ logic[16:0] v_bits;
/*mux_wire*/ logic[16:0] _UIntToBits_value;
wire[16:0] _UIntToBits_bits;
wire[3:0] _2;
generate
for(_g0 = 0; _g0 < 4; _g0 = _g0 + 1) begin
assign _2[_g0] = v_bits[_g0];
end
endgenerate
/*mux_wire*/ logic[3:0] _BitsToUInt_bits;
wire[3:0] _BitsToUInt_value;
wire[12:0] _3;
generate
for(_g0 = 0; _g0 < 13; _g0 = _g0 + 1) begin
assign _3[_g0] = v_bits[4 + _g0];
end
endgenerate
/*mux_wire*/ logic[12:0] _transmute_from_bits_bits;
wire[12:0] _transmute_from_bits_value;
UIntToBits_NUM_BITS_17 UIntToBits(
	.clk(clk),
	.value(_UIntToBits_value),
	.bits(_UIntToBits_bits)
);
BitsToUInt_NUM_BITS_4 BitsToUInt(
	.clk(clk),
	.bits(_BitsToUInt_bits),
	.value(_BitsToUInt_value)
);
transmute_from_bits_T_type_int_FROM_0_TO_4097 transmute_from_bits(
	.clk(clk),
	.bits(_transmute_from_bits_bits),
	.value(_transmute_from_bits_value)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	upper = 13'dx;
	upper = _transmute_from_bits_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	lower = 4'dx;
	lower = _BitsToUInt_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v_bits = 17'bxxxxxxxxxxxxxxxxx;
	v_bits = _UIntToBits_bits;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_value = 17'dx;
	_UIntToBits_value = v;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitsToUInt_bits = 4'bxxxx;
	_BitsToUInt_bits = _2;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_transmute_from_bits_bits = 13'bxxxxxxxxxxxxx;
	_transmute_from_bits_bits = _3;
end
endmodule

// transmute_from_bits #(T: type int #(FROM: 0, TO: 4097))
module transmute_from_bits_T_type_int_FROM_0_TO_4097(
	input clk,
	input wire[12:0] bits,
	output /*mux_wire*/ logic[12:0] value
);

assign value = bits;
endmodule

// BitwiseIntSplit #(TO: 4611686018427387904, LOWER_BITS: 4)
module BitwiseIntSplit_TO_4611686018427387904_LOWER_BITS_4(
	input clk,
	input wire[61:0] v,
	output /*mux_wire*/ logic[57:0] upper,
	output /*mux_wire*/ logic[3:0] lower
);

genvar _g0;
/*mux_wire*/ logic[61:0] v_bits;
/*mux_wire*/ logic[61:0] _UIntToBits_value;
wire[61:0] _UIntToBits_bits;
wire[3:0] _2;
generate
for(_g0 = 0; _g0 < 4; _g0 = _g0 + 1) begin
assign _2[_g0] = v_bits[_g0];
end
endgenerate
/*mux_wire*/ logic[3:0] _BitsToUInt_bits;
wire[3:0] _BitsToUInt_value;
wire[57:0] _3;
generate
for(_g0 = 0; _g0 < 58; _g0 = _g0 + 1) begin
assign _3[_g0] = v_bits[4 + _g0];
end
endgenerate
/*mux_wire*/ logic[57:0] _transmute_from_bits_bits;
wire[57:0] _transmute_from_bits_value;
UIntToBits_NUM_BITS_62 UIntToBits(
	.clk(clk),
	.value(_UIntToBits_value),
	.bits(_UIntToBits_bits)
);
BitsToUInt_NUM_BITS_4 BitsToUInt(
	.clk(clk),
	.bits(_BitsToUInt_bits),
	.value(_BitsToUInt_value)
);
transmute_from_bits_T_type_int_FROM_0_TO_288230376151711744 transmute_from_bits(
	.clk(clk),
	.bits(_transmute_from_bits_bits),
	.value(_transmute_from_bits_value)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	upper = 58'dx;
	upper = _transmute_from_bits_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	lower = 4'dx;
	lower = _BitsToUInt_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v_bits = 62'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	v_bits = _UIntToBits_bits;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_value = 62'dx;
	_UIntToBits_value = v;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitsToUInt_bits = 4'bxxxx;
	_BitsToUInt_bits = _2;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_transmute_from_bits_bits = 58'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	_transmute_from_bits_bits = _3;
end
endmodule

// transmute_from_bits #(T: type int #(FROM: 0, TO: 288230376151711744))
module transmute_from_bits_T_type_int_FROM_0_TO_288230376151711744(
	input clk,
	input wire[57:0] bits,
	output /*mux_wire*/ logic[57:0] value
);

assign value = bits;
endmodule

// BitsToUInt #(NUM_BITS: 4)
module BitsToUInt_NUM_BITS_4(
	input clk,
	input wire[3:0] bits,
	output /*mux_wire*/ logic[3:0] value
);

	assign value = bits;
endmodule

// UIntToBits #(NUM_BITS: 62)
module UIntToBits_NUM_BITS_62(
	input clk,
	input wire[61:0] value,
	output /*mux_wire*/ logic[61:0] bits
);

	assign bits = value;
endmodule

// unsafe_int_cast #(FROM_I: -1, TO_I: 4098, FROM: 0, TO: 4099)
module unsafe_int_cast_FROM_I_1_TO_I_4098_FROM_0_TO_4099(
	input clk,
	input wire signed[13:0] in,
	output /*mux_wire*/ logic[12:0] out
);

	assign out = in;
endmodule

// unsafe_int_cast #(FROM_I: -15, TO_I: 32, FROM: 0, TO: 17)
module unsafe_int_cast_FROM_I_15_TO_I_32_FROM_0_TO_17(
	input clk,
	input wire signed[5:0] in,
	output /*mux_wire*/ logic[4:0] out
);

	assign out = in;
endmodule

// transmute_from_bits #(T: type bool #()[32][16])
module transmute_from_bits_T_type_bool_32_16(
	input clk,
	input wire[511:0] bits,
	output /*mux_wire*/ logic[31:0] value[15:0]
);

genvar _g0;
generate
for(_g0 = 0; _g0 < 16; _g0 = _g0 + 1) begin
assign value[_g0] = bits[(_g0) * 32 +: 32];
end
endgenerate
endmodule

// unsafe_int_cast #(FROM_I: -1, TO_I: 256, FROM: 0, TO: 192)
module unsafe_int_cast_FROM_I_1_TO_I_256_FROM_0_TO_192(
	input clk,
	input wire signed[8:0] in,
	output /*mux_wire*/ logic[7:0] out
);

	assign out = in;
endmodule

// Ternary #(T: type int #(FROM: 0, TO: 65))
module Ternary_T_type_int_FROM_0_TO_65(
	input clk,
	input wire cond,
	input wire[6:0] a,
	input wire[6:0] b,
	output /*mux_wire*/ logic[6:0] o
);

always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	o = 7'dx;
	if(cond) o = a;
	if(!cond) o = b;
end
endmodule

// unsafe_int_cast #(FROM_I: -64, TO_I: 4098, FROM: 0, TO: 4099)
module unsafe_int_cast_FROM_I_64_TO_I_4098_FROM_0_TO_4099(
	input clk,
	input wire signed[13:0] in,
	output /*mux_wire*/ logic[12:0] out
);

	assign out = in;
endmodule

// unsafe_int_cast #(FROM_I: 0, TO_I: 288230376151711808, FROM: 0, TO: 288230376151711744)
module unsafe_int_cast_FROM_I_0_TO_I_288230376151711808_FROM_0_TO_288230376151711744(
	input clk,
	input wire[58:0] in,
	output /*mux_wire*/ logic[57:0] out
);

	assign out = in;
endmodule

// BitwiseIntConcat #(UPPER_TO: 4503599627370497, LOWER_BITS: 6)
module BitwiseIntConcat_UPPER_TO_4503599627370497_LOWER_BITS_6(
	input clk,
	input wire[52:0] upper,
	input wire[5:0] lower,
	output /*mux_wire*/ logic[58:0] v
);

/*mux_wire*/ logic[58:0] v_bits;
/*mux_wire*/ logic[5:0] _UIntToBits_value;
wire[5:0] _UIntToBits_bits;
/*mux_wire*/ logic[52:0] _UIntToBits_2_value;
wire[52:0] _UIntToBits_2_bits;
/*mux_wire*/ logic[58:0] _transmute_from_bits_bits;
wire[58:0] _transmute_from_bits_value;
UIntToBits_NUM_BITS_6 UIntToBits(
	.clk(clk),
	.value(_UIntToBits_value),
	.bits(_UIntToBits_bits)
);
UIntToBits_NUM_BITS_53 UIntToBits_2(
	.clk(clk),
	.value(_UIntToBits_2_value),
	.bits(_UIntToBits_2_bits)
);
transmute_from_bits_T_type_int_FROM_0_TO_288230376151711808 transmute_from_bits(
	.clk(clk),
	.bits(_transmute_from_bits_bits),
	.value(_transmute_from_bits_value)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v = 59'dx;
	v = _transmute_from_bits_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v_bits = 59'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	for(int _v0 = 0; _v0 < 6; _v0 = _v0 + 1) begin
v_bits[_v0] = _UIntToBits_bits[_v0];
end
	for(int _v0 = 0; _v0 < 53; _v0 = _v0 + 1) begin
v_bits[6 + _v0] = _UIntToBits_2_bits[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_value = 6'dx;
	_UIntToBits_value = lower;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_2_value = 53'dx;
	_UIntToBits_2_value = upper;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_transmute_from_bits_bits = 59'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	_transmute_from_bits_bits = v_bits;
end
endmodule

// transmute_from_bits #(T: type int #(FROM: 0, TO: 288230376151711808))
module transmute_from_bits_T_type_int_FROM_0_TO_288230376151711808(
	input clk,
	input wire[58:0] bits,
	output /*mux_wire*/ logic[58:0] value
);

assign value = bits;
endmodule

// UIntToBits #(NUM_BITS: 53)
module UIntToBits_NUM_BITS_53(
	input clk,
	input wire[52:0] value,
	output /*mux_wire*/ logic[52:0] bits
);

	assign bits = value;
endmodule

// LatencyOffset #(T: type bool #(), OFFSET: 192)
module LatencyOffset_T_type_bool_OFFSET_192(
	input clk,
	input wire in,
	output /*mux_wire*/ logic out
);

	assign out = in;
endmodule

// unsafe_int_cast #(FROM_I: 0, TO_I: 4099, FROM: 1, TO: 65)
module unsafe_int_cast_FROM_I_0_TO_I_4099_FROM_1_TO_65(
	input clk,
	input wire[12:0] in,
	output /*mux_wire*/ logic[6:0] out
);

	assign out = in;
endmodule

// BitwiseIntSplit #(TO: 288230376151711744, LOWER_BITS: 6)
module BitwiseIntSplit_TO_288230376151711744_LOWER_BITS_6(
	input clk,
	input wire[57:0] v,
	output /*mux_wire*/ logic[51:0] upper,
	output /*mux_wire*/ logic[5:0] lower
);

genvar _g0;
/*mux_wire*/ logic[57:0] v_bits;
/*mux_wire*/ logic[57:0] _UIntToBits_value;
wire[57:0] _UIntToBits_bits;
wire[5:0] _2;
generate
for(_g0 = 0; _g0 < 6; _g0 = _g0 + 1) begin
assign _2[_g0] = v_bits[_g0];
end
endgenerate
/*mux_wire*/ logic[5:0] _BitsToUInt_bits;
wire[5:0] _BitsToUInt_value;
wire[51:0] _3;
generate
for(_g0 = 0; _g0 < 52; _g0 = _g0 + 1) begin
assign _3[_g0] = v_bits[6 + _g0];
end
endgenerate
/*mux_wire*/ logic[51:0] _transmute_from_bits_bits;
wire[51:0] _transmute_from_bits_value;
UIntToBits_NUM_BITS_58 UIntToBits(
	.clk(clk),
	.value(_UIntToBits_value),
	.bits(_UIntToBits_bits)
);
BitsToUInt_NUM_BITS_6 BitsToUInt(
	.clk(clk),
	.bits(_BitsToUInt_bits),
	.value(_BitsToUInt_value)
);
transmute_from_bits_T_type_int_FROM_0_TO_4503599627370496 transmute_from_bits(
	.clk(clk),
	.bits(_transmute_from_bits_bits),
	.value(_transmute_from_bits_value)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	upper = 52'dx;
	upper = _transmute_from_bits_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	lower = 6'dx;
	lower = _BitsToUInt_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v_bits = 58'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	v_bits = _UIntToBits_bits;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_value = 58'dx;
	_UIntToBits_value = v;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitsToUInt_bits = 6'bxxxxxx;
	_BitsToUInt_bits = _2;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_transmute_from_bits_bits = 52'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	_transmute_from_bits_bits = _3;
end
endmodule

// transmute_from_bits #(T: type int #(FROM: 0, TO: 4503599627370496))
module transmute_from_bits_T_type_int_FROM_0_TO_4503599627370496(
	input clk,
	input wire[51:0] bits,
	output /*mux_wire*/ logic[51:0] value
);

assign value = bits;
endmodule

// BitsToUInt #(NUM_BITS: 6)
module BitsToUInt_NUM_BITS_6(
	input clk,
	input wire[5:0] bits,
	output /*mux_wire*/ logic[5:0] value
);

	assign value = bits;
endmodule

// BitwiseIntConcat #(UPPER_TO: 288230376151711744, LOWER_BITS: 6)
module BitwiseIntConcat_UPPER_TO_288230376151711744_LOWER_BITS_6(
	input clk,
	input wire[57:0] upper,
	input wire[5:0] lower,
	output /*mux_wire*/ logic[63:0] v
);

/*mux_wire*/ logic[63:0] v_bits;
/*mux_wire*/ logic[5:0] _UIntToBits_value;
wire[5:0] _UIntToBits_bits;
/*mux_wire*/ logic[57:0] _UIntToBits_2_value;
wire[57:0] _UIntToBits_2_bits;
/*mux_wire*/ logic[63:0] _transmute_from_bits_bits;
wire[63:0] _transmute_from_bits_value;
UIntToBits_NUM_BITS_6 UIntToBits(
	.clk(clk),
	.value(_UIntToBits_value),
	.bits(_UIntToBits_bits)
);
UIntToBits_NUM_BITS_58 UIntToBits_2(
	.clk(clk),
	.value(_UIntToBits_2_value),
	.bits(_UIntToBits_2_bits)
);
transmute_from_bits_T_type_int_FROM_0_TO_18446744073709551616 transmute_from_bits(
	.clk(clk),
	.bits(_transmute_from_bits_bits),
	.value(_transmute_from_bits_value)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v = 64'dx;
	v = _transmute_from_bits_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v_bits = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	for(int _v0 = 0; _v0 < 6; _v0 = _v0 + 1) begin
v_bits[_v0] = _UIntToBits_bits[_v0];
end
	for(int _v0 = 0; _v0 < 58; _v0 = _v0 + 1) begin
v_bits[6 + _v0] = _UIntToBits_2_bits[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_value = 6'dx;
	_UIntToBits_value = lower;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_2_value = 58'dx;
	_UIntToBits_2_value = upper;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_transmute_from_bits_bits = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	_transmute_from_bits_bits = v_bits;
end
endmodule

// UIntToBits #(NUM_BITS: 58)
module UIntToBits_NUM_BITS_58(
	input clk,
	input wire[57:0] value,
	output /*mux_wire*/ logic[57:0] bits
);

	assign bits = value;
endmodule

// UIntToBits #(NUM_BITS: 6)
module UIntToBits_NUM_BITS_6(
	input clk,
	input wire[5:0] value,
	output /*mux_wire*/ logic[5:0] bits
);

	assign bits = value;
endmodule

// SlowState #(T: type int #(FROM: 0, TO: 4099), RESET_TO: 0, OLD_DELAY: 2, NEW_DELAY: 0)
module SlowState_T_type_int_FROM_0_TO_4099_RESET_TO_0_OLD_DELAY_2_NEW_DELAY_0(
	input clk,
	input wire rst,
	output /*state*/ logic[12:0] old,
	output /*mux_wire*/ logic may_update,
	input wire update,
	input wire[12:0] new_1
);

genvar _g0;
/*mux_wire*/ logic _cross_rst_in;
/*mux_wire*/ logic[12:0] new_s;
/*mux_wire*/ logic update_s;
/*mux_wire*/ logic update_old;
/*mux_wire*/ logic _LatencyOffset_in;
wire _LatencyOffset_out;
/*mux_wire*/ logic[12:0] new_old;
/*mux_wire*/ logic[12:0] _LatencyOffset_2_in;
wire[12:0] _LatencyOffset_2_out;
wire _cross_rst_out;
/*latency*/ logic __cross_rst_out_N1; always_ff @(posedge clk) begin __cross_rst_out_N1 <= _cross_rst_out; end
/*latency*/ logic __cross_rst_out_D0; always_ff @(posedge clk) begin __cross_rst_out_D0 <= __cross_rst_out_N1; end
/*state*/ logic[1:0] cooldown;
wire _8 = cooldown[0];
wire _11;
assign _11 = update_s | __cross_rst_out_D0;
/*mux_wire*/ logic _Repeat_v;
wire[1:0] _Repeat_result;
wire[0:0] _12;
generate
for(_g0 = 0; _g0 < 1; _g0 = _g0 + 1) begin
assign _12[_g0] = cooldown[1 + _g0];
end
endgenerate
CrossDomain_T_type_bool cross_rst(
	.in_clk(clk),
	.in(_cross_rst_in),
	.out(_cross_rst_out)
);
LatencyOffset_T_type_bool_OFFSET_2 LatencyOffset(
	.clk(clk),
	.in(_LatencyOffset_in),
	.out(_LatencyOffset_out)
);
LatencyOffset_T_type_int_FROM_0_TO_4099_OFFSET_2 LatencyOffset_2(
	.clk(clk),
	.in(_LatencyOffset_2_in),
	.out(_LatencyOffset_2_out)
);
Repeat_T_type_bool_SIZE_2 Repeat(
	.clk(clk),
	.v(_Repeat_v),
	.result(_Repeat_result)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_cross_rst_in = 1'bx;
	_cross_rst_in = rst;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_cross_rst_in = _cross_rst_in;
end
always_ff @(posedge clk) begin
	if(_cross_rst_out) old <= 13'd0;
	if(!_cross_rst_out) if(update_old) old <= new_old;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	new_s = 13'dx;
	if(update) new_s = new_1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	update_s = 1'bx;
	if(update) update_s = 1'b1;
	if(!update) update_s = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	update_s = update_s;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	update_old = 1'bx;
	update_old = _LatencyOffset_out;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	update_old = update_old;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_in = 1'bx;
	_LatencyOffset_in = update_s;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_LatencyOffset_in = _LatencyOffset_in;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	new_old = 13'dx;
	new_old = _LatencyOffset_2_out;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_2_in = 13'dx;
	_LatencyOffset_2_in = new_s;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_update = 1'bx;
	may_update = _8;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_update = may_update;
end
always_ff @(posedge clk) begin
	if(_11) cooldown <= _Repeat_result;
	for(int _v0 = 0; _v0 < 1; _v0 = _v0 + 1) begin
if(!_11) cooldown[_v0] <= _12[_v0];
end
	if(!_11) cooldown[1] <= 1'b1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_v = 1'bx;
	if(_11) _Repeat_v = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_Repeat_v = _Repeat_v;
end
endmodule

// LatencyOffset #(T: type int #(FROM: 0, TO: 4099), OFFSET: -2)
module LatencyOffset_T_type_int_FROM_0_TO_4099_OFFSET_2(
	input clk,
	input wire[12:0] in,
	output /*mux_wire*/ logic[12:0] out
);

	assign out = in;
endmodule

// SlowState #(T: type int #(FROM: 0, TO: 288230376151711744), RESET_TO: 0, OLD_DELAY: 1, NEW_DELAY: 1)
module SlowState_T_type_int_FROM_0_TO_288230376151711744_RESET_TO_0_OLD_DELAY_1_NEW_DELAY_1(
	input clk,
	input wire rst,
	output /*state*/ logic[57:0] old,
	output /*mux_wire*/ logic may_update,
	input wire update,
	input wire[57:0] new_1
);

/*latency*/ logic _update_D1; always_ff @(posedge clk) begin _update_D1 <= update; end
genvar _g0;
/*mux_wire*/ logic _cross_rst_in;
/*mux_wire*/ logic[57:0] new_s;
/*mux_wire*/ logic update_s;
/*mux_wire*/ logic update_old;
/*mux_wire*/ logic _LatencyOffset_in;
wire _LatencyOffset_out;
/*latency*/ logic __LatencyOffset_out_N1; always_ff @(posedge clk) begin __LatencyOffset_out_N1 <= _LatencyOffset_out; end
/*mux_wire*/ logic[57:0] new_old;
/*mux_wire*/ logic[57:0] _LatencyOffset_2_in;
wire[57:0] _LatencyOffset_2_out;
wire _cross_rst_out;
/*latency*/ logic __cross_rst_out_D0; always_ff @(posedge clk) begin __cross_rst_out_D0 <= _cross_rst_out; end
/*state*/ logic[1:0] cooldown;
wire _8 = cooldown[0];
wire _11;
assign _11 = update_s | __cross_rst_out_D0;
/*mux_wire*/ logic _Repeat_v;
wire[1:0] _Repeat_result;
wire[0:0] _12;
generate
for(_g0 = 0; _g0 < 1; _g0 = _g0 + 1) begin
assign _12[_g0] = cooldown[1 + _g0];
end
endgenerate
CrossDomain_T_type_bool cross_rst(
	.in_clk(clk),
	.in(_cross_rst_in),
	.out(_cross_rst_out)
);
LatencyOffset_T_type_bool_OFFSET_2 LatencyOffset(
	.clk(clk),
	.in(_LatencyOffset_in),
	.out(_LatencyOffset_out)
);
LatencyOffset_T_type_int_FROM_0_TO_288230376151711744_OFFSET_2 LatencyOffset_2(
	.clk(clk),
	.in(_LatencyOffset_2_in),
	.out(_LatencyOffset_2_out)
);
Repeat_T_type_bool_SIZE_2 Repeat(
	.clk(clk),
	.v(_Repeat_v),
	.result(_Repeat_result)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_cross_rst_in = 1'bx;
	_cross_rst_in = rst;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_cross_rst_in = _cross_rst_in;
end
always_ff @(posedge clk) begin
	if(_cross_rst_out) old <= 58'd0;
	if(!_cross_rst_out) if(update_old) old <= new_old;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	new_s = 58'dx;
	if(_update_D1) new_s = new_1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	update_s = 1'bx;
	if(update) update_s = 1'b1;
	if(!update) update_s = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	update_s = update_s;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	update_old = 1'bx;
	update_old = __LatencyOffset_out_N1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	update_old = update_old;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_in = 1'bx;
	_LatencyOffset_in = update_s;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_LatencyOffset_in = _LatencyOffset_in;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	new_old = 58'dx;
	new_old = _LatencyOffset_2_out;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_2_in = 58'dx;
	_LatencyOffset_2_in = new_s;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_update = 1'bx;
	may_update = _8;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_update = may_update;
end
always_ff @(posedge clk) begin
	if(_11) cooldown <= _Repeat_result;
	for(int _v0 = 0; _v0 < 1; _v0 = _v0 + 1) begin
if(!_11) cooldown[_v0] <= _12[_v0];
end
	if(!_11) cooldown[1] <= 1'b1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_v = 1'bx;
	if(_11) _Repeat_v = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_Repeat_v = _Repeat_v;
end
endmodule

// LatencyOffset #(T: type int #(FROM: 0, TO: 288230376151711744), OFFSET: -2)
module LatencyOffset_T_type_int_FROM_0_TO_288230376151711744_OFFSET_2(
	input clk,
	input wire[57:0] in,
	output /*mux_wire*/ logic[57:0] out
);

	assign out = in;
endmodule

// axi_memory_burst_reader #(ElemT: type bool #()[16], AXI_WIDTH: 64, COUNT_TO: 65536)
module axi_memory_burst_reader_ElemT_type_bool_16_AXI_WIDTH_64_COUNT_TO_65536(
	input aclk,
	input wire aresetn,
	output /*mux_wire*/ logic arvalid,
	input wire arready,
	output /*mux_wire*/ logic[63:0] araddr,
	output /*mux_wire*/ logic[7:0] arlen,
	output /*mux_wire*/ logic[1:0] arburst,
	input wire rvalid,
	output /*mux_wire*/ logic rready,
	input wire[63:0] rdata,
	input wire rlast,
	input wire is_ready_to_receive_lots_of_data,
	output /*mux_wire*/ logic element_packet_valid,
	output /*mux_wire*/ logic[15:0] elements[3:0],
	output /*mux_wire*/ logic[1:0] chunk_offset,
	output /*mux_wire*/ logic[2:0] chunk_length,
	output /*mux_wire*/ logic last,
	output /*mux_wire*/ logic may_request_new_burst,
	input wire request_new_burst,
	input wire[63:0] start_addr,
	input wire[15:0] count
);

/*latency*/ logic _request_new_burst_D1; always_ff @(posedge aclk) begin _request_new_burst_D1 <= request_new_burst; end
localparam[1:0] _1 = 2'b01;
/*state*/ logic[8:0] num_in_flight;
wire[60:0] _cur_start_chunk_addr_old;
/*mux_wire*/ logic[60:0] _BitwiseIntConcat_upper;
/*mux_wire*/ logic[2:0] _BitwiseIntConcat_lower;
wire[63:0] _BitwiseIntConcat_v;
/*latency*/ logic[63:0] __BitwiseIntConcat_v_D0; always_ff @(posedge aclk) begin __BitwiseIntConcat_v_D0 <= _BitwiseIntConcat_v; end
/*mux_wire*/ logic[52:0] cur_burst_addr;
/*mux_wire*/ logic[7:0] cur_align;
/*mux_wire*/ logic[60:0] _BitwiseIntSplit_v;
wire[52:0] _BitwiseIntSplit_upper;
wire[7:0] _BitwiseIntSplit_lower;
/*mux_wire*/ logic[8:0] this_burst_size;
/*mux_wire*/ logic chunks_are_left;
/*latency*/ logic _chunks_are_left_D0; always_ff @(posedge aclk) begin _chunks_are_left_D0 <= chunks_are_left; end
wire[14:0] _num_chunks_left_old;
/*latency*/ logic[14:0] __num_chunks_left_old_N1; always_ff @(posedge aclk) begin __num_chunks_left_old_N1 <= _num_chunks_left_old; end
/*latency*/ logic[14:0] __num_chunks_left_old_D0; always_ff @(posedge aclk) begin __num_chunks_left_old_D0 <= __num_chunks_left_old_N1; end
wire _8;
assign _8 = _num_chunks_left_old > 1'd0;
/*latency*/ logic __8_N1; always_ff @(posedge aclk) begin __8_N1 <= _8; end
/*mux_wire*/ logic[8:0] max_chunks_in_this_burst;
/*latency*/ logic[8:0] _max_chunks_in_this_burst_D0; always_ff @(posedge aclk) begin _max_chunks_in_this_burst_D0 <= max_chunks_in_this_burst; end
wire[8:0] _11;
assign _11 = 9'd256 - cur_align;
wire _14;
assign _14 = __num_chunks_left_old_N1 <= max_chunks_in_this_burst;
/*latency*/ logic __14_D0; always_ff @(posedge aclk) begin __14_D0 <= _14; end
/*mux_wire*/ logic[14:0] _unsafe_int_cast_in;
wire[8:0] _unsafe_int_cast_out;
/*latency*/ logic[8:0] __unsafe_int_cast_out_D0; always_ff @(posedge aclk) begin __unsafe_int_cast_out_D0 <= _unsafe_int_cast_out; end
wire[7:0] _19;
assign _19 = this_burst_size - 1'd1;
wire _num_chunks_left_may_update;
wire _22;
assign _22 = _chunks_are_left_D0 & _num_chunks_left_may_update;
wire _cur_start_chunk_addr_may_update;
wire _24;
assign _24 = _22 & _cur_start_chunk_addr_may_update;
/*mux_wire*/ logic _LatencyOffset_in;
wire _LatencyOffset_out;
wire _26;
assign _26 = _24 & _LatencyOffset_out;
wire _29;
assign _29 = num_in_flight < 8'd128;
wire _30;
assign _30 = _26 & _29;
wire _33;
assign _33 = arready & arvalid;
/*latency*/ logic __33_D1; always_ff @(posedge aclk) begin __33_D1 <= _33; end
/*mux_wire*/ logic[53:0] next_burst_addr;
wire[53:0] _36;
assign _36 = cur_burst_addr + 1'd1;
/*latency*/ logic[53:0] __36_D0; always_ff @(posedge aclk) begin __36_D0 <= _36; end
/*latency*/ logic[53:0] __36_D1; always_ff @(posedge aclk) begin __36_D1 <= __36_D0; end
/*mux_wire*/ logic[53:0] _BitwiseIntConcat_2_upper;
/*mux_wire*/ logic[7:0] _BitwiseIntConcat_2_lower;
wire[61:0] _BitwiseIntConcat_2_v;
/*mux_wire*/ logic[61:0] _unsafe_int_cast_2_in;
wire[60:0] _unsafe_int_cast_2_out;
/*mux_wire*/ logic _cur_start_chunk_addr_update;
/*mux_wire*/ logic[60:0] _cur_start_chunk_addr_new;
/*mux_wire*/ logic[14:0] next_num_chunks_left;
wire signed[15:0] _43;
assign _43 = __num_chunks_left_old_D0 - this_burst_size;
/*mux_wire*/ logic signed[15:0] _unsafe_int_cast_3_in;
wire[14:0] _unsafe_int_cast_3_out;
/*mux_wire*/ logic _num_chunks_left_update;
/*mux_wire*/ logic[14:0] _num_chunks_left_new;
/*mux_wire*/ logic _BoolToInt_i;
wire[0:0] _BoolToInt_o;
wire signed[9:0] _50;
assign _50 = num_in_flight - _BoolToInt_o;
wire _53;
assign _53 = arready & arvalid;
/*mux_wire*/ logic _Ternary_cond;
/*mux_wire*/ logic[8:0] _Ternary_a;
/*mux_wire*/ logic[8:0] _Ternary_b;
wire[8:0] _Ternary_o;
wire signed[10:0] _56;
assign _56 = _50 + _Ternary_o;
/*mux_wire*/ logic signed[10:0] _unsafe_int_cast_4_in;
wire[8:0] _unsafe_int_cast_4_out;
/*state*/ logic[14:0] chunks_left;
/*state*/ logic[2:0] final_chunk_align;
/*state*/ logic[1:0] cur_chunk_align;
/*mux_wire*/ logic[15:0] elements_2[3:0];
/*mux_wire*/ logic[63:0] _transmute_from_bits_bits;
wire[15:0] _transmute_from_bits_value[3:0];
/*mux_wire*/ logic[2:0] num_chunk_elements;
/*mux_wire*/ logic is_last;
wire _61;
assign _61 = chunks_left == 1'd1;
wire signed[3:0] _65;
assign _65 = final_chunk_align - cur_chunk_align;
/*mux_wire*/ logic signed[3:0] _unsafe_int_cast_5_in;
wire[2:0] _unsafe_int_cast_5_out;
wire[2:0] _67;
assign _67 = 3'd4 - cur_chunk_align;
wire signed[15:0] _76;
assign _76 = chunks_left - 1'd1;
/*mux_wire*/ logic signed[15:0] _unsafe_int_cast_6_in;
wire[14:0] _unsafe_int_cast_6_out;
wire _78;
assign _78 = !chunks_are_left;
/*latency*/ logic __78_D0; always_ff @(posedge aclk) begin __78_D0 <= _78; end
wire _80;
assign _80 = __78_D0 & _num_chunks_left_may_update;
wire _82;
assign _82 = _80 & _cur_start_chunk_addr_may_update;
/*mux_wire*/ logic[60:0] chunk_addr;
/*latency*/ logic[60:0] _chunk_addr_D1; always_ff @(posedge aclk) begin _chunk_addr_D1 <= chunk_addr; end
/*mux_wire*/ logic[1:0] element_in_chunk_align;
wire[62:0] _84;
assign _84 = start_addr / 2'd2;
/*mux_wire*/ logic[62:0] _BitwiseIntSplit_2_v;
wire[60:0] _BitwiseIntSplit_2_upper;
wire[1:0] _BitwiseIntSplit_2_lower;
/*mux_wire*/ logic[14:0] chunk_count_bits;
/*mux_wire*/ logic[1:0] final_alignment;
wire[16:0] _87;
assign _87 = count + element_in_chunk_align;
/*mux_wire*/ logic[16:0] _BitwiseIntSplit_3_v;
wire[14:0] _BitwiseIntSplit_3_upper;
wire[1:0] _BitwiseIntSplit_3_lower;
/*mux_wire*/ logic[14:0] num_chunks;
/*mux_wire*/ logic is_no_chunks;
wire _90;
assign _90 = chunk_count_bits == 1'd0;
wire _96;
assign _96 = final_alignment != 1'd0;
/*mux_wire*/ logic _BoolToInt_2_i;
wire[0:0] _BoolToInt_2_o;
wire[14:0] _97;
assign _97 = chunk_count_bits + _BoolToInt_2_o;
wire _103;
assign _103 = !is_no_chunks;
wire _106;
assign _106 = final_alignment == 1'd0;
wire _107;
assign _107 = _103 & _106;
/*mux_wire*/ logic _BoolToInt_3_i;
wire[0:0] _BoolToInt_3_o;
/*mux_wire*/ logic[0:0] _BitwiseIntConcat_3_upper;
/*mux_wire*/ logic[1:0] _BitwiseIntConcat_3_lower;
wire[2:0] _BitwiseIntConcat_3_v;
wire _112;
assign _112 = !aresetn;
/*mux_wire*/ logic _cur_start_chunk_addr_rst;
wire _114;
assign _114 = !aresetn;
/*mux_wire*/ logic _num_chunks_left_rst;
wire _116;
assign _116 = !aresetn;
SlowState_T_type_int_FROM_0_TO_2305843009213693952_RESET_TO_0_OLD_DELAY_1_NEW_DELAY_1 cur_start_chunk_addr(
	.clk(aclk),
	.rst(_cur_start_chunk_addr_rst),
	.old(_cur_start_chunk_addr_old),
	.may_update(_cur_start_chunk_addr_may_update),
	.update(_cur_start_chunk_addr_update),
	.new_1(_cur_start_chunk_addr_new)
);
SlowState_T_type_int_FROM_0_TO_16387_RESET_TO_0_OLD_DELAY_2_NEW_DELAY_0 num_chunks_left(
	.clk(aclk),
	.rst(_num_chunks_left_rst),
	.old(_num_chunks_left_old),
	.may_update(_num_chunks_left_may_update),
	.update(_num_chunks_left_update),
	.new_1(_num_chunks_left_new)
);
BitwiseIntConcat_UPPER_TO_2305843009213693952_LOWER_BITS_3 BitwiseIntConcat(
	.clk(aclk),
	.upper(_BitwiseIntConcat_upper),
	.lower(_BitwiseIntConcat_lower),
	.v(_BitwiseIntConcat_v)
);
BitwiseIntSplit_TO_2305843009213693952_LOWER_BITS_8 BitwiseIntSplit(
	.clk(aclk),
	.v(_BitwiseIntSplit_v),
	.upper(_BitwiseIntSplit_upper),
	.lower(_BitwiseIntSplit_lower)
);
unsafe_int_cast_FROM_I_0_TO_I_16387_FROM_1_TO_257 unsafe_int_cast(
	.clk(aclk),
	.in(_unsafe_int_cast_in),
	.out(_unsafe_int_cast_out)
);
LatencyOffset_T_type_bool_OFFSET_384 LatencyOffset(
	.clk(aclk),
	.in(_LatencyOffset_in),
	.out(_LatencyOffset_out)
);
BitwiseIntConcat_UPPER_TO_9007199254740993_LOWER_BITS_8 BitwiseIntConcat_2(
	.clk(aclk),
	.upper(_BitwiseIntConcat_2_upper),
	.lower(_BitwiseIntConcat_2_lower),
	.v(_BitwiseIntConcat_2_v)
);
unsafe_int_cast_FROM_I_0_TO_I_2305843009213694208_FROM_0_TO_2305843009213693952 unsafe_int_cast_2(
	.clk(aclk),
	.in(_unsafe_int_cast_2_in),
	.out(_unsafe_int_cast_2_out)
);
unsafe_int_cast_FROM_I_256_TO_I_16386_FROM_0_TO_16387 unsafe_int_cast_3(
	.clk(aclk),
	.in(_unsafe_int_cast_3_in),
	.out(_unsafe_int_cast_3_out)
);
BoolToInt BoolToInt(
	.clk(aclk),
	.i(_BoolToInt_i),
	.o(_BoolToInt_o)
);
Ternary_T_type_int_FROM_0_TO_257 Ternary(
	.clk(aclk),
	.cond(_Ternary_cond),
	.a(_Ternary_a),
	.b(_Ternary_b),
	.o(_Ternary_o)
);
unsafe_int_cast_FROM_I_1_TO_I_640_FROM_0_TO_384 unsafe_int_cast_4(
	.clk(aclk),
	.in(_unsafe_int_cast_4_in),
	.out(_unsafe_int_cast_4_out)
);
transmute_from_bits_T_type_bool_16_4 transmute_from_bits(
	.clk(aclk),
	.bits(_transmute_from_bits_bits),
	.value(_transmute_from_bits_value)
);
unsafe_int_cast_FROM_I_3_TO_I_8_FROM_0_TO_5 unsafe_int_cast_5(
	.clk(aclk),
	.in(_unsafe_int_cast_5_in),
	.out(_unsafe_int_cast_5_out)
);
unsafe_int_cast_FROM_I_1_TO_I_16386_FROM_0_TO_16387 unsafe_int_cast_6(
	.clk(aclk),
	.in(_unsafe_int_cast_6_in),
	.out(_unsafe_int_cast_6_out)
);
BitwiseIntSplit_TO_9223372036854775808_LOWER_BITS_2 BitwiseIntSplit_2(
	.clk(aclk),
	.v(_BitwiseIntSplit_2_v),
	.upper(_BitwiseIntSplit_2_upper),
	.lower(_BitwiseIntSplit_2_lower)
);
BitwiseIntSplit_TO_65539_LOWER_BITS_2 BitwiseIntSplit_3(
	.clk(aclk),
	.v(_BitwiseIntSplit_3_v),
	.upper(_BitwiseIntSplit_3_upper),
	.lower(_BitwiseIntSplit_3_lower)
);
BoolToInt BoolToInt_2(
	.clk(aclk),
	.i(_BoolToInt_2_i),
	.o(_BoolToInt_2_o)
);
BoolToInt BoolToInt_3(
	.clk(aclk),
	.i(_BoolToInt_3_i),
	.o(_BoolToInt_3_o)
);
BitwiseIntConcat_UPPER_TO_2_LOWER_BITS_2 BitwiseIntConcat_3(
	.clk(aclk),
	.upper(_BitwiseIntConcat_3_upper),
	.lower(_BitwiseIntConcat_3_lower),
	.v(_BitwiseIntConcat_3_v)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	arvalid = 1'bx;
	arvalid = _30;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	arvalid = arvalid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	araddr = 64'dx;
	araddr = __BitwiseIntConcat_v_D0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	arlen = 8'dx;
	arlen = _19;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	arburst = 2'bxx;
	arburst = _1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	rready = 1'bx;
	rready = aresetn;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	rready = rready;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	element_packet_valid = 1'bx;
	element_packet_valid = 1'b0;
	if(rvalid) element_packet_valid = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	element_packet_valid = element_packet_valid;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	elements = '{16'bxxxxxxxxxxxxxxxx, 16'bxxxxxxxxxxxxxxxx, 16'bxxxxxxxxxxxxxxxx, 16'bxxxxxxxxxxxxxxxx};
	for(int _v0 = 0; _v0 < 4; _v0 = _v0 + 1) begin
if(rvalid) elements[_v0] = elements_2[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	chunk_offset = 2'dx;
	if(rvalid) chunk_offset = cur_chunk_align;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	chunk_length = 3'dx;
	if(rvalid) chunk_length = num_chunk_elements;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	last = 1'bx;
	if(rvalid) last = is_last;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	last = last;
end
always_ff @(posedge aclk) begin
	num_in_flight <= _unsafe_int_cast_4_out;
	if(_116) num_in_flight <= 1'd0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntConcat_upper = 61'dx;
	_BitwiseIntConcat_upper = _cur_start_chunk_addr_old;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntConcat_lower = 3'dx;
	_BitwiseIntConcat_lower = 1'd0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	cur_burst_addr = 53'dx;
	cur_burst_addr = _BitwiseIntSplit_upper;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	cur_align = 8'dx;
	cur_align = _BitwiseIntSplit_lower;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntSplit_v = 61'dx;
	_BitwiseIntSplit_v = _cur_start_chunk_addr_old;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	this_burst_size = 9'dx;
	if(_chunks_are_left_D0) if(__14_D0) this_burst_size = __unsafe_int_cast_out_D0;
	if(_chunks_are_left_D0) if(!__14_D0) this_burst_size = _max_chunks_in_this_burst_D0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	chunks_are_left = 1'bx;
	chunks_are_left = __8_N1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	chunks_are_left = chunks_are_left;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	max_chunks_in_this_burst = 9'dx;
	if(chunks_are_left) max_chunks_in_this_burst = _11;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_in = 15'dx;
	if(chunks_are_left) if(_14) _unsafe_int_cast_in = __num_chunks_left_old_N1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_in = 1'bx;
	_LatencyOffset_in = is_ready_to_receive_lots_of_data;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_LatencyOffset_in = _LatencyOffset_in;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	next_burst_addr = 54'dx;
	if(__33_D1) next_burst_addr = __36_D1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntConcat_2_upper = 54'dx;
	if(__33_D1) _BitwiseIntConcat_2_upper = next_burst_addr;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntConcat_2_lower = 8'dx;
	if(__33_D1) _BitwiseIntConcat_2_lower = 1'd0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_2_in = 62'dx;
	if(__33_D1) _unsafe_int_cast_2_in = _BitwiseIntConcat_2_v;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_cur_start_chunk_addr_update = 1'bx;
	_cur_start_chunk_addr_update = 1'b0;
	if(_33) _cur_start_chunk_addr_update = 1'b1;
	if(request_new_burst) _cur_start_chunk_addr_update = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_cur_start_chunk_addr_update = _cur_start_chunk_addr_update;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_cur_start_chunk_addr_new = 61'dx;
	if(__33_D1) _cur_start_chunk_addr_new = _unsafe_int_cast_2_out;
	if(_request_new_burst_D1) _cur_start_chunk_addr_new = _chunk_addr_D1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	next_num_chunks_left = 15'dx;
	if(_33) next_num_chunks_left = _unsafe_int_cast_3_out;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_3_in = 16'sdx;
	if(_33) _unsafe_int_cast_3_in = _43;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_num_chunks_left_update = 1'bx;
	_num_chunks_left_update = 1'b0;
	if(_33) _num_chunks_left_update = 1'b1;
	if(request_new_burst) _num_chunks_left_update = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_num_chunks_left_update = _num_chunks_left_update;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_num_chunks_left_new = 15'dx;
	if(_33) _num_chunks_left_new = next_num_chunks_left;
	if(request_new_burst) _num_chunks_left_new = num_chunks;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BoolToInt_i = 1'bx;
	_BoolToInt_i = rvalid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_BoolToInt_i = _BoolToInt_i;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Ternary_cond = 1'bx;
	_Ternary_cond = _53;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_Ternary_cond = _Ternary_cond;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Ternary_a = 9'dx;
	_Ternary_a = this_burst_size;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Ternary_b = 9'dx;
	_Ternary_b = 1'd0;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_4_in = 11'sdx;
	_unsafe_int_cast_4_in = _56;
end
always_ff @(posedge aclk) begin
	if(rvalid) chunks_left <= _unsafe_int_cast_6_out;
	if(request_new_burst) chunks_left <= num_chunks;
end
always_ff @(posedge aclk) begin
	if(request_new_burst) final_chunk_align <= _BitwiseIntConcat_3_v;
end
always_ff @(posedge aclk) begin
	if(rvalid) cur_chunk_align <= 1'd0;
	if(request_new_burst) cur_chunk_align <= element_in_chunk_align;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	elements_2 = '{16'bxxxxxxxxxxxxxxxx, 16'bxxxxxxxxxxxxxxxx, 16'bxxxxxxxxxxxxxxxx, 16'bxxxxxxxxxxxxxxxx};
	for(int _v0 = 0; _v0 < 4; _v0 = _v0 + 1) begin
if(rvalid) elements_2[_v0] = _transmute_from_bits_value[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_transmute_from_bits_bits = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(rvalid) _transmute_from_bits_bits = rdata;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	num_chunk_elements = 3'dx;
	if(rvalid) if(is_last) num_chunk_elements = _unsafe_int_cast_5_out;
	if(rvalid) if(!is_last) num_chunk_elements = _67;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	is_last = 1'bx;
	if(rvalid) is_last = _61;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	is_last = is_last;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_5_in = 4'sdx;
	if(rvalid) if(is_last) _unsafe_int_cast_5_in = _65;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_6_in = 16'sdx;
	if(rvalid) _unsafe_int_cast_6_in = _76;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_request_new_burst = 1'bx;
	may_request_new_burst = _82;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_request_new_burst = may_request_new_burst;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	chunk_addr = 61'dx;
	if(request_new_burst) chunk_addr = _BitwiseIntSplit_2_upper;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	element_in_chunk_align = 2'dx;
	if(request_new_burst) element_in_chunk_align = _BitwiseIntSplit_2_lower;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntSplit_2_v = 63'dx;
	if(request_new_burst) _BitwiseIntSplit_2_v = _84;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	chunk_count_bits = 15'dx;
	if(request_new_burst) chunk_count_bits = _BitwiseIntSplit_3_upper;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	final_alignment = 2'dx;
	if(request_new_burst) final_alignment = _BitwiseIntSplit_3_lower;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntSplit_3_v = 17'dx;
	if(request_new_burst) _BitwiseIntSplit_3_v = _87;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	num_chunks = 15'dx;
	if(request_new_burst) if(is_no_chunks) num_chunks = 1'd1;
	if(request_new_burst) if(!is_no_chunks) num_chunks = _97;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	is_no_chunks = 1'bx;
	if(request_new_burst) is_no_chunks = _90;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	is_no_chunks = is_no_chunks;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BoolToInt_2_i = 1'bx;
	if(request_new_burst) if(!is_no_chunks) _BoolToInt_2_i = _96;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_BoolToInt_2_i = _BoolToInt_2_i;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BoolToInt_3_i = 1'bx;
	if(request_new_burst) _BoolToInt_3_i = _107;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_BoolToInt_3_i = _BoolToInt_3_i;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntConcat_3_upper = 1'dx;
	if(request_new_burst) _BitwiseIntConcat_3_upper = _BoolToInt_3_o;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_BitwiseIntConcat_3_upper = _BitwiseIntConcat_3_upper;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntConcat_3_lower = 2'dx;
	if(request_new_burst) _BitwiseIntConcat_3_lower = final_alignment;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_cur_start_chunk_addr_rst = 1'bx;
	_cur_start_chunk_addr_rst = _112;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_cur_start_chunk_addr_rst = _cur_start_chunk_addr_rst;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_num_chunks_left_rst = 1'bx;
	_num_chunks_left_rst = _114;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_num_chunks_left_rst = _num_chunks_left_rst;
end
endmodule

// BitwiseIntConcat #(UPPER_TO: 2, LOWER_BITS: 2)
module BitwiseIntConcat_UPPER_TO_2_LOWER_BITS_2(
	input clk,
	input wire[0:0] upper,
	input wire[1:0] lower,
	output /*mux_wire*/ logic[2:0] v
);

/*mux_wire*/ logic[2:0] v_bits;
/*mux_wire*/ logic[1:0] _UIntToBits_value;
wire[1:0] _UIntToBits_bits;
/*mux_wire*/ logic[0:0] _UIntToBits_2_value;
wire[0:0] _UIntToBits_2_bits;
/*mux_wire*/ logic[2:0] _transmute_from_bits_bits;
wire[2:0] _transmute_from_bits_value;
UIntToBits_NUM_BITS_2 UIntToBits(
	.clk(clk),
	.value(_UIntToBits_value),
	.bits(_UIntToBits_bits)
);
UIntToBits_NUM_BITS_1 UIntToBits_2(
	.clk(clk),
	.value(_UIntToBits_2_value),
	.bits(_UIntToBits_2_bits)
);
transmute_from_bits_T_type_int_FROM_0_TO_8 transmute_from_bits(
	.clk(clk),
	.bits(_transmute_from_bits_bits),
	.value(_transmute_from_bits_value)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v = 3'dx;
	v = _transmute_from_bits_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v_bits = 3'bxxx;
	for(int _v0 = 0; _v0 < 2; _v0 = _v0 + 1) begin
v_bits[_v0] = _UIntToBits_bits[_v0];
end
	for(int _v0 = 0; _v0 < 1; _v0 = _v0 + 1) begin
v_bits[2 + _v0] = _UIntToBits_2_bits[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_value = 2'dx;
	_UIntToBits_value = lower;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_2_value = 1'dx;
	_UIntToBits_2_value = upper;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_UIntToBits_2_value = _UIntToBits_2_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_transmute_from_bits_bits = 3'bxxx;
	_transmute_from_bits_bits = v_bits;
end
endmodule

// transmute_from_bits #(T: type int #(FROM: 0, TO: 8))
module transmute_from_bits_T_type_int_FROM_0_TO_8(
	input clk,
	input wire[2:0] bits,
	output /*mux_wire*/ logic[2:0] value
);

assign value = bits;
endmodule

// UIntToBits #(NUM_BITS: 1)
module UIntToBits_NUM_BITS_1(
	input clk,
	input wire[0:0] value,
	output /*mux_wire*/ logic[0:0] bits
);

	assign bits = value;
endmodule

// UIntToBits #(NUM_BITS: 2)
module UIntToBits_NUM_BITS_2(
	input clk,
	input wire[1:0] value,
	output /*mux_wire*/ logic[1:0] bits
);

	assign bits = value;
endmodule

// BitwiseIntSplit #(TO: 65539, LOWER_BITS: 2)
module BitwiseIntSplit_TO_65539_LOWER_BITS_2(
	input clk,
	input wire[16:0] v,
	output /*mux_wire*/ logic[14:0] upper,
	output /*mux_wire*/ logic[1:0] lower
);

genvar _g0;
/*mux_wire*/ logic[16:0] v_bits;
/*mux_wire*/ logic[16:0] _UIntToBits_value;
wire[16:0] _UIntToBits_bits;
wire[1:0] _2;
generate
for(_g0 = 0; _g0 < 2; _g0 = _g0 + 1) begin
assign _2[_g0] = v_bits[_g0];
end
endgenerate
/*mux_wire*/ logic[1:0] _BitsToUInt_bits;
wire[1:0] _BitsToUInt_value;
wire[14:0] _3;
generate
for(_g0 = 0; _g0 < 15; _g0 = _g0 + 1) begin
assign _3[_g0] = v_bits[2 + _g0];
end
endgenerate
/*mux_wire*/ logic[14:0] _transmute_from_bits_bits;
wire[14:0] _transmute_from_bits_value;
UIntToBits_NUM_BITS_17 UIntToBits(
	.clk(clk),
	.value(_UIntToBits_value),
	.bits(_UIntToBits_bits)
);
BitsToUInt_NUM_BITS_2 BitsToUInt(
	.clk(clk),
	.bits(_BitsToUInt_bits),
	.value(_BitsToUInt_value)
);
transmute_from_bits_T_type_int_FROM_0_TO_16385 transmute_from_bits(
	.clk(clk),
	.bits(_transmute_from_bits_bits),
	.value(_transmute_from_bits_value)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	upper = 15'dx;
	upper = _transmute_from_bits_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	lower = 2'dx;
	lower = _BitsToUInt_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v_bits = 17'bxxxxxxxxxxxxxxxxx;
	v_bits = _UIntToBits_bits;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_value = 17'dx;
	_UIntToBits_value = v;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitsToUInt_bits = 2'bxx;
	_BitsToUInt_bits = _2;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_transmute_from_bits_bits = 15'bxxxxxxxxxxxxxxx;
	_transmute_from_bits_bits = _3;
end
endmodule

// transmute_from_bits #(T: type int #(FROM: 0, TO: 16385))
module transmute_from_bits_T_type_int_FROM_0_TO_16385(
	input clk,
	input wire[14:0] bits,
	output /*mux_wire*/ logic[14:0] value
);

assign value = bits;
endmodule

// UIntToBits #(NUM_BITS: 17)
module UIntToBits_NUM_BITS_17(
	input clk,
	input wire[16:0] value,
	output /*mux_wire*/ logic[16:0] bits
);

	assign bits = value;
endmodule

// BitwiseIntSplit #(TO: 9223372036854775808, LOWER_BITS: 2)
module BitwiseIntSplit_TO_9223372036854775808_LOWER_BITS_2(
	input clk,
	input wire[62:0] v,
	output /*mux_wire*/ logic[60:0] upper,
	output /*mux_wire*/ logic[1:0] lower
);

genvar _g0;
/*mux_wire*/ logic[62:0] v_bits;
/*mux_wire*/ logic[62:0] _UIntToBits_value;
wire[62:0] _UIntToBits_bits;
wire[1:0] _2;
generate
for(_g0 = 0; _g0 < 2; _g0 = _g0 + 1) begin
assign _2[_g0] = v_bits[_g0];
end
endgenerate
/*mux_wire*/ logic[1:0] _BitsToUInt_bits;
wire[1:0] _BitsToUInt_value;
wire[60:0] _3;
generate
for(_g0 = 0; _g0 < 61; _g0 = _g0 + 1) begin
assign _3[_g0] = v_bits[2 + _g0];
end
endgenerate
/*mux_wire*/ logic[60:0] _transmute_from_bits_bits;
wire[60:0] _transmute_from_bits_value;
UIntToBits_NUM_BITS_63 UIntToBits(
	.clk(clk),
	.value(_UIntToBits_value),
	.bits(_UIntToBits_bits)
);
BitsToUInt_NUM_BITS_2 BitsToUInt(
	.clk(clk),
	.bits(_BitsToUInt_bits),
	.value(_BitsToUInt_value)
);
transmute_from_bits_T_type_int_FROM_0_TO_2305843009213693952 transmute_from_bits(
	.clk(clk),
	.bits(_transmute_from_bits_bits),
	.value(_transmute_from_bits_value)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	upper = 61'dx;
	upper = _transmute_from_bits_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	lower = 2'dx;
	lower = _BitsToUInt_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v_bits = 63'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	v_bits = _UIntToBits_bits;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_value = 63'dx;
	_UIntToBits_value = v;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitsToUInt_bits = 2'bxx;
	_BitsToUInt_bits = _2;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_transmute_from_bits_bits = 61'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	_transmute_from_bits_bits = _3;
end
endmodule

// transmute_from_bits #(T: type int #(FROM: 0, TO: 2305843009213693952))
module transmute_from_bits_T_type_int_FROM_0_TO_2305843009213693952(
	input clk,
	input wire[60:0] bits,
	output /*mux_wire*/ logic[60:0] value
);

assign value = bits;
endmodule

// BitsToUInt #(NUM_BITS: 2)
module BitsToUInt_NUM_BITS_2(
	input clk,
	input wire[1:0] bits,
	output /*mux_wire*/ logic[1:0] value
);

	assign value = bits;
endmodule

// UIntToBits #(NUM_BITS: 63)
module UIntToBits_NUM_BITS_63(
	input clk,
	input wire[62:0] value,
	output /*mux_wire*/ logic[62:0] bits
);

	assign bits = value;
endmodule

// unsafe_int_cast #(FROM_I: -1, TO_I: 16386, FROM: 0, TO: 16387)
module unsafe_int_cast_FROM_I_1_TO_I_16386_FROM_0_TO_16387(
	input clk,
	input wire signed[15:0] in,
	output /*mux_wire*/ logic[14:0] out
);

	assign out = in;
endmodule

// unsafe_int_cast #(FROM_I: -3, TO_I: 8, FROM: 0, TO: 5)
module unsafe_int_cast_FROM_I_3_TO_I_8_FROM_0_TO_5(
	input clk,
	input wire signed[3:0] in,
	output /*mux_wire*/ logic[2:0] out
);

	assign out = in;
endmodule

// transmute_from_bits #(T: type bool #()[16][4])
module transmute_from_bits_T_type_bool_16_4(
	input clk,
	input wire[63:0] bits,
	output /*mux_wire*/ logic[15:0] value[3:0]
);

genvar _g0;
generate
for(_g0 = 0; _g0 < 4; _g0 = _g0 + 1) begin
assign value[_g0] = bits[(_g0) * 16 +: 16];
end
endgenerate
endmodule

// unsafe_int_cast #(FROM_I: -1, TO_I: 640, FROM: 0, TO: 384)
module unsafe_int_cast_FROM_I_1_TO_I_640_FROM_0_TO_384(
	input clk,
	input wire signed[10:0] in,
	output /*mux_wire*/ logic[8:0] out
);

	assign out = in;
endmodule

// Ternary #(T: type int #(FROM: 0, TO: 257))
module Ternary_T_type_int_FROM_0_TO_257(
	input clk,
	input wire cond,
	input wire[8:0] a,
	input wire[8:0] b,
	output /*mux_wire*/ logic[8:0] o
);

always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	o = 9'dx;
	if(cond) o = a;
	if(!cond) o = b;
end
endmodule

// BoolToInt #()
module BoolToInt(
	input clk,
	input wire i,
	output /*mux_wire*/ logic[0:0] o
);

always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	o = 1'dx;
	if(i) o = 1'd1;
	if(!i) o = 1'd0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	o = o;
end
endmodule

// unsafe_int_cast #(FROM_I: -256, TO_I: 16386, FROM: 0, TO: 16387)
module unsafe_int_cast_FROM_I_256_TO_I_16386_FROM_0_TO_16387(
	input clk,
	input wire signed[15:0] in,
	output /*mux_wire*/ logic[14:0] out
);

	assign out = in;
endmodule

// unsafe_int_cast #(FROM_I: 0, TO_I: 2305843009213694208, FROM: 0, TO: 2305843009213693952)
module unsafe_int_cast_FROM_I_0_TO_I_2305843009213694208_FROM_0_TO_2305843009213693952(
	input clk,
	input wire[61:0] in,
	output /*mux_wire*/ logic[60:0] out
);

	assign out = in;
endmodule

// BitwiseIntConcat #(UPPER_TO: 9007199254740993, LOWER_BITS: 8)
module BitwiseIntConcat_UPPER_TO_9007199254740993_LOWER_BITS_8(
	input clk,
	input wire[53:0] upper,
	input wire[7:0] lower,
	output /*mux_wire*/ logic[61:0] v
);

/*mux_wire*/ logic[61:0] v_bits;
/*mux_wire*/ logic[7:0] _UIntToBits_value;
wire[7:0] _UIntToBits_bits;
/*mux_wire*/ logic[53:0] _UIntToBits_2_value;
wire[53:0] _UIntToBits_2_bits;
/*mux_wire*/ logic[61:0] _transmute_from_bits_bits;
wire[61:0] _transmute_from_bits_value;
UIntToBits_NUM_BITS_8 UIntToBits(
	.clk(clk),
	.value(_UIntToBits_value),
	.bits(_UIntToBits_bits)
);
UIntToBits_NUM_BITS_54 UIntToBits_2(
	.clk(clk),
	.value(_UIntToBits_2_value),
	.bits(_UIntToBits_2_bits)
);
transmute_from_bits_T_type_int_FROM_0_TO_2305843009213694208 transmute_from_bits(
	.clk(clk),
	.bits(_transmute_from_bits_bits),
	.value(_transmute_from_bits_value)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v = 62'dx;
	v = _transmute_from_bits_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v_bits = 62'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	for(int _v0 = 0; _v0 < 8; _v0 = _v0 + 1) begin
v_bits[_v0] = _UIntToBits_bits[_v0];
end
	for(int _v0 = 0; _v0 < 54; _v0 = _v0 + 1) begin
v_bits[8 + _v0] = _UIntToBits_2_bits[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_value = 8'dx;
	_UIntToBits_value = lower;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_2_value = 54'dx;
	_UIntToBits_2_value = upper;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_transmute_from_bits_bits = 62'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	_transmute_from_bits_bits = v_bits;
end
endmodule

// transmute_from_bits #(T: type int #(FROM: 0, TO: 2305843009213694208))
module transmute_from_bits_T_type_int_FROM_0_TO_2305843009213694208(
	input clk,
	input wire[61:0] bits,
	output /*mux_wire*/ logic[61:0] value
);

assign value = bits;
endmodule

// UIntToBits #(NUM_BITS: 54)
module UIntToBits_NUM_BITS_54(
	input clk,
	input wire[53:0] value,
	output /*mux_wire*/ logic[53:0] bits
);

	assign bits = value;
endmodule

// UIntToBits #(NUM_BITS: 8)
module UIntToBits_NUM_BITS_8(
	input clk,
	input wire[7:0] value,
	output /*mux_wire*/ logic[7:0] bits
);

	assign bits = value;
endmodule

// LatencyOffset #(T: type bool #(), OFFSET: 384)
module LatencyOffset_T_type_bool_OFFSET_384(
	input clk,
	input wire in,
	output /*mux_wire*/ logic out
);

	assign out = in;
endmodule

// unsafe_int_cast #(FROM_I: 0, TO_I: 16387, FROM: 1, TO: 257)
module unsafe_int_cast_FROM_I_0_TO_I_16387_FROM_1_TO_257(
	input clk,
	input wire[14:0] in,
	output /*mux_wire*/ logic[8:0] out
);

	assign out = in;
endmodule

// BitwiseIntSplit #(TO: 2305843009213693952, LOWER_BITS: 8)
module BitwiseIntSplit_TO_2305843009213693952_LOWER_BITS_8(
	input clk,
	input wire[60:0] v,
	output /*mux_wire*/ logic[52:0] upper,
	output /*mux_wire*/ logic[7:0] lower
);

genvar _g0;
/*mux_wire*/ logic[60:0] v_bits;
/*mux_wire*/ logic[60:0] _UIntToBits_value;
wire[60:0] _UIntToBits_bits;
wire[7:0] _2;
generate
for(_g0 = 0; _g0 < 8; _g0 = _g0 + 1) begin
assign _2[_g0] = v_bits[_g0];
end
endgenerate
/*mux_wire*/ logic[7:0] _BitsToUInt_bits;
wire[7:0] _BitsToUInt_value;
wire[52:0] _3;
generate
for(_g0 = 0; _g0 < 53; _g0 = _g0 + 1) begin
assign _3[_g0] = v_bits[8 + _g0];
end
endgenerate
/*mux_wire*/ logic[52:0] _transmute_from_bits_bits;
wire[52:0] _transmute_from_bits_value;
UIntToBits_NUM_BITS_61 UIntToBits(
	.clk(clk),
	.value(_UIntToBits_value),
	.bits(_UIntToBits_bits)
);
BitsToUInt_NUM_BITS_8 BitsToUInt(
	.clk(clk),
	.bits(_BitsToUInt_bits),
	.value(_BitsToUInt_value)
);
transmute_from_bits_T_type_int_FROM_0_TO_9007199254740992 transmute_from_bits(
	.clk(clk),
	.bits(_transmute_from_bits_bits),
	.value(_transmute_from_bits_value)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	upper = 53'dx;
	upper = _transmute_from_bits_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	lower = 8'dx;
	lower = _BitsToUInt_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v_bits = 61'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	v_bits = _UIntToBits_bits;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_value = 61'dx;
	_UIntToBits_value = v;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitsToUInt_bits = 8'bxxxxxxxx;
	_BitsToUInt_bits = _2;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_transmute_from_bits_bits = 53'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	_transmute_from_bits_bits = _3;
end
endmodule

// transmute_from_bits #(T: type int #(FROM: 0, TO: 9007199254740992))
module transmute_from_bits_T_type_int_FROM_0_TO_9007199254740992(
	input clk,
	input wire[52:0] bits,
	output /*mux_wire*/ logic[52:0] value
);

assign value = bits;
endmodule

// BitsToUInt #(NUM_BITS: 8)
module BitsToUInt_NUM_BITS_8(
	input clk,
	input wire[7:0] bits,
	output /*mux_wire*/ logic[7:0] value
);

	assign value = bits;
endmodule

// BitwiseIntConcat #(UPPER_TO: 2305843009213693952, LOWER_BITS: 3)
module BitwiseIntConcat_UPPER_TO_2305843009213693952_LOWER_BITS_3(
	input clk,
	input wire[60:0] upper,
	input wire[2:0] lower,
	output /*mux_wire*/ logic[63:0] v
);

/*mux_wire*/ logic[63:0] v_bits;
/*mux_wire*/ logic[2:0] _UIntToBits_value;
wire[2:0] _UIntToBits_bits;
/*mux_wire*/ logic[60:0] _UIntToBits_2_value;
wire[60:0] _UIntToBits_2_bits;
/*mux_wire*/ logic[63:0] _transmute_from_bits_bits;
wire[63:0] _transmute_from_bits_value;
UIntToBits_NUM_BITS_3 UIntToBits(
	.clk(clk),
	.value(_UIntToBits_value),
	.bits(_UIntToBits_bits)
);
UIntToBits_NUM_BITS_61 UIntToBits_2(
	.clk(clk),
	.value(_UIntToBits_2_value),
	.bits(_UIntToBits_2_bits)
);
transmute_from_bits_T_type_int_FROM_0_TO_18446744073709551616 transmute_from_bits(
	.clk(clk),
	.bits(_transmute_from_bits_bits),
	.value(_transmute_from_bits_value)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v = 64'dx;
	v = _transmute_from_bits_value;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v_bits = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	for(int _v0 = 0; _v0 < 3; _v0 = _v0 + 1) begin
v_bits[_v0] = _UIntToBits_bits[_v0];
end
	for(int _v0 = 0; _v0 < 61; _v0 = _v0 + 1) begin
v_bits[3 + _v0] = _UIntToBits_2_bits[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_value = 3'dx;
	_UIntToBits_value = lower;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_2_value = 61'dx;
	_UIntToBits_2_value = upper;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_transmute_from_bits_bits = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	_transmute_from_bits_bits = v_bits;
end
endmodule

// transmute_from_bits #(T: type int #(FROM: 0, TO: 18446744073709551616))
module transmute_from_bits_T_type_int_FROM_0_TO_18446744073709551616(
	input clk,
	input wire[63:0] bits,
	output /*mux_wire*/ logic[63:0] value
);

assign value = bits;
endmodule

// UIntToBits #(NUM_BITS: 61)
module UIntToBits_NUM_BITS_61(
	input clk,
	input wire[60:0] value,
	output /*mux_wire*/ logic[60:0] bits
);

	assign bits = value;
endmodule

// UIntToBits #(NUM_BITS: 3)
module UIntToBits_NUM_BITS_3(
	input clk,
	input wire[2:0] value,
	output /*mux_wire*/ logic[2:0] bits
);

	assign bits = value;
endmodule

// SlowState #(T: type int #(FROM: 0, TO: 16387), RESET_TO: 0, OLD_DELAY: 2, NEW_DELAY: 0)
module SlowState_T_type_int_FROM_0_TO_16387_RESET_TO_0_OLD_DELAY_2_NEW_DELAY_0(
	input clk,
	input wire rst,
	output /*state*/ logic[14:0] old,
	output /*mux_wire*/ logic may_update,
	input wire update,
	input wire[14:0] new_1
);

genvar _g0;
/*mux_wire*/ logic _cross_rst_in;
/*mux_wire*/ logic[14:0] new_s;
/*mux_wire*/ logic update_s;
/*mux_wire*/ logic update_old;
/*mux_wire*/ logic _LatencyOffset_in;
wire _LatencyOffset_out;
/*mux_wire*/ logic[14:0] new_old;
/*mux_wire*/ logic[14:0] _LatencyOffset_2_in;
wire[14:0] _LatencyOffset_2_out;
wire _cross_rst_out;
/*latency*/ logic __cross_rst_out_N1; always_ff @(posedge clk) begin __cross_rst_out_N1 <= _cross_rst_out; end
/*latency*/ logic __cross_rst_out_D0; always_ff @(posedge clk) begin __cross_rst_out_D0 <= __cross_rst_out_N1; end
/*state*/ logic[1:0] cooldown;
wire _8 = cooldown[0];
wire _11;
assign _11 = update_s | __cross_rst_out_D0;
/*mux_wire*/ logic _Repeat_v;
wire[1:0] _Repeat_result;
wire[0:0] _12;
generate
for(_g0 = 0; _g0 < 1; _g0 = _g0 + 1) begin
assign _12[_g0] = cooldown[1 + _g0];
end
endgenerate
CrossDomain_T_type_bool cross_rst(
	.in_clk(clk),
	.in(_cross_rst_in),
	.out(_cross_rst_out)
);
LatencyOffset_T_type_bool_OFFSET_2 LatencyOffset(
	.clk(clk),
	.in(_LatencyOffset_in),
	.out(_LatencyOffset_out)
);
LatencyOffset_T_type_int_FROM_0_TO_16387_OFFSET_2 LatencyOffset_2(
	.clk(clk),
	.in(_LatencyOffset_2_in),
	.out(_LatencyOffset_2_out)
);
Repeat_T_type_bool_SIZE_2 Repeat(
	.clk(clk),
	.v(_Repeat_v),
	.result(_Repeat_result)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_cross_rst_in = 1'bx;
	_cross_rst_in = rst;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_cross_rst_in = _cross_rst_in;
end
always_ff @(posedge clk) begin
	if(_cross_rst_out) old <= 15'd0;
	if(!_cross_rst_out) if(update_old) old <= new_old;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	new_s = 15'dx;
	if(update) new_s = new_1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	update_s = 1'bx;
	if(update) update_s = 1'b1;
	if(!update) update_s = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	update_s = update_s;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	update_old = 1'bx;
	update_old = _LatencyOffset_out;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	update_old = update_old;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_in = 1'bx;
	_LatencyOffset_in = update_s;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_LatencyOffset_in = _LatencyOffset_in;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	new_old = 15'dx;
	new_old = _LatencyOffset_2_out;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_2_in = 15'dx;
	_LatencyOffset_2_in = new_s;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_update = 1'bx;
	may_update = _8;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_update = may_update;
end
always_ff @(posedge clk) begin
	if(_11) cooldown <= _Repeat_result;
	for(int _v0 = 0; _v0 < 1; _v0 = _v0 + 1) begin
if(!_11) cooldown[_v0] <= _12[_v0];
end
	if(!_11) cooldown[1] <= 1'b1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_v = 1'bx;
	if(_11) _Repeat_v = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_Repeat_v = _Repeat_v;
end
endmodule

// LatencyOffset #(T: type int #(FROM: 0, TO: 16387), OFFSET: -2)
module LatencyOffset_T_type_int_FROM_0_TO_16387_OFFSET_2(
	input clk,
	input wire[14:0] in,
	output /*mux_wire*/ logic[14:0] out
);

	assign out = in;
endmodule

// SlowState #(T: type int #(FROM: 0, TO: 2305843009213693952), RESET_TO: 0, OLD_DELAY: 1, NEW_DELAY: 1)
module SlowState_T_type_int_FROM_0_TO_2305843009213693952_RESET_TO_0_OLD_DELAY_1_NEW_DELAY_1(
	input clk,
	input wire rst,
	output /*state*/ logic[60:0] old,
	output /*mux_wire*/ logic may_update,
	input wire update,
	input wire[60:0] new_1
);

/*latency*/ logic _update_D1; always_ff @(posedge clk) begin _update_D1 <= update; end
genvar _g0;
/*mux_wire*/ logic _cross_rst_in;
/*mux_wire*/ logic[60:0] new_s;
/*mux_wire*/ logic update_s;
/*mux_wire*/ logic update_old;
/*mux_wire*/ logic _LatencyOffset_in;
wire _LatencyOffset_out;
/*latency*/ logic __LatencyOffset_out_N1; always_ff @(posedge clk) begin __LatencyOffset_out_N1 <= _LatencyOffset_out; end
/*mux_wire*/ logic[60:0] new_old;
/*mux_wire*/ logic[60:0] _LatencyOffset_2_in;
wire[60:0] _LatencyOffset_2_out;
wire _cross_rst_out;
/*latency*/ logic __cross_rst_out_D0; always_ff @(posedge clk) begin __cross_rst_out_D0 <= _cross_rst_out; end
/*state*/ logic[1:0] cooldown;
wire _8 = cooldown[0];
wire _11;
assign _11 = update_s | __cross_rst_out_D0;
/*mux_wire*/ logic _Repeat_v;
wire[1:0] _Repeat_result;
wire[0:0] _12;
generate
for(_g0 = 0; _g0 < 1; _g0 = _g0 + 1) begin
assign _12[_g0] = cooldown[1 + _g0];
end
endgenerate
CrossDomain_T_type_bool cross_rst(
	.in_clk(clk),
	.in(_cross_rst_in),
	.out(_cross_rst_out)
);
LatencyOffset_T_type_bool_OFFSET_2 LatencyOffset(
	.clk(clk),
	.in(_LatencyOffset_in),
	.out(_LatencyOffset_out)
);
LatencyOffset_T_type_int_FROM_0_TO_2305843009213693952_OFFSET_2 LatencyOffset_2(
	.clk(clk),
	.in(_LatencyOffset_2_in),
	.out(_LatencyOffset_2_out)
);
Repeat_T_type_bool_SIZE_2 Repeat(
	.clk(clk),
	.v(_Repeat_v),
	.result(_Repeat_result)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_cross_rst_in = 1'bx;
	_cross_rst_in = rst;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_cross_rst_in = _cross_rst_in;
end
always_ff @(posedge clk) begin
	if(_cross_rst_out) old <= 61'd0;
	if(!_cross_rst_out) if(update_old) old <= new_old;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	new_s = 61'dx;
	if(_update_D1) new_s = new_1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	update_s = 1'bx;
	if(update) update_s = 1'b1;
	if(!update) update_s = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	update_s = update_s;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	update_old = 1'bx;
	update_old = __LatencyOffset_out_N1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	update_old = update_old;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_in = 1'bx;
	_LatencyOffset_in = update_s;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_LatencyOffset_in = _LatencyOffset_in;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	new_old = 61'dx;
	new_old = _LatencyOffset_2_out;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_2_in = 61'dx;
	_LatencyOffset_2_in = new_s;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_update = 1'bx;
	may_update = _8;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_update = may_update;
end
always_ff @(posedge clk) begin
	if(_11) cooldown <= _Repeat_result;
	for(int _v0 = 0; _v0 < 1; _v0 = _v0 + 1) begin
if(!_11) cooldown[_v0] <= _12[_v0];
end
	if(!_11) cooldown[1] <= 1'b1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_v = 1'bx;
	if(_11) _Repeat_v = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_Repeat_v = _Repeat_v;
end
endmodule

// Repeat #(T: type bool #(), SIZE: 2)
module Repeat_T_type_bool_SIZE_2(
	input clk,
	input wire v,
	output /*mux_wire*/ logic[1:0] result
);

always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	result = 2'bxx;
	result[0] = v;
	result[1] = v;
end
endmodule

// LatencyOffset #(T: type int #(FROM: 0, TO: 2305843009213693952), OFFSET: -2)
module LatencyOffset_T_type_int_FROM_0_TO_2305843009213693952_OFFSET_2(
	input clk,
	input wire[60:0] in,
	output /*mux_wire*/ logic[60:0] out
);

	assign out = in;
endmodule

// LatencyOffset #(T: type bool #(), OFFSET: -2)
module LatencyOffset_T_type_bool_OFFSET_2(
	input clk,
	input wire in,
	output /*mux_wire*/ logic out
);

	assign out = in;
endmodule

// CrossDomain #(T: type bool #())
module CrossDomain_T_type_bool(
	input in_clk,
	input wire in,
	output /*mux_wire*/ logic out
);

	assign out = in;
endmodule

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
axi_memory_reader_T_type_int_FROM_0_TO_4294967296_8_AXI_WIDTH_32 reader(
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
axi_memory_writer_T_type_int_FROM_0_TO_4294967296_8_AXI_WIDTH_32 writer(
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

// axi_memory_writer #(T: type int #(FROM: 0, TO: 4294967296)[8], AXI_WIDTH: 32)
module axi_memory_writer_T_type_int_FROM_0_TO_4294967296_8_AXI_WIDTH_32(
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
/*mux_wire*/ logic _Repeat_v;
wire[3:0] _Repeat_result;
wire _17;
assign _17 = cur_data_chunk < 3'd7;
wire _18;
assign _18 = !_17;
wire _21;
assign _21 = wvalid & wready;
wire _23;
assign _23 = !wlast;
wire[3:0] _26;
assign _26 = cur_data_chunk + 1'd1;
/*mux_wire*/ logic[3:0] _unsafe_int_cast_in;
wire[2:0] _unsafe_int_cast_out;
wire _29;
assign _29 = awvalid & awready;
localparam[1:0] _33 = 2'b01;
wire _36;
assign _36 = !writing_data_valid;
wire _39;
assign _39 = num_outstanding_writes < 8'd255;
wire _40;
assign _40 = _36 & _39;
wire _43;
assign _43 = awvalid & awready;
wire _46;
assign _46 = awvalid & awready;
/*mux_wire*/ logic[31:0] _transmute_to_bits_value[7:0];
wire[255:0] _transmute_to_bits_bits;
wire _50;
assign _50 = awvalid & awready;
wire _53;
assign _53 = bvalid & bready;
wire _54;
assign _54 = !_53;
wire _55;
assign _55 = _50 & _54;
/*mux_wire*/ logic[7:0] _unsafe_int_cast_2_in;
wire[7:0] _unsafe_int_cast_2_out;
wire[7:0] _58;
assign _58 = _unsafe_int_cast_2_out + 1'd1;
wire _61;
assign _61 = bvalid & bready;
wire _64;
assign _64 = awvalid & awready;
wire _65;
assign _65 = !_64;
wire _66;
assign _66 = _61 & _65;
/*mux_wire*/ logic[7:0] _unsafe_int_cast_3_in;
wire[7:0] _unsafe_int_cast_3_out;
wire[7:0] _69;
assign _69 = _unsafe_int_cast_3_out - 1'd1;
wire _71;
assign _71 = !aresetn;
Repeat_T_type_bool_SIZE_4 Repeat(
	.clk(aclk),
	.v(_Repeat_v),
	.result(_Repeat_result)
);
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
	if(write) awvalid = _40;
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
	if(write) awburst = _33;
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
	wstrb = _Repeat_result;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	wlast = 1'bx;
	wlast = _18;
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
	if(write) if(_46) writing_data <= _transmute_to_bits_bits;
end
always_ff @(posedge aclk) begin
	if(_21) if(!_23) writing_data_valid <= 1'b0;
	if(write) if(_46) writing_data_valid <= 1'b1;
	if(_71) writing_data_valid <= 1'b0;
end
always_ff @(posedge aclk) begin
	if(_55) num_outstanding_writes <= _58;
	if(!_55) if(_66) num_outstanding_writes <= _69;
	if(_71) num_outstanding_writes <= 1'd0;
end
always_ff @(posedge aclk) begin
	if(_21) if(_23) cur_data_chunk <= _unsafe_int_cast_out;
	if(_29) cur_data_chunk <= 1'd0;
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
	_Repeat_v = 1'bx;
	_Repeat_v = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_Repeat_v = _Repeat_v;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_in = 4'dx;
	if(_21) if(_23) _unsafe_int_cast_in = _26;
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
	if(write) write_success = _43;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	write_success = write_success;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_transmute_to_bits_value = '{32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx, 32'dx};
	for(int _v0 = 0; _v0 < 8; _v0 = _v0 + 1) begin
if(write) if(_46) _transmute_to_bits_value[_v0] = data[_v0];
end
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_2_in = 8'dx;
	if(_55) _unsafe_int_cast_2_in = num_outstanding_writes;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_unsafe_int_cast_3_in = 8'dx;
	if(!_55) if(_66) _unsafe_int_cast_3_in = num_outstanding_writes;
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

// Repeat #(T: type bool #(), SIZE: 4)
module Repeat_T_type_bool_SIZE_4(
	input clk,
	input wire v,
	output /*mux_wire*/ logic[3:0] result
);

always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	result = 4'bxxxx;
	result[0] = v;
	result[1] = v;
	result[2] = v;
	result[3] = v;
end
endmodule

// axi_memory_reader #(T: type int #(FROM: 0, TO: 4294967296)[8], AXI_WIDTH: 32)
module axi_memory_reader_T_type_int_FROM_0_TO_4294967296_8_AXI_WIDTH_32(
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

