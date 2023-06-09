module count_module(
	input clk,
	input rstn,
	input mode,
	input enabled,
	output reg [3:0]cnt=4'b0000
	);
	wire [3:0]temp1;
    reg [3:0] temp=4'b0000;
    reg [3:0]step;
    reg ci=1'b0;
    wire co;
    reg flag;

always@(enabled)
begin
if(enabled)
flag<=1'b1;
else 
flag<=1'b0;
end

always@(mode)
begin 
if(mode)
step<=4'b0001;
else step<= 4'b1111;
end

FA_4 adder1(.sum(temp1),.co(co),.ai(cnt),.bi(step),.ci(ci));


//�Ĵ�������   
always@(posedge clk or negedge rstn )
begin 

           if(!rstn && flag==1'b1) 
            begin
               cnt<=4'b0000;
    
               end
            else if(rstn && flag==1'b1 )
            begin
                cnt<=temp1;
                end
end

endmodule