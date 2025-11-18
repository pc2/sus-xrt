
module array_burstreader_tb;
logic clk = 0;
always #5 clk = !clk;

logic aresetn = 0;

/*

module test_burst_reader {
    domain aclk
    input bool aresetn'0

    output bool                     arvalid'0
    input  bool                     arready'0
    output int#(FROM: 0, TO: ATO)   araddr'0
    output int#(FROM: 0, TO: 256)   arlen'0
    output bool[2]                  arburst'0
    input  bool                     rvalid'0
    output bool                     rready'0
    input  bool[AXI_WIDTH]          rdata'0
    input  bool                     rlast'0

    // User ports
    input bool is_ready_to_receive_lots_of_data'-MAX_CHUNKS_IN_FLIGHT
    trigger element_packet_valid'0: ElemT[NUM_PARALLEL_ELEMENTS] elements'0, int#(FROM: 0, TO: NUM_PARALLEL_ELEMENTS) chunk_offset'0, int#(FROM: 1, TO: NUM_PARALLEL_ELEMENTS+1) chunk_length'0, bool last'0


    output bool may_request_new_burst'0 = !chunks_are_left & num_chunks_left.may_update & cur_start_chunk_addr.may_update
    action request_new_burst'0 : int#(FROM: 0, TO: ATO) start_addr'0, int#(FROM: 0, TO: MAX_NUM_ELEMENTS+1) count'0
}
*/
localparam AXI_WIDTH = 64;
localparam ELEM_BYTE_SIZE = 2;
localparam NUM_PARALLEL_ELEMENTS = 4;

logic                 arvalid;
logic                 arready = 1;
logic[63:0]           araddr;
logic[7:0]            arlen;
logic[1:0]            arburst;
logic                 rvalid = 0;
logic                 rready;
logic[AXI_WIDTH-1:0]  rdata;
logic                 rlast = 0;

logic is_ready_to_receive_lots_of_data = 1;
logic element_packet_valid;
logic[ELEM_BYTE_SIZE*8-1:0] elements[NUM_PARALLEL_ELEMENTS-1:0];
logic[$clog2(NUM_PARALLEL_ELEMENTS)-1:0] chunk_offset;
logic[$clog2(NUM_PARALLEL_ELEMENTS+1)-1:0] chunk_length;
logic last;

logic may_request_new_burst;
logic request_new_burst = 0;
logic[63:0] start_addr;
logic[15:0] count;

axi_array_burst_reader_AXI_WIDTH_64_ADDR_ALIGN_2_COUNT_TO_65536_ATO_18446744073709551616 dut(
    .aclk(clk),
    .aresetn(aresetn),

    // AXI4 Master
    .arvalid(arvalid),
    .arready(arready),
    .araddr(araddr),
    .arlen(arlen),
    .arburst(arburst),
    .rvalid(rvalid),
    .rready(rready),
    .rdata(rdata),
    .rlast(rlast),

    // User wires
    .is_ready_to_receive_lots_of_data(is_ready_to_receive_lots_of_data),
    .element_packet_valid(element_packet_valid),
    .elements(elements),
    .chunk_offset(chunk_offset),
    .chunk_length(chunk_length),
    .last(last),
    .may_request_new_burst(may_request_new_burst),
    .request_new_burst(request_new_burst),
    .start_addr(start_addr),
    .count(count)
);

typedef struct {
  int addr;
  int len;
} burst_t;

burst_t burst_q[$];

initial forever begin
    is_ready_to_receive_lots_of_data <= !is_ready_to_receive_lots_of_data;
    #4000
    @(posedge clk);
end

always @(posedge clk) begin
    if(burst_q.size() != 0) begin
        automatic burst_t b = burst_q.pop_front();
        //$display("Popped burst_q: addr: %d, len: %d, new_depth: %d", b.addr, b.len, burst_q.size());
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        rvalid <= 1;
        for(int i = 0; i <= b.len; i = i + 1) begin
            for(int e = 0; e < NUM_PARALLEL_ELEMENTS; e = e + 1) begin
                rdata[e * ELEM_BYTE_SIZE*8 +: ELEM_BYTE_SIZE*8] <= b.addr + (i * NUM_PARALLEL_ELEMENTS + e) * ELEM_BYTE_SIZE;
            end
            if(i == b.len - 1) rlast <= 1;
            @(posedge clk);
        end
        rdata <= 'x;
        rlast <= 0;
        rvalid <= 0;
        @(posedge clk);
    end
