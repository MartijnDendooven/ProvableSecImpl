`ifdef OMSP_NO_INCLUDE
`else
`include "openMSP430_defines.v"
`endif

module top #(
    // TEXT_SECTION
    parameter STXT_START  = 16'hA000,
    parameter STXT_STOP   = 16'hA400,
    //DATA SECTION
    parameter SDATA_START = 16'h0500,
    parameter SDATA_STOP  = 16'h0C00
) (
    input         clk,
    input  [15:0] pc,
    input         data_en,
    input         code_en,
    input         code_wr,
    input  [15:0] data_addr,
    input  [15:0] code_addr,
    output        reset
);



  wire mac_reset;
  mac #(
      .STXT_START (STXT_START),
      .STXT_STOP  (STXT_STOP),
      .SDATA_START(SDATA_START),
      .SDATA_STOP (SDATA_STOP)
  ) mac_0 (
      .clk      (clk),
      .pc       (pc),
      .data_addr(data_addr),
      .code_addr(code_addr),
      .data_en  (data_en),
      .code_en  (code_en),
      .code_wr  (code_wr),
      .reset    (mac_reset)
  );

  assign reset = mac_reset;



endmodule
