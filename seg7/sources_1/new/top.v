`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/02 14:36:45
// Design Name: 
// Module Name: top
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


module top(
    input sys_clk,
    input sys_rst_n,
    output [7:0] seg_out,
    output [3:0] seg_sel

    );

//parameter define
parameter CNT_MAX =50'd49_999_999;

//wire define
wire add_flag;

//main code
timer
#(
    .CNT_MAX(CNT_MAX)
)
timer_inst(
    .sys_clk(sys_clk),
    .sys_rst_n(sys_rst_n),
    .clk_flag(add_flag)
);


seg7_static(
    .sys_clk(sys_clk),
    .sys_rst_n(sys_rst_n),
    .add_flag(add_flag),
    .seg_out(seg_out),
    .seg_sel(seg_sel)
);


endmodule
