// THIS IS A GENERATED FILE (Generated at 2026-02-21T01:43:55+01:00)
// This file was generated with SUS Compiler 0.3.9-dev (8eadbc1503b4fb711370ce3617085cb6876e832f) built at 2026-02-21_01:37:05
// test_burst_writer #()
module test_burst_writer(
	input clk
);

write_burst_address_manager_AXI_WIDTH_512_ATO_18446744073709551616_NUM_PARALLEL_ELEMENTS_16_ADDR_QUEUE_SIZE_20_ADDR_MAY_PUSH_LATENCY_0_TOTAL_ELEMENTS_THAT_CAN_BE_STORED_2048 mgr(
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
axi_array_burst_writer_AXI_WIDTH_512_ADDR_ALIGN_4_ATO_18446744073709551616_MAY_PUSH_LATENCY_20_MAX_IN_FLIGHT_300 writer(
	.aclk(clk),
	.awvalid(),
	.awready(),
	.awaddr(),
	.awlen(),
	.awsize(),
	.awburst(),
	.awcache(),
	.awprot(),
	.awqos(),
	.awlock(),
	.awregion(),
	.wvalid(),
	.wready(),
	.wlast(),
	.wdata(),
	.wstrb(),
	.bvalid(),
	.bresp(),
	.bready(),
	.may_start_burst(),
	.start_burst(),
	.start_addr(),
	.write_has_been_committed(),
	.may_write(),
	.write(),
	.write_v(),
	.num_elems(),
	.is_last(),
	.rst()
);
endmodule

// axi_array_burst_writer #(AXI_WIDTH: 512, ADDR_ALIGN: 4, ATO: 18446744073709551616, MAY_PUSH_LATENCY: 20, MAX_IN_FLIGHT: 300)
module axi_array_burst_writer_AXI_WIDTH_512_ADDR_ALIGN_4_ATO_18446744073709551616_MAY_PUSH_LATENCY_20_MAX_IN_FLIGHT_300(
	input aclk,
	output /*mux_wire*/ logic awvalid,
	input wire awready,
	output /*mux_wire*/ logic[63:0] awaddr,
	output /*mux_wire*/ logic[7:0] awlen,
	output /*mux_wire*/ logic[2:0] awsize,
	output /*mux_wire*/ logic[1:0] awburst,
	output /*mux_wire*/ logic[3:0] awcache,
	output /*mux_wire*/ logic[2:0] awprot,
	output /*mux_wire*/ logic[3:0] awqos,
	output /*mux_wire*/ logic awlock,
	output /*mux_wire*/ logic[3:0] awregion,
	output /*mux_wire*/ logic wvalid,
	input wire wready,
	output /*mux_wire*/ logic wlast,
	output /*mux_wire*/ logic[511:0] wdata,
	output /*mux_wire*/ logic[63:0] wstrb,
	input wire bvalid,
	input wire[1:0] bresp,
	output /*mux_wire*/ logic bready,
	output /*mux_wire*/ logic may_start_burst,
	input wire start_burst,
	input wire[63:0] start_addr,
	output /*mux_wire*/ logic write_has_been_committed,
	output /*mux_wire*/ logic may_write,
	input wire write,
	input wire[31:0] write_v[15:0],
	input wire[4:0] num_elems,
	input wire is_last,
	input wire rst
);

localparam[1:0] _1 = 2'b01;
localparam[3:0] _2 = 4'b0010;
localparam[2:0] _3 = 3'b000;
wire _fifo_manager_wvalid;
/*mux_wire*/ logic _fifo_manager_wready;
wire _fifo_manager_wlast;
wire[511:0] _fifo_manager_wdata;
wire[63:0] _fifo_manager_wstrb;
/*mux_wire*/ logic[1:0] _;
wire _addr_manager_may_push_address;
/*mux_wire*/ logic _addr_manager_push_address;
/*mux_wire*/ logic[63:0] _addr_manager_new_addr;
wire _addr_manager_burst_available;
wire[5:0] _addr_manager_awlen;
wire[61:0] _addr_manager_awaddr;
wire[3:0] _addr_manager_start_offset;
wire[3:0] _addr_manager_end_offset;
wire _addr_manager_is_last;
/*mux_wire*/ logic[5:0] mgr_awlen;
/*mux_wire*/ logic[61:0] mgr_awaddr;
/*mux_wire*/ logic[3:0] mgr_start_offset;
/*mux_wire*/ logic[3:0] mgr_end_offset;
/*mux_wire*/ logic mgr_is_last;
wire _burst_is_last_fifo_may_push;
wire _21;
assign _21 = awready & _burst_is_last_fifo_may_push;
wire _fifo_manager_may_write_burst;
/*mux_wire*/ logic _fifo_manager_write_burst;
/*mux_wire*/ logic[5:0] _fifo_manager_transfer_awlen;
/*mux_wire*/ logic[3:0] _fifo_manager_start_offset;
/*mux_wire*/ logic[3:0] _fifo_manager_end_offset;
/*mux_wire*/ logic _addr_manager_accept_burst;
/*mux_wire*/ logic _burst_is_last_fifo_push;
/*mux_wire*/ logic _burst_is_last_fifo_push_data;
wire _burst_is_last_fifo_may_pop;
wire _36;
assign _36 = bvalid & bready;
/*mux_wire*/ logic last_burst_just_finished;
/*mux_wire*/ logic _burst_is_last_fifo_pop;
wire _burst_is_last_fifo_pop_data;
wire _fifo_manager_may_push;
/*mux_wire*/ logic[3:0] fifo_offset;
/*mux_wire*/ logic _addr_manager_push_elements;
/*mux_wire*/ logic[4:0] _addr_manager_num_elements;
/*mux_wire*/ logic _addr_manager_is_last_elem;
wire[3:0] _addr_manager_fifo_offset;
/*mux_wire*/ logic _fifo_manager_push;
/*mux_wire*/ logic[31:0] _fifo_manager_write_v[15:0];
/*mux_wire*/ logic[4:0] _fifo_manager_num_elems;
/*mux_wire*/ logic[3:0] _fifo_manager_fifo_offset;
/*mux_wire*/ logic _addr_manager_rst;
/*mux_wire*/ logic _fifo_manager_rst;
/*mux_wire*/ logic _burst_is_last_fifo_rst;
write_burst_address_manager_AXI_WIDTH_512_ATO_18446744073709551616_NUM_PARALLEL_ELEMENTS_16_ADDR_QUEUE_SIZE_20_ADDR_MAY_PUSH_LATENCY_1_TOTAL_ELEMENTS_THAT_CAN_BE_STORED_8192 addr_manager(
	.clk(aclk),
	.burst_available(_addr_manager_burst_available),
	.awlen(_addr_manager_awlen),
	.awaddr(_addr_manager_awaddr),
	.start_offset(_addr_manager_start_offset),
	.end_offset(_addr_manager_end_offset),
	.is_last(_addr_manager_is_last),
	.accept_burst(_addr_manager_accept_burst),
	.may_push_address(_addr_manager_may_push_address),
	.push_address(_addr_manager_push_address),
	.new_addr(_addr_manager_new_addr),
	.push_elements(_addr_manager_push_elements),
	.num_elements(_addr_manager_num_elements),
	.is_last_elem(_addr_manager_is_last_elem),
	.fifo_offset(_addr_manager_fifo_offset),
	.rst(_addr_manager_rst)
);
burst_write_fifo_manager_AXI_WIDTH_512_NUM_PARALLEL_ELEMENTS_16_MAX_BURST_64_DEPTH_512_MAY_PUSH_LATENCY_20 fifo_manager(
	.clk(aclk),
	.may_push(_fifo_manager_may_push),
	.push(_fifo_manager_push),
	.write_v(_fifo_manager_write_v),
	.num_elems(_fifo_manager_num_elems),
	.fifo_offset(_fifo_manager_fifo_offset),
	.wvalid(_fifo_manager_wvalid),
	.wready(_fifo_manager_wready),
	.wlast(_fifo_manager_wlast),
	.wdata(_fifo_manager_wdata),
	.wstrb(_fifo_manager_wstrb),
	.may_write_burst(_fifo_manager_may_write_burst),
	.write_burst(_fifo_manager_write_burst),
	.transfer_awlen(_fifo_manager_transfer_awlen),
	.start_offset(_fifo_manager_start_offset),
	.end_offset(_fifo_manager_end_offset),
	.rst(_fifo_manager_rst)
);
RippleFIFO_T_type_bool_DEPTH_5 burst_is_last_fifo(
	.push_dom(aclk),
	.may_push(_burst_is_last_fifo_may_push),
	.push(_burst_is_last_fifo_push),
	.push_data(_burst_is_last_fifo_push_data),
	.may_pop(_burst_is_last_fifo_may_pop),
	.pop(_burst_is_last_fifo_pop),
	.pop_data(_burst_is_last_fifo_pop_data),
	.rst(_burst_is_last_fifo_rst)
);
always_comb begin // combinatorial awvalid
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	awvalid = 1'bx;
	if(_addr_manager_burst_available) awvalid = 1'b1;
	if(!_addr_manager_burst_available) awvalid = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	awvalid = awvalid;
end
always_comb begin // combinatorial awaddr
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	awaddr = 64'dx;
	if(_addr_manager_burst_available) awaddr = mgr_awaddr;
end
always_comb begin // combinatorial awlen
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	awlen = 8'dx;
	if(_addr_manager_burst_available) awlen = mgr_awlen;
end
always_comb begin // combinatorial awsize
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	awsize = 3'dx;
	awsize = 3'd6;
end
always_comb begin // combinatorial awburst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	awburst = 2'bxx;
	awburst = _1;
end
always_comb begin // combinatorial awcache
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	awcache = 4'bxxxx;
	awcache = _2;
end
always_comb begin // combinatorial awprot
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	awprot = 3'bxxx;
	awprot = _3;
end
always_comb begin // combinatorial awqos
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	awqos = 4'dx;
	awqos = 1'd0;
end
always_comb begin // combinatorial awlock
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	awlock = 1'bx;
	awlock = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	awlock = awlock;
end
always_comb begin // combinatorial awregion
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	awregion = 4'dx;
	awregion = 1'd0;
end
always_comb begin // combinatorial wvalid
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	wvalid = 1'bx;
	wvalid = _fifo_manager_wvalid;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	wvalid = wvalid;
end
always_comb begin // combinatorial _fifo_manager_wready
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_manager_wready = 1'bx;
	_fifo_manager_wready = wready;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_manager_wready = _fifo_manager_wready;
end
always_comb begin // combinatorial wlast
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	wlast = 1'bx;
	wlast = _fifo_manager_wlast;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	wlast = wlast;
end
always_comb begin // combinatorial wdata
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	wdata = 512'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	wdata = _fifo_manager_wdata;
end
always_comb begin // combinatorial wstrb
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	wstrb = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	wstrb = _fifo_manager_wstrb;
end
always_comb begin // combinatorial _
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_ = 2'bxx;
	_ = bresp;
end
always_comb begin // combinatorial bready
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	bready = 1'bx;
	bready = _burst_is_last_fifo_may_pop;
	if(rst) bready = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	bready = bready;
end
always_comb begin // combinatorial may_start_burst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_start_burst = 1'bx;
	may_start_burst = 1'b0;
	if(_addr_manager_may_push_address) may_start_burst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_start_burst = may_start_burst;
end
always_comb begin // combinatorial _addr_manager_push_address
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_addr_manager_push_address = 1'bx;
	_addr_manager_push_address = 1'b0;
	if(start_burst) _addr_manager_push_address = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_addr_manager_push_address = _addr_manager_push_address;
end
always_comb begin // combinatorial _addr_manager_new_addr
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_addr_manager_new_addr = 64'dx;
	if(start_burst) _addr_manager_new_addr = start_addr;
end
always_comb begin // combinatorial mgr_awlen
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	mgr_awlen = 6'dx;
	if(_addr_manager_burst_available) mgr_awlen = _addr_manager_awlen;
end
always_comb begin // combinatorial mgr_awaddr
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	mgr_awaddr = 62'dx;
	if(_addr_manager_burst_available) mgr_awaddr = _addr_manager_awaddr;
end
always_comb begin // combinatorial mgr_start_offset
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	mgr_start_offset = 4'dx;
	if(_addr_manager_burst_available) mgr_start_offset = _addr_manager_start_offset;
end
always_comb begin // combinatorial mgr_end_offset
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	mgr_end_offset = 4'dx;
	if(_addr_manager_burst_available) mgr_end_offset = _addr_manager_end_offset;
end
always_comb begin // combinatorial mgr_is_last
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	mgr_is_last = 1'bx;
	if(_addr_manager_burst_available) mgr_is_last = _addr_manager_is_last;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	mgr_is_last = mgr_is_last;
end
always_comb begin // combinatorial _fifo_manager_write_burst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_manager_write_burst = 1'bx;
	_fifo_manager_write_burst = 1'b0;
	if(_addr_manager_burst_available) if(_21) if(_fifo_manager_may_write_burst) _fifo_manager_write_burst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_manager_write_burst = _fifo_manager_write_burst;
end
always_comb begin // combinatorial _fifo_manager_transfer_awlen
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_manager_transfer_awlen = 6'dx;
	if(_addr_manager_burst_available) if(_21) if(_fifo_manager_may_write_burst) _fifo_manager_transfer_awlen = mgr_awlen;
end
always_comb begin // combinatorial _fifo_manager_start_offset
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_manager_start_offset = 4'dx;
	if(_addr_manager_burst_available) if(_21) if(_fifo_manager_may_write_burst) _fifo_manager_start_offset = mgr_start_offset;
end
always_comb begin // combinatorial _fifo_manager_end_offset
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_manager_end_offset = 4'dx;
	if(_addr_manager_burst_available) if(_21) if(_fifo_manager_may_write_burst) _fifo_manager_end_offset = mgr_end_offset;
end
always_comb begin // combinatorial _addr_manager_accept_burst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_addr_manager_accept_burst = 1'bx;
	_addr_manager_accept_burst = 1'b0;
	if(_addr_manager_burst_available) if(_21) if(_fifo_manager_may_write_burst) _addr_manager_accept_burst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_addr_manager_accept_burst = _addr_manager_accept_burst;
end
always_comb begin // combinatorial _burst_is_last_fifo_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_burst_is_last_fifo_push = 1'bx;
	_burst_is_last_fifo_push = 1'b0;
	if(_addr_manager_burst_available) if(_21) if(_fifo_manager_may_write_burst) _burst_is_last_fifo_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_burst_is_last_fifo_push = _burst_is_last_fifo_push;
end
always_comb begin // combinatorial _burst_is_last_fifo_push_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_burst_is_last_fifo_push_data = 1'bx;
	if(_addr_manager_burst_available) if(_21) if(_fifo_manager_may_write_burst) _burst_is_last_fifo_push_data = mgr_is_last;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_burst_is_last_fifo_push_data = _burst_is_last_fifo_push_data;
end
always_comb begin // combinatorial write_has_been_committed
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	write_has_been_committed = 1'bx;
	write_has_been_committed = 1'b0;
	if(_36) if(last_burst_just_finished) write_has_been_committed = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	write_has_been_committed = write_has_been_committed;
end
always_comb begin // combinatorial last_burst_just_finished
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	last_burst_just_finished = 1'bx;
	if(_36) last_burst_just_finished = _burst_is_last_fifo_pop_data;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	last_burst_just_finished = last_burst_just_finished;
end
always_comb begin // combinatorial _burst_is_last_fifo_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_burst_is_last_fifo_pop = 1'bx;
	_burst_is_last_fifo_pop = 1'b0;
	if(_36) _burst_is_last_fifo_pop = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_burst_is_last_fifo_pop = _burst_is_last_fifo_pop;
end
always_comb begin // combinatorial may_write
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_write = 1'bx;
	may_write = _fifo_manager_may_push;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_write = may_write;
end
always_comb begin // combinatorial fifo_offset
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	fifo_offset = 4'dx;
	if(write) fifo_offset = _addr_manager_fifo_offset;
end
always_comb begin // combinatorial _addr_manager_push_elements
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_addr_manager_push_elements = 1'bx;
	_addr_manager_push_elements = 1'b0;
	if(write) _addr_manager_push_elements = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_addr_manager_push_elements = _addr_manager_push_elements;
end
always_comb begin // combinatorial _addr_manager_num_elements
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_addr_manager_num_elements = 5'dx;
	if(write) _addr_manager_num_elements = num_elems;
end
always_comb begin // combinatorial _addr_manager_is_last_elem
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_addr_manager_is_last_elem = 1'bx;
	if(write) _addr_manager_is_last_elem = is_last;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_addr_manager_is_last_elem = _addr_manager_is_last_elem;
end
always_comb begin // combinatorial _fifo_manager_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_manager_push = 1'bx;
	_fifo_manager_push = 1'b0;
	if(write) _fifo_manager_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_manager_push = _fifo_manager_push;
end
always_comb begin // combinatorial _fifo_manager_write_v
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_manager_write_v = '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx};
	for(int _v0 = 0; _v0 < 16; _v0 = _v0 + 1) begin
if(write) _fifo_manager_write_v[_v0] = write_v[_v0];
end
end
always_comb begin // combinatorial _fifo_manager_num_elems
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_manager_num_elems = 5'dx;
	if(write) _fifo_manager_num_elems = num_elems;
end
always_comb begin // combinatorial _fifo_manager_fifo_offset
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_manager_fifo_offset = 4'dx;
	if(write) _fifo_manager_fifo_offset = fifo_offset;
end
always_comb begin // combinatorial _addr_manager_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_addr_manager_rst = 1'bx;
	_addr_manager_rst = 1'b0;
	if(rst) _addr_manager_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_addr_manager_rst = _addr_manager_rst;
end
always_comb begin // combinatorial _fifo_manager_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_manager_rst = 1'bx;
	_fifo_manager_rst = 1'b0;
	if(rst) _fifo_manager_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_manager_rst = _fifo_manager_rst;
end
always_comb begin // combinatorial _burst_is_last_fifo_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_burst_is_last_fifo_rst = 1'bx;
	_burst_is_last_fifo_rst = 1'b0;
	if(rst) _burst_is_last_fifo_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_burst_is_last_fifo_rst = _burst_is_last_fifo_rst;
end
endmodule

// RippleFIFO #(T: type bool #(), DEPTH: 5)
module RippleFIFO_T_type_bool_DEPTH_5(
	input push_dom,
	output /*mux_wire*/ logic may_push,
	input wire push,
	input wire push_data,
	output /*mux_wire*/ logic may_pop,
	input wire pop,
	output /*mux_wire*/ logic pop_data,
	input wire rst
);

/*state*/ logic[4:0] datas;
/*state*/ logic[4:0] valids;
wire _1 = valids[1];
wire _2;
assign _2 = !_1;
wire _3 = valids[0];
wire _4;
assign _4 = _2 & _3;
wire _5 = datas[0];
wire _6 = valids[2];
wire _7;
assign _7 = !_6;
wire _8 = valids[1];
wire _9;
assign _9 = _7 & _8;
wire _10 = datas[1];
wire _11 = valids[3];
wire _12;
assign _12 = !_11;
wire _13 = valids[2];
wire _14;
assign _14 = _12 & _13;
wire _15 = datas[2];
wire _16 = valids[4];
wire _17;
assign _17 = !_16;
wire _18 = valids[3];
wire _19;
assign _19 = _17 & _18;
wire _20 = datas[3];
wire _21 = valids[0];
wire _22;
assign _22 = !_21;
wire _24 = valids[4];
wire _25 = datas[4];
always_ff @(posedge push_dom) begin // state datas
	if(_4) datas[1] <= _5;
	if(_9) datas[2] <= _10;
	if(_14) datas[3] <= _15;
	if(_19) datas[4] <= _20;
	if(push) datas[0] <= push_data;
end
always_ff @(posedge push_dom) begin // state valids
	if(_4) valids[1] <= 1'b1;
	if(_4) valids[0] <= 1'b0;
	if(_9) valids[2] <= 1'b1;
	if(_9) valids[1] <= 1'b0;
	if(_14) valids[3] <= 1'b1;
	if(_14) valids[2] <= 1'b0;
	if(_19) valids[4] <= 1'b1;
	if(_19) valids[3] <= 1'b0;
	if(push) valids[0] <= 1'b1;
	if(pop) valids[4] <= 1'b0;
	if(rst) valids[0] <= 1'b0;
	if(rst) valids[1] <= 1'b0;
	if(rst) valids[2] <= 1'b0;
	if(rst) valids[3] <= 1'b0;
	if(rst) valids[4] <= 1'b0;
end
always_comb begin // combinatorial may_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_push = 1'bx;
	may_push = _22;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_push = may_push;
end
always_comb begin // combinatorial may_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_pop = 1'bx;
	may_pop = _24;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_pop = may_pop;
end
always_comb begin // combinatorial pop_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_data = 1'bx;
	if(pop) pop_data = _25;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	pop_data = pop_data;
end
endmodule

// burst_write_fifo_manager #(AXI_WIDTH: 512, NUM_PARALLEL_ELEMENTS: 16, MAX_BURST: 64, DEPTH: 512, MAY_PUSH_LATENCY: 20)
module burst_write_fifo_manager_AXI_WIDTH_512_NUM_PARALLEL_ELEMENTS_16_MAX_BURST_64_DEPTH_512_MAY_PUSH_LATENCY_20(
	input clk,
	output /*mux_wire*/ logic may_push,
	input wire push,
	input wire[31:0] write_v[15:0],
	input wire[4:0] num_elems,
	input wire[3:0] fifo_offset,
	output /*mux_wire*/ logic wvalid,
	input wire wready,
	output /*state*/ logic wlast,
	output /*mux_wire*/ logic[511:0] wdata,
	output /*mux_wire*/ logic[63:0] wstrb,
	output /*mux_wire*/ logic may_write_burst,
	input wire write_burst,
	input wire[5:0] transfer_awlen,
	input wire[3:0] start_offset,
	input wire[3:0] end_offset,
	input wire rst
);

/*mux_wire*/ logic do_rst;
/*state*/ logic[5:0] transfers_remaining;
/*state*/ logic pop_strobe_valid;
/*state*/ logic[15:0] pop_strobe;
/*state*/ logic[3:0] stored_end_offset;
/*mux_wire*/ logic[31:0] push_elements[15:0];
/*mux_wire*/ logic[15:0] push_strobe;
/*mux_wire*/ logic[15:0] may_pushes;
wire _2;
assign _2 = &may_pushes;
/*mux_wire*/ logic[31:0] _RotateRight_data[15:0];
/*mux_wire*/ logic[3:0] _RotateRight_offset;
wire[31:0] _RotateRight_rotated_data[15:0];
/*mux_wire*/ logic[3:0] _MakeStrobe_chunk_offset;
/*mux_wire*/ logic[4:0] _MakeStrobe_chunk_length;
wire[15:0] _MakeStrobe_strobe;
/*mux_wire*/ logic _Repeat_v;
wire[15:0] _Repeat_result;
wire _7 = pop_strobe[0];
wire _8 = pop_strobe[0];
wire _9 = pop_strobe[0];
wire _10 = pop_strobe[0];
wire _11 = pop_strobe[1];
wire _12 = pop_strobe[1];
wire _13 = pop_strobe[1];
wire _14 = pop_strobe[1];
wire _15 = pop_strobe[2];
wire _16 = pop_strobe[2];
wire _17 = pop_strobe[2];
wire _18 = pop_strobe[2];
wire _19 = pop_strobe[3];
wire _20 = pop_strobe[3];
wire _21 = pop_strobe[3];
wire _22 = pop_strobe[3];
wire _23 = pop_strobe[4];
wire _24 = pop_strobe[4];
wire _25 = pop_strobe[4];
wire _26 = pop_strobe[4];
wire _27 = pop_strobe[5];
wire _28 = pop_strobe[5];
wire _29 = pop_strobe[5];
wire _30 = pop_strobe[5];
wire _31 = pop_strobe[6];
wire _32 = pop_strobe[6];
wire _33 = pop_strobe[6];
wire _34 = pop_strobe[6];
wire _35 = pop_strobe[7];
wire _36 = pop_strobe[7];
wire _37 = pop_strobe[7];
wire _38 = pop_strobe[7];
wire _39 = pop_strobe[8];
wire _40 = pop_strobe[8];
wire _41 = pop_strobe[8];
wire _42 = pop_strobe[8];
wire _43 = pop_strobe[9];
wire _44 = pop_strobe[9];
wire _45 = pop_strobe[9];
wire _46 = pop_strobe[9];
wire _47 = pop_strobe[10];
wire _48 = pop_strobe[10];
wire _49 = pop_strobe[10];
wire _50 = pop_strobe[10];
wire _51 = pop_strobe[11];
wire _52 = pop_strobe[11];
wire _53 = pop_strobe[11];
wire _54 = pop_strobe[11];
wire _55 = pop_strobe[12];
wire _56 = pop_strobe[12];
wire _57 = pop_strobe[12];
wire _58 = pop_strobe[12];
wire _59 = pop_strobe[13];
wire _60 = pop_strobe[13];
wire _61 = pop_strobe[13];
wire _62 = pop_strobe[13];
wire _63 = pop_strobe[14];
wire _64 = pop_strobe[14];
wire _65 = pop_strobe[14];
wire _66 = pop_strobe[14];
wire _67 = pop_strobe[15];
wire _68 = pop_strobe[15];
wire _69 = pop_strobe[15];
wire _70 = pop_strobe[15];
/*mux_wire*/ logic[15:0] pop_available;
/*mux_wire*/ logic _Repeat_2_v;
wire[15:0] _Repeat_2_result;
wire[15:0] _73;
assign _73 = !pop_strobe;
wire[15:0] _74;
assign _74 = pop_available | _73;
wire _75;
assign _75 = &_74;
wire _77;
assign _77 = _75 & pop_strobe_valid;
/*mux_wire*/ logic do_commit_pop;
wire _80;
assign _80 = wvalid & wready;
wire _81 = push_strobe[0];
wire[31:0] _82 = push_elements[0];
/*mux_wire*/ logic _fifo_push;
/*mux_wire*/ logic[31:0] _fifo_push_data;
wire _fifo_may_push;
wire _fifo_pop_available;
wire[31:0] _fifo_pop_data;
/*mux_wire*/ logic[31:0] pop_data;
wire _88 = pop_strobe[0];
wire _89;
assign _89 = do_commit_pop & _88;
/*mux_wire*/ logic _fifo_pop;
/*mux_wire*/ logic _fifo_rst;
wire _95 = push_strobe[1];
wire[31:0] _96 = push_elements[1];
/*mux_wire*/ logic _fifo_2_push;
/*mux_wire*/ logic[31:0] _fifo_2_push_data;
wire _fifo_2_may_push;
wire _fifo_2_pop_available;
wire[31:0] _fifo_2_pop_data;
/*mux_wire*/ logic[31:0] pop_data_2;
wire _102 = pop_strobe[1];
wire _103;
assign _103 = do_commit_pop & _102;
/*mux_wire*/ logic _fifo_2_pop;
/*mux_wire*/ logic _fifo_2_rst;
wire _109 = push_strobe[2];
wire[31:0] _110 = push_elements[2];
/*mux_wire*/ logic _fifo_3_push;
/*mux_wire*/ logic[31:0] _fifo_3_push_data;
wire _fifo_3_may_push;
wire _fifo_3_pop_available;
wire[31:0] _fifo_3_pop_data;
/*mux_wire*/ logic[31:0] pop_data_3;
wire _116 = pop_strobe[2];
wire _117;
assign _117 = do_commit_pop & _116;
/*mux_wire*/ logic _fifo_3_pop;
/*mux_wire*/ logic _fifo_3_rst;
wire _123 = push_strobe[3];
wire[31:0] _124 = push_elements[3];
/*mux_wire*/ logic _fifo_4_push;
/*mux_wire*/ logic[31:0] _fifo_4_push_data;
wire _fifo_4_may_push;
wire _fifo_4_pop_available;
wire[31:0] _fifo_4_pop_data;
/*mux_wire*/ logic[31:0] pop_data_4;
wire _130 = pop_strobe[3];
wire _131;
assign _131 = do_commit_pop & _130;
/*mux_wire*/ logic _fifo_4_pop;
/*mux_wire*/ logic _fifo_4_rst;
wire _137 = push_strobe[4];
wire[31:0] _138 = push_elements[4];
/*mux_wire*/ logic _fifo_5_push;
/*mux_wire*/ logic[31:0] _fifo_5_push_data;
wire _fifo_5_may_push;
wire _fifo_5_pop_available;
wire[31:0] _fifo_5_pop_data;
/*mux_wire*/ logic[31:0] pop_data_5;
wire _144 = pop_strobe[4];
wire _145;
assign _145 = do_commit_pop & _144;
/*mux_wire*/ logic _fifo_5_pop;
/*mux_wire*/ logic _fifo_5_rst;
wire _151 = push_strobe[5];
wire[31:0] _152 = push_elements[5];
/*mux_wire*/ logic _fifo_6_push;
/*mux_wire*/ logic[31:0] _fifo_6_push_data;
wire _fifo_6_may_push;
wire _fifo_6_pop_available;
wire[31:0] _fifo_6_pop_data;
/*mux_wire*/ logic[31:0] pop_data_6;
wire _158 = pop_strobe[5];
wire _159;
assign _159 = do_commit_pop & _158;
/*mux_wire*/ logic _fifo_6_pop;
/*mux_wire*/ logic _fifo_6_rst;
wire _165 = push_strobe[6];
wire[31:0] _166 = push_elements[6];
/*mux_wire*/ logic _fifo_7_push;
/*mux_wire*/ logic[31:0] _fifo_7_push_data;
wire _fifo_7_may_push;
wire _fifo_7_pop_available;
wire[31:0] _fifo_7_pop_data;
/*mux_wire*/ logic[31:0] pop_data_7;
wire _172 = pop_strobe[6];
wire _173;
assign _173 = do_commit_pop & _172;
/*mux_wire*/ logic _fifo_7_pop;
/*mux_wire*/ logic _fifo_7_rst;
wire _179 = push_strobe[7];
wire[31:0] _180 = push_elements[7];
/*mux_wire*/ logic _fifo_8_push;
/*mux_wire*/ logic[31:0] _fifo_8_push_data;
wire _fifo_8_may_push;
wire _fifo_8_pop_available;
wire[31:0] _fifo_8_pop_data;
/*mux_wire*/ logic[31:0] pop_data_8;
wire _186 = pop_strobe[7];
wire _187;
assign _187 = do_commit_pop & _186;
/*mux_wire*/ logic _fifo_8_pop;
/*mux_wire*/ logic _fifo_8_rst;
wire _193 = push_strobe[8];
wire[31:0] _194 = push_elements[8];
/*mux_wire*/ logic _fifo_9_push;
/*mux_wire*/ logic[31:0] _fifo_9_push_data;
wire _fifo_9_may_push;
wire _fifo_9_pop_available;
wire[31:0] _fifo_9_pop_data;
/*mux_wire*/ logic[31:0] pop_data_9;
wire _200 = pop_strobe[8];
wire _201;
assign _201 = do_commit_pop & _200;
/*mux_wire*/ logic _fifo_9_pop;
/*mux_wire*/ logic _fifo_9_rst;
wire _207 = push_strobe[9];
wire[31:0] _208 = push_elements[9];
/*mux_wire*/ logic _fifo_10_push;
/*mux_wire*/ logic[31:0] _fifo_10_push_data;
wire _fifo_10_may_push;
wire _fifo_10_pop_available;
wire[31:0] _fifo_10_pop_data;
/*mux_wire*/ logic[31:0] pop_data_10;
wire _214 = pop_strobe[9];
wire _215;
assign _215 = do_commit_pop & _214;
/*mux_wire*/ logic _fifo_10_pop;
/*mux_wire*/ logic _fifo_10_rst;
wire _221 = push_strobe[10];
wire[31:0] _222 = push_elements[10];
/*mux_wire*/ logic _fifo_11_push;
/*mux_wire*/ logic[31:0] _fifo_11_push_data;
wire _fifo_11_may_push;
wire _fifo_11_pop_available;
wire[31:0] _fifo_11_pop_data;
/*mux_wire*/ logic[31:0] pop_data_11;
wire _228 = pop_strobe[10];
wire _229;
assign _229 = do_commit_pop & _228;
/*mux_wire*/ logic _fifo_11_pop;
/*mux_wire*/ logic _fifo_11_rst;
wire _235 = push_strobe[11];
wire[31:0] _236 = push_elements[11];
/*mux_wire*/ logic _fifo_12_push;
/*mux_wire*/ logic[31:0] _fifo_12_push_data;
wire _fifo_12_may_push;
wire _fifo_12_pop_available;
wire[31:0] _fifo_12_pop_data;
/*mux_wire*/ logic[31:0] pop_data_12;
wire _242 = pop_strobe[11];
wire _243;
assign _243 = do_commit_pop & _242;
/*mux_wire*/ logic _fifo_12_pop;
/*mux_wire*/ logic _fifo_12_rst;
wire _249 = push_strobe[12];
wire[31:0] _250 = push_elements[12];
/*mux_wire*/ logic _fifo_13_push;
/*mux_wire*/ logic[31:0] _fifo_13_push_data;
wire _fifo_13_may_push;
wire _fifo_13_pop_available;
wire[31:0] _fifo_13_pop_data;
/*mux_wire*/ logic[31:0] pop_data_13;
wire _256 = pop_strobe[12];
wire _257;
assign _257 = do_commit_pop & _256;
/*mux_wire*/ logic _fifo_13_pop;
/*mux_wire*/ logic _fifo_13_rst;
wire _263 = push_strobe[13];
wire[31:0] _264 = push_elements[13];
/*mux_wire*/ logic _fifo_14_push;
/*mux_wire*/ logic[31:0] _fifo_14_push_data;
wire _fifo_14_may_push;
wire _fifo_14_pop_available;
wire[31:0] _fifo_14_pop_data;
/*mux_wire*/ logic[31:0] pop_data_14;
wire _270 = pop_strobe[13];
wire _271;
assign _271 = do_commit_pop & _270;
/*mux_wire*/ logic _fifo_14_pop;
/*mux_wire*/ logic _fifo_14_rst;
wire _277 = push_strobe[14];
wire[31:0] _278 = push_elements[14];
/*mux_wire*/ logic _fifo_15_push;
/*mux_wire*/ logic[31:0] _fifo_15_push_data;
wire _fifo_15_may_push;
wire _fifo_15_pop_available;
wire[31:0] _fifo_15_pop_data;
/*mux_wire*/ logic[31:0] pop_data_15;
wire _284 = pop_strobe[14];
wire _285;
assign _285 = do_commit_pop & _284;
/*mux_wire*/ logic _fifo_15_pop;
/*mux_wire*/ logic _fifo_15_rst;
wire _291 = push_strobe[15];
wire[31:0] _292 = push_elements[15];
/*mux_wire*/ logic _fifo_16_push;
/*mux_wire*/ logic[31:0] _fifo_16_push_data;
wire _fifo_16_may_push;
wire _fifo_16_pop_available;
wire[31:0] _fifo_16_pop_data;
/*mux_wire*/ logic[31:0] pop_data_16;
wire _298 = pop_strobe[15];
wire _299;
assign _299 = do_commit_pop & _298;
/*mux_wire*/ logic _fifo_16_pop;
/*mux_wire*/ logic _fifo_16_rst;
wire _308;
assign _308 = wvalid & wready;
wire _310;
assign _310 = !pop_strobe_valid;
wire _311;
assign _311 = _308 | _310;
wire _314;
assign _314 = transfers_remaining == 1'd0;
wire signed[6:0] _318;
assign _318 = transfers_remaining - 1'd1;
/*mux_wire*/ logic signed[6:0] _IntNarrow_in;
wire[5:0] _IntNarrow_out;
wire _321;
assign _321 = transfers_remaining == 1'd1;
/*mux_wire*/ logic[4:0] _MakeMask_up_to;
wire[15:0] _MakeMask_bits;
/*mux_wire*/ logic _Repeat_3_v;
wire[15:0] _Repeat_3_result;
/*mux_wire*/ logic[15:0] lower_mask;
/*mux_wire*/ logic[4:0] _MakeMask_2_up_to;
wire[15:0] _MakeMask_2_bits;
wire[15:0] _326;
assign _326 = !_MakeMask_2_bits;
/*mux_wire*/ logic[15:0] upper_mask;
/*mux_wire*/ logic[4:0] _MakeMask_3_up_to;
wire[15:0] _MakeMask_3_bits;
wire _330;
assign _330 = transfer_awlen == 1'd0;
wire[15:0] _333;
assign _333 = upper_mask & lower_mask;
RotateRight_T_type_bool_32_ARRAY_LEN_16 RotateRight(
	.clk(clk),
	.data(_RotateRight_data),
	.offset(_RotateRight_offset),
	.rotated_data(_RotateRight_rotated_data)
);
MakeStrobe_STROBE_WIDTH_16 MakeStrobe(
	.clk(clk),
	.chunk_offset(_MakeStrobe_chunk_offset),
	.chunk_length(_MakeStrobe_chunk_length),
	.strobe(_MakeStrobe_strobe)
);
Repeat_T_type_bool_SIZE_16 Repeat(
	.clk(clk),
	.v(_Repeat_v),
	.result(_Repeat_result)
);
Repeat_T_type_bool_SIZE_16 Repeat_2(
	.clk(clk),
	.v(_Repeat_2_v),
	.result(_Repeat_2_result)
);
FWFT_T_type_bool_32_DEPTH_512_MAY_PUSH_LATENCY_20 fifo(
	.clk(clk),
	.rst(_fifo_rst),
	.may_push(_fifo_may_push),
	.push(_fifo_push),
	.push_data(_fifo_push_data),
	.pop_available(_fifo_pop_available),
	.pop_data(_fifo_pop_data),
	.pop(_fifo_pop)
);
FWFT_T_type_bool_32_DEPTH_512_MAY_PUSH_LATENCY_20 fifo_2(
	.clk(clk),
	.rst(_fifo_2_rst),
	.may_push(_fifo_2_may_push),
	.push(_fifo_2_push),
	.push_data(_fifo_2_push_data),
	.pop_available(_fifo_2_pop_available),
	.pop_data(_fifo_2_pop_data),
	.pop(_fifo_2_pop)
);
FWFT_T_type_bool_32_DEPTH_512_MAY_PUSH_LATENCY_20 fifo_3(
	.clk(clk),
	.rst(_fifo_3_rst),
	.may_push(_fifo_3_may_push),
	.push(_fifo_3_push),
	.push_data(_fifo_3_push_data),
	.pop_available(_fifo_3_pop_available),
	.pop_data(_fifo_3_pop_data),
	.pop(_fifo_3_pop)
);
FWFT_T_type_bool_32_DEPTH_512_MAY_PUSH_LATENCY_20 fifo_4(
	.clk(clk),
	.rst(_fifo_4_rst),
	.may_push(_fifo_4_may_push),
	.push(_fifo_4_push),
	.push_data(_fifo_4_push_data),
	.pop_available(_fifo_4_pop_available),
	.pop_data(_fifo_4_pop_data),
	.pop(_fifo_4_pop)
);
FWFT_T_type_bool_32_DEPTH_512_MAY_PUSH_LATENCY_20 fifo_5(
	.clk(clk),
	.rst(_fifo_5_rst),
	.may_push(_fifo_5_may_push),
	.push(_fifo_5_push),
	.push_data(_fifo_5_push_data),
	.pop_available(_fifo_5_pop_available),
	.pop_data(_fifo_5_pop_data),
	.pop(_fifo_5_pop)
);
FWFT_T_type_bool_32_DEPTH_512_MAY_PUSH_LATENCY_20 fifo_6(
	.clk(clk),
	.rst(_fifo_6_rst),
	.may_push(_fifo_6_may_push),
	.push(_fifo_6_push),
	.push_data(_fifo_6_push_data),
	.pop_available(_fifo_6_pop_available),
	.pop_data(_fifo_6_pop_data),
	.pop(_fifo_6_pop)
);
FWFT_T_type_bool_32_DEPTH_512_MAY_PUSH_LATENCY_20 fifo_7(
	.clk(clk),
	.rst(_fifo_7_rst),
	.may_push(_fifo_7_may_push),
	.push(_fifo_7_push),
	.push_data(_fifo_7_push_data),
	.pop_available(_fifo_7_pop_available),
	.pop_data(_fifo_7_pop_data),
	.pop(_fifo_7_pop)
);
FWFT_T_type_bool_32_DEPTH_512_MAY_PUSH_LATENCY_20 fifo_8(
	.clk(clk),
	.rst(_fifo_8_rst),
	.may_push(_fifo_8_may_push),
	.push(_fifo_8_push),
	.push_data(_fifo_8_push_data),
	.pop_available(_fifo_8_pop_available),
	.pop_data(_fifo_8_pop_data),
	.pop(_fifo_8_pop)
);
FWFT_T_type_bool_32_DEPTH_512_MAY_PUSH_LATENCY_20 fifo_9(
	.clk(clk),
	.rst(_fifo_9_rst),
	.may_push(_fifo_9_may_push),
	.push(_fifo_9_push),
	.push_data(_fifo_9_push_data),
	.pop_available(_fifo_9_pop_available),
	.pop_data(_fifo_9_pop_data),
	.pop(_fifo_9_pop)
);
FWFT_T_type_bool_32_DEPTH_512_MAY_PUSH_LATENCY_20 fifo_10(
	.clk(clk),
	.rst(_fifo_10_rst),
	.may_push(_fifo_10_may_push),
	.push(_fifo_10_push),
	.push_data(_fifo_10_push_data),
	.pop_available(_fifo_10_pop_available),
	.pop_data(_fifo_10_pop_data),
	.pop(_fifo_10_pop)
);
FWFT_T_type_bool_32_DEPTH_512_MAY_PUSH_LATENCY_20 fifo_11(
	.clk(clk),
	.rst(_fifo_11_rst),
	.may_push(_fifo_11_may_push),
	.push(_fifo_11_push),
	.push_data(_fifo_11_push_data),
	.pop_available(_fifo_11_pop_available),
	.pop_data(_fifo_11_pop_data),
	.pop(_fifo_11_pop)
);
FWFT_T_type_bool_32_DEPTH_512_MAY_PUSH_LATENCY_20 fifo_12(
	.clk(clk),
	.rst(_fifo_12_rst),
	.may_push(_fifo_12_may_push),
	.push(_fifo_12_push),
	.push_data(_fifo_12_push_data),
	.pop_available(_fifo_12_pop_available),
	.pop_data(_fifo_12_pop_data),
	.pop(_fifo_12_pop)
);
FWFT_T_type_bool_32_DEPTH_512_MAY_PUSH_LATENCY_20 fifo_13(
	.clk(clk),
	.rst(_fifo_13_rst),
	.may_push(_fifo_13_may_push),
	.push(_fifo_13_push),
	.push_data(_fifo_13_push_data),
	.pop_available(_fifo_13_pop_available),
	.pop_data(_fifo_13_pop_data),
	.pop(_fifo_13_pop)
);
FWFT_T_type_bool_32_DEPTH_512_MAY_PUSH_LATENCY_20 fifo_14(
	.clk(clk),
	.rst(_fifo_14_rst),
	.may_push(_fifo_14_may_push),
	.push(_fifo_14_push),
	.push_data(_fifo_14_push_data),
	.pop_available(_fifo_14_pop_available),
	.pop_data(_fifo_14_pop_data),
	.pop(_fifo_14_pop)
);
FWFT_T_type_bool_32_DEPTH_512_MAY_PUSH_LATENCY_20 fifo_15(
	.clk(clk),
	.rst(_fifo_15_rst),
	.may_push(_fifo_15_may_push),
	.push(_fifo_15_push),
	.push_data(_fifo_15_push_data),
	.pop_available(_fifo_15_pop_available),
	.pop_data(_fifo_15_pop_data),
	.pop(_fifo_15_pop)
);
FWFT_T_type_bool_32_DEPTH_512_MAY_PUSH_LATENCY_20 fifo_16(
	.clk(clk),
	.rst(_fifo_16_rst),
	.may_push(_fifo_16_may_push),
	.push(_fifo_16_push),
	.push_data(_fifo_16_push_data),
	.pop_available(_fifo_16_pop_available),
	.pop_data(_fifo_16_pop_data),
	.pop(_fifo_16_pop)
);
IntNarrow_FROM_I_1_TO_I_63_FROM_0_TO_64 IntNarrow(
	.clk(clk),
	.in(_IntNarrow_in),
	.out(_IntNarrow_out)
);
MakeMask_SIZE_16 MakeMask(
	.clk(clk),
	.up_to(_MakeMask_up_to),
	.bits(_MakeMask_bits)
);
Repeat_T_type_bool_SIZE_16 Repeat_3(
	.clk(clk),
	.v(_Repeat_3_v),
	.result(_Repeat_3_result)
);
MakeMask_SIZE_16 MakeMask_2(
	.clk(clk),
	.up_to(_MakeMask_2_up_to),
	.bits(_MakeMask_2_bits)
);
MakeMask_SIZE_16 MakeMask_3(
	.clk(clk),
	.up_to(_MakeMask_3_up_to),
	.bits(_MakeMask_3_bits)
);
always_comb begin // combinatorial do_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	do_rst = 1'bx;
	do_rst = 1'b0;
	if(rst) do_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	do_rst = do_rst;
end
always_ff @(posedge clk) begin // state transfers_remaining
	if(_311) if(!_314) transfers_remaining <= _IntNarrow_out;
	if(write_burst) transfers_remaining <= transfer_awlen;
end
always_ff @(posedge clk) begin // state pop_strobe_valid
	if(_311) if(_314) pop_strobe_valid <= 1'b0;
	if(write_burst) pop_strobe_valid <= 1'b1;
	if(rst) pop_strobe_valid <= 1'b0;
end
always_ff @(posedge clk) begin // state pop_strobe
	if(_311) if(_321) pop_strobe <= _MakeMask_bits;
	if(_311) if(!_321) pop_strobe <= _Repeat_3_result;
	if(write_burst) if(_330) pop_strobe <= _333;
	if(write_burst) if(!_330) pop_strobe <= lower_mask;
end
always_ff @(posedge clk) begin // state stored_end_offset
	if(write_burst) stored_end_offset <= end_offset;
end
always_comb begin // combinatorial push_elements
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	push_elements = '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx};
	for(int _v0 = 0; _v0 < 16; _v0 = _v0 + 1) begin
if(push) push_elements[_v0] = _RotateRight_rotated_data[_v0];
end
end
always_comb begin // combinatorial push_strobe
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	push_strobe = 16'bxxxxxxxxxxxxxxxx;
	if(push) push_strobe = _MakeStrobe_strobe;
	if(!push) push_strobe = _Repeat_result;
end
always_comb begin // combinatorial may_pushes
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_pushes = 16'bxxxxxxxxxxxxxxxx;
	may_pushes[0] = _fifo_may_push;
	may_pushes[1] = _fifo_2_may_push;
	may_pushes[2] = _fifo_3_may_push;
	may_pushes[3] = _fifo_4_may_push;
	may_pushes[4] = _fifo_5_may_push;
	may_pushes[5] = _fifo_6_may_push;
	may_pushes[6] = _fifo_7_may_push;
	may_pushes[7] = _fifo_8_may_push;
	may_pushes[8] = _fifo_9_may_push;
	may_pushes[9] = _fifo_10_may_push;
	may_pushes[10] = _fifo_11_may_push;
	may_pushes[11] = _fifo_12_may_push;
	may_pushes[12] = _fifo_13_may_push;
	may_pushes[13] = _fifo_14_may_push;
	may_pushes[14] = _fifo_15_may_push;
	may_pushes[15] = _fifo_16_may_push;
end
always_comb begin // combinatorial may_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_push = 1'bx;
	may_push = _2;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_push = may_push;
end
always_comb begin // combinatorial _RotateRight_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_RotateRight_data = '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx};
	for(int _v0 = 0; _v0 < 16; _v0 = _v0 + 1) begin
if(push) _RotateRight_data[_v0] = write_v[_v0];
end
end
always_comb begin // combinatorial _RotateRight_offset
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_RotateRight_offset = 4'dx;
	if(push) _RotateRight_offset = fifo_offset;
end
always_comb begin // combinatorial _MakeStrobe_chunk_offset
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_MakeStrobe_chunk_offset = 4'dx;
	if(push) _MakeStrobe_chunk_offset = fifo_offset;
end
always_comb begin // combinatorial _MakeStrobe_chunk_length
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_MakeStrobe_chunk_length = 5'dx;
	if(push) _MakeStrobe_chunk_length = num_elems;
end
always_comb begin // combinatorial _Repeat_v
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_v = 1'bx;
	if(!push) _Repeat_v = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_Repeat_v = _Repeat_v;
end
always_comb begin // combinatorial wvalid
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	wvalid = 1'bx;
	wvalid = _77;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	wvalid = wvalid;
end
always_ff @(posedge clk) begin // state wlast
	if(_311) if(_321) wlast <= 1'b1;
	if(_311) if(!_321) wlast <= 1'b0;
	if(write_burst) if(_330) wlast <= 1'b1;
	if(write_burst) if(!_330) wlast <= 1'b0;
end
always_comb begin // combinatorial wdata
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	wdata = 512'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(_fifo_pop_available) wdata[_v0] = pop_data[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(_fifo_2_pop_available) wdata[32 + _v0] = pop_data_2[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(_fifo_3_pop_available) wdata[64 + _v0] = pop_data_3[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(_fifo_4_pop_available) wdata[96 + _v0] = pop_data_4[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(_fifo_5_pop_available) wdata[128 + _v0] = pop_data_5[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(_fifo_6_pop_available) wdata[160 + _v0] = pop_data_6[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(_fifo_7_pop_available) wdata[192 + _v0] = pop_data_7[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(_fifo_8_pop_available) wdata[224 + _v0] = pop_data_8[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(_fifo_9_pop_available) wdata[256 + _v0] = pop_data_9[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(_fifo_10_pop_available) wdata[288 + _v0] = pop_data_10[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(_fifo_11_pop_available) wdata[320 + _v0] = pop_data_11[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(_fifo_12_pop_available) wdata[352 + _v0] = pop_data_12[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(_fifo_13_pop_available) wdata[384 + _v0] = pop_data_13[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(_fifo_14_pop_available) wdata[416 + _v0] = pop_data_14[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(_fifo_15_pop_available) wdata[448 + _v0] = pop_data_15[_v0];
end
	for(int _v0 = 0; _v0 < 32; _v0 = _v0 + 1) begin
if(_fifo_16_pop_available) wdata[480 + _v0] = pop_data_16[_v0];
end
end
always_comb begin // combinatorial wstrb
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	wstrb = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	wstrb[0] = _7;
	wstrb[1] = _8;
	wstrb[2] = _9;
	wstrb[3] = _10;
	wstrb[4] = _11;
	wstrb[5] = _12;
	wstrb[6] = _13;
	wstrb[7] = _14;
	wstrb[8] = _15;
	wstrb[9] = _16;
	wstrb[10] = _17;
	wstrb[11] = _18;
	wstrb[12] = _19;
	wstrb[13] = _20;
	wstrb[14] = _21;
	wstrb[15] = _22;
	wstrb[16] = _23;
	wstrb[17] = _24;
	wstrb[18] = _25;
	wstrb[19] = _26;
	wstrb[20] = _27;
	wstrb[21] = _28;
	wstrb[22] = _29;
	wstrb[23] = _30;
	wstrb[24] = _31;
	wstrb[25] = _32;
	wstrb[26] = _33;
	wstrb[27] = _34;
	wstrb[28] = _35;
	wstrb[29] = _36;
	wstrb[30] = _37;
	wstrb[31] = _38;
	wstrb[32] = _39;
	wstrb[33] = _40;
	wstrb[34] = _41;
	wstrb[35] = _42;
	wstrb[36] = _43;
	wstrb[37] = _44;
	wstrb[38] = _45;
	wstrb[39] = _46;
	wstrb[40] = _47;
	wstrb[41] = _48;
	wstrb[42] = _49;
	wstrb[43] = _50;
	wstrb[44] = _51;
	wstrb[45] = _52;
	wstrb[46] = _53;
	wstrb[47] = _54;
	wstrb[48] = _55;
	wstrb[49] = _56;
	wstrb[50] = _57;
	wstrb[51] = _58;
	wstrb[52] = _59;
	wstrb[53] = _60;
	wstrb[54] = _61;
	wstrb[55] = _62;
	wstrb[56] = _63;
	wstrb[57] = _64;
	wstrb[58] = _65;
	wstrb[59] = _66;
	wstrb[60] = _67;
	wstrb[61] = _68;
	wstrb[62] = _69;
	wstrb[63] = _70;
end
always_comb begin // combinatorial pop_available
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_available = 16'bxxxxxxxxxxxxxxxx;
	pop_available = _Repeat_2_result;
	if(_fifo_pop_available) pop_available[0] = 1'b1;
	if(_fifo_2_pop_available) pop_available[1] = 1'b1;
	if(_fifo_3_pop_available) pop_available[2] = 1'b1;
	if(_fifo_4_pop_available) pop_available[3] = 1'b1;
	if(_fifo_5_pop_available) pop_available[4] = 1'b1;
	if(_fifo_6_pop_available) pop_available[5] = 1'b1;
	if(_fifo_7_pop_available) pop_available[6] = 1'b1;
	if(_fifo_8_pop_available) pop_available[7] = 1'b1;
	if(_fifo_9_pop_available) pop_available[8] = 1'b1;
	if(_fifo_10_pop_available) pop_available[9] = 1'b1;
	if(_fifo_11_pop_available) pop_available[10] = 1'b1;
	if(_fifo_12_pop_available) pop_available[11] = 1'b1;
	if(_fifo_13_pop_available) pop_available[12] = 1'b1;
	if(_fifo_14_pop_available) pop_available[13] = 1'b1;
	if(_fifo_15_pop_available) pop_available[14] = 1'b1;
	if(_fifo_16_pop_available) pop_available[15] = 1'b1;
end
always_comb begin // combinatorial _Repeat_2_v
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_2_v = 1'bx;
	_Repeat_2_v = 1'b0;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_Repeat_2_v = _Repeat_2_v;
end
always_comb begin // combinatorial do_commit_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	do_commit_pop = 1'bx;
	do_commit_pop = _80;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	do_commit_pop = do_commit_pop;
end
always_comb begin // combinatorial _fifo_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_push = 1'bx;
	_fifo_push = 1'b0;
	if(_81) _fifo_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_push = _fifo_push;
end
always_comb begin // combinatorial _fifo_push_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_push_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_81) _fifo_push_data = _82;
end
always_comb begin // combinatorial pop_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_fifo_pop_available) pop_data = _fifo_pop_data;
end
always_comb begin // combinatorial _fifo_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_pop = 1'bx;
	_fifo_pop = 1'b0;
	if(_89) _fifo_pop = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_pop = _fifo_pop;
end
always_comb begin // combinatorial _fifo_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_rst = 1'bx;
	_fifo_rst = 1'b0;
	if(do_rst) _fifo_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_rst = _fifo_rst;
end
always_comb begin // combinatorial _fifo_2_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_2_push = 1'bx;
	_fifo_2_push = 1'b0;
	if(_95) _fifo_2_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_2_push = _fifo_2_push;
end
always_comb begin // combinatorial _fifo_2_push_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_2_push_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_95) _fifo_2_push_data = _96;
end
always_comb begin // combinatorial pop_data_2
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_data_2 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_fifo_2_pop_available) pop_data_2 = _fifo_2_pop_data;
end
always_comb begin // combinatorial _fifo_2_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_2_pop = 1'bx;
	_fifo_2_pop = 1'b0;
	if(_103) _fifo_2_pop = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_2_pop = _fifo_2_pop;
