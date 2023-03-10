module alu (
  input [31:0] A,B,
//immext,
  //input alusrc,
  input [2:0] sel,
  output [31:0] C, // alu_result
  output ZF,SF
);
reg [32:0] R;
//reg [32:0] B;
always@(*)
begin
//if(alusrc==0) B=rd2;
//else B=immext;
  case(sel)
   3'b000 : R = A + B ;
   3'b001 : R = A<<B ;
   3'b010 : R = A - B ;
   3'b100 : R = A ^ B ;
   3'b101 : R = A>>B ;
   3'b110 : R = A | B ;
   3'b111 : R = A & B ;
   default : R = 32'b0 ;
  endcase  
end
assign C = R[31:0] ;
assign ZF = ~(|R);
assign SF =  R[31];

endmodule
/*
module ALU_tb;
//declaration
reg [31:0] A_tb,B_tb;
reg [2:0] sel_tb;
wire ZF_tb,SF_tb;
wire [31:0] C_tb;
//instantiation
ALU A1 ( .A(A_tb), .B(B_tb), .C(C_tb),.ZF(ZF_tb), .SF(SF_tb),.sel(sel_tb));
initial
begin
A_tb = 32'd0;
B_tb = 32'd0;
sel_tb = 3'b000;
#10
   $display("test case1 (ADD)");
A_tb = 32'd150;
B_tb = 32'd130;
sel_tb = 3'b000;
#10
   $display("test case2 (SUB)");
A_tb = 32'd150;
B_tb = 32'd130;
sel_tb = 3'b011;
#10
   $display("test case3 (B)");
A_tb = 32'd150;
B_tb = 32'd130;
sel_tb = 3'b010;
#10
   $display("test case4 (OR)");
A_tb = 32'hF0F0F0FF;
B_tb = 32'h0FF00F00;
sel_tb = 3'b110;
#10
   $display("test case5 (AND)");
A_tb = 32'hF0F0F0FF;
B_tb = 32'h00F000F0;
sel_tb = 3'b111;
#10

$stop;
 end 
endmodule */
