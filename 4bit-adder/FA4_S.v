
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/12 20:33:47
// Design Name: 
// Module Name: FA4_S
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


module FA_4(sum,co,ai,bi,ci);
output [3:0] sum;
    output co;
    input [3:0] ai,bi;
    input ci;
    wire c1,c2,c3;
    
FA_1 fa0(.S(sum[0]),.Co(c1),.Ai(ai[0]),.Bi(bi[0]),.Ci(ci));
FA_1 fa1(.S(sum[1]),.Co(c2),.Ai(ai[1]),.Bi(bi[1]),.Ci(c1));
FA_1 fa2(.S(sum[2]),.Co(c3),.Ai(ai[2]),.Bi(bi[2]),.Ci(c2));
FA_1 fa3(.S(sum[3]),.Co(co),.Ai(ai[3]),.Bi(bi[3]),.Ci(c3));
    
endmodule

