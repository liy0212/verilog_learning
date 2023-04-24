//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/13 13:14:30
// Design Name: 
// Module Name: sync_reset
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


module sync_reset(
    input rstn,
    input clk,
    input din,
    input set,
    output reg dout
    );
    
    always @(posedge clk)begin
    if(!rstn) dout<= 1'b0;
    else if(!set) dout<=1'b1;
    else dout <= din;
    end
    
endmodule
