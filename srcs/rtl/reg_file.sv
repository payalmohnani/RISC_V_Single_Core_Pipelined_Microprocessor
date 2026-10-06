`timescale 1ns/1ps

`timescale 1ns/1ps

module registerFile(
  input clk,
  input reset,
  input [4:0] rs1,
  input [4:0] rs2,
  input [4:0] rd,
  input [63:0] writedata,
  input reg_write,
  output reg [63:0] readdata1,
  output reg [63:0] readdata2,
  output [63:0] r8,
  output [63:0] r19,
  output [63:0] r20,
  output [63:0] r21,
  output [63:0] r22
);

  integer i;
  reg [63:0] registers [31:0];

  assign r8  = registers[8];
  assign r19 = registers[19];
  assign r20 = registers[20];
  assign r21 = registers[26];
  assign r22 = registers[27];

  always @(*)
  begin
    if (reset == 1'b1)
    begin
      readdata1 = 64'd0;
      readdata2 = 64'd0;
    end
    else
    begin
      readdata1 = registers[rs1];
      readdata2 = registers[rs2];
    end
  end

  always @(negedge clk)
  begin
    if (reset == 1'b1)
    begin
      for (i = 0; i < 32; i = i + 1)
        registers[i] <= 64'd0;

      registers[11] <= 64'd8;
    end
    else if (reg_write == 1'b1)
    begin
      registers[rd] <= writedata;
    end
  end

endmodule
