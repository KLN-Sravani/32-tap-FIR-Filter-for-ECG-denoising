`timescale 1ns/1ps

// Include all dependencies - order matters
`include "HA2.v"
`include "FA2.v" // or "FA2.v" depending on your filename
`include "rca8.v"
`include "rca_16.v"
`include "wallace_4x4.v"
`include "HVWTM_8x8.v"
`include "hvwtm_s_16x16.v"
`include "d_ff.v"
`include "fir_hvwtm_rca_32.v"
`include "rca_32.v"

module fir16tb;
  reg clk, rst, ce;
  reg [31:0] x_in;
  wire [63:0] y_out;
  
  fir_hvwtm_rca_32 dut (.clk(clk), .rst(rst), .ce(ce), .x_in(x_in), .y_out(y_out));
  
  always #5 clk = ~clk;
  
  initial begin
    $monitor("%0t: x=%d y=%d", $time, $signed(x_in), $signed(y_out));
    clk=0; rst=1; ce=1; x_in=0;
    #20 rst=0;
    #10 x_in = 16'd1000;
    #10 x_in = 0;
    #400 $finish;
  end
initial
begin
$fsdbDumpfile("fir_hvwtm_rca_32.fsdb");
$fsdbDumpvars(0,fir32tb);
end

endmodule
