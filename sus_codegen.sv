// THIS IS A GENERATED FILE (Generated at 2026-02-20T02:10:08+01:00)
// This file was generated with SUS Compiler 0.3.9-dev (0f2b3d16bde373b3d89b6a8f3a948e4c2d0fd94e) built at 2026-02-19_16:47:09
// test_burst_writer #()
module test_burst_writer(
	input clk
);

write_burst_address_manager_AXI_WIDTH_BYTES_64_ATO_18446744073709551616_ELEMENT_SIZE_4_ADDR_QUEUE_SIZE_20_ADDR_MAY_PUSH_LATENCY_0_TOTAL_ELEMENTS_THAT_CAN_BE_STORED_2048 mgr(
	.clk(clk),
	.burst_available(),
	.awlen(),
	.awaddr(),
	.start_offset(),
	.end_offset(),
	.is_last(),
	.accept_burst(),
	.may_push_address(),
	.push_address(),
	.new_addr(),
	.push_elements(),
	.num_elements(),
	.is_last_elem(),
	.fifo_offset(),
	.rst()
);
endmodule

// write_burst_address_manager #(AXI_WIDTH_BYTES: 64, ATO: 18446744073709551616, ELEMENT_SIZE: 4, ADDR_QUEUE_SIZE: 20, ADDR_MAY_PUSH_LATENCY: 0, TOTAL_ELEMENTS_THAT_CAN_BE_STORED: 2048)
module write_burst_address_manager_AXI_WIDTH_BYTES_64_ATO_18446744073709551616_ELEMENT_SIZE_4_ADDR_QUEUE_SIZE_20_ADDR_MAY_PUSH_LATENCY_0_TOTAL_ELEMENTS_THAT_CAN_BE_STORED_2048(
	input clk,
	output /*mux_wire*/ logic burst_available,
	output /*mux_wire*/ logic[5:0] awlen,
	output /*mux_wire*/ logic[61:0] awaddr,
	output /*mux_wire*/ logic[3:0] start_offset,
	output /*mux_wire*/ logic[3:0] end_offset,
	output /*mux_wire*/ logic is_last,
	input wire accept_burst,
	output /*mux_wire*/ logic may_push_address,
	input wire push_address,
	input wire[63:0] new_addr,
	input wire push_elements,
	input wire[4:0] num_elements,
	input wire is_last_elem,
	output /*mux_wire*/ logic[3:0] fifo_offset,
	input wire rst
);

/*mux_wire*/ logic[57:0] first_transfer_idx;
/*mux_wire*/ logic[3:0] start_element_offset;
wire[61:0] _current_addr_old;
/*mux_wire*/ logic[61:0] _BitwiseIntSplit_v;
wire[57:0] _BitwiseIntSplit_upper;
wire[3:0] _BitwiseIntSplit_lower;
/*mux_wire*/ logic[7:0] last_transfer_to_include;
/*mux_wire*/ logic[5:0] awlen_w;
wire[5:0] _4;
assign _4 = first_transfer_idx; // == mod 64 (target is 6 bits wide)
wire signed[8:0] _5;
assign _5 = last_transfer_to_include - _4;
/*mux_wire*/ logic signed[8:0] _IntNarrow_in;
wire[5:0] _IntNarrow_out;
/*mux_wire*/ logic do_accept_burst;
/*latency*/ logic _do_accept_burst_D1001; always_ff @(posedge clk) begin _do_accept_burst_D1001 <= do_accept_burst; end
wire _current_addr_may_update;
wire _current_addr_valid_may_update;
wire _9;
assign _9 = _current_addr_may_update & _current_addr_valid_may_update;
wire _current_command_chunk_end_may_update;
wire _11;
assign _11 = _9 & _current_command_chunk_end_may_update;
wire _current_command_is_last_may_update;
wire _13;
assign _13 = _11 & _current_command_is_last_may_update;
wire _current_command_final_align_may_update;
wire _15;
assign _15 = _13 & _current_command_final_align_may_update;
wire _current_addr_valid_old;
wire _17;
assign _17 = _15 & _current_addr_valid_old;
/*latency*/ logic __17_D1001; always_ff @(posedge clk) begin __17_D1001 <= _17; end
wire _current_command_chunk_end_old;
/*latency*/ logic __current_command_chunk_end_old_D1001; always_ff @(posedge clk) begin __current_command_chunk_end_old_D1001 <= _current_command_chunk_end_old; end
wire[9:0] _current_command_final_align_old;
wire _25;
assign _25 = _current_command_final_align_old == 1'd0;
wire _current_command_is_last_old;
/*latency*/ logic __current_command_is_last_old_D1001; always_ff @(posedge clk) begin __current_command_is_last_old_D1001 <= _current_command_is_last_old; end
wire _27;
assign _27 = _25 & _current_command_is_last_old;
/*mux_wire*/ logic _current_command_chunk_end_update;
/*mux_wire*/ logic _current_command_chunk_end_new;
/*mux_wire*/ logic[51:0] cur_burst_idx;
/*mux_wire*/ logic[9:0] _;
/*mux_wire*/ logic[61:0] _BitwiseIntSplit_2_v;
wire[51:0] _BitwiseIntSplit_2_upper;
wire[9:0] _BitwiseIntSplit_2_lower;
/*mux_wire*/ logic[51:0] next_addr;
wire[52:0] _36;
assign _36 = cur_burst_idx + 1'd1;
wire[51:0] _38;
assign _38 = _36; // == mod 4503599627370496 (target is 52 bits wide)
/*mux_wire*/ logic[51:0] _BitwiseIntConcat_upper;
/*mux_wire*/ logic[9:0] _BitwiseIntConcat_lower;
wire[61:0] _BitwiseIntConcat_v;
/*latency*/ logic[61:0] __BitwiseIntConcat_v_D1001; always_ff @(posedge clk) begin __BitwiseIntConcat_v_D1001 <= _BitwiseIntConcat_v; end
/*mux_wire*/ logic _current_addr_update;
/*mux_wire*/ logic[61:0] _current_addr_new;
wire _45;
assign _45 = _current_command_final_align_old == 1'd0;
/*latency*/ logic __45_D1001; always_ff @(posedge clk) begin __45_D1001 <= _45; end
/*mux_wire*/ logic _current_addr_valid_update;
/*mux_wire*/ logic _current_addr_valid_new;
/*mux_wire*/ logic _current_command_is_last_update;
/*mux_wire*/ logic _current_command_is_last_new;
/*mux_wire*/ logic[9:0] last_element_before_final_align;
/*mux_wire*/ logic[9:0] _IntNarrow_2_in;
wire[9:0] _IntNarrow_2_out;
wire[9:0] _55;
assign _55 = _IntNarrow_2_out - 1'd1;
/*mux_wire*/ logic[3:0] last_chunk_offset;
/*mux_wire*/ logic[9:0] _BitwiseIntSplit_3_v;
wire[5:0] _BitwiseIntSplit_3_upper;
wire[3:0] _BitwiseIntSplit_3_lower;
/*mux_wire*/ logic __2;
wire _command_fifo_may_push;
/*mux_wire*/ logic[61:0] element_aligned_addr;
/*mux_wire*/ logic[1:0] _addr_misalign;
/*mux_wire*/ logic[63:0] _BitwiseIntSplit_4_v;
wire[61:0] _BitwiseIntSplit_4_upper;
wire[1:0] _BitwiseIntSplit_4_lower;
wire _70;
assign _70 = _addr_misalign == 1'd0;
/*mux_wire*/ logic _assert_runtime_assert_runtime;
/*mux_wire*/ logic _assert_runtime_condition;
/*mux_wire*/ logic _addr_fifo_push;
/*mux_wire*/ logic[61:0] _addr_fifo_push_data;
wire[9:0] _77;
assign _77 = element_aligned_addr; // == mod 1024 (target is 10 bits wide)
/*mux_wire*/ logic _burst_splitter_push_new_align;
/*mux_wire*/ logic[9:0] _burst_splitter_new_starting_align;
wire _addr_fifo_may_push;
/*mux_wire*/ logic _burst_splitter_push_elements;
/*mux_wire*/ logic[4:0] _burst_splitter_num_elements;
/*mux_wire*/ logic _burst_splitter_is_last;
wire[3:0] _burst_splitter_fifo_offset;
wire _burst_splitter_output_command;
wire _burst_splitter_end_of_burst;
wire _burst_splitter_is_last_burst;
wire[9:0] _burst_splitter_final_align;
/*mux_wire*/ logic end_of_burst;
/*mux_wire*/ logic is_last_burst;
/*mux_wire*/ logic[9:0] final_align;
/*mux_wire*/ logic _pack_command_v1_i;
/*mux_wire*/ logic _pack_command_v2_i;
/*mux_wire*/ logic[9:0] _pack_command_v3_i;
wire[11:0] _pack_command_packed_o;
/*mux_wire*/ logic _command_fifo_push;
/*mux_wire*/ logic[11:0] _command_fifo_push_data;
wire _93;
assign _93 = _current_addr_may_update & _current_addr_valid_may_update;
wire _95;
assign _95 = _93 & _current_command_chunk_end_may_update;
wire _97;
assign _97 = _95 & _current_command_is_last_may_update;
wire _99;
assign _99 = _97 & _current_command_final_align_may_update;
/*latency*/ logic __99_D1001; always_ff @(posedge clk) begin __99_D1001 <= _99; end
wire _101;
assign _101 = !_current_addr_valid_old;
wire _addr_fifo_may_pop;
wire _103;
assign _103 = _101 & _addr_fifo_may_pop;
/*latency*/ logic __103_D1001; always_ff @(posedge clk) begin __103_D1001 <= _103; end
/*mux_wire*/ logic _addr_fifo_pop;
wire[61:0] _addr_fifo_pop_data;
wire _109;
assign _109 = !_current_command_chunk_end_old;
wire _111;
assign _111 = !_current_command_is_last_old;
wire _112;
assign _112 = _109 & _111;
wire _command_fifo_may_pop;
wire _114;
assign _114 = _112 & _command_fifo_may_pop;
/*latency*/ logic __114_D1001; always_ff @(posedge clk) begin __114_D1001 <= _114; end
/*mux_wire*/ logic chunk_end;
/*mux_wire*/ logic is_last_2;
/*mux_wire*/ logic[9:0] final_align_2;
/*mux_wire*/ logic _command_fifo_pop;
wire[11:0] _command_fifo_pop_data;
/*mux_wire*/ logic[11:0] _pack_command_packed_i;
wire _pack_command_v1_o;
wire _pack_command_v2_o;
wire[9:0] _pack_command_v3_o;
/*mux_wire*/ logic _current_command_final_align_update;
/*mux_wire*/ logic[9:0] _current_command_final_align_new;
/*mux_wire*/ logic _current_addr_rst;
/*mux_wire*/ logic _current_addr_valid_rst;
/*mux_wire*/ logic _current_command_chunk_end_rst;
/*mux_wire*/ logic _current_command_is_last_rst;
/*mux_wire*/ logic _current_command_final_align_rst;
/*mux_wire*/ logic _addr_fifo_rst;
/*mux_wire*/ logic _command_fifo_rst;
/*mux_wire*/ logic _burst_splitter_rst;
SlowState_T_type_int_FROM_0_TO_4611686018427387904_RESET_TO_0_OLD_DELAY_0_NEW_DELAY_1 current_addr(
	.clk(clk),
	.rst(_current_addr_rst),
	.old(_current_addr_old),
	.may_update(_current_addr_may_update),
	.update(_current_addr_update),
	.new_1(_current_addr_new)
);
SlowState_T_type_bool_RESET_TO_false_OLD_DELAY_0_NEW_DELAY_0 current_addr_valid(
	.clk(clk),
	.rst(_current_addr_valid_rst),
	.old(_current_addr_valid_old),
	.may_update(_current_addr_valid_may_update),
	.update(_current_addr_valid_update),
	.new_1(_current_addr_valid_new)
);
SlowState_T_type_bool_RESET_TO_false_OLD_DELAY_0_NEW_DELAY_1 current_command_chunk_end(
	.clk(clk),
	.rst(_current_command_chunk_end_rst),
	.old(_current_command_chunk_end_old),
	.may_update(_current_command_chunk_end_may_update),
	.update(_current_command_chunk_end_update),
	.new_1(_current_command_chunk_end_new)
);
SlowState_T_type_bool_RESET_TO_false_OLD_DELAY_0_NEW_DELAY_1 current_command_is_last(
	.clk(clk),
	.rst(_current_command_is_last_rst),
	.old(_current_command_is_last_old),
	.may_update(_current_command_is_last_may_update),
	.update(_current_command_is_last_update),
	.new_1(_current_command_is_last_new)
);
SlowState_T_type_int_FROM_0_TO_1024_RESET_TO_0_OLD_DELAY_0_NEW_DELAY_1 current_command_final_align(
	.clk(clk),
	.rst(_current_command_final_align_rst),
	.old(_current_command_final_align_old),
	.may_update(_current_command_final_align_may_update),
	.update(_current_command_final_align_update),
	.new_1(_current_command_final_align_new)
);
BitwiseIntSplit_TO_4611686018427387904_LOWER_BITS_4 BitwiseIntSplit(
	.clk(clk),
	.v(_BitwiseIntSplit_v),
	.upper(_BitwiseIntSplit_upper),
	.lower(_BitwiseIntSplit_lower)
);
IntNarrow_FROM_I_63_TO_I_256_FROM_0_TO_64 IntNarrow(
	.clk(clk),
	.in(_IntNarrow_in),
	.out(_IntNarrow_out)
);
BitwiseIntSplit_TO_4611686018427387904_LOWER_BITS_10 BitwiseIntSplit_2(
	.clk(clk),
	.v(_BitwiseIntSplit_2_v),
	.upper(_BitwiseIntSplit_2_upper),
	.lower(_BitwiseIntSplit_2_lower)
);
BitwiseIntConcat_UPPER_TO_4503599627370496_LOWER_BITS_10 BitwiseIntConcat(
	.clk(clk),
	.upper(_BitwiseIntConcat_upper),
	.lower(_BitwiseIntConcat_lower),
	.v(_BitwiseIntConcat_v)
);
IntNarrow_FROM_I_0_TO_I_1024_FROM_1_TO_1024 IntNarrow_2(
	.clk(clk),
	.in(_IntNarrow_2_in),
	.out(_IntNarrow_2_out)
);
BitwiseIntSplit_TO_1023_LOWER_BITS_4 BitwiseIntSplit_3(
	.clk(clk),
	.v(_BitwiseIntSplit_3_v),
	.upper(_BitwiseIntSplit_3_upper),
	.lower(_BitwiseIntSplit_3_lower)
);
FIFO_T_type_int_FROM_0_TO_4611686018427387904_DEPTH_20_MAY_PUSH_LATENCY_0 addr_fifo(
	.clk(clk),
	.rst(_addr_fifo_rst),
	.may_push(_addr_fifo_may_push),
	.push(_addr_fifo_push),
	.push_data(_addr_fifo_push_data),
	.may_pop(_addr_fifo_may_pop),
	.pop(_addr_fifo_pop),
	.pop_data(_addr_fifo_pop_data)
);
FIFO_T_type_bool_12_DEPTH_42_MAY_PUSH_LATENCY_0 command_fifo(
	.clk(clk),
	.rst(_command_fifo_rst),
	.may_push(_command_fifo_may_push),
	.push(_command_fifo_push),
	.push_data(_command_fifo_push_data),
	.may_pop(_command_fifo_may_pop),
	.pop(_command_fifo_pop),
	.pop_data(_command_fifo_pop_data)
);
Tuple3_T1_type_bool_T2_type_bool_T3_type_int_FROM_0_TO_1024 pack_command(
	.clk(clk),
	.v1_i(_pack_command_v1_i),
	.v2_i(_pack_command_v2_i),
	.v3_i(_pack_command_v3_i),
	.packed_o(_pack_command_packed_o),
	.packed_i(_pack_command_packed_i),
	.v1_o(_pack_command_v1_o),
	.v2_o(_pack_command_v2_o),
	.v3_o(_pack_command_v3_o)
);
burst_write_splitter_MAX_ELEMENTS_IN_BURST_1024_NUM_PARALLEL_ELEMENTS_16_ADDR_QUEUE_SIZE_20 burst_splitter(
	.clk(clk),
	.push_new_align(_burst_splitter_push_new_align),
	.new_starting_align(_burst_splitter_new_starting_align),
	.output_command(_burst_splitter_output_command),
	.end_of_burst(_burst_splitter_end_of_burst),
	.is_last_burst(_burst_splitter_is_last_burst),
	.final_align(_burst_splitter_final_align),
	.push_elements(_burst_splitter_push_elements),
	.num_elements(_burst_splitter_num_elements),
	.is_last(_burst_splitter_is_last),
	.fifo_offset(_burst_splitter_fifo_offset),
	.rst(_burst_splitter_rst)
);
BitwiseIntSplit_TO_18446744073709551616_LOWER_BITS_2 BitwiseIntSplit_4(
	.clk(clk),
	.v(_BitwiseIntSplit_4_v),
	.upper(_BitwiseIntSplit_4_upper),
	.lower(_BitwiseIntSplit_4_lower)
);
assert_runtime #() assert_runtime(
	.clk(clk),
	.assert_runtime(_assert_runtime_assert_runtime),
	.condition(_assert_runtime_condition)
);
always_comb begin // combinatorial first_transfer_idx
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	first_transfer_idx = 58'dx;
	first_transfer_idx = _BitwiseIntSplit_upper;
