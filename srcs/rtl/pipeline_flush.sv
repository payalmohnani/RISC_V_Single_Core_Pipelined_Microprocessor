`timescale 1ns/1ps

module pipeline_flush
(
  input branch,
  output reg flush
);

  always @(*)
  begin
    if (branch == 1'b1)
      flush = 1'b1;
    else
      flush = 1'b0;
  end

endmodule
