`timescale 1ns/1ps

module instruction_memory(
    input  [63:0] inst_address,
    output reg [31:0] instruction
);

  always @(*)
  begin
    instruction = 32'h00000000;

    case (inst_address[6:2])

      5'd0:  instruction = 32'h00000913; // 1
      5'd1:  instruction = 32'h00000433; // 2
      5'd2:  instruction = 32'h04b40863; // 3
      5'd3:  instruction = 32'h00800eb3; // 4
      5'd4:  instruction = 32'h000409b3; // 5
      5'd5:  instruction = 32'h013989b3; // 6
      5'd6:  instruction = 32'h013989b3; // 7
      5'd7:  instruction = 32'h013989b3; // 8
      5'd8:  instruction = 32'h02be8663; // 9
      5'd9:  instruction = 32'h001e8e93; // 10
      5'd10: instruction = 32'h00898993; // 11
      5'd11: instruction = 32'h00093d03; // 12
      5'd12: instruction = 32'h0009bd83; // 13
      5'd13: instruction = 32'h01bd4463; // 14
      5'd14: instruction = 32'hfe0004e3; // 15
      5'd15: instruction = 32'h01a002b3; // 16
      5'd16: instruction = 32'h01b93023; // 17
      5'd17: instruction = 32'h0059b023; // 18
      5'd18: instruction = 32'hfc000ce3; // 19
      5'd19: instruction = 32'h00140413; // 20
      5'd20: instruction = 32'h00890913; // 21
      5'd21: instruction = 32'hfa000ae3; // 22

      default:
        instruction = 32'h00000000;

    endcase
  end

endmodule
