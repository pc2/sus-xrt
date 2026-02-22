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

module burst_writer_address_tb;

logic clk = 0;
logic rst;

always #5 clk = ~clk;   // 100MHz

// Resulting Burst
wire burst_available;
logic accept_burst;
wire[5:0] awlen;
wire[61:0] awaddr;
wire[3:0] start_offset;
wire[3:0] end_offset;
wire is_last;

// Push new addresses
wire may_push_address;
logic push_address;
logic[63:0] new_addr;

// Push new elements
logic push_elements;
logic[4:0] num_elements;
logic is_last_elem;
wire[3:0] fifo_offset;

task send_addr(input logic[63:0] addr);
    wait(may_push_address);
    push_address <= 1;
    new_addr <= addr;
    @(posedge clk);
    push_address <= 0;
    @(posedge clk);
endtask
task send_elements(input logic[31:0] len);
    automatic int amount;
    while(len > 16) begin
        push_elements <= 1;
        is_last_elem <= 0;
        //amount = $urandom_range(0,16);
        amount = 16;
        len <= len - amount;
        num_elements <= amount;
        @(posedge clk);
    end
    push_elements <= 1;
    is_last_elem <= 1;
    num_elements <= len;
    @(posedge clk);
    
    push_elements <= 0;
    @(posedge clk);
endtask

always @* begin
    if(burst_available) begin
        accept_burst <= 1;
    end else begin
        accept_burst <= 0;
    end
end

initial begin
    rst = 1;

    accept_burst = 0;
    push_address = 0;
    push_elements = 0;

    #18

    @(posedge clk)
    rst = 0;

    send_addr(900);
    send_addr(904);
    send_addr(908);
    send_addr(912);
    send_addr(916);
    
    send_elements(800);
    send_elements(800);
    send_elements(800);
    send_elements(800);
    send_elements(900);
    
    #400
    $finish;
    
    send_addr(100);
    send_addr(100);
    send_addr(100);
    send_addr(100);
    send_addr(100);
    
    send_elements(1000);
    send_elements(1001);
    send_elements(1002);
    send_elements(1003);
    send_elements(1004);
    
    $finish;
end

write_burst_address_manager_AXI_WIDTH_BYTES_64_ATO_18446744073709551616_ELEMENT_SIZE_4_ADDR_QUEUE_SIZE_20_ADDR_MAY_PUSH_LATENCY_0_TOTAL_ELEMENTS_THAT_CAN_BE_STORED_2048 mgr(
	.clk,
	.rst,
	.burst_available,
	.accept_burst,
	.awlen,
	.awaddr,
	.start_offset,
	.end_offset,
	.is_last,
	.may_push_address,
	.push_address,
	.new_addr,
	.push_elements,
	.num_elements,
	.is_last_elem,
	.fifo_offset
);

endmodule


module assert_runtime(
    input logic clk,
    input logic assert_runtime,
    input logic condition
);

`ifndef SYNTHESIS
    // Fire on clock edge
    always_ff @(posedge clk) begin
        if (assert_runtime) begin
            assert (condition)
            else begin
                $error("Runtime assertion failed at time %0t", $time);
                // Optional: use $fatal instead if you want to stop simulation
                // $fatal;
            end
        end
    end
`endif

endmodule
