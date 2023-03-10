
module alu_decoder(
  input [1:0] alu_op,
  input [2:0] func3,
  input op5,func7,
  output reg [2:0] alu_control
  
);
  
  always @(*) begin 
    case(alu_op)
      2'b00 : alu_control= 3'b000;
      2'b01 : begin
      case (func3)
        3'b000: alu_control = 3'b010; 
        3'b001: alu_control = 3'b010;
        3'b100: alu_control = 3'b010;

        default: alu_control = 3'b000;
        endcase
      end
      2'b10: begin
        case (func3)
          3'b000 : begin
            if ( {op5,func7} == 2'b11) alu_control = 3'b010;
            else alu_control = 3'b000;
          end
          3'b001 : alu_control = 3'b001;
          3'b100 : alu_control = 3'b100;
          3'b101 : alu_control = 3'b101;
          3'b110 : alu_control = 3'b110;
          3'b111 : alu_control = 3'b111;  
          default :  alu_control = 3'b000;
        endcase
      end
        default : alu_control = 3'b000; 
    endcase
  end
endmodule
      
        
        
        
        
        
        
        