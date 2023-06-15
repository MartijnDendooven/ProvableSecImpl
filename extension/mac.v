`ifdef OMSP_NO_INCLUDE
`else
`include "openMSP430_defines.v"
`endif

module mac #(
    // TEXT_SECTION
    parameter STXT_START  = 16'hA000,
    parameter STXT_STOP   = 16'hA400,
    //DATA SECTION
    parameter SDATA_START = 16'h0500,
    parameter SDATA_STOP  = 16'h0C00
) (
    input                clk,
    input  [15:0]        pc,
    input  [15:0]        data_addr,
    input  [15:0]        code_addr,
    input                data_en,
    input                code_en, 
    input                code_wr,
    output               reset
);

  wire text_access = code_addr >= STXT_START & code_addr <= STXT_STOP;
  wire data_access = data_addr >= SDATA_START & data_addr <= SDATA_STOP & data_en;
  wire secured_section_access = text_access | data_access;

  //assign reset = secured_section_access;
  wire text_execution = pc >= STXT_START & pc <= STXT_STOP;
  wire invalid_text_access = text_access & !text_execution;
  wire invalid_data_access = data_access & !text_execution;
  wire invalid_text_write = code_wr & text_execution & text_access;


  reg [15:0] prev_pc = 16'hA400; //16'b1; //overall statement (5) will be false in this case
  always @(posedge clk) begin
    prev_pc <= pc;
  end
  wire jump_to_non_entry = pc > STXT_START & pc <= STXT_STOP;
  wire executing_text = prev_pc >= STXT_START & prev_pc <= STXT_STOP;
  wire invalid_jmp = jump_to_non_entry & !executing_text;

  assign reset = (invalid_data_access | invalid_text_access  | invalid_text_write | invalid_jmp)? 1'b1 : 1'b0;

endmodule