end
always_comb begin // combinatorial _fifo_2_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_2_rst = 1'bx;
	_fifo_2_rst = 1'b0;
	if(do_rst) _fifo_2_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_2_rst = _fifo_2_rst;
end
always_comb begin // combinatorial _fifo_3_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_3_push = 1'bx;
	_fifo_3_push = 1'b0;
	if(_109) _fifo_3_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_3_push = _fifo_3_push;
end
always_comb begin // combinatorial _fifo_3_push_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_3_push_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_109) _fifo_3_push_data = _110;
end
always_comb begin // combinatorial pop_data_3
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_data_3 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_fifo_3_pop_available) pop_data_3 = _fifo_3_pop_data;
end
always_comb begin // combinatorial _fifo_3_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_3_pop = 1'bx;
	_fifo_3_pop = 1'b0;
	if(_117) _fifo_3_pop = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_3_pop = _fifo_3_pop;
end
always_comb begin // combinatorial _fifo_3_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_3_rst = 1'bx;
	_fifo_3_rst = 1'b0;
	if(do_rst) _fifo_3_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_3_rst = _fifo_3_rst;
end
always_comb begin // combinatorial _fifo_4_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_4_push = 1'bx;
	_fifo_4_push = 1'b0;
	if(_123) _fifo_4_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_4_push = _fifo_4_push;
