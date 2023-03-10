module risc_top (
 input clk,
 input reset
);
 wire [31:0] RD1,RD2,immext,alu_result,rd,PC,RData,MUX1_out,MUX2_out;
 wire [2:0] alu_control;
 wire [1 :0] alu_op,immsrc;
 wire alusrc,zf,sf,resultsrc,pcsrc,memwrite,regwrite,branch;

program_counter P1(
  //.PCNext(PCnext),
  .ImmExt(immext),
  .PCSrc(pcsrc),
  .clk(clk),
  .areset(reset),
  .load(1'b1),
  .PC_out(PC)
);
/*PC_calculations P2(
   .PC(PC),
   .ImmExt(immext),
   .PCSrc(pcsrc),
   .PCNext(PCnext)
    );*/

instruction_mem I1(
  
 .PC(PC), // this is the PC output in (program counter module)
 .RD(rd) 
);
alu_decoder A2(
  .alu_op(alu_op),
  .func3(rd[14:12]),
  .op5(rd[5]),
  .func7(rd[30]),
  .alu_control(alu_control)
  
);
mux1 M1 (
  .in1(RD2),
  .in2(immext),
  .sel(alusrc),
  .out(MUX1_out)
);

main_decoder D2(
  .op_code(rd[6:0]),
  .regwrite(regwrite),
  .immsrc(immsrc),
  .alu_src(alusrc),
  .memory_write(memwrite),
  .result_src(resultsrc),
  .branch(branch),
  .alu_op(alu_op)
  //.load(load)
  );
pc_src P3(
  .branch(branch),
  .zf(zf),
  .sf(sf),
  .func3(rd[14:12]),
  .pcsrc(pcsrc)

);
sign_extend S1(
  .immsrc(immsrc),
  .instr(rd[31:7]), //(rd)
  .immext(immext)
);
reg_file R1(
  .clk(clk),
  .WE3(regwrite),
  .reset(reset),
  .wd3(MUX2_out),
  //.resultsrc(resultsrc),
  //.rd(RData),
  //.alu_result(alu_result),
  .a1(rd[19:15]),
  .a2(rd[24:20]),
  .a3(rd[11:7]),
   //input [31:0] wd3,
   .rd1(RD1),
   .rd2(RD2)
);
alu A1(
  .A(RD1),
  .B(MUX1_out),
  //.immext(immext),
  //.alusrc(alusrc),
  .sel(alu_control),
  .C(alu_result), // alu_result
  .ZF(zf),
  .SF(sf)
);
 data_memory D1(
     .clk(clk),
     .WE(memwrite),
     .A(alu_result),
     .WD(RD2),
     .RD(RData) 
);
mux1 M2 (
  .in1(alu_result),
  .in2(RData),
  .sel(resultsrc),
  .out(MUX2_out)
);

endmodule
