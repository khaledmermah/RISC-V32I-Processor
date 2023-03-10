module pc_src (
  input branch,
  input zf,
  input sf,
  input [2:0] func3,
  output reg pcsrc

);
wire beq, bnq, blt;
  always @(*) begin
    
    case ( func3 )
      3'b000 : pcsrc = branch & zf;
      3'b001 : pcsrc = branch & ~zf;
      3'b100 : pcsrc = branch & sf;
      default :  pcsrc =0;
    endcase
  end
    assign beq = branch & zf; 
    assign bnq = branch & ~zf; 
    assign blt = branch & sf; 
endmodule
  