end
always_comb begin // combinatorial _fifo_4_push_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_4_push_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_123) _fifo_4_push_data = _124;
end
always_comb begin // combinatorial pop_data_4
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_data_4 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_fifo_4_pop_available) pop_data_4 = _fifo_4_pop_data;
end
always_comb begin // combinatorial _fifo_4_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_4_pop = 1'bx;
	_fifo_4_pop = 1'b0;
	if(_131) _fifo_4_pop = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_4_pop = _fifo_4_pop;
end
always_comb begin // combinatorial _fifo_4_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_4_rst = 1'bx;
	_fifo_4_rst = 1'b0;
	if(do_rst) _fifo_4_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_4_rst = _fifo_4_rst;
end
always_comb begin // combinatorial _fifo_5_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_5_push = 1'bx;
	_fifo_5_push = 1'b0;
	if(_137) _fifo_5_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_5_push = _fifo_5_push;
end
always_comb begin // combinatorial _fifo_5_push_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_5_push_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_137) _fifo_5_push_data = _138;
end
always_comb begin // combinatorial pop_data_5
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_data_5 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_fifo_5_pop_available) pop_data_5 = _fifo_5_pop_data;
end
always_comb begin // combinatorial _fifo_5_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_5_pop = 1'bx;
	_fifo_5_pop = 1'b0;
	if(_145) _fifo_5_pop = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_5_pop = _fifo_5_pop;
