
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/14 10:29:34
// Design Name: 
// Module Name: async_reset
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


module async_reset(
    input rstn,
    input clk,
    input din,
    output reg dout
  
    );
    always @(posedge clk or negedge rstn)begin
    if(rstn) dout <= 1'b0;
    else dout <=din;
   
    end
endmodule
