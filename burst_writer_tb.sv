`timescale 1ns/1ps

module tb_burst_address_manager;

// --------------------------------------------------------------------------
// Clock / Reset
// --------------------------------------------------------------------------
logic aclk = 0;
logic aresetn;

always #5 aclk = ~aclk;   // 100MHz

// --------------------------------------------------------------------------
// AXI Write Address Channel
// --------------------------------------------------------------------------
logic awvalid;
logic awready;
logic [63:0] awaddr;
logic [7:0]  awlen;
logic [2:0]  awsize;
logic [1:0]  awburst;
logic [3:0]  awcache;
logic [2:0]  awprot;
logic [3:0]  awqos;
logic        awlock;
logic [3:0]  awregion;

// --------------------------------------------------------------------------
// Burst / Command Interface
// --------------------------------------------------------------------------
logic may_push_burst;
logic push_burst;
logic [7:0] len;
logic [3:0] start_offset;
logic [3:0] end_offset;
logic last_burst;

logic try_get_command;
logic command_valid;
logic chunk_end;
logic is_last;
logic [9:0] final_align;

logic try_get_addr;
logic addr_valid;
logic [61:0] addr_start;

// --------------------------------------------------------------------------
// DUT
// --------------------------------------------------------------------------
burst_address_manager_AXI_WIDTH_512_ATO_18446744073709551616_ELEMENT_SIZE_4 dut (
    .aclk(aclk),
    .aresetn(aresetn),
    
    .awvalid(awvalid),
    .awready(awready),
    .awaddr(awaddr),
    .awlen(awlen),
    .awsize(awsize),
    .awburst(awburst),
    .awcache(awcache),
    .awprot(awprot),
    .awqos(awqos),
    .awlock(awlock),
    .awregion(awregion),
    
    .may_push_burst(may_push_burst),
    .push_burst(push_burst),
    .len(len),
    .start_offset(start_offset),
    .end_offset(end_offset),
    .last_burst(last_burst),
    
    .try_get_command(try_get_command),
    .command_valid(command_valid),
    .chunk_end(chunk_end),
    .is_last(is_last),
    .final_align(final_align),
    
    .try_get_addr(try_get_addr),
    .addr_valid(addr_valid),
    .addr_start(addr_start)
);

// --------------------------------------------------------------------------
// Simple AXI Slave Model (always ready)
// --------------------------------------------------------------------------
/*initial begin
awready = 0;
@(posedge aresetn);
forever begin
    @(posedge aclk);
    awready <= $urandom_range(0,1);   // random backpressure
end
end*/
initial awready <= 1;

//logic chunk_end;
//logic is_last;
//logic[9:0] final_align;
logic[11:0] command_queue[$];
//wire[61:0] addr_start;
logic[61:0] addr_queue[$];

always @(*) begin
    addr_valid = try_get_addr & (addr_queue.size() != 0);
    if(addr_valid) begin
        addr_start = addr_queue.pop_front();
    end
end

always @(*) begin
    command_valid = try_get_command & (command_queue.size() != 0);
    if(command_valid) begin
        {chunk_end, is_last, final_align} = command_queue.pop_front();
    end
end

initial begin
    #3
    aresetn = 0;
    repeat (10) @(posedge aclk);
    aresetn <= 1;
    
    repeat (10) @(posedge aclk);
    
    may_push_burst = 1;
    
    addr_queue.push_back(12345);
    command_queue.push_back({1'b1, 1'b0, 10'd0});
    command_queue.push_back({1'b1, 1'b0, 10'd0});
    command_queue.push_back({1'b1, 1'b0, 10'd0});
    command_queue.push_back({1'b0, 1'b1, 10'd200});
    
    addr_queue.push_back(200);
    command_queue.push_back({1'b1, 1'b0, 10'd0});
    command_queue.push_back({1'b1, 1'b1, 10'd2});
    
    #200
    $finish();
end
endmodule
