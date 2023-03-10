module data_memory(
input clk,WE,
input [31:0] A,
input [31:0] WD,
output [31:0] RD 
);

reg [31:0] data_memory [63:0];
//wire [31:0] data_1;
//wire [31:0] data_2;
//integer i ;


always@( posedge clk  ) begin
if ( WE == 1 )begin
data_memory[A] <= WD;
end
else begin
data_memory[A] <=data_memory[A] ;
end
end
assign  RD = data_memory[A] ;
 //RD = data_memory[A] ;
endmodule


//data_memory D1 ( .clk(clk_tb), .WE(WE_tb), .A(A_tb) , .WD(WD_tb),.RD(RD_tb));