end
always_comb begin // combinatorial start_element_offset
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	start_element_offset = 4'dx;
	start_element_offset = _BitwiseIntSplit_lower;
end
always_comb begin // combinatorial _BitwiseIntSplit_v
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntSplit_v = 62'dx;
	_BitwiseIntSplit_v = _current_addr_old;
end
always_comb begin // combinatorial last_transfer_to_include
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	last_transfer_to_include = 8'dx;
	if(_17) if(_current_command_chunk_end_old) last_transfer_to_include = 8'd255;
	if(_17) if(!_current_command_chunk_end_old) if(_current_command_is_last_old) last_transfer_to_include = _BitwiseIntSplit_3_upper;
end
always_comb begin // combinatorial awlen_w
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	awlen_w = 6'dx;
	awlen_w = _IntNarrow_out;
end
always_comb begin // combinatorial _IntNarrow_in
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_IntNarrow_in = 9'sdx;
	_IntNarrow_in = _5;
end
always_comb begin // combinatorial burst_available
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	burst_available = 1'bx;
	burst_available = 1'b0;
	if(_17) if(_current_command_chunk_end_old) burst_available = 1'b1;
	if(_17) if(!_current_command_chunk_end_old) if(_current_command_is_last_old) burst_available = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	burst_available = burst_available;
end
always_comb begin // combinatorial awlen
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	awlen = 6'dx;
	if(_17) if(_current_command_chunk_end_old) awlen = awlen_w;
	if(_17) if(!_current_command_chunk_end_old) if(_current_command_is_last_old) awlen = awlen_w;
end
always_comb begin // combinatorial awaddr
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	awaddr = 62'dx;
	if(_17) if(_current_command_chunk_end_old) awaddr = _current_addr_old;
	if(_17) if(!_current_command_chunk_end_old) if(_current_command_is_last_old) awaddr = _current_addr_old;
end
always_comb begin // combinatorial start_offset
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	start_offset = 4'dx;
	if(_17) if(_current_command_chunk_end_old) start_offset = start_element_offset;
	if(_17) if(!_current_command_chunk_end_old) if(_current_command_is_last_old) start_offset = start_element_offset;
end
always_comb begin // combinatorial end_offset
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	end_offset = 4'dx;
	if(_17) if(_current_command_chunk_end_old) end_offset = 4'd15;
	if(_17) if(!_current_command_chunk_end_old) if(_current_command_is_last_old) end_offset = last_chunk_offset;
end
always_comb begin // combinatorial is_last
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	is_last = 1'bx;
	if(_17) if(_current_command_chunk_end_old) is_last = _27;
	if(_17) if(!_current_command_chunk_end_old) if(_current_command_is_last_old) is_last = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	is_last = is_last;
end
always_comb begin // combinatorial do_accept_burst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	do_accept_burst = 1'bx;
	do_accept_burst = 1'b0;
	if(accept_burst) do_accept_burst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	do_accept_burst = do_accept_burst;
end
always_comb begin // combinatorial _current_command_chunk_end_update
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_current_command_chunk_end_update = 1'bx;
	_current_command_chunk_end_update = 1'b0;
	if(_17) if(_current_command_chunk_end_old) if(do_accept_burst) _current_command_chunk_end_update = 1'b1;
	if(_99) if(_114) _current_command_chunk_end_update = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_current_command_chunk_end_update = _current_command_chunk_end_update;
end
always_comb begin // combinatorial _current_command_chunk_end_new
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_current_command_chunk_end_new = 1'bx;
	if(__17_D1001) if(__current_command_chunk_end_old_D1001) if(_do_accept_burst_D1001) _current_command_chunk_end_new = 1'b0;
	if(__99_D1001) if(__114_D1001) _current_command_chunk_end_new = chunk_end;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_current_command_chunk_end_new = _current_command_chunk_end_new;
end
always_comb begin // combinatorial cur_burst_idx
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	cur_burst_idx = 52'dx;
	if(_17) if(_current_command_chunk_end_old) if(do_accept_burst) cur_burst_idx = _BitwiseIntSplit_2_upper;
end
always_comb begin // combinatorial _
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_ = 10'dx;
	if(_17) if(_current_command_chunk_end_old) if(do_accept_burst) _ = _BitwiseIntSplit_2_lower;
end
always_comb begin // combinatorial _BitwiseIntSplit_2_v
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntSplit_2_v = 62'dx;
	if(_17) if(_current_command_chunk_end_old) if(do_accept_burst) _BitwiseIntSplit_2_v = _current_addr_old;
