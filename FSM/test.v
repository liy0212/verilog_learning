`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/12 11:18:22
// Design Name: 
// Module Name: test
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

//`include"./sequence_detection_module.v"
module test;
reg clk,rstn;
reg[23:0]data;
wire[2:0]state;
wire z,x;
assign x=data[23];
always #10 clk=~clk;
always@(posedge clk)
    data={data[22:0],data[23]};
    
initial
     begin
    clk=0;
    rstn=1;
    #2 rstn=0;
    #30 rstn=1;
    data='b0011_0110_1001_0100;
    #500 $stop;
    end
    
    sequence_detection_module m(x,z,clk,rstn,state);
    
endmodule
