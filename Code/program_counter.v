module program_counter #(
    parameter data_Size = 32
    )(
    input clk,
    input load,
    input areset,
    input[data_Size-1 : 0] ImmExt,
    input PCSrc,
    output reg [data_Size-1 : 0] PC_out
);
    wire [data_Size-1 : 0] PC;
    assign PC = PC_out;
    reg[data_Size-1 : 0] PC_Next;


always @(*)begin
    if (PCSrc) begin
        PC_Next <= PC + ImmExt;
    end
    else begin
        PC_Next <= PC + 4;
    end
end



always @(posedge clk or negedge areset) begin           //areset     load     clk          PC
    if(!areset)begin                                    //  0          x       x            0
        PC_out <= 32'd0;
    end
    else if(areset && !load)begin                // 1           0      Posedge       PC
        PC_out <= PC_out;
    end
    else if(areset && load)begin                // 1           1       Posedge      PC_next
        PC_out <= PC_Next;
    end
    else if (areset) begin                     // 1           1      notPosedge   PC_next
        PC_out <= PC_out;
    end
PC_out = PC;
end


endmodule
/* input [31 :0 ] PCNext,
  input [31 :0 ] ImmExt,
  input PCSrc,
  input  clk,
  input asynch_rst,
  input load,
  output reg [31 : 0 ] PC

);
  always @( posedge clk , negedge asynch_rst) begin
    if (!asynch_rst) PC<=0;
    else begin
      if (load==0) PC<=PC;
      else begin
       if (load ==1)  PC<= PCNext;
      end
    end
  end
endmodule

    
  module PC_calculations(
   input [31 :0 ] PC,
   input [31 :0 ] ImmExt,
   input PCSrc,
    output reg [31 :0 ] PCNext
      
    );
  always @(*) begin
    if(PCSrc==0) begin
      PCNext = PC+4;
    end
    else PCNext = PC + ImmExt;
  end */
    