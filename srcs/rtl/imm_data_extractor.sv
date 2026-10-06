`timescale 1ns/1ps

module data_extractor
(
    input [31:0] instruction,
    output reg [63:0] imm_data
);

  reg [11:0] imm12;

  always @(*)
    begin
      imm12 = 12'b0;

      case (instruction[6:5])
        2'b00:
          begin
            imm12 = instruction[31:20];
          end

        2'b01:
          begin
            imm12 = {instruction[31:25], instruction[11:7]};
          end

        2'b11:
          begin
            imm12 = {instruction[31], instruction[7],
                     instruction[30:25], instruction[11:8]};
          end

        default:
          begin
            imm12 = 12'b0;
          end
      endcase

      imm_data = {{52{imm12[11]}}, imm12};
    end

endmodule
