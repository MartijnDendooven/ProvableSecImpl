`ifdef OMSP_NO_INCLUDE
`else
`include "openMSP430_defines.v"
`endif
`include "config.v"

module wrapper (
    input  [15:0] pc,
    input  [15:0] prev_pc,
    input         data_en,
    input         data_wr,
    input  [15:0] data_addr,
    output        reset
);


  // TEXT_SECTION
  parameter STXT_START = 16'hA000;
  parameter STXT_STOP = 16'hA400;

  // DATA_SECTION
  parameter SDATA_START = 16'h0500;
  parameter SDATA_STOP = 16'h0C00;

  parameter KEY_IDX_SIZE = $clog2(`SECURITY / 16 + 1);

  wire sm_violation;

omsp_spm_control #(
  .KEY_IDX_SIZE           (KEY_IDX_SIZE)
) spm_control_0(
  .mclk                   (1'b1),//mclk
  .puc_rst                (1'b0),//puc_rst
  .pc                     (pc),//current_inst_pc
  .prev_pc                (prev_pc),//prev_inst_pc
  .handling_irq           (1'b0),//handling_irq               DNC
  .irq_num                (4'b0),//irq_num                    DNC
  .eu_mab                 (data_addr),//mab
  .eu_mb_en               (data_en),//mb_en
  .eu_mb_wr               (data_wr),//mb_wr
  .update_spm             (1'b0),//do_sm_update
  .enable_spm             (1'b0),//do_sm_enable         CAN THIS BE 1??
  .cancel_spm             (1'b0),//sm_cancel
  .disable_spm            (1'b0),//sm_disable
  .verify_spm             (1'b0),//sm_verify
  .r10                    (15'b0),//r10                       DNC
  .r12                    (STXT_START),//r12
  .r13                    (STXT_STOP),//r13
  .r14                    (SDATA_START),//r14
  .r15                    (SDATA_STOP),//r15
  .data_request           (3'b0),//sm_request                 DNC
  .spm_data_select        (16'b0),//sm_data_select
  .spm_data_select_type   (1'b0),//sm_data_select_type
  .spm_key_select         (16'b0),//sm_key_select
  .write_key              (1'b0),//sm_write_key
  .key_in                 (16'b0),//crypto_data_out
  .key_idx                ({KEY_IDX_SIZE{1'b0}}),//sm_key_idx
  .violation              (sm_violation),
  .spm_data_select_valid  (),//sm_data_select_valid
  .spm_key_select_valid   (),//sm_key_select_valid
  .spm_current_id         (),//sm_current_id
  .spm_prev_id            (),//sm_prev_id
  .requested_data         (),//sm_requested_data
  .key_out                (),//sm_key
  .exec_sm                (),//exec_sm
  .enter_sm               (),//enter_sm
  .dma_addr               (14'b0),//dma_addr
  .dma_violation          (),//dma_violation
  .enabled                ()//sm_enabled
);

assign reset = sm_violation;


endmodule