end
always_comb begin // combinatorial next_addr
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	next_addr = 52'dx;
	if(_17) if(_current_command_chunk_end_old) if(do_accept_burst) next_addr = _38;
end
always_comb begin // combinatorial _BitwiseIntConcat_upper
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntConcat_upper = 52'dx;
	if(_17) if(_current_command_chunk_end_old) if(do_accept_burst) _BitwiseIntConcat_upper = next_addr;
end
always_comb begin // combinatorial _BitwiseIntConcat_lower
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntConcat_lower = 10'dx;
	if(_17) if(_current_command_chunk_end_old) if(do_accept_burst) _BitwiseIntConcat_lower = 1'd0;
end
always_comb begin // combinatorial _current_addr_update
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_current_addr_update = 1'bx;
	_current_addr_update = 1'b0;
	if(_17) if(_current_command_chunk_end_old) if(do_accept_burst) _current_addr_update = 1'b1;
	if(_99) if(_103) _current_addr_update = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_current_addr_update = _current_addr_update;
end
always_comb begin // combinatorial _current_addr_new
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_current_addr_new = 62'dx;
	if(__17_D1001) if(__current_command_chunk_end_old_D1001) if(_do_accept_burst_D1001) _current_addr_new = __BitwiseIntConcat_v_D1001;
	if(__99_D1001) if(__103_D1001) _current_addr_new = _addr_fifo_pop_data;
end
always_comb begin // combinatorial _current_addr_valid_update
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_current_addr_valid_update = 1'bx;
	_current_addr_valid_update = 1'b0;
	if(_17) if(_current_command_chunk_end_old) if(_45) if(do_accept_burst) if(_current_command_is_last_old) _current_addr_valid_update = 1'b1;
	if(_17) if(!_current_command_chunk_end_old) if(_current_command_is_last_old) if(do_accept_burst) _current_addr_valid_update = 1'b1;
	if(_99) if(_103) _current_addr_valid_update = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_current_addr_valid_update = _current_addr_valid_update;
end
always_comb begin // combinatorial _current_addr_valid_new
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_current_addr_valid_new = 1'bx;
	if(_17) if(_current_command_chunk_end_old) if(_45) if(do_accept_burst) if(_current_command_is_last_old) _current_addr_valid_new = 1'b0;
	if(_17) if(!_current_command_chunk_end_old) if(_current_command_is_last_old) if(do_accept_burst) _current_addr_valid_new = 1'b0;
	if(_99) if(_103) _current_addr_valid_new = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_current_addr_valid_new = _current_addr_valid_new;
end
always_comb begin // combinatorial _current_command_is_last_update
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_current_command_is_last_update = 1'bx;
	_current_command_is_last_update = 1'b0;
	if(_17) if(_current_command_chunk_end_old) if(_45) if(do_accept_burst) _current_command_is_last_update = 1'b1;
	if(_17) if(!_current_command_chunk_end_old) if(_current_command_is_last_old) if(do_accept_burst) _current_command_is_last_update = 1'b1;
	if(_99) if(_114) _current_command_is_last_update = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_current_command_is_last_update = _current_command_is_last_update;
end
always_comb begin // combinatorial _current_command_is_last_new
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_current_command_is_last_new = 1'bx;
	if(__17_D1001) if(__current_command_chunk_end_old_D1001) if(__45_D1001) if(_do_accept_burst_D1001) _current_command_is_last_new = 1'b0;
	if(__17_D1001) if(!__current_command_chunk_end_old_D1001) if(__current_command_is_last_old_D1001) if(_do_accept_burst_D1001) _current_command_is_last_new = 1'b0;
	if(__99_D1001) if(__114_D1001) _current_command_is_last_new = is_last_2;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_current_command_is_last_new = _current_command_is_last_new;
end
always_comb begin // combinatorial last_element_before_final_align
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	last_element_before_final_align = 10'dx;
	if(_17) if(!_current_command_chunk_end_old) if(_current_command_is_last_old) last_element_before_final_align = _55;
end
always_comb begin // combinatorial _IntNarrow_2_in
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_IntNarrow_2_in = 10'dx;
	if(_17) if(!_current_command_chunk_end_old) if(_current_command_is_last_old) _IntNarrow_2_in = _current_command_final_align_old;
end
always_comb begin // combinatorial last_chunk_offset
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	last_chunk_offset = 4'dx;
	if(_17) if(!_current_command_chunk_end_old) if(_current_command_is_last_old) last_chunk_offset = _BitwiseIntSplit_3_lower;
end
always_comb begin // combinatorial _BitwiseIntSplit_3_v
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntSplit_3_v = 10'dx;
	if(_17) if(!_current_command_chunk_end_old) if(_current_command_is_last_old) _BitwiseIntSplit_3_v = last_element_before_final_align;
end
always_comb begin // combinatorial __2
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	__2 = 1'bx;
	__2 = _command_fifo_may_push;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	__2 = __2;
end
always_comb begin // combinatorial may_push_address
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_push_address = 1'bx;
	may_push_address = 1'b0;
	if(_addr_fifo_may_push) may_push_address = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_push_address = may_push_address;
end
always_comb begin // combinatorial element_aligned_addr
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	element_aligned_addr = 62'dx;
	if(push_address) element_aligned_addr = _BitwiseIntSplit_4_upper;
end
always_comb begin // combinatorial _addr_misalign
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_addr_misalign = 2'dx;
	if(push_address) _addr_misalign = _BitwiseIntSplit_4_lower;
end
always_comb begin // combinatorial _BitwiseIntSplit_4_v
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntSplit_4_v = 64'dx;
	if(push_address) _BitwiseIntSplit_4_v = new_addr;
end
always_comb begin // combinatorial _assert_runtime_assert_runtime
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_assert_runtime_assert_runtime = 1'bx;
	_assert_runtime_assert_runtime = 1'b0;
	if(push_address) _assert_runtime_assert_runtime = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_assert_runtime_assert_runtime = _assert_runtime_assert_runtime;
end
always_comb begin // combinatorial _assert_runtime_condition
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_assert_runtime_condition = 1'bx;
	if(push_address) _assert_runtime_condition = _70;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_assert_runtime_condition = _assert_runtime_condition;
end
always_comb begin // combinatorial _addr_fifo_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_addr_fifo_push = 1'bx;
	_addr_fifo_push = 1'b0;
	if(push_address) _addr_fifo_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_addr_fifo_push = _addr_fifo_push;
end
always_comb begin // combinatorial _addr_fifo_push_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_addr_fifo_push_data = 62'dx;
	if(push_address) _addr_fifo_push_data = element_aligned_addr;
end
always_comb begin // combinatorial _burst_splitter_push_new_align
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_burst_splitter_push_new_align = 1'bx;
	_burst_splitter_push_new_align = 1'b0;
	if(push_address) _burst_splitter_push_new_align = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_burst_splitter_push_new_align = _burst_splitter_push_new_align;
end
always_comb begin // combinatorial _burst_splitter_new_starting_align
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_burst_splitter_new_starting_align = 10'dx;
	if(push_address) _burst_splitter_new_starting_align = _77;
end
always_comb begin // combinatorial fifo_offset
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	fifo_offset = 4'dx;
	if(push_elements) fifo_offset = _burst_splitter_fifo_offset;
end
always_comb begin // combinatorial _burst_splitter_push_elements
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_burst_splitter_push_elements = 1'bx;
	_burst_splitter_push_elements = 1'b0;
	if(push_elements) _burst_splitter_push_elements = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_burst_splitter_push_elements = _burst_splitter_push_elements;
end
always_comb begin // combinatorial _burst_splitter_num_elements
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_burst_splitter_num_elements = 5'dx;
	if(push_elements) _burst_splitter_num_elements = num_elements;
end
always_comb begin // combinatorial _burst_splitter_is_last
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_burst_splitter_is_last = 1'bx;
	if(push_elements) _burst_splitter_is_last = is_last_elem;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_burst_splitter_is_last = _burst_splitter_is_last;
end
always_comb begin // combinatorial end_of_burst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	end_of_burst = 1'bx;
	if(_burst_splitter_output_command) end_of_burst = _burst_splitter_end_of_burst;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	end_of_burst = end_of_burst;
end
always_comb begin // combinatorial is_last_burst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	is_last_burst = 1'bx;
	if(_burst_splitter_output_command) is_last_burst = _burst_splitter_is_last_burst;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	is_last_burst = is_last_burst;
end
always_comb begin // combinatorial final_align
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	final_align = 10'dx;
	if(_burst_splitter_output_command) final_align = _burst_splitter_final_align;
end
always_comb begin // combinatorial _pack_command_v1_i
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_pack_command_v1_i = 1'bx;
	if(_burst_splitter_output_command) _pack_command_v1_i = end_of_burst;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_pack_command_v1_i = _pack_command_v1_i;
end
always_comb begin // combinatorial _pack_command_v2_i
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_pack_command_v2_i = 1'bx;
	if(_burst_splitter_output_command) _pack_command_v2_i = is_last_burst;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_pack_command_v2_i = _pack_command_v2_i;
end
always_comb begin // combinatorial _pack_command_v3_i
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_pack_command_v3_i = 10'dx;
	if(_burst_splitter_output_command) _pack_command_v3_i = final_align;
end
always_comb begin // combinatorial _command_fifo_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_command_fifo_push = 1'bx;
	_command_fifo_push = 1'b0;
	if(_burst_splitter_output_command) _command_fifo_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_command_fifo_push = _command_fifo_push;
end
always_comb begin // combinatorial _command_fifo_push_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_command_fifo_push_data = 12'bxxxxxxxxxxxx;
	if(_burst_splitter_output_command) _command_fifo_push_data = _pack_command_packed_o;
end
always_comb begin // combinatorial _addr_fifo_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_addr_fifo_pop = 1'bx;
	_addr_fifo_pop = 1'b0;
	if(_99) if(_103) _addr_fifo_pop = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_addr_fifo_pop = _addr_fifo_pop;
end
always_comb begin // combinatorial chunk_end
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	chunk_end = 1'bx;
	if(__99_D1001) if(__114_D1001) chunk_end = _pack_command_v1_o;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	chunk_end = chunk_end;
end
always_comb begin // combinatorial is_last_2
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	is_last_2 = 1'bx;
	if(__99_D1001) if(__114_D1001) is_last_2 = _pack_command_v2_o;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	is_last_2 = is_last_2;
end
always_comb begin // combinatorial final_align_2
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	final_align_2 = 10'dx;
	if(__99_D1001) if(__114_D1001) final_align_2 = _pack_command_v3_o;
end
always_comb begin // combinatorial _command_fifo_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_command_fifo_pop = 1'bx;
	_command_fifo_pop = 1'b0;
	if(_99) if(_114) _command_fifo_pop = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_command_fifo_pop = _command_fifo_pop;
