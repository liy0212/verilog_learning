`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/30 20:07:42
// Design Name: 
// Module Name: FA_1
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

module FA_1(S,Co,Ai,Bi,Ci);


input Ai,Bi,Ci;
output S,Co;

wire s1,s2,s3;

xor(s1,Ai,Bi);
xor(S,s1,Ci);

and(s2,Bi,Ai);
and(s3,Ci,s1);

or(Co,s2,s3);

endmodule
