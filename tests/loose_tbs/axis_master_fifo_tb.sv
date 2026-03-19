`timescale 1ns/1ps

module axis_master_fifo_example_tb;

    // Clock and reset
    logic clk = 0;
    logic aresetn = 0;

    // AXIS interface
    logic axis_tready;
    logic axis_tvalid;
    logic [31:0] axis_tdata;

    // Push interface
    logic may_push;
    logic push;
    logic [31:0] data;

    // DUT instance
    axis_master_fifo_example dut (
        .clk(clk),
        .aresetn(aresetn),
        .axis_tready(axis_tready),
        .axis_tvalid(axis_tvalid),
        .axis_tdata(axis_tdata),
        .may_push(may_push),
        .push(push),
        .data(data)
    );

    // Clock generation
    always #5 clk = ~clk; // 100 MHz clock

    // Simple scoreboard
    int unsigned expected_data[$];
    
    `define PIPELINE_STAGES 10
    logic[`PIPELINE_STAGES-1:0] may_push_delayed;
    always_ff @(posedge clk) begin
        may_push_delayed <= {may_push_delayed[`PIPELINE_STAGES-2:0], may_push};
    end
    wire may_push_synced = may_push_delayed[`PIPELINE_STAGES-1];
    
    // Push procedure
    task automatic push_data(input [31:0] value);
        if (!may_push_synced) begin
            $display("[%0t] WARNING: Attempted push when FIFO full!", $time);
        end
        data = value;
        push = 1;
        @(posedge clk);
        push = 0;
    endtask

    always_ff @(posedge clk) begin
        if (axis_tvalid && axis_tready) begin
            if (expected_data.size() == 0) begin
                $error("[%0t] Unexpected data on AXIS output: %d", $time, axis_tdata);
            end else begin
                int unsigned exp = expected_data.pop_front();
                if (axis_tdata !== exp)
                    $error("[%0t] Mismatch: expected %d, got %d", $time, exp, axis_tdata);
                else
                    $display("[%0t] OK: received %d", $time, axis_tdata);
            end
        end
    end
    
    always_ff @(posedge clk) begin
        axis_tready = $urandom_range(0,1);
    end
    // Test sequence
    initial begin
        // Initialize
        push = 0;
        data = 0;

        // Reset
        repeat (20) @(posedge clk);
        aresetn = 1;
        $display("[%0t] Deasserted reset", $time);

        @(posedge clk);
        @(posedge clk);
        @(posedge clk);

        // Push several values
        for (int i = 0; i < 100;) begin
            if(may_push_synced) begin
                push_data(i * 10 + 5);
                expected_data.push_back(i * 10 + 5);
                i++;
            end else @(posedge clk);
        end
        
        repeat (100) @(posedge clk);

        for (int i = 0; i < 100;) begin
            if(may_push_synced) begin
                push_data(i * 10 + 5);
                expected_data.push_back(i * 10 + 5);
                i++;
            end else @(posedge clk);
        end
        
        repeat (100) @(posedge clk);
        
        // Finish
        $display("[%0t] Simulation done", $time);
        $finish;
    end

endmodule
