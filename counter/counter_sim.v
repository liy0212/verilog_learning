module count_sim(
	input clk,
	input rstn,

	output reg [3:0]cnt=4'b0000
	);
	wire [3:0]temp1;
    reg [3:0] temp=4'b0000;
    reg [3:0]step=4'b0001;
    reg ci=1'b0;
    wire co;
    reg flag;

//always@(enabled)
//begin
//if(enabled)
//flag<=1'b1;
//else 
//flag<=1'b0;
//end

//always@(mode)
//begin 
//if(mode)
//step<=4'b0001;
//else step<= 4'b1111;
//end

FA_4 adder1(.sum(temp1),.co(co),.ai(cnt),.bi(step),.ci(ci));


//¼Ä´æÆ÷²¿·Ö   
always@(posedge clk or negedge rstn )
begin 

           if(!rstn) 
            begin
               cnt<=4'b0000;
    
               end
            else 
            begin
                cnt<=temp1;
                end
end

endmodule