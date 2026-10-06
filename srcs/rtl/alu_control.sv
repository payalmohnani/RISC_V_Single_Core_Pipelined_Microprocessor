`timescale 1ns/1ps

module alu_control(
  input [1:0] Aluop,
  input [3:0] funct,
  output reg [3:0] operation
);

  always @(*)
    begin
      operation = 4'b0000;   // default value

      if (Aluop == 2'b01)
        begin
          operation = 4'b0110;
        end

      else if (Aluop == 2'b00)
        begin
          operation = 4'b0010;
        end

      else if (Aluop == 2'b10)
        begin
          if (funct == 4'b0000)
            begin
              operation = 4'b0010;
            end
          else if (funct == 4'b0111)
            begin
              operation = 4'b0000;
            end
          else if (funct == 4'b1000)
            begin
              operation = 4'b0110;
            end
          else if (funct == 4'b0110)
            begin
              operation = 4'b0001;
            end
        end
    end

endmodule
