module instruction_mem (
  
 input [31:0] PC, // this is the PC output in (program counter module)
 output reg [31:0] RD 
);

reg [31:0] instruction_memory [63:0];
  initial
  $readmemh("program.txt",instruction_memory);

  
always @ (*) begin 
RD = instruction_memory [PC[31:2]];
//Instr <= rom[pc[31:2]];
end
endmodule
