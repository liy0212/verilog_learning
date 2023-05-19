`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/12 10:38:32
// Design Name: 
// Module Name: sequence_detection_module
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


module sequence_detection_module(x,z,clk,rstn,state);
input x,clk,rstn;
output z;
output [2:0]state;
reg [2:0]state;
wire z;

parameter IDLE='d0,A='d1,B='d2,C='d3,D='d4,E='d5,F='d6,G='D7;

assign z=(state==E&&x==1)?1:0;

always@(posedge clk)
begin
if(!rstn)
    begin
    state<=IDLE;
    end
else
    casex(state)
    IDLE:if(x==0)
        begin
            state<=A;
        end
        
    A:if(x==1)
        begin
            state<=B;
        end
        
     B:if(x==1)
        begin
            state<=C;
        end
        else
        begin
            state<=A;
        end
        
      C:if(x==0)
        begin
            state<=D;
        end
        else
        begin
            state<=F;
        end
        
      D:if(x==1)
        begin
            state<=E;
        end 
        else
        begin
            state<=A;
        end
       
       E:if(x==1)
        begin
            state<=C;
        end 
        else
        begin
            state<=A;
        end
        
       F:if(x==0)
        begin
            state<=A;
        end
       default:state=IDLE;
       endcase 
        
end

endmodule