end
always_comb begin // combinatorial _fifo_5_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_5_rst = 1'bx;
	_fifo_5_rst = 1'b0;
	if(do_rst) _fifo_5_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_5_rst = _fifo_5_rst;
end
always_comb begin // combinatorial _fifo_6_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_6_push = 1'bx;
	_fifo_6_push = 1'b0;
	if(_151) _fifo_6_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_6_push = _fifo_6_push;
end
always_comb begin // combinatorial _fifo_6_push_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_6_push_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_151) _fifo_6_push_data = _152;
end
always_comb begin // combinatorial pop_data_6
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_data_6 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_fifo_6_pop_available) pop_data_6 = _fifo_6_pop_data;
end
always_comb begin // combinatorial _fifo_6_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_6_pop = 1'bx;
	_fifo_6_pop = 1'b0;
	if(_159) _fifo_6_pop = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_6_pop = _fifo_6_pop;
end
always_comb begin // combinatorial _fifo_6_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_6_rst = 1'bx;
	_fifo_6_rst = 1'b0;
	if(do_rst) _fifo_6_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_6_rst = _fifo_6_rst;
end
always_comb begin // combinatorial _fifo_7_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_7_push = 1'bx;
	_fifo_7_push = 1'b0;
	if(_165) _fifo_7_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_7_push = _fifo_7_push;
