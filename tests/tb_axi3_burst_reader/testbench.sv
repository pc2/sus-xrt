
module array_burstreader_tb;
logic clk = 0;
always #5 clk = !clk;

logic aresetn = 0;

/*

module test_burst_reader {
    clock aclk
    input bool aresetn'0

    output bool                     arvalid'0
    input  bool                     arready'0
    output int#(FROM: 0, TO: ATO)   araddr'0
    output int#(FROM: 0, TO: 16)    arlen'0
    output bool[2]                  arburst'0
    input  bool                     rvalid'0
    output bool                     rready'0
    input  bool[AXI_WIDTH]          rdata'0
    input  bool                     rlast'0

    // User ports
    input bool ready_for_lots_of_data'-MAX_CHUNKS_IN_FLIGHT
    trigger chunk_valid'0: ElemT[NUM_PARALLEL_ELEMENTS] elements'0, int#(FROM: 0, TO: NUM_PARALLEL_ELEMENTS) chunk_offset'0, int#(FROM: 1, TO: NUM_PARALLEL_ELEMENTS+1) chunk_length'0, bool last'0


    output bool may_request_new_read'0 = !chunks_are_left & num_chunks_left.may_update & cur_start_chunk_addr.may_update
    action request_new_read'0 : int#(FROM: 0, TO: ATO) start_addr'0, int#(FROM: 0, TO: MAX_NUM_ELEMENTS+1) count'0
}
*/
localparam AXI_WIDTH = 256;
localparam ELEM_BYTE_SIZE = 4;
localparam NUM_PARALLEL_ELEMENTS = AXI_WIDTH / 8 / ELEM_BYTE_SIZE;

logic                 arvalid;
logic                 arready = 0;
logic[63:0]           araddr;
logic[3:0]            arlen;
logic[1:0]            arburst;
logic                 rvalid;
logic                 rready;
logic[AXI_WIDTH-1:0]  rdata;
logic                 rlast;
logic[1:0]            rresp = 2'b00;

logic ready_for_lots_of_data = 1;
logic chunk_valid;
logic[ELEM_BYTE_SIZE*8-1:0] elements[0:NUM_PARALLEL_ELEMENTS-1];
logic[$clog2(NUM_PARALLEL_ELEMENTS)-1:0] chunk_offset;
logic[$clog2(NUM_PARALLEL_ELEMENTS+1)-1:0] chunk_length;
logic last;

logic may_request_new_read;
logic request_new_read = 0;
logic[63:0] start_addr;
logic[15:0] count;

axi3_burst_reader_ExtraDataT_type_bool_0_AXI_WIDTH_256_ADDR_WIDTH_64_ADDR_ALIGN_4_COUNT_TO_65536_MAX_IN_FLIGHT_192 dut(
    .clk(clk),
    .rst(!aresetn),

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
    .rresp(rresp),

    // User wires
    .ready_for_lots_of_data(ready_for_lots_of_data),
    .chunk_valid(chunk_valid),
    .elements(elements),
    .chunk_offset(chunk_offset),
    .chunk_length(chunk_length),
    .last(last),
    .may_request_new_read(may_request_new_read),
    .request_new_read(request_new_read),
    .start_addr(start_addr),
    .count(count)
);

typedef struct {
  int addr;
  int len;
} burst_t;

burst_t burst_q[$];

initial forever begin
    ready_for_lots_of_data <= !ready_for_lots_of_data;
    #4000
    @(posedge clk);
end

initial forever begin
    automatic burst_t b;

    rdata <= 'x;
    rlast <= 'x;
    rvalid <= 0;
    while(burst_q.size() == 0) begin
        @(posedge clk);
    end
    b = burst_q.pop_front();
    //$display("Popped burst_q: addr: %d, len: %d, new_depth: %d", b.addr, b.len, burst_q.size());
    for(int i = 0; i <= b.len; i = i + 1) begin
        rvalid <= 1;
        for(int e = 0; e < NUM_PARALLEL_ELEMENTS; e = e + 1) begin
            rdata[e * ELEM_BYTE_SIZE*8 +: ELEM_BYTE_SIZE*8] <= b.addr + (i * NUM_PARALLEL_ELEMENTS + e) * ELEM_BYTE_SIZE;
        end
        rlast <= i == b.len;
        @(posedge clk);
        while(!rready) begin
            @(posedge clk);
        end
    end
end

int max_bursts_in_flight = 400;
always @(posedge clk) begin
    if (arvalid & arready) begin
        burst_q.push_back('{addr: araddr, len: arlen});
        //$display("Pushed back burst_q: addr: %d, len: %d, new_depth: %d", araddr, arlen, burst_q.size());
    end
    arready <= burst_q.size() < max_bursts_in_flight;
end

int element_index;
int chunk_index = 0;
task automatic test_burst(input int start, input int cnt);
    $display("TESTING BURST start: %d, cnt: %d", start, cnt);
    request_new_read <= 1;
    start_addr <= start;
    count <= cnt;
    @(posedge clk);
    request_new_read <= 0;
    
    element_index = 0;
    chunk_index = 0;
    while(!(last & chunk_valid)) begin
        @(posedge clk);
        if(chunk_valid) begin
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
    repeat(10) @(posedge clk);

    test_burst(10004, 2000);
    
    for(int s = 0; s < 20; s=s+ELEM_BYTE_SIZE) begin
        for(int i = 0; i < 20; i=i+1) begin
            test_burst(s, i);
        end
    end
    
    test_burst(12, 1);
    test_burst(16, 4);
    test_burst(20, 3);
    test_burst(24, 2);
    test_burst(28, 0);
    
    test_burst(20, 18);

    $finish;
end
endmodule
