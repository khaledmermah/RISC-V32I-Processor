module main_decoder (
  input [6 : 0] op_code,
  output reg regwrite,
  output reg [1:0] immsrc,
  output reg alu_src,
  output reg memory_write,
  output reg result_src,
  output reg branch,
  output reg [1:0] alu_op
  //output reg load
 );
  always@(*) begin
  //regwrite=0;
  //immsrc=2'b00;
  //alu_src=0;
  //memory_write=0;
  //result_src=0;
  //branch=0;
  //alu_op=2'b00;
    case(op_code)
      7'b0000011 : begin 
        regwrite=1;
        immsrc=2'b00;
        alu_src=1;
        memory_write=0;
        result_src=1;
        branch=0;
        alu_op=2'b00;
      end
      7'b0100011 : begin 
        regwrite=0;
        immsrc=2'b01;
        alu_src=1;
        memory_write=1;
        result_src=1'bx;
        branch=0;
        alu_op=2'b00;
      end
      7'b0110011 : begin 
        regwrite=1;
        immsrc=2'bxx;
        alu_src=0;
        memory_write=0;
        result_src=0;
        branch=0;
        alu_op=2'b10;
      end
      7'b0010011 : begin 
        regwrite=1;
        immsrc=2'b00;
        alu_src=1;
        memory_write=0;
        result_src=0;
        branch=0;
        alu_op=2'b10;
      end
      7'b1100011 : begin 
        regwrite=0;
        immsrc=2'b10;
        alu_src=0;
        memory_write=0;
        result_src=1'bx;
        branch=1;
        alu_op=2'b01;
      end
      default : begin
       regwrite=0;
       immsrc=0;
       alu_src=0;
       memory_write=0;
       result_src=0;
       branch=0;
       alu_op=2'b00;
      end
    endcase
  end
endmodule
 
        
        
      
