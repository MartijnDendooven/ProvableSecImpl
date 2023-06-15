`ifdef OMSP_NO_INCLUDE
`else
`include "openMSP430_defines.v"
`endif

module wrapper (
    input  [15:0] pc,
    input         data_en,
    input         code_en,
    input         code_wr,
    input  [15:0] data_addr,
    input  [15:0] code_addr,
    output        reset
);

  // TEXT_SECTION
  parameter STXT_START = 16'hA000;
  parameter STXT_STOP = 16'hA400;

  // DATA_SECTION
  parameter SDATA_START = 16'h0500;
  parameter SDATA_STOP = 16'h0C00;

  wire top_reset;

  top #(
      .STXT_START (STXT_START),
      .STXT_STOP  (STXT_STOP),
      .SDATA_START(SDATA_START),
      .SDATA_STOP (SDATA_STOP)
    ) top_0 (
      .clk      (1'b1),
      .pc       (pc),
      .data_en  (data_en),
      .code_en  (code_en),
      .code_wr  (code_wr),
      .data_addr(data_addr),
      .code_addr(code_addr),
      .reset    (top_reset),
  );

  assign reset = top_reset;

endmodule
