module reg_file(
  input clk,reset,WE3,
   input [31:0] wd3,
   //input [31:0] alu_result,
   input [4:0] a1,
   input [4:0] a2,
   input [4:0] a3,
   //input [31:0] wd3,
   output [31:0] rd1,
   output [31:0] rd2
);
//reg [31:0] wd3;
reg [31:0] reg_file [31:0];
//wire [31:0] data_1;
integer i ;

/*always @(*) begin
if( resultsrc ) wd3 = alu_result;
else wd3 = rd;
end*/

   always@(posedge clk or negedge reset ) begin
     if(!reset ) begin
for (i=0; i<32 ; i=i+1)
begin 
reg_file[i]<=0; 
end
end
else begin
if( WE3 ==1) begin
  if (a3 < 32) begin
  reg_file [a3]<= wd3;
end
end
else reg_file [a3]<= reg_file [a3];
end
//else

end
  assign  rd1 = (a1 <32 )? reg_file [a1] : 0;
  assign  rd2 = (a2 <32 )? reg_file [a2] : 0;
 //assign data_1 = data_out_1;
 //assign data_2 = data_out_2;
endmodule

