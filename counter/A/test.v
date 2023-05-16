`timescale 1ns / 1ps

module test();
 
reg clk,rstn;
wire [3:0]cnt;

 
count_sim count_module(
.clk   (clk),
.rstn (rstn),
.cnt(cnt)

);  
 
 initial begin
 clk=0;
 rstn=0;
 end
   
always #15 clk=~clk;
always #660 rstn=~rstn;    
endmodule