end
always_comb begin // combinatorial _fifo_7_push_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_7_push_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_165) _fifo_7_push_data = _166;
end
always_comb begin // combinatorial pop_data_7
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_data_7 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_fifo_7_pop_available) pop_data_7 = _fifo_7_pop_data;
end
always_comb begin // combinatorial _fifo_7_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_7_pop = 1'bx;
	_fifo_7_pop = 1'b0;
	if(_173) _fifo_7_pop = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_7_pop = _fifo_7_pop;
end
always_comb begin // combinatorial _fifo_7_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_7_rst = 1'bx;
	_fifo_7_rst = 1'b0;
	if(do_rst) _fifo_7_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_7_rst = _fifo_7_rst;
end
always_comb begin // combinatorial _fifo_8_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_8_push = 1'bx;
	_fifo_8_push = 1'b0;
	if(_179) _fifo_8_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_8_push = _fifo_8_push;
end
always_comb begin // combinatorial _fifo_8_push_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_8_push_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_179) _fifo_8_push_data = _180;
end
always_comb begin // combinatorial pop_data_8
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_data_8 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_fifo_8_pop_available) pop_data_8 = _fifo_8_pop_data;
end
always_comb begin // combinatorial _fifo_8_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_8_pop = 1'bx;
	_fifo_8_pop = 1'b0;
	if(_187) _fifo_8_pop = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_8_pop = _fifo_8_pop;
end
always_comb begin // combinatorial _fifo_8_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_8_rst = 1'bx;
	_fifo_8_rst = 1'b0;
	if(do_rst) _fifo_8_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_8_rst = _fifo_8_rst;
end
always_comb begin // combinatorial _fifo_9_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_9_push = 1'bx;
	_fifo_9_push = 1'b0;
	if(_193) _fifo_9_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_9_push = _fifo_9_push;
end
always_comb begin // combinatorial _fifo_9_push_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_9_push_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_193) _fifo_9_push_data = _194;
end
always_comb begin // combinatorial pop_data_9
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_data_9 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_fifo_9_pop_available) pop_data_9 = _fifo_9_pop_data;
end
always_comb begin // combinatorial _fifo_9_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_9_pop = 1'bx;
	_fifo_9_pop = 1'b0;
	if(_201) _fifo_9_pop = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_9_pop = _fifo_9_pop;
end
always_comb begin // combinatorial _fifo_9_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_9_rst = 1'bx;
	_fifo_9_rst = 1'b0;
	if(do_rst) _fifo_9_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_9_rst = _fifo_9_rst;
end
always_comb begin // combinatorial _fifo_10_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_10_push = 1'bx;
	_fifo_10_push = 1'b0;
	if(_207) _fifo_10_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_10_push = _fifo_10_push;
end
always_comb begin // combinatorial _fifo_10_push_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_10_push_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_207) _fifo_10_push_data = _208;
end
always_comb begin // combinatorial pop_data_10
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_data_10 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_fifo_10_pop_available) pop_data_10 = _fifo_10_pop_data;
end
always_comb begin // combinatorial _fifo_10_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_10_pop = 1'bx;
	_fifo_10_pop = 1'b0;
	if(_215) _fifo_10_pop = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_10_pop = _fifo_10_pop;
end
always_comb begin // combinatorial _fifo_10_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_10_rst = 1'bx;
	_fifo_10_rst = 1'b0;
	if(do_rst) _fifo_10_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_10_rst = _fifo_10_rst;
end
always_comb begin // combinatorial _fifo_11_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_11_push = 1'bx;
	_fifo_11_push = 1'b0;
	if(_221) _fifo_11_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_11_push = _fifo_11_push;
end
always_comb begin // combinatorial _fifo_11_push_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_11_push_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_221) _fifo_11_push_data = _222;
end
always_comb begin // combinatorial pop_data_11
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_data_11 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_fifo_11_pop_available) pop_data_11 = _fifo_11_pop_data;
end
always_comb begin // combinatorial _fifo_11_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_11_pop = 1'bx;
	_fifo_11_pop = 1'b0;
	if(_229) _fifo_11_pop = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_11_pop = _fifo_11_pop;
end
always_comb begin // combinatorial _fifo_11_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_11_rst = 1'bx;
	_fifo_11_rst = 1'b0;
	if(do_rst) _fifo_11_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_11_rst = _fifo_11_rst;
end
always_comb begin // combinatorial _fifo_12_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_12_push = 1'bx;
	_fifo_12_push = 1'b0;
	if(_235) _fifo_12_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_12_push = _fifo_12_push;
end
always_comb begin // combinatorial _fifo_12_push_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_12_push_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_235) _fifo_12_push_data = _236;
end
always_comb begin // combinatorial pop_data_12
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_data_12 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_fifo_12_pop_available) pop_data_12 = _fifo_12_pop_data;
end
always_comb begin // combinatorial _fifo_12_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_12_pop = 1'bx;
	_fifo_12_pop = 1'b0;
	if(_243) _fifo_12_pop = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_12_pop = _fifo_12_pop;
end
always_comb begin // combinatorial _fifo_12_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_12_rst = 1'bx;
	_fifo_12_rst = 1'b0;
	if(do_rst) _fifo_12_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_12_rst = _fifo_12_rst;
end
always_comb begin // combinatorial _fifo_13_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_13_push = 1'bx;
	_fifo_13_push = 1'b0;
	if(_249) _fifo_13_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_13_push = _fifo_13_push;
end
always_comb begin // combinatorial _fifo_13_push_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_13_push_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_249) _fifo_13_push_data = _250;
end
always_comb begin // combinatorial pop_data_13
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_data_13 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_fifo_13_pop_available) pop_data_13 = _fifo_13_pop_data;
end
always_comb begin // combinatorial _fifo_13_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_13_pop = 1'bx;
	_fifo_13_pop = 1'b0;
	if(_257) _fifo_13_pop = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_13_pop = _fifo_13_pop;
end
always_comb begin // combinatorial _fifo_13_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_13_rst = 1'bx;
	_fifo_13_rst = 1'b0;
	if(do_rst) _fifo_13_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_13_rst = _fifo_13_rst;
end
always_comb begin // combinatorial _fifo_14_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_14_push = 1'bx;
	_fifo_14_push = 1'b0;
	if(_263) _fifo_14_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_14_push = _fifo_14_push;
end
always_comb begin // combinatorial _fifo_14_push_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_14_push_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_263) _fifo_14_push_data = _264;
end
always_comb begin // combinatorial pop_data_14
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_data_14 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_fifo_14_pop_available) pop_data_14 = _fifo_14_pop_data;
end
always_comb begin // combinatorial _fifo_14_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_14_pop = 1'bx;
	_fifo_14_pop = 1'b0;
	if(_271) _fifo_14_pop = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_14_pop = _fifo_14_pop;
end
always_comb begin // combinatorial _fifo_14_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_14_rst = 1'bx;
	_fifo_14_rst = 1'b0;
	if(do_rst) _fifo_14_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_14_rst = _fifo_14_rst;
end
always_comb begin // combinatorial _fifo_15_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_15_push = 1'bx;
	_fifo_15_push = 1'b0;
	if(_277) _fifo_15_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_15_push = _fifo_15_push;
end
always_comb begin // combinatorial _fifo_15_push_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_15_push_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_277) _fifo_15_push_data = _278;
end
always_comb begin // combinatorial pop_data_15
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_data_15 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_fifo_15_pop_available) pop_data_15 = _fifo_15_pop_data;
end
always_comb begin // combinatorial _fifo_15_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_15_pop = 1'bx;
	_fifo_15_pop = 1'b0;
	if(_285) _fifo_15_pop = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_15_pop = _fifo_15_pop;
end
always_comb begin // combinatorial _fifo_15_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_15_rst = 1'bx;
	_fifo_15_rst = 1'b0;
	if(do_rst) _fifo_15_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_15_rst = _fifo_15_rst;
end
always_comb begin // combinatorial _fifo_16_push
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_16_push = 1'bx;
	_fifo_16_push = 1'b0;
	if(_291) _fifo_16_push = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_16_push = _fifo_16_push;
end
always_comb begin // combinatorial _fifo_16_push_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_16_push_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_291) _fifo_16_push_data = _292;
end
always_comb begin // combinatorial pop_data_16
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	pop_data_16 = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_fifo_16_pop_available) pop_data_16 = _fifo_16_pop_data;
end
always_comb begin // combinatorial _fifo_16_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_16_pop = 1'bx;
	_fifo_16_pop = 1'b0;
	if(_299) _fifo_16_pop = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_16_pop = _fifo_16_pop;
end
always_comb begin // combinatorial _fifo_16_rst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_fifo_16_rst = 1'bx;
	_fifo_16_rst = 1'b0;
	if(do_rst) _fifo_16_rst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_fifo_16_rst = _fifo_16_rst;
end
always_comb begin // combinatorial may_write_burst
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	may_write_burst = 1'bx;
	may_write_burst = 1'b0;
	if(_311) if(_314) may_write_burst = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	may_write_burst = may_write_burst;
end
always_comb begin // combinatorial _IntNarrow_in
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_IntNarrow_in = 7'sdx;
	if(_311) if(!_314) _IntNarrow_in = _318;
end
always_comb begin // combinatorial _MakeMask_up_to
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_MakeMask_up_to = 5'dx;
	if(_311) if(_321) _MakeMask_up_to = stored_end_offset;
end
always_comb begin // combinatorial _Repeat_3_v
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_Repeat_3_v = 1'bx;
	if(_311) if(!_321) _Repeat_3_v = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_Repeat_3_v = _Repeat_3_v;
end
always_comb begin // combinatorial lower_mask
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	lower_mask = 16'bxxxxxxxxxxxxxxxx;
	if(write_burst) lower_mask = _326;
end
always_comb begin // combinatorial _MakeMask_2_up_to
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_MakeMask_2_up_to = 5'dx;
	if(write_burst) _MakeMask_2_up_to = start_offset;
end
always_comb begin // combinatorial upper_mask
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	upper_mask = 16'bxxxxxxxxxxxxxxxx;
	if(write_burst) upper_mask = _MakeMask_3_bits;
end
always_comb begin // combinatorial _MakeMask_3_up_to
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_MakeMask_3_up_to = 5'dx;
	if(write_burst) _MakeMask_3_up_to = end_offset;
end
endmodule

// IntNarrow #(FROM_I: -1, TO_I: 63, FROM: 0, TO: 64)
module IntNarrow_FROM_I_1_TO_I_63_FROM_0_TO_64(
	input clk,
	input wire signed[6:0] in,
	output /*mux_wire*/ logic[5:0] out
);

	assign out = in;
endmodule

// FWFT #(T: type bool #()[32], DEPTH: 512, MAY_PUSH_LATENCY: 20)
module FWFT_T_type_bool_32_DEPTH_512_MAY_PUSH_LATENCY_20(
	input clk,
	input wire rst,
	output /*mux_wire*/ logic may_push,
	input wire push,
	input wire[31:0] push_data,
	output /*mux_wire*/ logic pop_available,
	output /*mux_wire*/ logic[31:0] pop_data,
	input wire pop
);