end
always_comb begin // combinatorial _pack_command_packed_i
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_pack_command_packed_i = 12'bxxxxxxxxxxxx;
	if(__99_D1001) if(__114_D1001) _pack_command_packed_i = _command_fifo_pop_data;
end
always_comb begin // combinatorial _current_command_final_align_update
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_current_command_final_align_update = 1'bx;
	_current_command_final_align_update = 1'b0;
	if(_99) if(_114) _current_command_final_align_update = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_current_command_final_align_update = _current_command_final_align_update;
end
always_comb begin // combinatorial _current_command_final_align_new
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_current_command_final_align_new = 10'dx;
	if(__99_D1001) if(__114_D1001) _current_command_final_align_new = final_align_2;
end
always_comb begin // combinatorial _current_addr_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_current_addr_rst = 1'bx;
	_current_addr_rst = 1'b0;
	if(rst) _current_addr_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_current_addr_rst = _current_addr_rst;
end
always_comb begin // combinatorial _current_addr_valid_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_current_addr_valid_rst = 1'bx;
	_current_addr_valid_rst = 1'b0;
	if(rst) _current_addr_valid_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_current_addr_valid_rst = _current_addr_valid_rst;
end
always_comb begin // combinatorial _current_command_chunk_end_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_current_command_chunk_end_rst = 1'bx;
	_current_command_chunk_end_rst = 1'b0;
	if(rst) _current_command_chunk_end_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_current_command_chunk_end_rst = _current_command_chunk_end_rst;
end
always_comb begin // combinatorial _current_command_is_last_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_current_command_is_last_rst = 1'bx;
	_current_command_is_last_rst = 1'b0;
	if(rst) _current_command_is_last_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_current_command_is_last_rst = _current_command_is_last_rst;
end
always_comb begin // combinatorial _current_command_final_align_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_current_command_final_align_rst = 1'bx;
	_current_command_final_align_rst = 1'b0;
	if(rst) _current_command_final_align_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_current_command_final_align_rst = _current_command_final_align_rst;
end
always_comb begin // combinatorial _addr_fifo_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_addr_fifo_rst = 1'bx;
	_addr_fifo_rst = 1'b0;
	if(rst) _addr_fifo_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_addr_fifo_rst = _addr_fifo_rst;
end
always_comb begin // combinatorial _command_fifo_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_command_fifo_rst = 1'bx;
	_command_fifo_rst = 1'b0;
	if(rst) _command_fifo_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_command_fifo_rst = _command_fifo_rst;
end
always_comb begin // combinatorial _burst_splitter_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_burst_splitter_rst = 1'bx;
	_burst_splitter_rst = 1'b0;
	if(rst) _burst_splitter_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_burst_splitter_rst = _burst_splitter_rst;
end
endmodule

// BitwiseIntSplit #(TO: 18446744073709551616, LOWER_BITS: 2)
module BitwiseIntSplit_TO_18446744073709551616_LOWER_BITS_2(
	input clk,
	input wire[63:0] v,
	output /*mux_wire*/ logic[61:0] upper,
	output /*mux_wire*/ logic[1:0] lower
);

genvar _g0;
/*mux_wire*/ logic[63:0] v_bits;
/*mux_wire*/ logic[63:0] _UIntToBits_value;
wire[63:0] _UIntToBits_bits;
wire[1:0] _2;
generate
for(_g0 = 0; _g0 < 2; _g0 = _g0 + 1) begin
assign _2[_g0] = v_bits[_g0];
end
endgenerate
/*mux_wire*/ logic[1:0] _BitsToUInt_bits;
wire[1:0] _BitsToUInt_value;
wire[61:0] _3;
generate
for(_g0 = 0; _g0 < 62; _g0 = _g0 + 1) begin
assign _3[_g0] = v_bits[2 + _g0];
end
endgenerate
/*mux_wire*/ logic[61:0] _FromBits_bits;
wire[61:0] _FromBits_value;
UIntToBits_NUM_BITS_64 UIntToBits(
	.clk(clk),
	.value(_UIntToBits_value),
	.bits(_UIntToBits_bits)
);
BitsToUInt_NUM_BITS_2 BitsToUInt(
	.clk(clk),
	.bits(_BitsToUInt_bits),
	.value(_BitsToUInt_value)
);
FromBits_T_type_int_FROM_0_TO_4611686018427387904 FromBits(
	.clk(clk),
	.bits(_FromBits_bits),
	.value(_FromBits_value)
);
always_comb begin // combinatorial upper
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	upper = 62'dx;
	upper = _FromBits_value;
end
always_comb begin // combinatorial lower
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	lower = 2'dx;
	lower = _BitsToUInt_value;
end
always_comb begin // combinatorial v_bits
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v_bits = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	v_bits = _UIntToBits_bits;
end
always_comb begin // combinatorial _UIntToBits_value
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_value = 64'dx;
	_UIntToBits_value = v;
end
always_comb begin // combinatorial _BitsToUInt_bits
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitsToUInt_bits = 2'bxx;
	_BitsToUInt_bits = _2;
end
always_comb begin // combinatorial _FromBits_bits
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_FromBits_bits = 62'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	_FromBits_bits = _3;
end
endmodule

// BitsToUInt #(NUM_BITS: 2)
module BitsToUInt_NUM_BITS_2(
	input clk,
	input wire[1:0] bits,
	output /*mux_wire*/ logic[1:0] value
);

	assign value = bits;
endmodule

// UIntToBits #(NUM_BITS: 64)
module UIntToBits_NUM_BITS_64(
	input clk,
	input wire[63:0] value,
	output /*mux_wire*/ logic[63:0] bits
);

	assign bits = value;
endmodule

// burst_write_splitter #(MAX_ELEMENTS_IN_BURST: 1024, NUM_PARALLEL_ELEMENTS: 16, ADDR_QUEUE_SIZE: 20)
module burst_write_splitter_MAX_ELEMENTS_IN_BURST_1024_NUM_PARALLEL_ELEMENTS_16_ADDR_QUEUE_SIZE_20(
	input clk,
	input wire push_new_align,
	input wire[9:0] new_starting_align,
	output /*mux_wire*/ logic output_command,
	output /*mux_wire*/ logic end_of_burst,
	output /*mux_wire*/ logic is_last_burst,
	output /*mux_wire*/ logic[9:0] final_align,
	input wire push_elements,
	input wire[4:0] num_elements,
	input wire is_last,
	output /*mux_wire*/ logic[3:0] fifo_offset,
	input wire rst
);

/*state*/ logic[9:0] current_align;
/*state*/ logic current_align_valid;
/*mux_wire*/ logic _;
wire _addr_queue_may_push;
/*mux_wire*/ logic _addr_queue_push;
/*mux_wire*/ logic[9:0] _addr_queue_push_data;
/*mux_wire*/ logic new_addr_requested;
/*mux_wire*/ logic _assert_runtime_assert_runtime;
/*mux_wire*/ logic _assert_runtime_condition;
wire[3:0] _10;
assign _10 = current_align; // == mod 16 (target is 4 bits wide)
/*mux_wire*/ logic[10:0] current_align_and;
wire[10:0] _13;
assign _13 = current_align + num_elements;
/*mux_wire*/ logic[9:0] next_align;
wire[9:0] _15;
assign _15 = current_align_and; // == mod 1024 (target is 10 bits wide)
/*mux_wire*/ logic push_end_of_burst;
wire _17;
assign _17 = current_align_and >= 11'd1024;
wire _20;
assign _20 = push_end_of_burst | is_last;
wire _28;
assign _28 = !current_align_valid;
wire _addr_queue_pop_available;
wire[9:0] _addr_queue_pop_data;
/*mux_wire*/ logic[9:0] new_addr_align;
/*mux_wire*/ logic _addr_queue_rst;
FWFT_T_type_int_FROM_0_TO_1024_DEPTH_20_MAY_PUSH_LATENCY_0 addr_queue(
	.clk(clk),
	.rst(_addr_queue_rst),
	.may_push(_addr_queue_may_push),
	.push(_addr_queue_push),
	.push_data(_addr_queue_push_data),
	.pop_available(_addr_queue_pop_available),
	.pop_data(_addr_queue_pop_data),
	.pop()
);
assert_runtime #() assert_runtime(
	.clk(clk),
	.assert_runtime(_assert_runtime_assert_runtime),
	.condition(_assert_runtime_condition)
);
always_ff @(posedge clk) begin // state current_align
	if(push_elements) if(!is_last) current_align <= next_align;
	if(new_addr_requested) if(_addr_queue_pop_available) current_align <= new_addr_align;
end
always_ff @(posedge clk) begin // state current_align_valid
	if(new_addr_requested) if(_addr_queue_pop_available) current_align_valid <= 1'b1;
	if(new_addr_requested) if(!_addr_queue_pop_available) current_align_valid <= 1'b0;
	if(rst) current_align_valid <= 1'b0;
end
always_comb begin // combinatorial _
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_ = 1'bx;
	_ = _addr_queue_may_push;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_ = _;
end
always_comb begin // combinatorial _addr_queue_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_addr_queue_push = 1'bx;
	_addr_queue_push = 1'b0;
	if(push_new_align) _addr_queue_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_addr_queue_push = _addr_queue_push;
end
always_comb begin // combinatorial _addr_queue_push_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_addr_queue_push_data = 10'dx;
	if(push_new_align) _addr_queue_push_data = new_starting_align;
end
always_comb begin // combinatorial output_command
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	output_command = 1'bx;
	output_command = 1'b0;
	if(push_elements) if(_20) output_command = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	output_command = output_command;
end
always_comb begin // combinatorial end_of_burst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	end_of_burst = 1'bx;
	if(push_elements) if(_20) end_of_burst = push_end_of_burst;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	end_of_burst = end_of_burst;
end
always_comb begin // combinatorial is_last_burst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	is_last_burst = 1'bx;
	if(push_elements) if(_20) is_last_burst = is_last;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	is_last_burst = is_last_burst;
end
always_comb begin // combinatorial final_align
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	final_align = 10'dx;
	if(push_elements) if(_20) final_align = next_align;
end
always_comb begin // combinatorial new_addr_requested
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	new_addr_requested = 1'bx;
	new_addr_requested = 1'b0;
	if(push_elements) if(is_last) new_addr_requested = 1'b1;
	if(_28) new_addr_requested = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	new_addr_requested = new_addr_requested;
end
always_comb begin // combinatorial fifo_offset
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	fifo_offset = 4'dx;
	if(push_elements) fifo_offset = _10;
end
always_comb begin // combinatorial _assert_runtime_assert_runtime
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_assert_runtime_assert_runtime = 1'bx;
	_assert_runtime_assert_runtime = 1'b0;
	if(push_elements) _assert_runtime_assert_runtime = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_assert_runtime_assert_runtime = _assert_runtime_assert_runtime;
end
always_comb begin // combinatorial _assert_runtime_condition
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_assert_runtime_condition = 1'bx;
	if(push_elements) _assert_runtime_condition = current_align_valid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_assert_runtime_condition = _assert_runtime_condition;
end
always_comb begin // combinatorial current_align_and
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	current_align_and = 11'dx;
	if(push_elements) current_align_and = _13;
