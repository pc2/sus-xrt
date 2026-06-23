`timescale 1ns/1ps

module tb_axis_SkidBuffer;

  // -------------------------------------------------
  // Clock & Reset
  // -------------------------------------------------
  logic clk;
  logic rst;

  initial begin
    clk = 0;
    forever #5 clk = ~clk;   // 100 MHz clock
  end

  initial begin
    rst = 1;
    repeat (5) @(posedge clk);
    rst = 0;
  end

  // -------------------------------------------------
  // DUT Signals
  // -------------------------------------------------
  logic [31:0] adata = 0;
  logic        avalid;
  logic        aready;

  logic [31:0] bdata;
  logic        bvalid;
  logic        bready;

  // -------------------------------------------------
  // Instantiate DUT
  // -------------------------------------------------
  axis_SkidBuffer_T_type_bool_32 dut (
    .clk    (clk),
    .rst (rst),
    .adata   (adata),
    .avalid  (avalid),
    .aready  (aready),
    .bdata   (bdata),
    .bvalid  (bvalid),
    .bready  (bready)
  );

  // -------------------------------------------------
  // Scoreboard
  // -------------------------------------------------
  int unsigned sent_queue[$];
  int unsigned recv_queue[$];
  
  // Track transfers
  always @(posedge clk) begin
    if (!rst) begin
      if (avalid && aready) begin
        sent_queue.push_back(adata);
        adata <= adata + 1;
      end

      if (bvalid && bready) begin
        recv_queue.push_back(bdata);
        //next_expected_bdata <= next_expected_bdata + 1;
      end
    end
  end

  // Final comparison
  task check_results();
    if (sent_queue.size() != recv_queue.size()) begin
      $error("Mismatch in transfer count! Sent=%0d Received=%0d",
              sent_queue.size(), recv_queue.size());
      //$finish;
    end

    for (int i = 0; i < sent_queue.size(); i++) begin
      if (sent_queue[i] !== recv_queue[i]) begin
        $error("Data mismatch at index %0d: sent=%h recv=%h",
                i, sent_queue[i], recv_queue[i]);
        $finish;
      end
    end

    $display("All transfers matched! Test PASSED.");
  endtask
  
  initial begin
    avalid <= 0;
    bready <= 0;

    wait(!rst);
    
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    
    repeat(1000) begin
        @(posedge clk);
        avalid <= $urandom_range(0,1);
        bready <= $urandom_range(0,1);
    end
    
    @(posedge clk);
    bready <= 1;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    bready <= 0;
    
    repeat (20) @(posedge clk);

    check_results();
    $finish;
  end

endmodule