/*state*/ logic[31:0] mem[511:0];
/*state*/ logic[8:0] read_addr;
/*state*/ logic[8:0] write_addr;
/*state*/ logic[1:0] outflow_path_valids_reg;
/*state*/ logic[31:0] outflow_path_elems_reg[1:0];
/*mux_wire*/ logic[2:0] outflow_path_valids;
/*mux_wire*/ logic[31:0] outflow_path_elems[2:0];
/*mux_wire*/ logic[2:0] will_shifts;
wire _3;
assign _3 = read_addr != write_addr;
wire[31:0] _5 = mem[read_addr];
wire[31:0] _6 = outflow_path_elems_reg[0];
wire _7 = outflow_path_valids_reg[0];
wire _8 = will_shifts[0];
wire _9 = outflow_path_valids[0];
wire _10;
assign _10 = !_9;
wire _11;
assign _11 = _8 | _10;
wire _12 = will_shifts[1];
wire _13 = outflow_path_valids[1];
wire[31:0] _14 = outflow_path_elems[1];
wire[31:0] _15 = outflow_path_elems_reg[1];
wire _16 = outflow_path_valids_reg[1];
wire _17 = will_shifts[1];
wire _18 = outflow_path_valids[1];
wire _19;
assign _19 = !_18;
wire _20;
assign _20 = _17 | _19;
wire _21 = will_shifts[2];
wire _22 = outflow_path_valids[2];
wire[31:0] _23 = outflow_path_elems[2];
/*mux_wire*/ logic[8:0] space_remaining;
wire[9:0] _29;
assign _29 = write_addr + 1'd1;
wire signed[9:0] _30;
assign _30 = read_addr - _29;
wire[8:0] _31;
assign _31 = _30; // == mod 512 (target is 9 bits wide)
wire _33;
assign _33 = space_remaining > 5'd20;
/*mux_wire*/ logic _LatencyOffset_in;
wire _LatencyOffset_out;
wire[9:0] _38;
assign _38 = write_addr + 1'd1;
wire[8:0] _39;
assign _39 = _38; // == mod 512 (target is 9 bits wide)
wire _40 = outflow_path_valids[2];
wire _41 = will_shifts[2];
wire _42;
assign _42 = _40 & _41;
wire[9:0] _45;
assign _45 = read_addr + 1'd1;
wire[8:0] _46;
assign _46 = _45; // == mod 512 (target is 9 bits wide)
wire _48 = outflow_path_valids[0];
wire[31:0] _49 = outflow_path_elems[0];
LatencyOffset_T_type_bool_OFFSET_20 LatencyOffset(
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
	outflow_path_elems = '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx};
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
	space_remaining = 9'dx;
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
	pop_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	if(_48) pop_data = _49;
end
endmodule

// LatencyOffset #(T: type bool #(), OFFSET: -20)
module LatencyOffset_T_type_bool_OFFSET_20(
	input clk,
	input wire in,
	output /*mux_wire*/ logic out
);

	assign out = in;
endmodule

// Repeat #(T: type bool #(), SIZE: 16)
module Repeat_T_type_bool_SIZE_16(
	input clk,
	input wire v,
	output /*mux_wire*/ logic[15:0] result
);

always_comb begin // combinatorial result
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	result = 16'bxxxxxxxxxxxxxxxx;
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
end
endmodule

// MakeStrobe #(STROBE_WIDTH: 16)
module MakeStrobe_STROBE_WIDTH_16(
	input clk,
	input wire[3:0] chunk_offset,
	input wire[4:0] chunk_length,
	output /*mux_wire*/ logic[15:0] strobe
);

/*mux_wire*/ logic[4:0] _MakeMask_up_to;
wire[15:0] _MakeMask_bits;
/*mux_wire*/ logic[15:0] _RotateRight_data;
/*mux_wire*/ logic[3:0] _RotateRight_offset;
wire[15:0] _RotateRight_rotated_data;
MakeMask_SIZE_16 MakeMask(
	.clk(clk),
	.up_to(_MakeMask_up_to),
	.bits(_MakeMask_bits)
);
RotateRight_T_type_bool_ARRAY_LEN_16 RotateRight(
	.clk(clk),
	.data(_RotateRight_data),
	.offset(_RotateRight_offset),
	.rotated_data(_RotateRight_rotated_data)
);
always_comb begin // combinatorial strobe
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	strobe = 16'bxxxxxxxxxxxxxxxx;
	strobe = _RotateRight_rotated_data;
end
always_comb begin // combinatorial _MakeMask_up_to
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_MakeMask_up_to = 5'dx;
	_MakeMask_up_to = chunk_length;
end
always_comb begin // combinatorial _RotateRight_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_RotateRight_data = 16'bxxxxxxxxxxxxxxxx;
	_RotateRight_data = _MakeMask_bits;
end
always_comb begin // combinatorial _RotateRight_offset
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_RotateRight_offset = 4'dx;
	_RotateRight_offset = chunk_offset;
end
endmodule

// RotateRight #(T: type bool #(), ARRAY_LEN: 16)
module RotateRight_T_type_bool_ARRAY_LEN_16(
	input clk,
	input wire[15:0] data,
	input wire[3:0] offset,
	output /*mux_wire*/ logic[15:0] rotated_data
);

/*mux_wire*/ logic[3:0] offset_bits;
/*mux_wire*/ logic[3:0] _UIntToBits_value;
wire[3:0] _UIntToBits_bits;
/*mux_wire*/ logic[15:0] rotate_stages[4:0];
/*mux_wire*/ logic[15:0] from;
wire[15:0] _3 = rotate_stages[0];
wire _4 = offset_bits[0];
wire _5 = from[15];
wire _6 = from[0];
wire _7 = offset_bits[0];
wire _8 = from[0];
wire _9 = from[1];
wire _10 = offset_bits[0];
wire _11 = from[1];
wire _12 = from[2];
wire _13 = offset_bits[0];
wire _14 = from[2];
wire _15 = from[3];
wire _16 = offset_bits[0];
wire _17 = from[3];
wire _18 = from[4];
wire _19 = offset_bits[0];
wire _20 = from[4];
wire _21 = from[5];
wire _22 = offset_bits[0];
wire _23 = from[5];
wire _24 = from[6];
wire _25 = offset_bits[0];
wire _26 = from[6];
wire _27 = from[7];
wire _28 = offset_bits[0];
wire _29 = from[7];
wire _30 = from[8];
wire _31 = offset_bits[0];
wire _32 = from[8];
wire _33 = from[9];
wire _34 = offset_bits[0];
wire _35 = from[9];
wire _36 = from[10];
wire _37 = offset_bits[0];
wire _38 = from[10];
wire _39 = from[11];
wire _40 = offset_bits[0];
wire _41 = from[11];
wire _42 = from[12];
wire _43 = offset_bits[0];
wire _44 = from[12];
wire _45 = from[13];
wire _46 = offset_bits[0];
wire _47 = from[13];
wire _48 = from[14];
wire _49 = offset_bits[0];
wire _50 = from[14];
wire _51 = from[15];
/*mux_wire*/ logic[15:0] from_2;
wire[15:0] _52 = rotate_stages[1];
wire _53 = offset_bits[1];
wire _54 = from_2[14];
wire _55 = from_2[0];
wire _56 = offset_bits[1];
wire _57 = from_2[15];
wire _58 = from_2[1];
wire _59 = offset_bits[1];
wire _60 = from_2[0];
wire _61 = from_2[2];
wire _62 = offset_bits[1];
wire _63 = from_2[1];
wire _64 = from_2[3];
wire _65 = offset_bits[1];
wire _66 = from_2[2];
wire _67 = from_2[4];
wire _68 = offset_bits[1];
wire _69 = from_2[3];
wire _70 = from_2[5];
wire _71 = offset_bits[1];
wire _72 = from_2[4];
wire _73 = from_2[6];
wire _74 = offset_bits[1];
wire _75 = from_2[5];
wire _76 = from_2[7];
wire _77 = offset_bits[1];
wire _78 = from_2[6];
wire _79 = from_2[8];
wire _80 = offset_bits[1];
wire _81 = from_2[7];
wire _82 = from_2[9];
wire _83 = offset_bits[1];
wire _84 = from_2[8];
wire _85 = from_2[10];
wire _86 = offset_bits[1];
wire _87 = from_2[9];
wire _88 = from_2[11];
wire _89 = offset_bits[1];
wire _90 = from_2[10];
wire _91 = from_2[12];
wire _92 = offset_bits[1];
wire _93 = from_2[11];
wire _94 = from_2[13];
wire _95 = offset_bits[1];
wire _96 = from_2[12];
wire _97 = from_2[14];
wire _98 = offset_bits[1];
wire _99 = from_2[13];
wire _100 = from_2[15];
/*mux_wire*/ logic[15:0] from_3;
wire[15:0] _101 = rotate_stages[2];
wire _102 = offset_bits[2];
wire _103 = from_3[12];
wire _104 = from_3[0];
wire _105 = offset_bits[2];
wire _106 = from_3[13];
wire _107 = from_3[1];
wire _108 = offset_bits[2];
wire _109 = from_3[14];
wire _110 = from_3[2];
wire _111 = offset_bits[2];
wire _112 = from_3[15];
wire _113 = from_3[3];
wire _114 = offset_bits[2];
wire _115 = from_3[0];
wire _116 = from_3[4];
wire _117 = offset_bits[2];
wire _118 = from_3[1];
wire _119 = from_3[5];
wire _120 = offset_bits[2];
wire _121 = from_3[2];
wire _122 = from_3[6];
wire _123 = offset_bits[2];
wire _124 = from_3[3];
wire _125 = from_3[7];
wire _126 = offset_bits[2];
wire _127 = from_3[4];
wire _128 = from_3[8];
wire _129 = offset_bits[2];
wire _130 = from_3[5];
wire _131 = from_3[9];
wire _132 = offset_bits[2];
wire _133 = from_3[6];
wire _134 = from_3[10];
wire _135 = offset_bits[2];
wire _136 = from_3[7];
wire _137 = from_3[11];
wire _138 = offset_bits[2];
wire _139 = from_3[8];
wire _140 = from_3[12];
wire _141 = offset_bits[2];
wire _142 = from_3[9];
wire _143 = from_3[13];
wire _144 = offset_bits[2];
wire _145 = from_3[10];
wire _146 = from_3[14];
wire _147 = offset_bits[2];
wire _148 = from_3[11];
wire _149 = from_3[15];
/*mux_wire*/ logic[15:0] from_4;
wire[15:0] _150 = rotate_stages[3];
wire _151 = offset_bits[3];
wire _152 = from_4[8];
wire _153 = from_4[0];
wire _154 = offset_bits[3];
wire _155 = from_4[9];
wire _156 = from_4[1];
wire _157 = offset_bits[3];
wire _158 = from_4[10];
wire _159 = from_4[2];
wire _160 = offset_bits[3];
wire _161 = from_4[11];
wire _162 = from_4[3];
wire _163 = offset_bits[3];
wire _164 = from_4[12];
wire _165 = from_4[4];
wire _166 = offset_bits[3];
wire _167 = from_4[13];
wire _168 = from_4[5];
wire _169 = offset_bits[3];
wire _170 = from_4[14];
wire _171 = from_4[6];
wire _172 = offset_bits[3];
wire _173 = from_4[15];
wire _174 = from_4[7];
wire _175 = offset_bits[3];
wire _176 = from_4[0];
wire _177 = from_4[8];
wire _178 = offset_bits[3];
wire _179 = from_4[1];
wire _180 = from_4[9];
wire _181 = offset_bits[3];
wire _182 = from_4[2];
wire _183 = from_4[10];
wire _184 = offset_bits[3];
wire _185 = from_4[3];
wire _186 = from_4[11];
wire _187 = offset_bits[3];
wire _188 = from_4[4];
wire _189 = from_4[12];
wire _190 = offset_bits[3];
wire _191 = from_4[5];
wire _192 = from_4[13];
wire _193 = offset_bits[3];
wire _194 = from_4[6];
wire _195 = from_4[14];
wire _196 = offset_bits[3];
wire _197 = from_4[7];
wire _198 = from_4[15];
wire[15:0] _199 = rotate_stages[4];
UIntToBits_NUM_BITS_4 UIntToBits(
	.clk(clk),
	.value(_UIntToBits_value),
	.bits(_UIntToBits_bits)
);
always_comb begin // combinatorial rotated_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	rotated_data = 16'bxxxxxxxxxxxxxxxx;
	rotated_data = _199;
end
always_comb begin // combinatorial offset_bits
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	offset_bits = 4'bxxxx;
	offset_bits = _UIntToBits_bits;
end
always_comb begin // combinatorial _UIntToBits_value
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_value = 4'dx;
	_UIntToBits_value = offset;
end
always_comb begin // combinatorial rotate_stages
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	rotate_stages = '{16'bxxxxxxxxxxxxxxxx, 16'bxxxxxxxxxxxxxxxx, 16'bxxxxxxxxxxxxxxxx, 16'bxxxxxxxxxxxxxxxx, 16'bxxxxxxxxxxxxxxxx};
	rotate_stages[0] = data;
	if(_4) rotate_stages[1][0] = _5;
	if(!_4) rotate_stages[1][0] = _6;
	if(_7) rotate_stages[1][1] = _8;
	if(!_7) rotate_stages[1][1] = _9;
	if(_10) rotate_stages[1][2] = _11;
	if(!_10) rotate_stages[1][2] = _12;
	if(_13) rotate_stages[1][3] = _14;
	if(!_13) rotate_stages[1][3] = _15;
	if(_16) rotate_stages[1][4] = _17;
	if(!_16) rotate_stages[1][4] = _18;
	if(_19) rotate_stages[1][5] = _20;
	if(!_19) rotate_stages[1][5] = _21;
	if(_22) rotate_stages[1][6] = _23;
	if(!_22) rotate_stages[1][6] = _24;
	if(_25) rotate_stages[1][7] = _26;
	if(!_25) rotate_stages[1][7] = _27;
	if(_28) rotate_stages[1][8] = _29;
	if(!_28) rotate_stages[1][8] = _30;
	if(_31) rotate_stages[1][9] = _32;
	if(!_31) rotate_stages[1][9] = _33;
	if(_34) rotate_stages[1][10] = _35;
	if(!_34) rotate_stages[1][10] = _36;
	if(_37) rotate_stages[1][11] = _38;
	if(!_37) rotate_stages[1][11] = _39;
	if(_40) rotate_stages[1][12] = _41;
	if(!_40) rotate_stages[1][12] = _42;
	if(_43) rotate_stages[1][13] = _44;
	if(!_43) rotate_stages[1][13] = _45;
	if(_46) rotate_stages[1][14] = _47;
	if(!_46) rotate_stages[1][14] = _48;
	if(_49) rotate_stages[1][15] = _50;
	if(!_49) rotate_stages[1][15] = _51;
	if(_53) rotate_stages[2][0] = _54;
	if(!_53) rotate_stages[2][0] = _55;
	if(_56) rotate_stages[2][1] = _57;
	if(!_56) rotate_stages[2][1] = _58;
	if(_59) rotate_stages[2][2] = _60;
	if(!_59) rotate_stages[2][2] = _61;
	if(_62) rotate_stages[2][3] = _63;
	if(!_62) rotate_stages[2][3] = _64;
	if(_65) rotate_stages[2][4] = _66;
	if(!_65) rotate_stages[2][4] = _67;
	if(_68) rotate_stages[2][5] = _69;
	if(!_68) rotate_stages[2][5] = _70;
	if(_71) rotate_stages[2][6] = _72;
	if(!_71) rotate_stages[2][6] = _73;
	if(_74) rotate_stages[2][7] = _75;
	if(!_74) rotate_stages[2][7] = _76;
	if(_77) rotate_stages[2][8] = _78;
	if(!_77) rotate_stages[2][8] = _79;
	if(_80) rotate_stages[2][9] = _81;
	if(!_80) rotate_stages[2][9] = _82;
	if(_83) rotate_stages[2][10] = _84;
	if(!_83) rotate_stages[2][10] = _85;
	if(_86) rotate_stages[2][11] = _87;
	if(!_86) rotate_stages[2][11] = _88;
	if(_89) rotate_stages[2][12] = _90;
	if(!_89) rotate_stages[2][12] = _91;
	if(_92) rotate_stages[2][13] = _93;
	if(!_92) rotate_stages[2][13] = _94;
	if(_95) rotate_stages[2][14] = _96;
	if(!_95) rotate_stages[2][14] = _97;
	if(_98) rotate_stages[2][15] = _99;
	if(!_98) rotate_stages[2][15] = _100;
	if(_102) rotate_stages[3][0] = _103;
	if(!_102) rotate_stages[3][0] = _104;
	if(_105) rotate_stages[3][1] = _106;
	if(!_105) rotate_stages[3][1] = _107;
	if(_108) rotate_stages[3][2] = _109;
	if(!_108) rotate_stages[3][2] = _110;
	if(_111) rotate_stages[3][3] = _112;
	if(!_111) rotate_stages[3][3] = _113;
	if(_114) rotate_stages[3][4] = _115;
	if(!_114) rotate_stages[3][4] = _116;
	if(_117) rotate_stages[3][5] = _118;
	if(!_117) rotate_stages[3][5] = _119;
	if(_120) rotate_stages[3][6] = _121;
	if(!_120) rotate_stages[3][6] = _122;
	if(_123) rotate_stages[3][7] = _124;
	if(!_123) rotate_stages[3][7] = _125;
	if(_126) rotate_stages[3][8] = _127;
	if(!_126) rotate_stages[3][8] = _128;
	if(_129) rotate_stages[3][9] = _130;
	if(!_129) rotate_stages[3][9] = _131;
	if(_132) rotate_stages[3][10] = _133;
	if(!_132) rotate_stages[3][10] = _134;
	if(_135) rotate_stages[3][11] = _136;
	if(!_135) rotate_stages[3][11] = _137;
	if(_138) rotate_stages[3][12] = _139;
	if(!_138) rotate_stages[3][12] = _140;
	if(_141) rotate_stages[3][13] = _142;
	if(!_141) rotate_stages[3][13] = _143;
	if(_144) rotate_stages[3][14] = _145;
	if(!_144) rotate_stages[3][14] = _146;
	if(_147) rotate_stages[3][15] = _148;
	if(!_147) rotate_stages[3][15] = _149;
	if(_151) rotate_stages[4][0] = _152;
	if(!_151) rotate_stages[4][0] = _153;
	if(_154) rotate_stages[4][1] = _155;
	if(!_154) rotate_stages[4][1] = _156;
	if(_157) rotate_stages[4][2] = _158;
	if(!_157) rotate_stages[4][2] = _159;
	if(_160) rotate_stages[4][3] = _161;
	if(!_160) rotate_stages[4][3] = _162;
	if(_163) rotate_stages[4][4] = _164;
	if(!_163) rotate_stages[4][4] = _165;
	if(_166) rotate_stages[4][5] = _167;
	if(!_166) rotate_stages[4][5] = _168;
	if(_169) rotate_stages[4][6] = _170;
	if(!_169) rotate_stages[4][6] = _171;
	if(_172) rotate_stages[4][7] = _173;
	if(!_172) rotate_stages[4][7] = _174;
	if(_175) rotate_stages[4][8] = _176;
	if(!_175) rotate_stages[4][8] = _177;
	if(_178) rotate_stages[4][9] = _179;
	if(!_178) rotate_stages[4][9] = _180;
	if(_181) rotate_stages[4][10] = _182;
	if(!_181) rotate_stages[4][10] = _183;
	if(_184) rotate_stages[4][11] = _185;
	if(!_184) rotate_stages[4][11] = _186;
	if(_187) rotate_stages[4][12] = _188;
	if(!_187) rotate_stages[4][12] = _189;
	if(_190) rotate_stages[4][13] = _191;
	if(!_190) rotate_stages[4][13] = _192;
	if(_193) rotate_stages[4][14] = _194;
	if(!_193) rotate_stages[4][14] = _195;
	if(_196) rotate_stages[4][15] = _197;
	if(!_196) rotate_stages[4][15] = _198;