end
always_comb begin // combinatorial next_align
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	next_align = 10'dx;
	if(push_elements) next_align = _15;
end
always_comb begin // combinatorial push_end_of_burst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	push_end_of_burst = 1'bx;
	if(push_elements) push_end_of_burst = _17;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	push_end_of_burst = push_end_of_burst;
end
always_comb begin // combinatorial new_addr_align
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	new_addr_align = 10'dx;
	if(new_addr_requested) if(_addr_queue_pop_available) new_addr_align = _addr_queue_pop_data;
end
always_comb begin // combinatorial _addr_queue_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_addr_queue_rst = 1'bx;
	_addr_queue_rst = 1'b0;
	if(rst) _addr_queue_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_addr_queue_rst = _addr_queue_rst;
end
endmodule

// assert_runtime #()
// Provided externally
// module assert_runtime(
// 	input clk,
// 	input wire assert_runtime,
// 	input wire condition
// );
// FWFT #(T: type int #(FROM: 0, TO: 1024), DEPTH: 20, MAY_PUSH_LATENCY: 0)
module FWFT_T_type_int_FROM_0_TO_1024_DEPTH_20_MAY_PUSH_LATENCY_0(
	input clk,
	input wire rst,
	output /*mux_wire*/ logic may_push,
	input wire push,
	input wire[9:0] push_data,
	output /*mux_wire*/ logic pop_available,
	output /*mux_wire*/ logic[9:0] pop_data,
	input wire pop
);

/*state*/ logic[9:0] mem[19:0];
/*state*/ logic[4:0] read_addr;
/*state*/ logic[4:0] write_addr;
/*state*/ logic[1:0] outflow_path_valids_reg;
/*state*/ logic[9:0] outflow_path_elems_reg[1:0];
/*mux_wire*/ logic[2:0] outflow_path_valids;
/*mux_wire*/ logic[9:0] outflow_path_elems[2:0];
/*mux_wire*/ logic[2:0] will_shifts;
wire _3;
assign _3 = read_addr != write_addr;
wire[9:0] _5 = mem[read_addr];
wire[9:0] _6 = outflow_path_elems_reg[0];
wire _7 = outflow_path_valids_reg[0];
wire _8 = will_shifts[0];
wire _9 = outflow_path_valids[0];
wire _10;
assign _10 = !_9;
wire _11;
assign _11 = _8 | _10;
wire _12 = will_shifts[1];
wire _13 = outflow_path_valids[1];
wire[9:0] _14 = outflow_path_elems[1];
wire[9:0] _15 = outflow_path_elems_reg[1];
wire _16 = outflow_path_valids_reg[1];
wire _17 = will_shifts[1];
wire _18 = outflow_path_valids[1];
wire _19;
assign _19 = !_18;
wire _20;
assign _20 = _17 | _19;
wire _21 = will_shifts[2];
wire _22 = outflow_path_valids[2];
wire[9:0] _23 = outflow_path_elems[2];
/*mux_wire*/ logic[4:0] space_remaining;
wire[4:0] _29;
assign _29 = write_addr + 1'd1;
wire signed[5:0] _30;
assign _30 = read_addr - _29;
wire[4:0] _31;
assign _31 = _30 + ((_30 < 0) ? 20 : 0); // == mod 20
wire _33;
assign _33 = space_remaining > 1'd0;
/*mux_wire*/ logic _LatencyOffset_in;
wire _LatencyOffset_out;
wire[4:0] _38;
assign _38 = write_addr + 1'd1;
wire[4:0] _39;
assign _39 = (_38 == 20) ? 0 : _38; // == mod 20
wire _40 = outflow_path_valids[2];
wire _41 = will_shifts[2];
wire _42;
assign _42 = _40 & _41;
wire[4:0] _45;
assign _45 = read_addr + 1'd1;
wire[4:0] _46;
assign _46 = (_45 == 20) ? 0 : _45; // == mod 20
wire _48 = outflow_path_valids[0];
wire[9:0] _49 = outflow_path_elems[0];
LatencyOffset_T_type_bool_OFFSET_0 LatencyOffset(
	.clk(clk),
	.in(_LatencyOffset_in),
	.out(_LatencyOffset_out)
);
always_ff @(posedge clk) begin // state mem
	if(push) mem[write_addr] <= push_data;
end
always_ff @(posedge clk) begin // state read_addr
	if(rst) read_addr <= 1'd0;
	if(_42) read_addr <= _46;
end
always_ff @(posedge clk) begin // state write_addr
	if(rst) write_addr <= 1'd0;
	if(push) write_addr <= _39;
end
always_ff @(posedge clk) begin // state outflow_path_valids_reg
	if(_12) outflow_path_valids_reg[0] <= _13;
	if(_21) outflow_path_valids_reg[1] <= _22;
	if(rst) outflow_path_valids_reg[0] <= 1'b0;
	if(rst) outflow_path_valids_reg[1] <= 1'b0;
end
always_ff @(posedge clk) begin // state outflow_path_elems_reg
	if(_12) outflow_path_elems_reg[0] <= _14;
	if(_21) outflow_path_elems_reg[1] <= _23;
end
always_comb begin // combinatorial outflow_path_valids
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	outflow_path_valids = 3'bxxx;
	outflow_path_valids[2] = _3;
	outflow_path_valids[0] = _7;
	outflow_path_valids[1] = _16;
end
always_comb begin // combinatorial outflow_path_elems
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	outflow_path_elems = '{10'dx, 10'dx, 10'dx};
	outflow_path_elems[2] = _5;
	outflow_path_elems[0] = _6;
	outflow_path_elems[1] = _15;
end
always_comb begin // combinatorial will_shifts
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	will_shifts = 3'bxxx;
	will_shifts[1] = _11;
	will_shifts[2] = _20;
	will_shifts[0] = 1'b0;
	if(pop_available) if(pop) will_shifts[0] = 1'b1;
end
always_comb begin // combinatorial space_remaining
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	space_remaining = 5'dx;
	space_remaining = _31;
end
always_comb begin // combinatorial may_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_push = 1'bx;
	may_push = _LatencyOffset_out;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_push = may_push;
end
always_comb begin // combinatorial _LatencyOffset_in
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_in = 1'bx;
	_LatencyOffset_in = _33;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_LatencyOffset_in = _LatencyOffset_in;
end
always_comb begin // combinatorial pop_available
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_available = 1'bx;
	pop_available = 1'b0;
	if(_48) pop_available = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	pop_available = pop_available;
end
always_comb begin // combinatorial pop_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_data = 10'dx;
	if(_48) pop_data = _49;
end
endmodule

// Tuple3 #(T1: type bool #(), T2: type bool #(), T3: type int #(FROM: 0, TO: 1024))
module Tuple3_T1_type_bool_T2_type_bool_T3_type_int_FROM_0_TO_1024(
	input clk,
	input wire v1_i,
	input wire v2_i,
	input wire[9:0] v3_i,
	output /*mux_wire*/ logic[11:0] packed_o,
	input wire[11:0] packed_i,
	output /*mux_wire*/ logic v1_o,
	output /*mux_wire*/ logic v2_o,
	output /*mux_wire*/ logic[9:0] v3_o
);

genvar _g0;
/*mux_wire*/ logic _ToBits_value;
wire[0:0] _ToBits_bits;
/*mux_wire*/ logic _ToBits_2_value;
wire[0:0] _ToBits_2_bits;
/*mux_wire*/ logic[9:0] _ToBits_3_value;
wire[9:0] _ToBits_3_bits;
wire[0:0] _4;
generate
for(_g0 = 0; _g0 < 1; _g0 = _g0 + 1) begin
assign _4[_g0] = packed_i[_g0];
end
endgenerate
/*mux_wire*/ logic[0:0] _FromBits_bits;
wire _FromBits_value;
wire[0:0] _5;
generate
for(_g0 = 0; _g0 < 1; _g0 = _g0 + 1) begin
assign _5[_g0] = packed_i[1 + _g0];
end
endgenerate
/*mux_wire*/ logic[0:0] _FromBits_2_bits;
wire _FromBits_2_value;
wire[9:0] _6;
generate
for(_g0 = 0; _g0 < 10; _g0 = _g0 + 1) begin
assign _6[_g0] = packed_i[2 + _g0];
end
endgenerate
/*mux_wire*/ logic[9:0] _FromBits_3_bits;
wire[9:0] _FromBits_3_value;
ToBits_T_type_bool ToBits(
	.clk(clk),
	.value(_ToBits_value),
	.bits(_ToBits_bits)
);
ToBits_T_type_bool ToBits_2(
	.clk(clk),
	.value(_ToBits_2_value),
	.bits(_ToBits_2_bits)
);
ToBits_T_type_int_FROM_0_TO_1024 ToBits_3(
	.clk(clk),
	.value(_ToBits_3_value),
	.bits(_ToBits_3_bits)
);
FromBits_T_type_bool FromBits(
	.clk(clk),
	.bits(_FromBits_bits),
	.value(_FromBits_value)
);
FromBits_T_type_bool FromBits_2(
	.clk(clk),
	.bits(_FromBits_2_bits),
	.value(_FromBits_2_value)
);
FromBits_T_type_int_FROM_0_TO_1024 FromBits_3(
	.clk(clk),
	.bits(_FromBits_3_bits),
	.value(_FromBits_3_value)
);
always_comb begin // combinatorial packed_o
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	packed_o = 12'bxxxxxxxxxxxx;
	for(int _v0 = 0; _v0 < 1; _v0 = _v0 + 1) begin
packed_o[_v0] = _ToBits_bits[_v0];
end
	for(int _v0 = 0; _v0 < 1; _v0 = _v0 + 1) begin
packed_o[1 + _v0] = _ToBits_2_bits[_v0];
end
	for(int _v0 = 0; _v0 < 10; _v0 = _v0 + 1) begin
packed_o[2 + _v0] = _ToBits_3_bits[_v0];
end
end
always_comb begin // combinatorial _ToBits_value
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_ToBits_value = 1'bx;
	_ToBits_value = v1_i;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_ToBits_value = _ToBits_value;
end
always_comb begin // combinatorial _ToBits_2_value
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_ToBits_2_value = 1'bx;
	_ToBits_2_value = v2_i;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_ToBits_2_value = _ToBits_2_value;
end
always_comb begin // combinatorial _ToBits_3_value
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_ToBits_3_value = 10'dx;
	_ToBits_3_value = v3_i;
end
always_comb begin // combinatorial v1_o
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v1_o = 1'bx;
	v1_o = _FromBits_value;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	v1_o = v1_o;
end
always_comb begin // combinatorial v2_o
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v2_o = 1'bx;
	v2_o = _FromBits_2_value;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	v2_o = v2_o;
end
always_comb begin // combinatorial v3_o
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v3_o = 10'dx;
	v3_o = _FromBits_3_value;
end
always_comb begin // combinatorial _FromBits_bits
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_FromBits_bits = 1'bx;
	_FromBits_bits = _4;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_FromBits_bits = _FromBits_bits;
