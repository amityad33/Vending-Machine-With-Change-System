`timescale 1ns/1ps
module vending_machine(clk,reset,in,out,change);
  input clk,reset;
  input [1:0]in;
  output reg out;
  output reg[1:0]change;
  parameter [1:0]s0=2'b00;
  parameter [1:0]s1=2'b01;
  parameter [1:0]s2=2'b10;
  reg [1:0]c_state,n_state;
  reg [1:0]c_tmp;
  reg o_tmp;
  initial begin
    c_state<=s0;
    n_state<=s0;
    c_tmp<=2'b00;
    change<=2'b00;
    o_tmp<=0;
  end
  always@(posedge clk)begin
    
    if(reset)begin
      c_state<=s0;
      out<=0;
      change<=2'b00;end
    else begin
      c_state=n_state;
      out=o_tmp;
      change=c_tmp;end
    
      case(c_state)  
        s0:if(in==2'b00)begin
          n_state<=s0;c_tmp<=2'b00;o_tmp<=0;end
        else if(in==2'b01)begin
          n_state<=s1;c_tmp<=2'b00;o_tmp<=0;end
        else if(in==2'b10)begin
          n_state<=s2;c_tmp<=2'b00;o_tmp<=0;end
        
        s1:if(in==2'b00)begin
          n_state<=s0;c_tmp<=2'b01;o_tmp<=0;end
        else if(in==2'b01)begin
          n_state<=s2;c_tmp<=2'b00;o_tmp<=0;end
        else if(in==2'b10)begin
          n_state<=s0;c_tmp<=2'b00;o_tmp<=1;end
        
        s2:if(in==2'b00)begin
          n_state<=s0;c_tmp<=2'b10;o_tmp<=0;end
        else if(in==2'b01)begin
          n_state<=s0;c_tmp<=2'b00;o_tmp<=1;end
        else if(in==2'b10)begin
          n_state<=s0;c_tmp<=2'b01;o_tmp<=1;end
      endcase
    end
/*always@(posedge clk)begin
  if(reset)begin
    c_state<=s0;
    change<=2'b00;end
  else begin
    c_state<=n_state;
    out<=o_tmp;
    change<=c_tmp;end
end*/
endmodule