end
always_comb begin // combinatorial from
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	from = 16'bxxxxxxxxxxxxxxxx;
	from = _3;
end
always_comb begin // combinatorial from_2
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	from_2 = 16'bxxxxxxxxxxxxxxxx;
	from_2 = _52;
end
always_comb begin // combinatorial from_3
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	from_3 = 16'bxxxxxxxxxxxxxxxx;
	from_3 = _101;
end
always_comb begin // combinatorial from_4
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	from_4 = 16'bxxxxxxxxxxxxxxxx;
	from_4 = _150;
end
endmodule

// MakeMask #(SIZE: 16)
module MakeMask_SIZE_16(
	input clk,
	input wire[4:0] up_to,
	output /*mux_wire*/ logic[15:0] bits
);

wire _2;
assign _2 = up_to > 1'd0;
wire _4;
assign _4 = up_to > 1'd1;
wire _6;
assign _6 = up_to > 2'd2;
wire _8;
assign _8 = up_to > 2'd3;
wire _10;
assign _10 = up_to > 3'd4;
wire _12;
assign _12 = up_to > 3'd5;
wire _14;
assign _14 = up_to > 3'd6;
wire _16;
assign _16 = up_to > 3'd7;
wire _18;
assign _18 = up_to > 4'd8;
wire _20;
assign _20 = up_to > 4'd9;
wire _22;
assign _22 = up_to > 4'd10;
wire _24;
assign _24 = up_to > 4'd11;
wire _26;
assign _26 = up_to > 4'd12;
wire _28;
assign _28 = up_to > 4'd13;
wire _30;
assign _30 = up_to > 4'd14;
wire _32;
assign _32 = up_to > 4'd15;
always_comb begin // combinatorial bits
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	bits = 16'bxxxxxxxxxxxxxxxx;
	bits[0] = _2;
	bits[1] = _4;
	bits[2] = _6;
	bits[3] = _8;
	bits[4] = _10;
	bits[5] = _12;
	bits[6] = _14;
	bits[7] = _16;
	bits[8] = _18;
	bits[9] = _20;
	bits[10] = _22;
	bits[11] = _24;
	bits[12] = _26;
	bits[13] = _28;
	bits[14] = _30;
	bits[15] = _32;
end
endmodule

// RotateRight #(T: type bool #()[32], ARRAY_LEN: 16)
module RotateRight_T_type_bool_32_ARRAY_LEN_16(
	input clk,
	input wire[31:0] data[15:0],
	input wire[3:0] offset,
	output /*mux_wire*/ logic[31:0] rotated_data[15:0]
);

genvar _g0;
/*mux_wire*/ logic[3:0] offset_bits;
/*mux_wire*/ logic[3:0] _UIntToBits_value;
wire[3:0] _UIntToBits_bits;
/*mux_wire*/ logic[31:0] rotate_stages[4:0][15:0];
/*mux_wire*/ logic[31:0] from[15:0];
wire[31:0] _3[15:0];
generate
for(_g0 = 0; _g0 < 16; _g0 = _g0 + 1) begin
assign _3[_g0] = rotate_stages[0][_g0];
end
endgenerate
wire _4 = offset_bits[0];
wire[31:0] _5 = from[15];
wire[31:0] _6 = from[0];
wire _7 = offset_bits[0];
wire[31:0] _8 = from[0];
wire[31:0] _9 = from[1];
wire _10 = offset_bits[0];
wire[31:0] _11 = from[1];
wire[31:0] _12 = from[2];
wire _13 = offset_bits[0];
wire[31:0] _14 = from[2];
wire[31:0] _15 = from[3];
wire _16 = offset_bits[0];
wire[31:0] _17 = from[3];
wire[31:0] _18 = from[4];
wire _19 = offset_bits[0];
wire[31:0] _20 = from[4];
wire[31:0] _21 = from[5];
wire _22 = offset_bits[0];
wire[31:0] _23 = from[5];
wire[31:0] _24 = from[6];
wire _25 = offset_bits[0];
wire[31:0] _26 = from[6];
wire[31:0] _27 = from[7];
wire _28 = offset_bits[0];
wire[31:0] _29 = from[7];
wire[31:0] _30 = from[8];
wire _31 = offset_bits[0];
wire[31:0] _32 = from[8];
wire[31:0] _33 = from[9];
wire _34 = offset_bits[0];
wire[31:0] _35 = from[9];
wire[31:0] _36 = from[10];
wire _37 = offset_bits[0];
wire[31:0] _38 = from[10];
wire[31:0] _39 = from[11];
wire _40 = offset_bits[0];
wire[31:0] _41 = from[11];
wire[31:0] _42 = from[12];
wire _43 = offset_bits[0];
wire[31:0] _44 = from[12];
wire[31:0] _45 = from[13];
wire _46 = offset_bits[0];
wire[31:0] _47 = from[13];
wire[31:0] _48 = from[14];
wire _49 = offset_bits[0];
wire[31:0] _50 = from[14];
wire[31:0] _51 = from[15];
/*mux_wire*/ logic[31:0] from_2[15:0];
wire[31:0] _52[15:0];
generate
for(_g0 = 0; _g0 < 16; _g0 = _g0 + 1) begin
assign _52[_g0] = rotate_stages[1][_g0];
end
endgenerate
wire _53 = offset_bits[1];
wire[31:0] _54 = from_2[14];
wire[31:0] _55 = from_2[0];
wire _56 = offset_bits[1];
wire[31:0] _57 = from_2[15];
wire[31:0] _58 = from_2[1];
wire _59 = offset_bits[1];
wire[31:0] _60 = from_2[0];
wire[31:0] _61 = from_2[2];
wire _62 = offset_bits[1];
wire[31:0] _63 = from_2[1];
wire[31:0] _64 = from_2[3];
wire _65 = offset_bits[1];
wire[31:0] _66 = from_2[2];
wire[31:0] _67 = from_2[4];
wire _68 = offset_bits[1];
wire[31:0] _69 = from_2[3];
wire[31:0] _70 = from_2[5];
wire _71 = offset_bits[1];
wire[31:0] _72 = from_2[4];
wire[31:0] _73 = from_2[6];
wire _74 = offset_bits[1];
wire[31:0] _75 = from_2[5];
wire[31:0] _76 = from_2[7];
wire _77 = offset_bits[1];
wire[31:0] _78 = from_2[6];
wire[31:0] _79 = from_2[8];
wire _80 = offset_bits[1];
wire[31:0] _81 = from_2[7];
wire[31:0] _82 = from_2[9];
wire _83 = offset_bits[1];
wire[31:0] _84 = from_2[8];
wire[31:0] _85 = from_2[10];
wire _86 = offset_bits[1];
wire[31:0] _87 = from_2[9];
wire[31:0] _88 = from_2[11];
wire _89 = offset_bits[1];
wire[31:0] _90 = from_2[10];
wire[31:0] _91 = from_2[12];
wire _92 = offset_bits[1];
wire[31:0] _93 = from_2[11];
wire[31:0] _94 = from_2[13];
wire _95 = offset_bits[1];
wire[31:0] _96 = from_2[12];
wire[31:0] _97 = from_2[14];
wire _98 = offset_bits[1];
wire[31:0] _99 = from_2[13];
wire[31:0] _100 = from_2[15];
/*mux_wire*/ logic[31:0] from_3[15:0];
wire[31:0] _101[15:0];
generate
for(_g0 = 0; _g0 < 16; _g0 = _g0 + 1) begin
assign _101[_g0] = rotate_stages[2][_g0];
end
endgenerate
wire _102 = offset_bits[2];
wire[31:0] _103 = from_3[12];
wire[31:0] _104 = from_3[0];
wire _105 = offset_bits[2];
wire[31:0] _106 = from_3[13];
wire[31:0] _107 = from_3[1];
wire _108 = offset_bits[2];
wire[31:0] _109 = from_3[14];
wire[31:0] _110 = from_3[2];
wire _111 = offset_bits[2];
wire[31:0] _112 = from_3[15];
wire[31:0] _113 = from_3[3];
wire _114 = offset_bits[2];
wire[31:0] _115 = from_3[0];
wire[31:0] _116 = from_3[4];
wire _117 = offset_bits[2];
wire[31:0] _118 = from_3[1];
wire[31:0] _119 = from_3[5];
wire _120 = offset_bits[2];
wire[31:0] _121 = from_3[2];
wire[31:0] _122 = from_3[6];
wire _123 = offset_bits[2];
wire[31:0] _124 = from_3[3];
wire[31:0] _125 = from_3[7];
wire _126 = offset_bits[2];
wire[31:0] _127 = from_3[4];
wire[31:0] _128 = from_3[8];
wire _129 = offset_bits[2];
wire[31:0] _130 = from_3[5];
wire[31:0] _131 = from_3[9];
wire _132 = offset_bits[2];
wire[31:0] _133 = from_3[6];
wire[31:0] _134 = from_3[10];
wire _135 = offset_bits[2];
wire[31:0] _136 = from_3[7];
wire[31:0] _137 = from_3[11];
wire _138 = offset_bits[2];
wire[31:0] _139 = from_3[8];
wire[31:0] _140 = from_3[12];
wire _141 = offset_bits[2];
wire[31:0] _142 = from_3[9];
wire[31:0] _143 = from_3[13];
wire _144 = offset_bits[2];
wire[31:0] _145 = from_3[10];
wire[31:0] _146 = from_3[14];
wire _147 = offset_bits[2];
wire[31:0] _148 = from_3[11];
wire[31:0] _149 = from_3[15];
/*mux_wire*/ logic[31:0] from_4[15:0];
wire[31:0] _150[15:0];
generate
for(_g0 = 0; _g0 < 16; _g0 = _g0 + 1) begin
assign _150[_g0] = rotate_stages[3][_g0];
end
endgenerate
wire _151 = offset_bits[3];
wire[31:0] _152 = from_4[8];
wire[31:0] _153 = from_4[0];
wire _154 = offset_bits[3];
wire[31:0] _155 = from_4[9];
wire[31:0] _156 = from_4[1];
wire _157 = offset_bits[3];
wire[31:0] _158 = from_4[10];
wire[31:0] _159 = from_4[2];
wire _160 = offset_bits[3];
wire[31:0] _161 = from_4[11];
wire[31:0] _162 = from_4[3];
wire _163 = offset_bits[3];
wire[31:0] _164 = from_4[12];
wire[31:0] _165 = from_4[4];
wire _166 = offset_bits[3];
wire[31:0] _167 = from_4[13];
wire[31:0] _168 = from_4[5];
wire _169 = offset_bits[3];
wire[31:0] _170 = from_4[14];
wire[31:0] _171 = from_4[6];
wire _172 = offset_bits[3];
wire[31:0] _173 = from_4[15];
wire[31:0] _174 = from_4[7];
wire _175 = offset_bits[3];
wire[31:0] _176 = from_4[0];
wire[31:0] _177 = from_4[8];
wire _178 = offset_bits[3];
wire[31:0] _179 = from_4[1];
wire[31:0] _180 = from_4[9];
wire _181 = offset_bits[3];
wire[31:0] _182 = from_4[2];
wire[31:0] _183 = from_4[10];
wire _184 = offset_bits[3];
wire[31:0] _185 = from_4[3];
wire[31:0] _186 = from_4[11];
wire _187 = offset_bits[3];
wire[31:0] _188 = from_4[4];
wire[31:0] _189 = from_4[12];
wire _190 = offset_bits[3];
wire[31:0] _191 = from_4[5];
wire[31:0] _192 = from_4[13];
wire _193 = offset_bits[3];
wire[31:0] _194 = from_4[6];
wire[31:0] _195 = from_4[14];
wire _196 = offset_bits[3];
wire[31:0] _197 = from_4[7];
wire[31:0] _198 = from_4[15];
wire[31:0] _199[15:0];
generate
for(_g0 = 0; _g0 < 16; _g0 = _g0 + 1) begin
assign _199[_g0] = rotate_stages[4][_g0];
end
endgenerate
UIntToBits_NUM_BITS_4 UIntToBits(
	.clk(clk),
	.value(_UIntToBits_value),
	.bits(_UIntToBits_bits)
);
always_comb begin // combinatorial rotated_data
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	rotated_data = '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx};
	for(int _v0 = 0; _v0 < 16; _v0 = _v0 + 1) begin