end
always_comb begin // combinatorial _FromBits_2_bits
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_FromBits_2_bits = 1'bx;
	_FromBits_2_bits = _5;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_FromBits_2_bits = _FromBits_2_bits;
end
always_comb begin // combinatorial _FromBits_3_bits
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_FromBits_3_bits = 10'bxxxxxxxxxx;
	_FromBits_3_bits = _6;
end
endmodule

// FromBits #(T: type int #(FROM: 0, TO: 1024))
module FromBits_T_type_int_FROM_0_TO_1024(
	input clk,
	input wire[9:0] bits,
	output /*mux_wire*/ logic[9:0] value
);

assign value = bits;
endmodule

// FromBits #(T: type bool #())
module FromBits_T_type_bool(
	input clk,
	input wire[0:0] bits,
	output /*mux_wire*/ logic value
);

assign value = bits;
endmodule

// ToBits #(T: type int #(FROM: 0, TO: 1024))
module ToBits_T_type_int_FROM_0_TO_1024(
	input clk,
	input wire[9:0] value,
	output /*mux_wire*/ logic[9:0] bits
);

assign bits = value;
endmodule

// ToBits #(T: type bool #())
module ToBits_T_type_bool(
	input clk,
	input wire value,
	output /*mux_wire*/ logic[0:0] bits
);

assign bits = value;
endmodule

// FIFO #(T: type bool #()[12], DEPTH: 42, MAY_PUSH_LATENCY: 0)
module FIFO_T_type_bool_12_DEPTH_42_MAY_PUSH_LATENCY_0(
	input clk,
	input wire rst,
	output /*mux_wire*/ logic may_push,
	input wire push,
	input wire[11:0] push_data,
	output /*mux_wire*/ logic may_pop,
	input wire pop,
	output /*mux_wire*/ logic[11:0] pop_data
);

/*latency*/ logic _pop_D1; always_ff @(posedge clk) begin _pop_D1 <= pop; end
/*state*/ logic[11:0] mem[41:0];
/*state*/ logic[5:0] read_addr;
/*state*/ logic[5:0] write_addr;
/*mux_wire*/ logic[5:0] space_remaining;
wire[5:0] _6;
assign _6 = write_addr + 1'd1;
wire signed[6:0] _7;
assign _7 = read_addr - _6;
wire[5:0] _8;
assign _8 = _7 + ((_7 < 0) ? 42 : 0); // == mod 42
wire _10;
assign _10 = space_remaining > 1'd0;
/*mux_wire*/ logic _LatencyOffset_in;
wire _LatencyOffset_out;
wire[5:0] _15;
assign _15 = write_addr + 1'd1;
wire[5:0] _16;
assign _16 = (_15 == 42) ? 0 : _15; // == mod 42
wire _19;
assign _19 = read_addr != write_addr;
wire[11:0] _21 = mem[read_addr];
/*latency*/ logic[11:0] __21_D1; always_ff @(posedge clk) begin __21_D1 <= _21; end
wire[5:0] _24;
assign _24 = read_addr + 1'd1;
wire[5:0] _25;
assign _25 = (_24 == 42) ? 0 : _24; // == mod 42
LatencyOffset_T_type_bool_OFFSET_0 LatencyOffset(
	.clk(clk),
	.in(_LatencyOffset_in),
	.out(_LatencyOffset_out)
);
always_ff @(posedge clk) begin // state mem
	if(push) mem[write_addr] <= push_data;
end
always_ff @(posedge clk) begin // state read_addr
	if(rst) read_addr <= 1'd0;
	if(pop) read_addr <= _25;
end
always_ff @(posedge clk) begin // state write_addr
	if(rst) write_addr <= 1'd0;
	if(push) write_addr <= _16;
end
always_comb begin // combinatorial space_remaining
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	space_remaining = 6'dx;
	space_remaining = _8;
end
always_comb begin // combinatorial may_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_push = 1'bx;
	may_push = _LatencyOffset_out;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_push = may_push;
end
always_comb begin // combinatorial _LatencyOffset_in
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_in = 1'bx;
	_LatencyOffset_in = _10;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_LatencyOffset_in = _LatencyOffset_in;
end
always_comb begin // combinatorial may_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_pop = 1'bx;
	may_pop = _19;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_pop = may_pop;
end
always_comb begin // combinatorial pop_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_data = 12'bxxxxxxxxxxxx;
	if(_pop_D1) pop_data = __21_D1;
end
endmodule

// FIFO #(T: type int #(FROM: 0, TO: 4611686018427387904), DEPTH: 20, MAY_PUSH_LATENCY: 0)
module FIFO_T_type_int_FROM_0_TO_4611686018427387904_DEPTH_20_MAY_PUSH_LATENCY_0(
	input clk,
	input wire rst,
	output /*mux_wire*/ logic may_push,
	input wire push,
	input wire[61:0] push_data,
	output /*mux_wire*/ logic may_pop,
	input wire pop,
	output /*mux_wire*/ logic[61:0] pop_data
);

/*latency*/ logic _pop_D1; always_ff @(posedge clk) begin _pop_D1 <= pop; end
/*state*/ logic[61:0] mem[19:0];
/*state*/ logic[4:0] read_addr;
/*state*/ logic[4:0] write_addr;
/*mux_wire*/ logic[4:0] space_remaining;
wire[4:0] _6;
assign _6 = write_addr + 1'd1;
wire signed[5:0] _7;
assign _7 = read_addr - _6;
wire[4:0] _8;
assign _8 = _7 + ((_7 < 0) ? 20 : 0); // == mod 20
wire _10;
assign _10 = space_remaining > 1'd0;
/*mux_wire*/ logic _LatencyOffset_in;
wire _LatencyOffset_out;
wire[4:0] _15;
assign _15 = write_addr + 1'd1;
wire[4:0] _16;
assign _16 = (_15 == 20) ? 0 : _15; // == mod 20
wire _19;
assign _19 = read_addr != write_addr;
wire[61:0] _21 = mem[read_addr];
/*latency*/ logic[61:0] __21_D1; always_ff @(posedge clk) begin __21_D1 <= _21; end
wire[4:0] _24;
assign _24 = read_addr + 1'd1;
wire[4:0] _25;
assign _25 = (_24 == 20) ? 0 : _24; // == mod 20
LatencyOffset_T_type_bool_OFFSET_0 LatencyOffset(
	.clk(clk),
	.in(_LatencyOffset_in),
	.out(_LatencyOffset_out)
);
always_ff @(posedge clk) begin // state mem
	if(push) mem[write_addr] <= push_data;
end
always_ff @(posedge clk) begin // state read_addr
	if(rst) read_addr <= 1'd0;
	if(pop) read_addr <= _25;
end
always_ff @(posedge clk) begin // state write_addr
	if(rst) write_addr <= 1'd0;
	if(push) write_addr <= _16;
end
always_comb begin // combinatorial space_remaining
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	space_remaining = 5'dx;
	space_remaining = _8;
end
always_comb begin // combinatorial may_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_push = 1'bx;
	may_push = _LatencyOffset_out;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_push = may_push;
end
always_comb begin // combinatorial _LatencyOffset_in
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_in = 1'bx;
	_LatencyOffset_in = _10;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_LatencyOffset_in = _LatencyOffset_in;
end
always_comb begin // combinatorial may_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_pop = 1'bx;
	may_pop = _19;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_pop = may_pop;
end
always_comb begin // combinatorial pop_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_data = 62'dx;
	if(_pop_D1) pop_data = __21_D1;
end
endmodule

// BitwiseIntSplit #(TO: 1023, LOWER_BITS: 4)
module BitwiseIntSplit_TO_1023_LOWER_BITS_4(
	input clk,
	input wire[9:0] v,
	output /*mux_wire*/ logic[5:0] upper,
	output /*mux_wire*/ logic[3:0] lower
);

genvar _g0;
/*mux_wire*/ logic[9:0] v_bits;
/*mux_wire*/ logic[9:0] _UIntToBits_value;
wire[9:0] _UIntToBits_bits;
wire[3:0] _2;
generate
for(_g0 = 0; _g0 < 4; _g0 = _g0 + 1) begin
assign _2[_g0] = v_bits[_g0];
end
endgenerate
/*mux_wire*/ logic[3:0] _BitsToUInt_bits;
wire[3:0] _BitsToUInt_value;
wire[5:0] _3;
generate
for(_g0 = 0; _g0 < 6; _g0 = _g0 + 1) begin
assign _3[_g0] = v_bits[4 + _g0];
end
endgenerate
/*mux_wire*/ logic[5:0] _FromBits_bits;
wire[5:0] _FromBits_value;
UIntToBits_NUM_BITS_10 UIntToBits(
	.clk(clk),
	.value(_UIntToBits_value),
	.bits(_UIntToBits_bits)
);
BitsToUInt_NUM_BITS_4 BitsToUInt(
	.clk(clk),
	.bits(_BitsToUInt_bits),
	.value(_BitsToUInt_value)
);
FromBits_T_type_int_FROM_0_TO_64 FromBits(
	.clk(clk),
	.bits(_FromBits_bits),
	.value(_FromBits_value)
);
always_comb begin // combinatorial upper
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	upper = 6'dx;
	upper = _FromBits_value;
end
always_comb begin // combinatorial lower
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	lower = 4'dx;
	lower = _BitsToUInt_value;
end
always_comb begin // combinatorial v_bits
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v_bits = 10'bxxxxxxxxxx;
	v_bits = _UIntToBits_bits;
end
always_comb begin // combinatorial _UIntToBits_value
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_value = 10'dx;
	_UIntToBits_value = v;
end
always_comb begin // combinatorial _BitsToUInt_bits
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitsToUInt_bits = 4'bxxxx;
	_BitsToUInt_bits = _2;
end
always_comb begin // combinatorial _FromBits_bits
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_FromBits_bits = 6'bxxxxxx;
	_FromBits_bits = _3;
end
endmodule

// FromBits #(T: type int #(FROM: 0, TO: 64))
module FromBits_T_type_int_FROM_0_TO_64(
	input clk,
	input wire[5:0] bits,
	output /*mux_wire*/ logic[5:0] value
);

assign value = bits;
endmodule

// IntNarrow #(FROM_I: 0, TO_I: 1024, FROM: 1, TO: 1024)
module IntNarrow_FROM_I_0_TO_I_1024_FROM_1_TO_1024(
	input clk,
	input wire[9:0] in,
	output /*mux_wire*/ logic[9:0] out
);

	assign out = in;
endmodule

// BitwiseIntConcat #(UPPER_TO: 4503599627370496, LOWER_BITS: 10)
module BitwiseIntConcat_UPPER_TO_4503599627370496_LOWER_BITS_10(
	input clk,
	input wire[51:0] upper,
	input wire[9:0] lower,
	output /*mux_wire*/ logic[61:0] v
);

