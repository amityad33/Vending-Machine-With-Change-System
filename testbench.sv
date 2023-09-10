`timescale 1ns/1ps
module vending_machine_tb;
//inputs
reg clk;
reg[1:0] in;
reg reset;
//output
wire out;
wire [1:0]change;
vending_machine uut(
.clk(clk),
.reset(reset),
.in(in),
.out(out),
.change(change)
);
  initial begin
     $dumpfile("dump.vcd");
     $dumpvars;
     #1000
     $finish;
   end
  
initial begin
reset = 1;
clk = 1;
#6 reset = 0;
in = 2'b10;
#19 in = 2'b10;
#80 $finish;
end
always #5 clk = ~clk;
endmodule
