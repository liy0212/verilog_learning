//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/01 14:52:38
// Design Name: 
// Module Name: counter
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


module counter
#(
    parameter CNT_MAX =50'd49_999_999
)
(
    input wire sys_clk,
    input wire sys_rst_n,
    output reg[15:0] led_out
//    output reg cnt_flag
);

//reg define
reg[49:0] cnt;
reg cnt_flag;

//计数，到CNT_MAX清零
always @(posedge sys_clk or negedge sys_rst_n)
begin
    if(!sys_rst_n)
    begin
        cnt <= 50'b0;
  //    cnt_flag <= 1'b0;
    end
    else if(cnt==CNT_MAX)
    begin
        cnt <= 50'b0;
    end
    else
    cnt<=cnt+1'b1;
    
end

//计数到CNT_MAX时，cnt_flag�?1
always @(posedge sys_clk or negedge sys_rst_n)
begin
    if(!sys_rst_n)
    begin
        cnt_flag <= 1'b0;
    end
    else if(cnt==CNT_MAX-50'b1)
    begin
        cnt_flag <= 1'b1;
    end
    else
    cnt_flag<=1'b0;
end

//led_out输出
always @(posedge sys_clk or negedge sys_rst_n)
begin
    if(!sys_rst_n)
    begin
        led_out <= 16'b0000_0000_0000_0001;
    end
    else if(cnt_flag==1'b1&&led_out==16'b0000_0000_0000_0000)
    begin
        led_out <= 16'b0000_0000_0000_0001;
    end
    else if(cnt_flag==1'b1)
    begin
        led_out <= led_out<<1'b1;
    end
   else
   led_out<=led_out;
end
endmodule