/*mux_wire*/ logic[61:0] v_bits;
/*mux_wire*/ logic[9:0] _UIntToBits_value;
wire[9:0] _UIntToBits_bits;
/*mux_wire*/ logic[51:0] _UIntToBits_2_value;
wire[51:0] _UIntToBits_2_bits;
/*mux_wire*/ logic[61:0] _FromBits_bits;
wire[61:0] _FromBits_value;
UIntToBits_NUM_BITS_10 UIntToBits(
	.clk(clk),
	.value(_UIntToBits_value),
	.bits(_UIntToBits_bits)
);
UIntToBits_NUM_BITS_52 UIntToBits_2(
	.clk(clk),
	.value(_UIntToBits_2_value),
	.bits(_UIntToBits_2_bits)
);
FromBits_T_type_int_FROM_0_TO_4611686018427387904 FromBits(
	.clk(clk),
	.bits(_FromBits_bits),
	.value(_FromBits_value)
);
always_comb begin // combinatorial v
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v = 62'dx;
	v = _FromBits_value;
end
always_comb begin // combinatorial v_bits
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v_bits = 62'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	for(int _v0 = 0; _v0 < 10; _v0 = _v0 + 1) begin
v_bits[_v0] = _UIntToBits_bits[_v0];
end
	for(int _v0 = 0; _v0 < 52; _v0 = _v0 + 1) begin
v_bits[10 + _v0] = _UIntToBits_2_bits[_v0];
end
end
always_comb begin // combinatorial _UIntToBits_value
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_value = 10'dx;
	_UIntToBits_value = lower;
end
always_comb begin // combinatorial _UIntToBits_2_value
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_2_value = 52'dx;
	_UIntToBits_2_value = upper;
end
always_comb begin // combinatorial _FromBits_bits
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_FromBits_bits = 62'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	_FromBits_bits = v_bits;
end
endmodule

// FromBits #(T: type int #(FROM: 0, TO: 4611686018427387904))
module FromBits_T_type_int_FROM_0_TO_4611686018427387904(
	input clk,
	input wire[61:0] bits,
	output /*mux_wire*/ logic[61:0] value
);

assign value = bits;
endmodule

// UIntToBits #(NUM_BITS: 52)
module UIntToBits_NUM_BITS_52(
	input clk,
	input wire[51:0] value,
	output /*mux_wire*/ logic[51:0] bits
);

	assign bits = value;
endmodule

// UIntToBits #(NUM_BITS: 10)
module UIntToBits_NUM_BITS_10(
	input clk,
	input wire[9:0] value,
	output /*mux_wire*/ logic[9:0] bits
);

	assign bits = value;
endmodule

// BitwiseIntSplit #(TO: 4611686018427387904, LOWER_BITS: 10)
module BitwiseIntSplit_TO_4611686018427387904_LOWER_BITS_10(
	input clk,
	input wire[61:0] v,
	output /*mux_wire*/ logic[51:0] upper,
	output /*mux_wire*/ logic[9:0] lower
);

genvar _g0;
/*mux_wire*/ logic[61:0] v_bits;
/*mux_wire*/ logic[61:0] _UIntToBits_value;
wire[61:0] _UIntToBits_bits;
wire[9:0] _2;
generate
for(_g0 = 0; _g0 < 10; _g0 = _g0 + 1) begin
assign _2[_g0] = v_bits[_g0];
end
endgenerate
/*mux_wire*/ logic[9:0] _BitsToUInt_bits;
wire[9:0] _BitsToUInt_value;
wire[51:0] _3;
generate
for(_g0 = 0; _g0 < 52; _g0 = _g0 + 1) begin
assign _3[_g0] = v_bits[10 + _g0];
end
endgenerate
/*mux_wire*/ logic[51:0] _FromBits_bits;
wire[51:0] _FromBits_value;
UIntToBits_NUM_BITS_62 UIntToBits(
	.clk(clk),
	.value(_UIntToBits_value),
	.bits(_UIntToBits_bits)
);
BitsToUInt_NUM_BITS_10 BitsToUInt(
	.clk(clk),
	.bits(_BitsToUInt_bits),
	.value(_BitsToUInt_value)
);
FromBits_T_type_int_FROM_0_TO_4503599627370496 FromBits(
	.clk(clk),
	.bits(_FromBits_bits),
	.value(_FromBits_value)
);
always_comb begin // combinatorial upper
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	upper = 52'dx;
	upper = _FromBits_value;
end
always_comb begin // combinatorial lower
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	lower = 10'dx;
	lower = _BitsToUInt_value;
end
always_comb begin // combinatorial v_bits
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v_bits = 62'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	v_bits = _UIntToBits_bits;
end
always_comb begin // combinatorial _UIntToBits_value
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_value = 62'dx;
	_UIntToBits_value = v;
end
always_comb begin // combinatorial _BitsToUInt_bits
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitsToUInt_bits = 10'bxxxxxxxxxx;
	_BitsToUInt_bits = _2;
end
always_comb begin // combinatorial _FromBits_bits
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_FromBits_bits = 52'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	_FromBits_bits = _3;
end
endmodule

// FromBits #(T: type int #(FROM: 0, TO: 4503599627370496))
module FromBits_T_type_int_FROM_0_TO_4503599627370496(
	input clk,
	input wire[51:0] bits,
	output /*mux_wire*/ logic[51:0] value
);

assign value = bits;
endmodule

// BitsToUInt #(NUM_BITS: 10)
module BitsToUInt_NUM_BITS_10(
	input clk,
	input wire[9:0] bits,
	output /*mux_wire*/ logic[9:0] value
);

	assign value = bits;
endmodule

// IntNarrow #(FROM_I: -63, TO_I: 256, FROM: 0, TO: 64)
module IntNarrow_FROM_I_63_TO_I_256_FROM_0_TO_64(
	input clk,
	input wire signed[8:0] in,
	output /*mux_wire*/ logic[5:0] out
);

	assign out = in;
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
/*mux_wire*/ logic[57:0] _FromBits_bits;
wire[57:0] _FromBits_value;
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
FromBits_T_type_int_FROM_0_TO_288230376151711744 FromBits(
	.clk(clk),
	.bits(_FromBits_bits),
	.value(_FromBits_value)
);
always_comb begin // combinatorial upper
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	upper = 58'dx;
	upper = _FromBits_value;
end
always_comb begin // combinatorial lower
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	lower = 4'dx;
	lower = _BitsToUInt_value;
end
always_comb begin // combinatorial v_bits
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	v_bits = 62'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	v_bits = _UIntToBits_bits;
end
always_comb begin // combinatorial _UIntToBits_value
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_value = 62'dx;
	_UIntToBits_value = v;
end
always_comb begin // combinatorial _BitsToUInt_bits
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitsToUInt_bits = 4'bxxxx;
	_BitsToUInt_bits = _2;
end
always_comb begin // combinatorial _FromBits_bits
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_FromBits_bits = 58'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	_FromBits_bits = _3;
end
endmodule

