`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/02 15:11:44
// Design Name: 
// Module Name: seg7
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


module seg7_static(
    input sys_clk,
    input sys_rst_n,
    input add_flag,
    output reg [7:0] seg_out,
    output reg [3:0] seg_sel
    );
//reg define
reg [3:0] num;//显示16进制数

//main code
//控制位选信号,选中所有数码管
always @(posedge sys_clk or negedge sys_rst_n)
begin
    if(!sys_rst_n)
        seg_sel <= 4'b1111;
    else
        seg_sel <= 4'b0000;
end

//add_flag上升沿时,数码管显示的数加1
always @(posedge sys_clk or negedge sys_rst_n)
begin
    if(!sys_rst_n)
        num <= 4'b0000;
    else if(add_flag)
    begin
        if(num<4'b1111)
            num <= num + 1'b1;
        else
            num <= 4'b0000;
    end
    else 
        num <= num;
end

//共阳数码管显示
always @(posedge sys_clk or negedge sys_rst_n)
begin
    if(!sys_rst_n)
        seg_out <= 8'b00000000;
    else
        case(num)
            4'h0: seg_out <= 8'b1100_0000;
            4'h1: seg_out <= 8'b1111_1001;
            4'h2: seg_out <= 8'b1010_0100;
            4'h3: seg_out <= 8'b1011_0000;
            4'h4: seg_out <= 8'b1001_1001;
            4'h5: seg_out <= 8'b1001_0010;
            4'h6: seg_out <= 8'b1000_0010;
            4'h7: seg_out <= 8'b1111_1000;
            4'h8: seg_out <= 8'b1000_0000;
            4'h9: seg_out <= 8'b1001_0000;
            4'ha: seg_out <= 8'b1000_1000;
            4'hb: seg_out <= 8'b1000_0011;
            4'hc: seg_out <= 8'b1100_0110;
            4'hd: seg_out <= 8'b1010_0001;
            4'he: seg_out <= 8'b1000_0110;
            4'hf: seg_out <= 8'b1000_1110;
            default: seg_out <= 8'b00000000;
        endcase
        
end
endmodule
