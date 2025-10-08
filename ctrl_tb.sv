`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2025 06:19:41 PM
// Design Name: 
// Module Name: sim_control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module tb_axi_ctrl_slave_example;

  // Clock and reset
  logic aclk;
  logic aresetn;

  // AXI control interface
  logic [11:0] s_axi_control_awaddr;
  logic s_axi_control_awvalid;
  logic s_axi_control_awready;

  logic [31:0] s_axi_control_wdata;
  logic [3:0]  s_axi_control_wstrb;
  logic s_axi_control_wvalid;
  logic s_axi_control_wready;

  logic [1:0] s_axi_control_bresp;
  logic s_axi_control_bvalid;
  logic s_axi_control_bready;

  logic [11:0] s_axi_control_araddr;
  logic s_axi_control_arvalid;
  logic s_axi_control_arready;

  logic [31:0] s_axi_control_rdata;
  logic [1:0]  s_axi_control_rresp;
  logic s_axi_control_rvalid;
  logic s_axi_control_rready;

  // Instantiate DUT
  axi_ctrl_slave_example dut (
    .aclk(aclk),
    .aresetn(aresetn),
    .s_axi_control_awaddr(s_axi_control_awaddr),
    .s_axi_control_awvalid(s_axi_control_awvalid),
    .s_axi_control_awready(s_axi_control_awready),
    .s_axi_control_wdata(s_axi_control_wdata),
    .s_axi_control_wstrb(s_axi_control_wstrb),
    .s_axi_control_wvalid(s_axi_control_wvalid),
    .s_axi_control_wready(s_axi_control_wready),
    .s_axi_control_bresp(s_axi_control_bresp),
    .s_axi_control_bvalid(s_axi_control_bvalid),
    .s_axi_control_bready(s_axi_control_bready),
    .s_axi_control_araddr(s_axi_control_araddr),
    .s_axi_control_arvalid(s_axi_control_arvalid),
    .s_axi_control_arready(s_axi_control_arready),
    .s_axi_control_rdata(s_axi_control_rdata),
    .s_axi_control_rresp(s_axi_control_rresp),
    .s_axi_control_rvalid(s_axi_control_rvalid),
    .s_axi_control_rready(s_axi_control_rready)
  );

  // Clock generation
  initial aclk = 0;
  always #5 aclk = ~aclk; // 100 MHz

  // Reset generation
  initial begin
    aresetn = 0;
    repeat(5) @(posedge aclk);
    aresetn = 1;
  end

  // Simple AXI write task
  task axi_write(input [11:0] addr, input [31:0] data);
  begin
    s_axi_control_awaddr  = addr;
    s_axi_control_awvalid = 1;
    s_axi_control_wdata   = data;
    s_axi_control_wstrb   = 4'hF;
    s_axi_control_wvalid  = 1;
    s_axi_control_bready  = 1;

    // Wait for AWREADY and WREADY handshake
    wait (s_axi_control_awready);
    @(posedge aclk);
    s_axi_control_awvalid = 0;
    wait (s_axi_control_wready);
    @(posedge aclk);
    s_axi_control_wvalid  = 0;

    // Wait for write response
    wait (s_axi_control_bvalid);
    @(posedge aclk);
    s_axi_control_bready = 0;
  end
  endtask

  // Simple AXI read task
  task axi_read(input [11:0] addr, output [31:0] data_out);
  begin
    s_axi_control_araddr  = addr;
    s_axi_control_arvalid = 1;
    s_axi_control_rready  = 1;

    // Wait for ARREADY handshake
    wait (s_axi_control_arready);
    @(posedge aclk);
    s_axi_control_arvalid = 0;

    // Wait for RVALID
    wait (s_axi_control_rvalid);
    data_out = s_axi_control_rdata;
    @(posedge aclk);
    s_axi_control_rready = 0;
  end
  endtask

    logic[31:0] read_data;
  // Main test sequence
  initial begin
    // Initialize signals
    s_axi_control_awaddr  = 0;
    s_axi_control_awvalid = 0;
    s_axi_control_wdata   = 0;
    s_axi_control_wstrb   = 0;
    s_axi_control_wvalid  = 0;
    s_axi_control_bready  = 0;
    s_axi_control_araddr  = 0;
    s_axi_control_arvalid = 0;
    s_axi_control_rready  = 0;

    @(posedge aresetn);
    @(posedge aclk);
    @(posedge aclk);
    @(posedge aclk);
    @(posedge aclk);

    // Write to address 0x010
    axi_write(12'h010, 32'hDEADBEEF);
    $display("[%0t] Wrote 0x%08X to address 0x%03X", $time, 32'hDEADBEEF, 12'h010);
    
    // Read from address
    axi_read(12'h010, read_data);
    $display("[%0t] Read  0x%08X from address 0x%03X", $time, read_data, 12'h010);

    // Finish simulation
    repeat(10) @(posedge aclk);
    $display("[%0t] Simulation finished", $time);
    $finish();
  end

endmodule