// FromBits #(T: type int #(FROM: 0, TO: 288230376151711744))
module FromBits_T_type_int_FROM_0_TO_288230376151711744(
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

// SlowState #(T: type int #(FROM: 0, TO: 1024), RESET_TO: 0, OLD_DELAY: 0, NEW_DELAY: 1)
module SlowState_T_type_int_FROM_0_TO_1024_RESET_TO_0_OLD_DELAY_0_NEW_DELAY_1(
	input clk,
	input wire rst,
	output /*state*/ logic[9:0] old,
	output /*mux_wire*/ logic may_update,
	input wire update,
	input wire[9:0] new_1
);

/*latency*/ logic _update_D1; always_ff @(posedge clk) begin _update_D1 <= update; end
/*mux_wire*/ logic do_rst;
/*mux_wire*/ logic[9:0] new_s;
/*mux_wire*/ logic update_s;
/*mux_wire*/ logic update_old;
/*mux_wire*/ logic _LatencyOffset_in;
wire _LatencyOffset_out;
/*latency*/ logic __LatencyOffset_out_D0; always_ff @(posedge clk) begin __LatencyOffset_out_D0 <= _LatencyOffset_out; end
/*mux_wire*/ logic[9:0] new_old;
/*mux_wire*/ logic[9:0] _LatencyOffset_2_in;
wire[9:0] _LatencyOffset_2_out;
/*state*/ logic[0:0] cooldown;
wire _7 = cooldown[0];
wire _10;
assign _10 = update_s | do_rst;
/*mux_wire*/ logic _Repeat_v;
wire[0:0] _Repeat_result;
// (zero sized) _11
LatencyOffset_T_type_bool_OFFSET_1 LatencyOffset(
	.clk(clk),
	.in(_LatencyOffset_in),
	.out(_LatencyOffset_out)
);
LatencyOffset_T_type_int_FROM_0_TO_1024_OFFSET_1 LatencyOffset_2(
	.clk(clk),
	.in(_LatencyOffset_2_in),
	.out(_LatencyOffset_2_out)
);
Repeat_T_type_bool_SIZE_1 Repeat(
	.clk(clk),
	.v(_Repeat_v),
	.result(_Repeat_result)
);
always_comb begin // combinatorial do_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	do_rst = 1'bx;
	do_rst = 1'b0;
	if(rst) do_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	do_rst = do_rst;
end
always_ff @(posedge clk) begin // state old
	if(do_rst) old <= 10'd0;
	if(!do_rst) if(update_old) old <= new_old;
end
always_comb begin // combinatorial new_s
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	new_s = 10'dx;
	if(_update_D1) new_s = new_1;
end
always_comb begin // combinatorial update_s
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	update_s = 1'bx;
	if(update) update_s = 1'b1;
	if(!update) update_s = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	update_s = update_s;
end
always_comb begin // combinatorial update_old
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	update_old = 1'bx;
	update_old = __LatencyOffset_out_D0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	update_old = update_old;
end
always_comb begin // combinatorial _LatencyOffset_in
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_in = 1'bx;
	_LatencyOffset_in = update_s;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_LatencyOffset_in = _LatencyOffset_in;
end
always_comb begin // combinatorial new_old
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	new_old = 10'dx;
	new_old = _LatencyOffset_2_out;
end
always_comb begin // combinatorial _LatencyOffset_2_in
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_2_in = 10'dx;
	_LatencyOffset_2_in = new_s;
end
always_comb begin // combinatorial may_update
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_update = 1'bx;
	may_update = _7;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_update = may_update;
end
always_ff @(posedge clk) begin // state cooldown
	if(_10) cooldown <= _Repeat_result;
	if(!_10) cooldown[0] <= 1'b1;
end
always_comb begin // combinatorial _Repeat_v
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_v = 1'bx;
	if(_10) _Repeat_v = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_Repeat_v = _Repeat_v;
end
endmodule

// LatencyOffset #(T: type int #(FROM: 0, TO: 1024), OFFSET: -1)
module LatencyOffset_T_type_int_FROM_0_TO_1024_OFFSET_1(
	input clk,
	input wire[9:0] in,
	output /*mux_wire*/ logic[9:0] out
);

	assign out = in;
endmodule

// SlowState #(T: type bool #(), RESET_TO: false, OLD_DELAY: 0, NEW_DELAY: 1)
module SlowState_T_type_bool_RESET_TO_false_OLD_DELAY_0_NEW_DELAY_1(
	input clk,
	input wire rst,
	output /*state*/ logic old,
	output /*mux_wire*/ logic may_update,
	input wire update,
	input wire new_1
);

/*latency*/ logic _update_D1; always_ff @(posedge clk) begin _update_D1 <= update; end
/*mux_wire*/ logic do_rst;
/*mux_wire*/ logic new_s;
/*mux_wire*/ logic update_s;
/*mux_wire*/ logic update_old;
/*mux_wire*/ logic _LatencyOffset_in;
wire _LatencyOffset_out;
/*latency*/ logic __LatencyOffset_out_D0; always_ff @(posedge clk) begin __LatencyOffset_out_D0 <= _LatencyOffset_out; end
/*mux_wire*/ logic new_old;
/*mux_wire*/ logic _LatencyOffset_2_in;
wire _LatencyOffset_2_out;
/*state*/ logic[0:0] cooldown;
wire _7 = cooldown[0];
wire _10;
assign _10 = update_s | do_rst;
/*mux_wire*/ logic _Repeat_v;
wire[0:0] _Repeat_result;
// (zero sized) _11
LatencyOffset_T_type_bool_OFFSET_1 LatencyOffset(
	.clk(clk),
	.in(_LatencyOffset_in),
	.out(_LatencyOffset_out)
);
LatencyOffset_T_type_bool_OFFSET_1 LatencyOffset_2(
	.clk(clk),
	.in(_LatencyOffset_2_in),
	.out(_LatencyOffset_2_out)
);
Repeat_T_type_bool_SIZE_1 Repeat(
	.clk(clk),
	.v(_Repeat_v),
	.result(_Repeat_result)
);
always_comb begin // combinatorial do_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	do_rst = 1'bx;
	do_rst = 1'b0;
	if(rst) do_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	do_rst = do_rst;
end
always_ff @(posedge clk) begin // state old
	if(do_rst) old <= 1'b0;
	if(!do_rst) if(update_old) old <= new_old;
end
always_comb begin // combinatorial new_s
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	new_s = 1'bx;
	if(_update_D1) new_s = new_1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	new_s = new_s;
end
always_comb begin // combinatorial update_s
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	update_s = 1'bx;
	if(update) update_s = 1'b1;
	if(!update) update_s = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	update_s = update_s;
end
always_comb begin // combinatorial update_old
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	update_old = 1'bx;
	update_old = __LatencyOffset_out_D0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	update_old = update_old;
end
always_comb begin // combinatorial _LatencyOffset_in
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_in = 1'bx;
	_LatencyOffset_in = update_s;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_LatencyOffset_in = _LatencyOffset_in;
end
always_comb begin // combinatorial new_old
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	new_old = 1'bx;
	new_old = _LatencyOffset_2_out;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	new_old = new_old;
end
always_comb begin // combinatorial _LatencyOffset_2_in
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_2_in = 1'bx;
	_LatencyOffset_2_in = new_s;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_LatencyOffset_2_in = _LatencyOffset_2_in;
end
always_comb begin // combinatorial may_update
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_update = 1'bx;
	may_update = _7;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_update = may_update;
end
always_ff @(posedge clk) begin // state cooldown
	if(_10) cooldown <= _Repeat_result;
	if(!_10) cooldown[0] <= 1'b1;
end
always_comb begin // combinatorial _Repeat_v
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_v = 1'bx;
	if(_10) _Repeat_v = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_Repeat_v = _Repeat_v;
end
endmodule

// SlowState #(T: type bool #(), RESET_TO: false, OLD_DELAY: 0, NEW_DELAY: 0)
module SlowState_T_type_bool_RESET_TO_false_OLD_DELAY_0_NEW_DELAY_0(
	input clk,
	input wire rst,
	output /*state*/ logic old,
	output /*mux_wire*/ logic may_update,
	input wire update,
	input wire new_1
);

/*mux_wire*/ logic do_rst;
/*mux_wire*/ logic new_s;
/*mux_wire*/ logic update_s;
/*mux_wire*/ logic update_old;
/*mux_wire*/ logic _LatencyOffset_in;
wire _LatencyOffset_out;
/*mux_wire*/ logic new_old;
/*mux_wire*/ logic _LatencyOffset_2_in;
wire _LatencyOffset_2_out;
LatencyOffset_T_type_bool_OFFSET_0 LatencyOffset(
	.clk(clk),
	.in(_LatencyOffset_in),
	.out(_LatencyOffset_out)
);
LatencyOffset_T_type_bool_OFFSET_0 LatencyOffset_2(
	.clk(clk),
	.in(_LatencyOffset_2_in),
	.out(_LatencyOffset_2_out)
);
always_comb begin // combinatorial do_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	do_rst = 1'bx;
	do_rst = 1'b0;
	if(rst) do_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	do_rst = do_rst;
end
always_ff @(posedge clk) begin // state old
	if(do_rst) old <= 1'b0;
	if(!do_rst) if(update_old) old <= new_old;
end
always_comb begin // combinatorial new_s
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	new_s = 1'bx;
	if(update) new_s = new_1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	new_s = new_s;
end
always_comb begin // combinatorial update_s
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	update_s = 1'bx;
	if(update) update_s = 1'b1;
	if(!update) update_s = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	update_s = update_s;
end
always_comb begin // combinatorial update_old
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	update_old = 1'bx;
	update_old = _LatencyOffset_out;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	update_old = update_old;
end
always_comb begin // combinatorial _LatencyOffset_in
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_in = 1'bx;
	_LatencyOffset_in = update_s;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_LatencyOffset_in = _LatencyOffset_in;
end
always_comb begin // combinatorial new_old
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	new_old = 1'bx;
	new_old = _LatencyOffset_2_out;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	new_old = new_old;
end
always_comb begin // combinatorial _LatencyOffset_2_in
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_2_in = 1'bx;
	_LatencyOffset_2_in = new_s;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_LatencyOffset_2_in = _LatencyOffset_2_in;
end
always_comb begin // combinatorial may_update
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_update = 1'bx;
	may_update = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_update = may_update;
end
endmodule

// LatencyOffset #(T: type bool #(), OFFSET: 0)
module LatencyOffset_T_type_bool_OFFSET_0(
	input clk,
	input wire in,
	output /*mux_wire*/ logic out
);

	assign out = in;
endmodule

// SlowState #(T: type int #(FROM: 0, TO: 4611686018427387904), RESET_TO: 0, OLD_DELAY: 0, NEW_DELAY: 1)
module SlowState_T_type_int_FROM_0_TO_4611686018427387904_RESET_TO_0_OLD_DELAY_0_NEW_DELAY_1(
	input clk,
	input wire rst,
	output /*state*/ logic[61:0] old,
	output /*mux_wire*/ logic may_update,
	input wire update,
	input wire[61:0] new_1
);

/*latency*/ logic _update_D1; always_ff @(posedge clk) begin _update_D1 <= update; end
/*mux_wire*/ logic do_rst;
/*mux_wire*/ logic[61:0] new_s;
/*mux_wire*/ logic update_s;
/*mux_wire*/ logic update_old;
/*mux_wire*/ logic _LatencyOffset_in;
wire _LatencyOffset_out;
/*latency*/ logic __LatencyOffset_out_D0; always_ff @(posedge clk) begin __LatencyOffset_out_D0 <= _LatencyOffset_out; end
/*mux_wire*/ logic[61:0] new_old;
/*mux_wire*/ logic[61:0] _LatencyOffset_2_in;
wire[61:0] _LatencyOffset_2_out;
/*state*/ logic[0:0] cooldown;
wire _7 = cooldown[0];
wire _10;
assign _10 = update_s | do_rst;
/*mux_wire*/ logic _Repeat_v;
wire[0:0] _Repeat_result;
// (zero sized) _11
LatencyOffset_T_type_bool_OFFSET_1 LatencyOffset(
	.clk(clk),
	.in(_LatencyOffset_in),
	.out(_LatencyOffset_out)
);
LatencyOffset_T_type_int_FROM_0_TO_4611686018427387904_OFFSET_1 LatencyOffset_2(
	.clk(clk),
	.in(_LatencyOffset_2_in),
	.out(_LatencyOffset_2_out)
);
Repeat_T_type_bool_SIZE_1 Repeat(
	.clk(clk),
	.v(_Repeat_v),
	.result(_Repeat_result)
);
always_comb begin // combinatorial do_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	do_rst = 1'bx;
	do_rst = 1'b0;
	if(rst) do_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	do_rst = do_rst;
end
always_ff @(posedge clk) begin // state old
	if(do_rst) old <= 62'd0;
	if(!do_rst) if(update_old) old <= new_old;
end
always_comb begin // combinatorial new_s
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	new_s = 62'dx;
	if(_update_D1) new_s = new_1;
end
always_comb begin // combinatorial update_s
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	update_s = 1'bx;
	if(update) update_s = 1'b1;
	if(!update) update_s = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	update_s = update_s;
end
always_comb begin // combinatorial update_old
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	update_old = 1'bx;
	update_old = __LatencyOffset_out_D0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	update_old = update_old;
end
always_comb begin // combinatorial _LatencyOffset_in
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_in = 1'bx;
	_LatencyOffset_in = update_s;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_LatencyOffset_in = _LatencyOffset_in;
end
always_comb begin // combinatorial new_old
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	new_old = 62'dx;
	new_old = _LatencyOffset_2_out;
end
always_comb begin // combinatorial _LatencyOffset_2_in
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_LatencyOffset_2_in = 62'dx;
	_LatencyOffset_2_in = new_s;
end
always_comb begin // combinatorial may_update
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_update = 1'bx;
	may_update = _7;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_update = may_update;
end
always_ff @(posedge clk) begin // state cooldown
	if(_10) cooldown <= _Repeat_result;
	if(!_10) cooldown[0] <= 1'b1;
end
always_comb begin // combinatorial _Repeat_v
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_v = 1'bx;
	if(_10) _Repeat_v = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_Repeat_v = _Repeat_v;
end
endmodule

// Repeat #(T: type bool #(), SIZE: 1)
module Repeat_T_type_bool_SIZE_1(
	input clk,
	input wire v,
	output /*mux_wire*/ logic[0:0] result
);

always_comb begin // combinatorial result
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	result = 1'bx;
	result[0] = v;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	result = result;
end
endmodule

// LatencyOffset #(T: type int #(FROM: 0, TO: 4611686018427387904), OFFSET: -1)
module LatencyOffset_T_type_int_FROM_0_TO_4611686018427387904_OFFSET_1(
	input clk,
	input wire[61:0] in,
	output /*mux_wire*/ logic[61:0] out
);

	assign out = in;
endmodule

// LatencyOffset #(T: type bool #(), OFFSET: -1)
module LatencyOffset_T_type_bool_OFFSET_1(
	input clk,
	input wire in,
	output /*mux_wire*/ logic out
);

	assign out = in;
endmodule