end

always @(posedge clk) begin
    if (arvalid & arready) begin
        burst_q.push_back('{addr: araddr, len: arlen});
        //$display("Pushed back burst_q: addr: %d, len: %d, new_depth: %d", araddr, arlen, burst_q.size());
    end
end

/*int total_chunks_received = 0;
int total_elements_received = 0;
always @(posedge clk) begin
    if (rvalid & rready) begin
        total_chunks_received = total_chunks_received + 1;
        total_elements_received = total_elements_received + chunk_length;
        $display("Received %d chunks, %d elements, last was %d, %d", total_chunks_received, total_elements_received, elements[0], elements[1]);
    end
end*/

int element_index;
int chunk_index = 0;
task automatic test_burst(input int start, input int cnt);
    $display("TESTING BURST start: %d, cnt: %d", start, cnt);
    request_new_burst <= 1;
    start_addr <= start;
    count <= cnt;
    @(posedge clk);
    request_new_burst <= 0;
    
    element_index = 0;
    chunk_index = 0;
    while(!(last & element_packet_valid)) begin
        @(posedge clk);
        if(element_packet_valid) begin
            chunk_index += 1;
            for(int i = 0; i < chunk_length; i = i + 1) begin
                logic[31:0] expected_value = start + element_index * ELEM_BYTE_SIZE;
                if(expected_value != elements[chunk_offset + i])
                    $display("INCORRECT VALUE! Element %d was %d instead of %d", element_index, elements[chunk_offset + i], expected_value);
                element_index = element_index + 1;
            end
        end
    end
    
    if(element_index != cnt) begin
        $display("INCORRECT LENGTH! %d instead of %d", element_index, cnt);
    end else begin
        //$display("FINISHED %d length burst - took %d chunks", element_index, chunk_index);
    end
endtask

initial begin
    #100
    @(posedge clk);
    aresetn = 1;
    repeat(10) @(posedge clk);
    
    test_burst(10000, 2000);
    test_burst(10002, 2000);
    
    for(int s = 0; s < 20; s=s+2) begin
        for(int i = 0; i < 20; i=i+1) begin
            test_burst(s, i);
        end
    end
    
    test_burst(14, 1);
    test_burst(16, 4);
    test_burst(18, 3);
    test_burst(20, 2);
    test_burst(16, 0);
    
    test_burst(18, 18);

    $finish;
end
endmodule



module realigning_burstreader_tb;
logic clk = 0;
always #5 clk = !clk;

logic aresetn = 0;

/*

module test_burst_reader {
    domain aclk
    input bool aresetn'0

    output bool                     arvalid'0
    input  bool                     arready'0
    output int#(FROM: 0, TO: ATO)   araddr'0
    output int#(FROM: 0, TO: 256)   arlen'0
    output bool[2]                  arburst'0
    input  bool                     rvalid'0
    output bool                     rready'0
    input  bool[AXI_WIDTH]          rdata'0
    input  bool                     rlast'0

    // User ports
    input bool is_ready_to_receive_lots_of_data'-MAX_CHUNKS_IN_FLIGHT
    trigger element_packet_valid'0: ElemT[NUM_PARALLEL_ELEMENTS] elements'0, int#(FROM: 0, TO: NUM_PARALLEL_ELEMENTS) chunk_offset'0, int#(FROM: 1, TO: NUM_PARALLEL_ELEMENTS+1) chunk_length'0, bool last'0


    output bool may_request_new_burst'0 = !chunks_are_left & num_chunks_left.may_update & cur_start_chunk_addr.may_update
    action request_new_burst'0 : int#(FROM: 0, TO: ATO) start_addr'0, int#(FROM: 0, TO: MAX_NUM_ELEMENTS+1) count'0
}
*/
localparam AXI_WIDTH = 512;
localparam VALUE_SIZE = 32;
localparam VALUE_ARRAY_SIZE = 17;
localparam NUM_PARALLEL_ELEMENTS = AXI_WIDTH / VALUE_SIZE;

logic                 arvalid;
logic                 arready = 1;
logic[63:0]           araddr;
logic[7:0]            arlen;
logic[1:0]            arburst;
logic                 rvalid = 0;
logic                 rready;
logic[AXI_WIDTH-1:0]  rdata;
logic                 rlast = 0;

logic is_ready_to_receive_lots_of_data = 1;
logic value_valid;
logic[VALUE_SIZE-1:0] value[VALUE_ARRAY_SIZE-1:0];
logic last;

logic may_request_new_burst;
logic request_new_burst = 0;
logic[63:0] start_addr;
logic[15:0] count;

axi_realigning_burst_reader_T_type_bool_32_17_AXI_WIDTH_512_ADDR_ALIGN_4_COUNT_TO_65536_ATO_18446744073709551616 dut(
    .aclk(clk),
    .aresetn(aresetn),

    // AXI4 Master
    .arvalid(arvalid),
    .arready(arready),
    .araddr(araddr),
    .arlen(arlen),
    .arburst(arburst),
    .rvalid(rvalid),
    .rready(rready),
    .rdata(rdata),
    .rlast(rlast),
    .rresp(2'b00),

    // User wires
    .is_ready_to_receive_lots_of_data(is_ready_to_receive_lots_of_data),
    .value_valid(value_valid),
    .value(value),
    .last(last),
    .may_request_new_burst(may_request_new_burst),
    .request_new_burst(request_new_burst),
    .start_addr(start_addr),
    .count(count),
    
    .max_in_flight(320)
);

typedef struct {
  int addr;
  int len;
} burst_t;

burst_t burst_q[$];

initial forever begin
    is_ready_to_receive_lots_of_data <= !is_ready_to_receive_lots_of_data;
    #4000
    @(posedge clk);
end

initial forever begin
    if(burst_q.size() != 0) begin
        automatic burst_t b = burst_q.pop_front();
        //$display("Popped burst_q: addr: %d, len: %d, new_depth: %d", b.addr, b.len, burst_q.size());
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        rvalid <= 1;
        for(int i = 0; i <= b.len; i = i + 1) begin
            for(int e = 0; e < NUM_PARALLEL_ELEMENTS; e = e + 1) begin
                rdata[e * VALUE_SIZE +: VALUE_SIZE] <= b.addr + (i * NUM_PARALLEL_ELEMENTS + e) * VALUE_SIZE / 8;
            end
            if(i == b.len - 1) rlast <= 1;
            @(posedge clk);
        end
        rdata <= 'x;
        rlast <= 0;
        rvalid <= 0;
    end
    @(posedge clk);
end

always @(posedge clk) begin
    if (arvalid & arready) begin
        burst_q.push_back('{addr: araddr, len: arlen});
        //$display("Pushed back burst_q: addr: %d, len: %d, new_depth: %d", araddr, arlen, burst_q.size());
    end
end

/*int total_chunks_received = 0;
int total_elements_received = 0;
always @(posedge clk) begin
    if (rvalid & rready) begin
        total_chunks_received = total_chunks_received + 1;
        total_elements_received = total_elements_received + chunk_length;
        $display("Received %d chunks, %d elements, last was %d, %d", total_chunks_received, total_elements_received, elements[0], elements[1]);
    end
end*/

int value_index;
task automatic test_burst(input int start, input int cnt);
    $display("TESTING BURST start: %d, cnt: %d", start, cnt);
    if(cnt == 0) begin
        $display("Count 0 burst, skipping...");
        return;
    end
    request_new_burst <= 1;
    start_addr <= start;
    count <= cnt;
    @(posedge clk);
    request_new_burst <= 0;
    
    value_index = 0;
    while(!(last & value_valid)) begin
        @(posedge clk);
        if(value_valid) begin
            for(int i = 0; i < VALUE_ARRAY_SIZE; i = i + 1) begin
                logic[31:0] expected_value = start + (value_index * VALUE_ARRAY_SIZE + i) * VALUE_SIZE / 8;
                if(expected_value != value[i])
                    $display("INCORRECT VALUE! Element %d was %d instead of %d", value_index * VALUE_ARRAY_SIZE + i, value[i], expected_value);
            end
            value_index += 1;
        end
    end
    
    if(value_index != cnt) begin
        $display("INCORRECT LENGTH! %d instead of %d", value_index, cnt);
    end else begin
        //$display("FINISHED %d length burst - took %d chunks", element_index, chunk_index);
    end
endtask

initial begin
    #100
    @(posedge clk);
    aresetn = 1;
    repeat(10) @(posedge clk);
    
    test_burst(10000, 2000);
    test_burst(10004, 2000);
    
    for(int s = 0; s < 20; s=s+2) begin
        for(int i = 1; i < 20; i=i+1) begin
            test_burst(s * 4, i);
        end
    end

    repeat(300) @(posedge clk);
    $finish;
end
endmodule


module aligned_realigning_burstreader_tb;
logic clk = 0;
always #5 clk = !clk;

logic aresetn = 0;

/*

module test_burst_reader {
    domain aclk
    input bool aresetn'0

    output bool                     arvalid'0
    input  bool                     arready'0
    output int#(FROM: 0, TO: ATO)   araddr'0
    output int#(FROM: 0, TO: 256)   arlen'0
    output bool[2]                  arburst'0
    input  bool                     rvalid'0
    output bool                     rready'0
    input  bool[AXI_WIDTH]          rdata'0
    input  bool                     rlast'0

    // User ports
    input bool is_ready_to_receive_lots_of_data'-MAX_CHUNKS_IN_FLIGHT
    trigger element_packet_valid'0: ElemT[NUM_PARALLEL_ELEMENTS] elements'0, int#(FROM: 0, TO: NUM_PARALLEL_ELEMENTS) chunk_offset'0, int#(FROM: 1, TO: NUM_PARALLEL_ELEMENTS+1) chunk_length'0, bool last'0


    output bool may_request_new_burst'0 = !chunks_are_left & num_chunks_left.may_update & cur_start_chunk_addr.may_update
    action request_new_burst'0 : int#(FROM: 0, TO: ATO) start_addr'0, int#(FROM: 0, TO: MAX_NUM_ELEMENTS+1) count'0
}
*/
localparam AXI_WIDTH = 512;
localparam VALUE_SIZE = 32;
localparam VALUE_ARRAY_SIZE = 16;
localparam NUM_PARALLEL_ELEMENTS = AXI_WIDTH / VALUE_SIZE;

logic                 arvalid;
logic                 arready = 1;
logic[63:0]           araddr;
logic[7:0]            arlen;
logic[1:0]            arburst;
logic                 rvalid = 0;
logic                 rready;
logic[AXI_WIDTH-1:0]  rdata;
logic                 rlast = 0;

logic is_ready_to_receive_lots_of_data = 1;
logic value_valid;
logic[VALUE_SIZE-1:0] value[VALUE_ARRAY_SIZE-1:0];
logic last;

logic may_request_new_burst;
logic request_new_burst = 0;
logic[63:0] start_addr;
logic[15:0] count;

axi_realigning_burst_reader_T_type_bool_32_16_AXI_WIDTH_512_ADDR_ALIGN_64_COUNT_TO_65536_ATO_18446744073709551616 dut(
    .aclk(clk),
    .aresetn(aresetn),

    // AXI4 Master
    .arvalid(arvalid),
    .arready(arready),
    .araddr(araddr),
    .arlen(arlen),
    .arburst(arburst),
    .rvalid(rvalid),
    .rready(rready),
    .rdata(rdata),
    .rlast(rlast),

    // User wires
    .is_ready_to_receive_lots_of_data(is_ready_to_receive_lots_of_data),
    .value_valid(value_valid),
    .value(value),
    .last(last),
    .may_request_new_burst(may_request_new_burst),
    .request_new_burst(request_new_burst),
    .start_addr(start_addr),
    .count(count)
);

typedef struct {
  int addr;
  int len;
} burst_t;

burst_t burst_q[$];

initial forever begin
    is_ready_to_receive_lots_of_data <= !is_ready_to_receive_lots_of_data;
    #4000
    @(posedge clk);
end

initial forever begin
    if(burst_q.size() != 0) begin
        automatic burst_t b = burst_q.pop_front();
        //$display("Popped burst_q: addr: %d, len: %d, new_depth: %d", b.addr, b.len, burst_q.size());
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        rvalid <= 1;
        for(int i = 0; i <= b.len; i = i + 1) begin
            for(int e = 0; e < NUM_PARALLEL_ELEMENTS; e = e + 1) begin
                rdata[e * VALUE_SIZE +: VALUE_SIZE] <= b.addr + (i * NUM_PARALLEL_ELEMENTS + e) * VALUE_SIZE / 8;
            end
            if(i == b.len - 1) rlast <= 1;
            @(posedge clk);
        end
        rdata <= 'x;
        rlast <= 0;
        rvalid <= 0;
        @(posedge clk);
    end
end

always @(posedge clk) begin
    if (arvalid & arready) begin
        burst_q.push_back('{addr: araddr, len: arlen});
        //$display("Pushed back burst_q: addr: %d, len: %d, new_depth: %d", araddr, arlen, burst_q.size());
    end
end

/*int total_chunks_received = 0;
int total_elements_received = 0;
always @(posedge clk) begin
    if (rvalid & rready) begin
        total_chunks_received = total_chunks_received + 1;
        total_elements_received = total_elements_received + chunk_length;
        $display("Received %d chunks, %d elements, last was %d, %d", total_chunks_received, total_elements_received, elements[0], elements[1]);
    end
end*/

int value_index;
task automatic test_burst(input int start, input int cnt);
    $display("TESTING BURST start: %d, cnt: %d", start, cnt);
    if(cnt == 0) begin
        $display("Count 0 burst, skipping...");
        return;
    end
    request_new_burst <= 1;
    start_addr <= start;
    count <= cnt;
    @(posedge clk);
    request_new_burst <= 0;
    
    value_index = 0;
    while(!(last & value_valid)) begin
        @(posedge clk);
        if(value_valid) begin
            for(int i = 0; i < VALUE_ARRAY_SIZE; i = i + 1) begin
                logic[31:0] expected_value = start + (value_index * VALUE_ARRAY_SIZE + i) * VALUE_SIZE / 8;
                if(expected_value != value[i])
                    $display("INCORRECT VALUE! Element %d was %d instead of %d", value_index * VALUE_ARRAY_SIZE + i, value[i], expected_value);
            end
            value_index += 1;
        end
    end
    
    if(value_index != cnt) begin
        $display("INCORRECT LENGTH! %d instead of %d", value_index, cnt);
    end else begin
        //$display("FINISHED %d length burst - took %d chunks", element_index, chunk_index);
    end
endtask

initial begin
    #100
    @(posedge clk);
    aresetn = 1;
    repeat(10) @(posedge clk);
    
    test_burst(9984, 2000);
    test_burst(10048, 2000);
    
    for(int s = 0; s < 20; s=s+2) begin
        for(int i = 1; i < 20; i=i+1) begin
            test_burst(s * 64, i);
        end
    end

    $finish;
end
endmodule

module RotateRight_tb;

logic clk = 1;
initial forever #5 clk = !clk;

int offset = 0;
always @(posedge clk) offset = (offset + 1) % 17;

logic[31:0] i[16:0];
initial begin
    for(int ii = 0; ii < 17; ii += 1) 
        i[ii] = ii;
end
logic[31:0] o[16:0];

DoRotate r (
	.clk(clk),
	.i(i),
	.offset(offset),
	.o(o)
);

endmodule