rotated_data[_v0] = _199[_v0];
end
end
always_comb begin // combinatorial offset_bits
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	offset_bits = 4'bxxxx;
	offset_bits = _UIntToBits_bits;
end
always_comb begin // combinatorial _UIntToBits_value
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_UIntToBits_value = 4'dx;
	_UIntToBits_value = offset;
end
always_comb begin // combinatorial rotate_stages
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	rotate_stages = '{'{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx}, '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx}, '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx}, '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx}, '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx}};
	for(int _v0 = 0; _v0 < 16; _v0 = _v0 + 1) begin
rotate_stages[0][_v0] = data[_v0];
end
	if(_4) rotate_stages[1][0] = _5;
	if(!_4) rotate_stages[1][0] = _6;
	if(_7) rotate_stages[1][1] = _8;
	if(!_7) rotate_stages[1][1] = _9;
	if(_10) rotate_stages[1][2] = _11;
	if(!_10) rotate_stages[1][2] = _12;
	if(_13) rotate_stages[1][3] = _14;
	if(!_13) rotate_stages[1][3] = _15;
	if(_16) rotate_stages[1][4] = _17;
	if(!_16) rotate_stages[1][4] = _18;
	if(_19) rotate_stages[1][5] = _20;
	if(!_19) rotate_stages[1][5] = _21;
	if(_22) rotate_stages[1][6] = _23;
	if(!_22) rotate_stages[1][6] = _24;
	if(_25) rotate_stages[1][7] = _26;
	if(!_25) rotate_stages[1][7] = _27;
	if(_28) rotate_stages[1][8] = _29;
	if(!_28) rotate_stages[1][8] = _30;
	if(_31) rotate_stages[1][9] = _32;
	if(!_31) rotate_stages[1][9] = _33;
	if(_34) rotate_stages[1][10] = _35;
	if(!_34) rotate_stages[1][10] = _36;
	if(_37) rotate_stages[1][11] = _38;
	if(!_37) rotate_stages[1][11] = _39;
	if(_40) rotate_stages[1][12] = _41;
	if(!_40) rotate_stages[1][12] = _42;
	if(_43) rotate_stages[1][13] = _44;
	if(!_43) rotate_stages[1][13] = _45;
	if(_46) rotate_stages[1][14] = _47;
	if(!_46) rotate_stages[1][14] = _48;
	if(_49) rotate_stages[1][15] = _50;
	if(!_49) rotate_stages[1][15] = _51;
	if(_53) rotate_stages[2][0] = _54;
	if(!_53) rotate_stages[2][0] = _55;
	if(_56) rotate_stages[2][1] = _57;
	if(!_56) rotate_stages[2][1] = _58;
	if(_59) rotate_stages[2][2] = _60;
	if(!_59) rotate_stages[2][2] = _61;
	if(_62) rotate_stages[2][3] = _63;
	if(!_62) rotate_stages[2][3] = _64;
	if(_65) rotate_stages[2][4] = _66;
	if(!_65) rotate_stages[2][4] = _67;
	if(_68) rotate_stages[2][5] = _69;
	if(!_68) rotate_stages[2][5] = _70;
	if(_71) rotate_stages[2][6] = _72;
	if(!_71) rotate_stages[2][6] = _73;
	if(_74) rotate_stages[2][7] = _75;
	if(!_74) rotate_stages[2][7] = _76;
	if(_77) rotate_stages[2][8] = _78;
	if(!_77) rotate_stages[2][8] = _79;
	if(_80) rotate_stages[2][9] = _81;
	if(!_80) rotate_stages[2][9] = _82;
	if(_83) rotate_stages[2][10] = _84;
	if(!_83) rotate_stages[2][10] = _85;
	if(_86) rotate_stages[2][11] = _87;
	if(!_86) rotate_stages[2][11] = _88;
	if(_89) rotate_stages[2][12] = _90;
	if(!_89) rotate_stages[2][12] = _91;
	if(_92) rotate_stages[2][13] = _93;
	if(!_92) rotate_stages[2][13] = _94;
	if(_95) rotate_stages[2][14] = _96;
	if(!_95) rotate_stages[2][14] = _97;
	if(_98) rotate_stages[2][15] = _99;
	if(!_98) rotate_stages[2][15] = _100;
	if(_102) rotate_stages[3][0] = _103;
	if(!_102) rotate_stages[3][0] = _104;
	if(_105) rotate_stages[3][1] = _106;
	if(!_105) rotate_stages[3][1] = _107;
	if(_108) rotate_stages[3][2] = _109;
	if(!_108) rotate_stages[3][2] = _110;
	if(_111) rotate_stages[3][3] = _112;
	if(!_111) rotate_stages[3][3] = _113;
	if(_114) rotate_stages[3][4] = _115;
	if(!_114) rotate_stages[3][4] = _116;
	if(_117) rotate_stages[3][5] = _118;
	if(!_117) rotate_stages[3][5] = _119;
	if(_120) rotate_stages[3][6] = _121;
	if(!_120) rotate_stages[3][6] = _122;
	if(_123) rotate_stages[3][7] = _124;
	if(!_123) rotate_stages[3][7] = _125;
	if(_126) rotate_stages[3][8] = _127;
	if(!_126) rotate_stages[3][8] = _128;
	if(_129) rotate_stages[3][9] = _130;
	if(!_129) rotate_stages[3][9] = _131;
	if(_132) rotate_stages[3][10] = _133;
	if(!_132) rotate_stages[3][10] = _134;
	if(_135) rotate_stages[3][11] = _136;
	if(!_135) rotate_stages[3][11] = _137;
	if(_138) rotate_stages[3][12] = _139;
	if(!_138) rotate_stages[3][12] = _140;
	if(_141) rotate_stages[3][13] = _142;
	if(!_141) rotate_stages[3][13] = _143;
	if(_144) rotate_stages[3][14] = _145;
	if(!_144) rotate_stages[3][14] = _146;
	if(_147) rotate_stages[3][15] = _148;
	if(!_147) rotate_stages[3][15] = _149;
	if(_151) rotate_stages[4][0] = _152;
	if(!_151) rotate_stages[4][0] = _153;
	if(_154) rotate_stages[4][1] = _155;
	if(!_154) rotate_stages[4][1] = _156;
	if(_157) rotate_stages[4][2] = _158;
	if(!_157) rotate_stages[4][2] = _159;
	if(_160) rotate_stages[4][3] = _161;
	if(!_160) rotate_stages[4][3] = _162;
	if(_163) rotate_stages[4][4] = _164;
	if(!_163) rotate_stages[4][4] = _165;
	if(_166) rotate_stages[4][5] = _167;
	if(!_166) rotate_stages[4][5] = _168;
	if(_169) rotate_stages[4][6] = _170;
	if(!_169) rotate_stages[4][6] = _171;
	if(_172) rotate_stages[4][7] = _173;
	if(!_172) rotate_stages[4][7] = _174;
	if(_175) rotate_stages[4][8] = _176;
	if(!_175) rotate_stages[4][8] = _177;
	if(_178) rotate_stages[4][9] = _179;
	if(!_178) rotate_stages[4][9] = _180;
	if(_181) rotate_stages[4][10] = _182;
	if(!_181) rotate_stages[4][10] = _183;
	if(_184) rotate_stages[4][11] = _185;
	if(!_184) rotate_stages[4][11] = _186;
	if(_187) rotate_stages[4][12] = _188;
	if(!_187) rotate_stages[4][12] = _189;
	if(_190) rotate_stages[4][13] = _191;
	if(!_190) rotate_stages[4][13] = _192;
	if(_193) rotate_stages[4][14] = _194;
	if(!_193) rotate_stages[4][14] = _195;
	if(_196) rotate_stages[4][15] = _197;
	if(!_196) rotate_stages[4][15] = _198;
end
always_comb begin // combinatorial from
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	from = '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx};
	for(int _v0 = 0; _v0 < 16; _v0 = _v0 + 1) begin
from[_v0] = _3[_v0];
end
end
always_comb begin // combinatorial from_2
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	from_2 = '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx};
	for(int _v0 = 0; _v0 < 16; _v0 = _v0 + 1) begin
from_2[_v0] = _52[_v0];
end
end
always_comb begin // combinatorial from_3
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	from_3 = '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx};
	for(int _v0 = 0; _v0 < 16; _v0 = _v0 + 1) begin
from_3[_v0] = _101[_v0];
end
end
always_comb begin // combinatorial from_4
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	from_4 = '{32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx};
	for(int _v0 = 0; _v0 < 16; _v0 = _v0 + 1) begin
from_4[_v0] = _150[_v0];
end
end
endmodule

// UIntToBits #(NUM_BITS: 4)
module UIntToBits_NUM_BITS_4(
	input clk,
	input wire[3:0] value,
	output /*mux_wire*/ logic[3:0] bits
);

	assign bits = value;
endmodule

// write_burst_address_manager #(AXI_WIDTH: 512, ATO: 18446744073709551616, NUM_PARALLEL_ELEMENTS: 16, ADDR_QUEUE_SIZE: 20, ADDR_MAY_PUSH_LATENCY: 1, TOTAL_ELEMENTS_THAT_CAN_BE_STORED: 8192)
module write_burst_address_manager_AXI_WIDTH_512_ATO_18446744073709551616_NUM_PARALLEL_ELEMENTS_16_ADDR_QUEUE_SIZE_20_ADDR_MAY_PUSH_LATENCY_1_TOTAL_ELEMENTS_THAT_CAN_BE_STORED_8192(
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
/*mux_wire*/ logic[51:0] next_burst_idx;
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
FIFO_T_type_int_FROM_0_TO_4611686018427387904_DEPTH_20_MAY_PUSH_LATENCY_1 addr_fifo(
	.clk(clk),
	.rst(_addr_fifo_rst),
	.may_push(_addr_fifo_may_push),
	.push(_addr_fifo_push),
	.push_data(_addr_fifo_push_data),
	.may_pop(_addr_fifo_may_pop),
	.pop(_addr_fifo_pop),
	.pop_data(_addr_fifo_pop_data)
);
FIFO_T_type_bool_12_DEPTH_48_MAY_PUSH_LATENCY_0 command_fifo(
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
always_comb begin // combinatorial next_burst_idx
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	next_burst_idx = 52'dx;
	if(_17) if(_current_command_chunk_end_old) if(do_accept_burst) next_burst_idx = _38;
end
always_comb begin // combinatorial _BitwiseIntConcat_upper
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntConcat_upper = 52'dx;
	if(_17) if(_current_command_chunk_end_old) if(do_accept_burst) _BitwiseIntConcat_upper = next_burst_idx;
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

// FIFO #(T: type bool #()[12], DEPTH: 48, MAY_PUSH_LATENCY: 0)
module FIFO_T_type_bool_12_DEPTH_48_MAY_PUSH_LATENCY_0(
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
/*state*/ logic[11:0] mem[47:0];
/*state*/ logic[5:0] read_addr;
/*state*/ logic[5:0] write_addr;
/*mux_wire*/ logic[5:0] space_remaining;
wire[5:0] _6;
assign _6 = write_addr + 1'd1;
wire signed[6:0] _7;
assign _7 = read_addr - _6;
wire[5:0] _8;
assign _8 = _7 + ((_7 < 0) ? 48 : 0); // == mod 48
wire _10;
assign _10 = space_remaining > 1'd0;
/*mux_wire*/ logic _LatencyOffset_in;
wire _LatencyOffset_out;
wire[5:0] _15;
assign _15 = write_addr + 1'd1;
wire[5:0] _16;
assign _16 = (_15 == 48) ? 0 : _15; // == mod 48
wire _19;
assign _19 = read_addr != write_addr;
wire[11:0] _21 = mem[read_addr];
/*latency*/ logic[11:0] __21_D1; always_ff @(posedge clk) begin __21_D1 <= _21; end
wire[5:0] _24;
assign _24 = read_addr + 1'd1;
wire[5:0] _25;
assign _25 = (_24 == 48) ? 0 : _24; // == mod 48
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

// FIFO #(T: type int #(FROM: 0, TO: 4611686018427387904), DEPTH: 20, MAY_PUSH_LATENCY: 1)
module FIFO_T_type_int_FROM_0_TO_4611686018427387904_DEPTH_20_MAY_PUSH_LATENCY_1(
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
assign _10 = space_remaining > 1'd1;
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
LatencyOffset_T_type_bool_OFFSET_1 LatencyOffset(
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

// write_burst_address_manager #(AXI_WIDTH: 512, ATO: 18446744073709551616, NUM_PARALLEL_ELEMENTS: 16, ADDR_QUEUE_SIZE: 20, ADDR_MAY_PUSH_LATENCY: 0, TOTAL_ELEMENTS_THAT_CAN_BE_STORED: 2048)
module write_burst_address_manager_AXI_WIDTH_512_ATO_18446744073709551616_NUM_PARALLEL_ELEMENTS_16_ADDR_QUEUE_SIZE_20_ADDR_MAY_PUSH_LATENCY_0_TOTAL_ELEMENTS_THAT_CAN_BE_STORED_2048(
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
/*mux_wire*/ logic[51:0] next_burst_idx;
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
always_comb begin // combinatorial next_burst_idx
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	next_burst_idx = 52'dx;
	if(_17) if(_current_command_chunk_end_old) if(do_accept_burst) next_burst_idx = _38;
end
always_comb begin // combinatorial _BitwiseIntConcat_upper
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_BitwiseIntConcat_upper = 52'dx;
	if(_17) if(_current_command_chunk_end_old) if(do_accept_burst) _BitwiseIntConcat_upper = next_burst_idx;
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
/*mux_wire*/ logic _addr_queue_pop;
/*mux_wire*/ logic _addr_queue_rst;
FWFT_T_type_int_FROM_0_TO_1024_DEPTH_20_MAY_PUSH_LATENCY_0 addr_queue(
	.clk(clk),
	.rst(_addr_queue_rst),
	.may_push(_addr_queue_may_push),
	.push(_addr_queue_push),
	.push_data(_addr_queue_push_data),
	.pop_available(_addr_queue_pop_available),
	.pop_data(_addr_queue_pop_data),
	.pop(_addr_queue_pop)
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
always_comb begin // combinatorial _addr_queue_pop
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	_addr_queue_pop = 1'bx;
	_addr_queue_pop = 1'b0;
	if(new_addr_requested) if(_addr_queue_pop_available) _addr_queue_pop = 1'b1;
	// PATCH Vivado 23.1 Simulator Bug: 1-bit Conditional Assigns become don't care
	_addr_queue_pop = _addr_queue_pop;
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

