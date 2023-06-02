//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/01 14:52:38
// Design Name: 
// Module Name: timer
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
`define CNT_WIDE 50

module timer
#(
    parameter CNT_MAX = 50'd49_999_999
)
(
    input wire sys_clk,
    input wire sys_rst_n,
    output reg clk_flag
);

//reg define
reg[`CNT_WIDE-1:0] cnt;


//计数，到CNT_MAX清零
always @(posedge sys_clk or negedge sys_rst_n)
begin
    if(!sys_rst_n)
    begin
        cnt <= `CNT_WIDE'b0;
    end
    else if(cnt==CNT_MAX)
    begin
        cnt <= `CNT_WIDE'b0;
    end
    else
    cnt<=cnt+1'b1;
    
end

//计数到CNT_MAX时，cnt_flag�??1
always @(posedge sys_clk or negedge sys_rst_n)
begin
    if(!sys_rst_n)
    begin
        clk_flag <= 1'b0;
    end
    else if(cnt==CNT_MAX-`CNT_WIDE'b1)
    begin
        clk_flag <= 1'b1;
    end
    else
    clk_flag<=1'b0;
end

endmodule
