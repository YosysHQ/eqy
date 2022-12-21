// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Tue Dec 20 20:22:03 2022
// Host        : lamarr running 64-bit Ubuntu 20.04.5 LTS
// Command     : write_verilog -force picorv32_vivado.v
// Design      : picorv32
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7k70tfbg676-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* BARREL_SHIFTER = "1'b0" *) (* CATCH_ILLINSN = "1'b1" *) (* CATCH_MISALIGN = "1'b1" *) 
(* COMPRESSED_ISA = "1'b0" *) (* ENABLE_COUNTERS = "1'b1" *) (* ENABLE_COUNTERS64 = "1'b1" *) 
(* ENABLE_DIV = "1'b0" *) (* ENABLE_FAST_MUL = "1'b0" *) (* ENABLE_IRQ = "1'b0" *) 
(* ENABLE_IRQ_QREGS = "1'b1" *) (* ENABLE_IRQ_TIMER = "1'b1" *) (* ENABLE_MUL = "1'b0" *) 
(* ENABLE_PCPI = "1'b0" *) (* ENABLE_REGS_16_31 = "1'b1" *) (* ENABLE_REGS_DUALPORT = "1'b1" *) 
(* ENABLE_TRACE = "1'b0" *) (* LATCHED_IRQ = "-1" *) (* LATCHED_MEM_RDATA = "1'b0" *) 
(* MASKED_IRQ = "0" *) (* PROGADDR_IRQ = "16" *) (* PROGADDR_RESET = "0" *) 
(* REGS_INIT_ZERO = "1'b0" *) (* STACKADDR = "-1" *) (* TRACE_ADDR = "36'b001000000000000000000000000000000000" *) 
(* TRACE_BRANCH = "36'b000100000000000000000000000000000000" *) (* TRACE_IRQ = "36'b100000000000000000000000000000000000" *) (* TWO_CYCLE_ALU = "1'b0" *) 
(* TWO_CYCLE_COMPARE = "1'b0" *) (* TWO_STAGE_SHIFT = "1'b1" *) (* WITH_PCPI = "1'b0" *) 
(* cpu_state_exec = "8'b00001000" *) (* cpu_state_fetch = "8'b01000000" *) (* cpu_state_ld_rs1 = "8'b00100000" *) 
(* cpu_state_ld_rs2 = "8'b00010000" *) (* cpu_state_ldmem = "8'b00000001" *) (* cpu_state_shift = "8'b00000100" *) 
(* cpu_state_stmem = "8'b00000010" *) (* cpu_state_trap = "8'b10000000" *) (* irq_buserror = "2" *) 
(* irq_ebreak = "1" *) (* irq_timer = "0" *) (* irqregs_offset = "32" *) 
(* regfile_size = "32" *) (* regindex_bits = "5" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module picorv32
   (clk,
    resetn,
    trap,
    mem_valid,
    mem_instr,
    mem_ready,
    mem_addr,
    mem_wdata,
    mem_wstrb,
    mem_rdata,
    mem_la_read,
    mem_la_write,
    mem_la_addr,
    mem_la_wdata,
    mem_la_wstrb,
    pcpi_valid,
    pcpi_insn,
    pcpi_rs1,
    pcpi_rs2,
    pcpi_wr,
    pcpi_rd,
    pcpi_wait,
    pcpi_ready,
    irq,
    eoi,
    trace_valid,
    trace_data);
  input clk;
  input resetn;
  output trap;
  output mem_valid;
  output mem_instr;
  input mem_ready;
  output [31:0]mem_addr;
  output [31:0]mem_wdata;
  output [3:0]mem_wstrb;
  input [31:0]mem_rdata;
  output mem_la_read;
  output mem_la_write;
  output [31:0]mem_la_addr;
  output [31:0]mem_la_wdata;
  output [3:0]mem_la_wstrb;
  output pcpi_valid;
  output [31:0]pcpi_insn;
  output [31:0]pcpi_rs1;
  output [31:0]pcpi_rs2;
  input pcpi_wr;
  input [31:0]pcpi_rd;
  input pcpi_wait;
  input pcpi_ready;
  input [31:0]irq;
  output [31:0]eoi;
  output trace_valid;
  output [35:0]trace_data;

  wire \<const0> ;
  wire \<const1> ;
  wire alu_eq;
  wire alu_lts;
  wire alu_ltu;
  wire [31:0]alu_out_q;
  wire [31:0]alu_out_q20_out;
  wire [31:0]alu_out_q22_out;
  wire \alu_out_q[0]_i_1_n_0 ;
  wire \alu_out_q[0]_i_2_n_0 ;
  wire \alu_out_q[0]_i_3_n_0 ;
  wire \alu_out_q[0]_i_4_n_0 ;
  wire \alu_out_q[10]_i_1_n_0 ;
  wire \alu_out_q[10]_i_2_n_0 ;
  wire \alu_out_q[11]_i_10_n_0 ;
  wire \alu_out_q[11]_i_11_n_0 ;
  wire \alu_out_q[11]_i_12_n_0 ;
  wire \alu_out_q[11]_i_1_n_0 ;
  wire \alu_out_q[11]_i_4_n_0 ;
  wire \alu_out_q[11]_i_5_n_0 ;
  wire \alu_out_q[11]_i_6_n_0 ;
  wire \alu_out_q[11]_i_7_n_0 ;
  wire \alu_out_q[11]_i_8_n_0 ;
  wire \alu_out_q[11]_i_9_n_0 ;
  wire \alu_out_q[12]_i_1_n_0 ;
  wire \alu_out_q[12]_i_2_n_0 ;
  wire \alu_out_q[13]_i_1_n_0 ;
  wire \alu_out_q[13]_i_2_n_0 ;
  wire \alu_out_q[14]_i_1_n_0 ;
  wire \alu_out_q[14]_i_2_n_0 ;
  wire \alu_out_q[15]_i_10_n_0 ;
  wire \alu_out_q[15]_i_11_n_0 ;
  wire \alu_out_q[15]_i_12_n_0 ;
  wire \alu_out_q[15]_i_1_n_0 ;
  wire \alu_out_q[15]_i_2_n_0 ;
  wire \alu_out_q[15]_i_5_n_0 ;
  wire \alu_out_q[15]_i_6_n_0 ;
  wire \alu_out_q[15]_i_7_n_0 ;
  wire \alu_out_q[15]_i_8_n_0 ;
  wire \alu_out_q[15]_i_9_n_0 ;
  wire \alu_out_q[16]_i_1_n_0 ;
  wire \alu_out_q[16]_i_2_n_0 ;
  wire \alu_out_q[17]_i_1_n_0 ;
  wire \alu_out_q[17]_i_2_n_0 ;
  wire \alu_out_q[18]_i_1_n_0 ;
  wire \alu_out_q[18]_i_2_n_0 ;
  wire \alu_out_q[19]_i_10_n_0 ;
  wire \alu_out_q[19]_i_11_n_0 ;
  wire \alu_out_q[19]_i_12_n_0 ;
  wire \alu_out_q[19]_i_1_n_0 ;
  wire \alu_out_q[19]_i_4_n_0 ;
  wire \alu_out_q[19]_i_5_n_0 ;
  wire \alu_out_q[19]_i_6_n_0 ;
  wire \alu_out_q[19]_i_7_n_0 ;
  wire \alu_out_q[19]_i_8_n_0 ;
  wire \alu_out_q[19]_i_9_n_0 ;
  wire \alu_out_q[1]_i_1_n_0 ;
  wire \alu_out_q[1]_i_2_n_0 ;
  wire \alu_out_q[20]_i_1_n_0 ;
  wire \alu_out_q[20]_i_2_n_0 ;
  wire \alu_out_q[21]_i_1_n_0 ;
  wire \alu_out_q[21]_i_2_n_0 ;
  wire \alu_out_q[22]_i_1_n_0 ;
  wire \alu_out_q[22]_i_2_n_0 ;
  wire \alu_out_q[23]_i_10_n_0 ;
  wire \alu_out_q[23]_i_11_n_0 ;
  wire \alu_out_q[23]_i_12_n_0 ;
  wire \alu_out_q[23]_i_1_n_0 ;
  wire \alu_out_q[23]_i_4_n_0 ;
  wire \alu_out_q[23]_i_5_n_0 ;
  wire \alu_out_q[23]_i_6_n_0 ;
  wire \alu_out_q[23]_i_7_n_0 ;
  wire \alu_out_q[23]_i_8_n_0 ;
  wire \alu_out_q[23]_i_9_n_0 ;
  wire \alu_out_q[24]_i_1_n_0 ;
  wire \alu_out_q[24]_i_2_n_0 ;
  wire \alu_out_q[25]_i_1_n_0 ;
  wire \alu_out_q[25]_i_2_n_0 ;
  wire \alu_out_q[26]_i_1_n_0 ;
  wire \alu_out_q[26]_i_2_n_0 ;
  wire \alu_out_q[27]_i_10_n_0 ;
  wire \alu_out_q[27]_i_11_n_0 ;
  wire \alu_out_q[27]_i_12_n_0 ;
  wire \alu_out_q[27]_i_1_n_0 ;
  wire \alu_out_q[27]_i_4_n_0 ;
  wire \alu_out_q[27]_i_5_n_0 ;
  wire \alu_out_q[27]_i_6_n_0 ;
  wire \alu_out_q[27]_i_7_n_0 ;
  wire \alu_out_q[27]_i_8_n_0 ;
  wire \alu_out_q[27]_i_9_n_0 ;
  wire \alu_out_q[28]_i_1_n_0 ;
  wire \alu_out_q[28]_i_2_n_0 ;
  wire \alu_out_q[29]_i_1_n_0 ;
  wire \alu_out_q[29]_i_2_n_0 ;
  wire \alu_out_q[2]_i_1_n_0 ;
  wire \alu_out_q[2]_i_2_n_0 ;
  wire \alu_out_q[30]_i_1_n_0 ;
  wire \alu_out_q[30]_i_2_n_0 ;
  wire \alu_out_q[31]_i_10_n_0 ;
  wire \alu_out_q[31]_i_11_n_0 ;
  wire \alu_out_q[31]_i_12_n_0 ;
  wire \alu_out_q[31]_i_13_n_0 ;
  wire \alu_out_q[31]_i_14_n_0 ;
  wire \alu_out_q[31]_i_15_n_0 ;
  wire \alu_out_q[31]_i_16_n_0 ;
  wire \alu_out_q[31]_i_1_n_0 ;
  wire \alu_out_q[31]_i_4_n_0 ;
  wire \alu_out_q[31]_i_5_n_0 ;
  wire \alu_out_q[31]_i_6_n_0 ;
  wire \alu_out_q[31]_i_7_n_0 ;
  wire \alu_out_q[31]_i_8_n_0 ;
  wire \alu_out_q[31]_i_9_n_0 ;
  wire \alu_out_q[3]_i_10_n_0 ;
  wire \alu_out_q[3]_i_11_n_0 ;
  wire \alu_out_q[3]_i_12_n_0 ;
  wire \alu_out_q[3]_i_1_n_0 ;
  wire \alu_out_q[3]_i_4_n_0 ;
  wire \alu_out_q[3]_i_5_n_0 ;
  wire \alu_out_q[3]_i_6_n_0 ;
  wire \alu_out_q[3]_i_7_n_0 ;
  wire \alu_out_q[3]_i_8_n_0 ;
  wire \alu_out_q[3]_i_9_n_0 ;
  wire \alu_out_q[4]_i_1_n_0 ;
  wire \alu_out_q[4]_i_2_n_0 ;
  wire \alu_out_q[5]_i_1_n_0 ;
  wire \alu_out_q[5]_i_2_n_0 ;
  wire \alu_out_q[6]_i_1_n_0 ;
  wire \alu_out_q[6]_i_2_n_0 ;
  wire \alu_out_q[7]_i_10_n_0 ;
  wire \alu_out_q[7]_i_11_n_0 ;
  wire \alu_out_q[7]_i_12_n_0 ;
  wire \alu_out_q[7]_i_1_n_0 ;
  wire \alu_out_q[7]_i_4_n_0 ;
  wire \alu_out_q[7]_i_5_n_0 ;
  wire \alu_out_q[7]_i_6_n_0 ;
  wire \alu_out_q[7]_i_7_n_0 ;
  wire \alu_out_q[7]_i_8_n_0 ;
  wire \alu_out_q[7]_i_9_n_0 ;
  wire \alu_out_q[8]_i_1_n_0 ;
  wire \alu_out_q[8]_i_2_n_0 ;
  wire \alu_out_q[9]_i_1_n_0 ;
  wire \alu_out_q[9]_i_2_n_0 ;
  wire \alu_out_q_reg[11]_i_2_n_0 ;
  wire \alu_out_q_reg[11]_i_3_n_0 ;
  wire \alu_out_q_reg[15]_i_3_n_0 ;
  wire \alu_out_q_reg[15]_i_4_n_0 ;
  wire \alu_out_q_reg[19]_i_2_n_0 ;
  wire \alu_out_q_reg[19]_i_3_n_0 ;
  wire \alu_out_q_reg[23]_i_2_n_0 ;
  wire \alu_out_q_reg[23]_i_3_n_0 ;
  wire \alu_out_q_reg[27]_i_2_n_0 ;
  wire \alu_out_q_reg[27]_i_3_n_0 ;
  wire \alu_out_q_reg[3]_i_2_n_0 ;
  wire \alu_out_q_reg[3]_i_3_n_0 ;
  wire \alu_out_q_reg[7]_i_2_n_0 ;
  wire \alu_out_q_reg[7]_i_3_n_0 ;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [63:0]count_cycle;
  wire \count_cycle[0]_i_1_n_0 ;
  wire \count_cycle_reg[12]_i_1_n_0 ;
  wire \count_cycle_reg[12]_i_1_n_4 ;
  wire \count_cycle_reg[12]_i_1_n_5 ;
  wire \count_cycle_reg[12]_i_1_n_6 ;
  wire \count_cycle_reg[12]_i_1_n_7 ;
  wire \count_cycle_reg[16]_i_1_n_0 ;
  wire \count_cycle_reg[16]_i_1_n_4 ;
  wire \count_cycle_reg[16]_i_1_n_5 ;
  wire \count_cycle_reg[16]_i_1_n_6 ;
  wire \count_cycle_reg[16]_i_1_n_7 ;
  wire \count_cycle_reg[20]_i_1_n_0 ;
  wire \count_cycle_reg[20]_i_1_n_4 ;
  wire \count_cycle_reg[20]_i_1_n_5 ;
  wire \count_cycle_reg[20]_i_1_n_6 ;
  wire \count_cycle_reg[20]_i_1_n_7 ;
  wire \count_cycle_reg[24]_i_1_n_0 ;
  wire \count_cycle_reg[24]_i_1_n_4 ;
  wire \count_cycle_reg[24]_i_1_n_5 ;
  wire \count_cycle_reg[24]_i_1_n_6 ;
  wire \count_cycle_reg[24]_i_1_n_7 ;
  wire \count_cycle_reg[28]_i_1_n_0 ;
  wire \count_cycle_reg[28]_i_1_n_4 ;
  wire \count_cycle_reg[28]_i_1_n_5 ;
  wire \count_cycle_reg[28]_i_1_n_6 ;
  wire \count_cycle_reg[28]_i_1_n_7 ;
  wire \count_cycle_reg[32]_i_1_n_0 ;
  wire \count_cycle_reg[32]_i_1_n_4 ;
  wire \count_cycle_reg[32]_i_1_n_5 ;
  wire \count_cycle_reg[32]_i_1_n_6 ;
  wire \count_cycle_reg[32]_i_1_n_7 ;
  wire \count_cycle_reg[36]_i_1_n_0 ;
  wire \count_cycle_reg[36]_i_1_n_4 ;
  wire \count_cycle_reg[36]_i_1_n_5 ;
  wire \count_cycle_reg[36]_i_1_n_6 ;
  wire \count_cycle_reg[36]_i_1_n_7 ;
  wire \count_cycle_reg[40]_i_1_n_0 ;
  wire \count_cycle_reg[40]_i_1_n_4 ;
  wire \count_cycle_reg[40]_i_1_n_5 ;
  wire \count_cycle_reg[40]_i_1_n_6 ;
  wire \count_cycle_reg[40]_i_1_n_7 ;
  wire \count_cycle_reg[44]_i_1_n_0 ;
  wire \count_cycle_reg[44]_i_1_n_4 ;
  wire \count_cycle_reg[44]_i_1_n_5 ;
  wire \count_cycle_reg[44]_i_1_n_6 ;
  wire \count_cycle_reg[44]_i_1_n_7 ;
  wire \count_cycle_reg[48]_i_1_n_0 ;
  wire \count_cycle_reg[48]_i_1_n_4 ;
  wire \count_cycle_reg[48]_i_1_n_5 ;
  wire \count_cycle_reg[48]_i_1_n_6 ;
  wire \count_cycle_reg[48]_i_1_n_7 ;
  wire \count_cycle_reg[4]_i_1_n_0 ;
  wire \count_cycle_reg[4]_i_1_n_4 ;
  wire \count_cycle_reg[4]_i_1_n_5 ;
  wire \count_cycle_reg[4]_i_1_n_6 ;
  wire \count_cycle_reg[4]_i_1_n_7 ;
  wire \count_cycle_reg[52]_i_1_n_0 ;
  wire \count_cycle_reg[52]_i_1_n_4 ;
  wire \count_cycle_reg[52]_i_1_n_5 ;
  wire \count_cycle_reg[52]_i_1_n_6 ;
  wire \count_cycle_reg[52]_i_1_n_7 ;
  wire \count_cycle_reg[56]_i_1_n_0 ;
  wire \count_cycle_reg[56]_i_1_n_4 ;
  wire \count_cycle_reg[56]_i_1_n_5 ;
  wire \count_cycle_reg[56]_i_1_n_6 ;
  wire \count_cycle_reg[56]_i_1_n_7 ;
  wire \count_cycle_reg[60]_i_1_n_0 ;
  wire \count_cycle_reg[60]_i_1_n_4 ;
  wire \count_cycle_reg[60]_i_1_n_5 ;
  wire \count_cycle_reg[60]_i_1_n_6 ;
  wire \count_cycle_reg[60]_i_1_n_7 ;
  wire \count_cycle_reg[63]_i_1_n_5 ;
  wire \count_cycle_reg[63]_i_1_n_6 ;
  wire \count_cycle_reg[63]_i_1_n_7 ;
  wire \count_cycle_reg[8]_i_1_n_0 ;
  wire \count_cycle_reg[8]_i_1_n_4 ;
  wire \count_cycle_reg[8]_i_1_n_5 ;
  wire \count_cycle_reg[8]_i_1_n_6 ;
  wire \count_cycle_reg[8]_i_1_n_7 ;
  wire count_instr;
  wire \count_instr[0]_i_1_n_0 ;
  wire \count_instr_reg[12]_i_1_n_0 ;
  wire \count_instr_reg[12]_i_1_n_4 ;
  wire \count_instr_reg[12]_i_1_n_5 ;
  wire \count_instr_reg[12]_i_1_n_6 ;
  wire \count_instr_reg[12]_i_1_n_7 ;
  wire \count_instr_reg[16]_i_1_n_0 ;
  wire \count_instr_reg[16]_i_1_n_4 ;
  wire \count_instr_reg[16]_i_1_n_5 ;
  wire \count_instr_reg[16]_i_1_n_6 ;
  wire \count_instr_reg[16]_i_1_n_7 ;
  wire \count_instr_reg[20]_i_1_n_0 ;
  wire \count_instr_reg[20]_i_1_n_4 ;
  wire \count_instr_reg[20]_i_1_n_5 ;
  wire \count_instr_reg[20]_i_1_n_6 ;
  wire \count_instr_reg[20]_i_1_n_7 ;
  wire \count_instr_reg[24]_i_1_n_0 ;
  wire \count_instr_reg[24]_i_1_n_4 ;
  wire \count_instr_reg[24]_i_1_n_5 ;
  wire \count_instr_reg[24]_i_1_n_6 ;
  wire \count_instr_reg[24]_i_1_n_7 ;
  wire \count_instr_reg[28]_i_1_n_0 ;
  wire \count_instr_reg[28]_i_1_n_4 ;
  wire \count_instr_reg[28]_i_1_n_5 ;
  wire \count_instr_reg[28]_i_1_n_6 ;
  wire \count_instr_reg[28]_i_1_n_7 ;
  wire \count_instr_reg[32]_i_1_n_0 ;
  wire \count_instr_reg[32]_i_1_n_4 ;
  wire \count_instr_reg[32]_i_1_n_5 ;
  wire \count_instr_reg[32]_i_1_n_6 ;
  wire \count_instr_reg[32]_i_1_n_7 ;
  wire \count_instr_reg[36]_i_1_n_0 ;
  wire \count_instr_reg[36]_i_1_n_4 ;
  wire \count_instr_reg[36]_i_1_n_5 ;
  wire \count_instr_reg[36]_i_1_n_6 ;
  wire \count_instr_reg[36]_i_1_n_7 ;
  wire \count_instr_reg[40]_i_1_n_0 ;
  wire \count_instr_reg[40]_i_1_n_4 ;
  wire \count_instr_reg[40]_i_1_n_5 ;
  wire \count_instr_reg[40]_i_1_n_6 ;
  wire \count_instr_reg[40]_i_1_n_7 ;
  wire \count_instr_reg[44]_i_1_n_0 ;
  wire \count_instr_reg[44]_i_1_n_4 ;
  wire \count_instr_reg[44]_i_1_n_5 ;
  wire \count_instr_reg[44]_i_1_n_6 ;
  wire \count_instr_reg[44]_i_1_n_7 ;
  wire \count_instr_reg[48]_i_1_n_0 ;
  wire \count_instr_reg[48]_i_1_n_4 ;
  wire \count_instr_reg[48]_i_1_n_5 ;
  wire \count_instr_reg[48]_i_1_n_6 ;
  wire \count_instr_reg[48]_i_1_n_7 ;
  wire \count_instr_reg[4]_i_1_n_0 ;
  wire \count_instr_reg[4]_i_1_n_4 ;
  wire \count_instr_reg[4]_i_1_n_5 ;
  wire \count_instr_reg[4]_i_1_n_6 ;
  wire \count_instr_reg[4]_i_1_n_7 ;
  wire \count_instr_reg[52]_i_1_n_0 ;
  wire \count_instr_reg[52]_i_1_n_4 ;
  wire \count_instr_reg[52]_i_1_n_5 ;
  wire \count_instr_reg[52]_i_1_n_6 ;
  wire \count_instr_reg[52]_i_1_n_7 ;
  wire \count_instr_reg[56]_i_1_n_0 ;
  wire \count_instr_reg[56]_i_1_n_4 ;
  wire \count_instr_reg[56]_i_1_n_5 ;
  wire \count_instr_reg[56]_i_1_n_6 ;
  wire \count_instr_reg[56]_i_1_n_7 ;
  wire \count_instr_reg[60]_i_1_n_0 ;
  wire \count_instr_reg[60]_i_1_n_4 ;
  wire \count_instr_reg[60]_i_1_n_5 ;
  wire \count_instr_reg[60]_i_1_n_6 ;
  wire \count_instr_reg[60]_i_1_n_7 ;
  wire \count_instr_reg[63]_i_2_n_5 ;
  wire \count_instr_reg[63]_i_2_n_6 ;
  wire \count_instr_reg[63]_i_2_n_7 ;
  wire \count_instr_reg[8]_i_1_n_0 ;
  wire \count_instr_reg[8]_i_1_n_4 ;
  wire \count_instr_reg[8]_i_1_n_5 ;
  wire \count_instr_reg[8]_i_1_n_6 ;
  wire \count_instr_reg[8]_i_1_n_7 ;
  wire \count_instr_reg_n_0_[0] ;
  wire \count_instr_reg_n_0_[10] ;
  wire \count_instr_reg_n_0_[11] ;
  wire \count_instr_reg_n_0_[12] ;
  wire \count_instr_reg_n_0_[13] ;
  wire \count_instr_reg_n_0_[14] ;
  wire \count_instr_reg_n_0_[15] ;
  wire \count_instr_reg_n_0_[16] ;
  wire \count_instr_reg_n_0_[17] ;
  wire \count_instr_reg_n_0_[18] ;
  wire \count_instr_reg_n_0_[19] ;
  wire \count_instr_reg_n_0_[1] ;
  wire \count_instr_reg_n_0_[20] ;
  wire \count_instr_reg_n_0_[21] ;
  wire \count_instr_reg_n_0_[22] ;
  wire \count_instr_reg_n_0_[23] ;
  wire \count_instr_reg_n_0_[24] ;
  wire \count_instr_reg_n_0_[25] ;
  wire \count_instr_reg_n_0_[26] ;
  wire \count_instr_reg_n_0_[27] ;
  wire \count_instr_reg_n_0_[28] ;
  wire \count_instr_reg_n_0_[29] ;
  wire \count_instr_reg_n_0_[2] ;
  wire \count_instr_reg_n_0_[30] ;
  wire \count_instr_reg_n_0_[31] ;
  wire \count_instr_reg_n_0_[32] ;
  wire \count_instr_reg_n_0_[33] ;
  wire \count_instr_reg_n_0_[34] ;
  wire \count_instr_reg_n_0_[35] ;
  wire \count_instr_reg_n_0_[36] ;
  wire \count_instr_reg_n_0_[37] ;
  wire \count_instr_reg_n_0_[38] ;
  wire \count_instr_reg_n_0_[39] ;
  wire \count_instr_reg_n_0_[3] ;
  wire \count_instr_reg_n_0_[40] ;
  wire \count_instr_reg_n_0_[41] ;
  wire \count_instr_reg_n_0_[42] ;
  wire \count_instr_reg_n_0_[43] ;
  wire \count_instr_reg_n_0_[44] ;
  wire \count_instr_reg_n_0_[45] ;
  wire \count_instr_reg_n_0_[46] ;
  wire \count_instr_reg_n_0_[47] ;
  wire \count_instr_reg_n_0_[48] ;
  wire \count_instr_reg_n_0_[49] ;
  wire \count_instr_reg_n_0_[4] ;
  wire \count_instr_reg_n_0_[50] ;
  wire \count_instr_reg_n_0_[51] ;
  wire \count_instr_reg_n_0_[52] ;
  wire \count_instr_reg_n_0_[53] ;
  wire \count_instr_reg_n_0_[54] ;
  wire \count_instr_reg_n_0_[55] ;
  wire \count_instr_reg_n_0_[56] ;
  wire \count_instr_reg_n_0_[57] ;
  wire \count_instr_reg_n_0_[58] ;
  wire \count_instr_reg_n_0_[59] ;
  wire \count_instr_reg_n_0_[5] ;
  wire \count_instr_reg_n_0_[60] ;
  wire \count_instr_reg_n_0_[61] ;
  wire \count_instr_reg_n_0_[62] ;
  wire \count_instr_reg_n_0_[63] ;
  wire \count_instr_reg_n_0_[6] ;
  wire \count_instr_reg_n_0_[7] ;
  wire \count_instr_reg_n_0_[8] ;
  wire \count_instr_reg_n_0_[9] ;
  wire [6:0]cpu_state0_out;
  wire \cpu_state[1]_i_2_n_0 ;
  wire \cpu_state[1]_i_3_n_0 ;
  wire \cpu_state[2]_i_2_n_0 ;
  wire \cpu_state[3]_i_2_n_0 ;
  wire \cpu_state[6]_i_2_n_0 ;
  wire \cpu_state[7]_i_10_n_0 ;
  wire \cpu_state[7]_i_11_n_0 ;
  wire \cpu_state[7]_i_12_n_0 ;
  wire \cpu_state[7]_i_13_n_0 ;
  wire \cpu_state[7]_i_14_n_0 ;
  wire \cpu_state[7]_i_15_n_0 ;
  wire \cpu_state[7]_i_16_n_0 ;
  wire \cpu_state[7]_i_1_n_0 ;
  wire \cpu_state[7]_i_2_n_0 ;
  wire \cpu_state[7]_i_3_n_0 ;
  wire \cpu_state[7]_i_4_n_0 ;
  wire \cpu_state[7]_i_5_n_0 ;
  wire \cpu_state[7]_i_6_n_0 ;
  wire \cpu_state[7]_i_7_n_0 ;
  wire \cpu_state[7]_i_8_n_0 ;
  wire \cpu_state[7]_i_9_n_0 ;
  wire \cpu_state_reg_n_0_[0] ;
  wire \cpu_state_reg_n_0_[1] ;
  wire \cpu_state_reg_n_0_[2] ;
  wire \cpu_state_reg_n_0_[3] ;
  wire \cpu_state_reg_n_0_[5] ;
  wire \cpu_state_reg_n_0_[7] ;
  wire cpuregs_reg_r1_0_31_0_5_i_10_n_0;
  wire cpuregs_reg_r1_0_31_0_5_i_11_n_0;
  wire cpuregs_reg_r1_0_31_0_5_i_11_n_4;
  wire cpuregs_reg_r1_0_31_0_5_i_11_n_5;
  wire cpuregs_reg_r1_0_31_0_5_i_11_n_6;
  wire cpuregs_reg_r1_0_31_0_5_i_12_n_0;
  wire cpuregs_reg_r1_0_31_0_5_i_13_n_0;
  wire cpuregs_reg_r1_0_31_0_5_i_13_n_4;
  wire cpuregs_reg_r1_0_31_0_5_i_13_n_5;
  wire cpuregs_reg_r1_0_31_0_5_i_13_n_6;
  wire cpuregs_reg_r1_0_31_0_5_i_13_n_7;
  wire cpuregs_reg_r1_0_31_0_5_i_14_n_0;
  wire cpuregs_reg_r1_0_31_0_5_i_15_n_0;
  wire cpuregs_reg_r1_0_31_0_5_i_1_n_0;
  wire cpuregs_reg_r1_0_31_0_5_i_8_n_0;
  wire cpuregs_reg_r1_0_31_0_5_i_9_n_0;
  wire cpuregs_reg_r1_0_31_0_5_n_0;
  wire cpuregs_reg_r1_0_31_0_5_n_1;
  wire cpuregs_reg_r1_0_31_0_5_n_2;
  wire cpuregs_reg_r1_0_31_0_5_n_3;
  wire cpuregs_reg_r1_0_31_0_5_n_4;
  wire cpuregs_reg_r1_0_31_0_5_n_5;
  wire cpuregs_reg_r1_0_31_12_17_i_7_n_0;
  wire cpuregs_reg_r1_0_31_12_17_i_7_n_4;
  wire cpuregs_reg_r1_0_31_12_17_i_7_n_5;
  wire cpuregs_reg_r1_0_31_12_17_i_7_n_6;
  wire cpuregs_reg_r1_0_31_12_17_i_7_n_7;
  wire cpuregs_reg_r1_0_31_12_17_i_8_n_0;
  wire cpuregs_reg_r1_0_31_12_17_i_8_n_4;
  wire cpuregs_reg_r1_0_31_12_17_i_8_n_5;
  wire cpuregs_reg_r1_0_31_12_17_i_8_n_6;
  wire cpuregs_reg_r1_0_31_12_17_i_8_n_7;
  wire cpuregs_reg_r1_0_31_12_17_n_0;
  wire cpuregs_reg_r1_0_31_12_17_n_1;
  wire cpuregs_reg_r1_0_31_12_17_n_2;
  wire cpuregs_reg_r1_0_31_12_17_n_3;
  wire cpuregs_reg_r1_0_31_12_17_n_4;
  wire cpuregs_reg_r1_0_31_12_17_n_5;
  wire cpuregs_reg_r1_0_31_18_23_i_7_n_0;
  wire cpuregs_reg_r1_0_31_18_23_i_7_n_4;
  wire cpuregs_reg_r1_0_31_18_23_i_7_n_5;
  wire cpuregs_reg_r1_0_31_18_23_i_7_n_6;
  wire cpuregs_reg_r1_0_31_18_23_i_7_n_7;
  wire cpuregs_reg_r1_0_31_18_23_n_0;
  wire cpuregs_reg_r1_0_31_18_23_n_1;
  wire cpuregs_reg_r1_0_31_18_23_n_2;
  wire cpuregs_reg_r1_0_31_18_23_n_3;
  wire cpuregs_reg_r1_0_31_18_23_n_4;
  wire cpuregs_reg_r1_0_31_18_23_n_5;
  wire cpuregs_reg_r1_0_31_24_29_i_7_n_0;
  wire cpuregs_reg_r1_0_31_24_29_i_7_n_4;
  wire cpuregs_reg_r1_0_31_24_29_i_7_n_5;
  wire cpuregs_reg_r1_0_31_24_29_i_7_n_6;
  wire cpuregs_reg_r1_0_31_24_29_i_7_n_7;
  wire cpuregs_reg_r1_0_31_24_29_i_8_n_4;
  wire cpuregs_reg_r1_0_31_24_29_i_8_n_5;
  wire cpuregs_reg_r1_0_31_24_29_i_8_n_6;
  wire cpuregs_reg_r1_0_31_24_29_i_8_n_7;
  wire cpuregs_reg_r1_0_31_24_29_n_0;
  wire cpuregs_reg_r1_0_31_24_29_n_1;
  wire cpuregs_reg_r1_0_31_24_29_n_2;
  wire cpuregs_reg_r1_0_31_24_29_n_3;
  wire cpuregs_reg_r1_0_31_24_29_n_4;
  wire cpuregs_reg_r1_0_31_24_29_n_5;
  wire cpuregs_reg_r1_0_31_30_31__0_n_0;
  wire cpuregs_reg_r1_0_31_30_31_n_0;
  wire cpuregs_reg_r1_0_31_6_11_i_7_n_0;
  wire cpuregs_reg_r1_0_31_6_11_i_7_n_4;
  wire cpuregs_reg_r1_0_31_6_11_i_7_n_5;
  wire cpuregs_reg_r1_0_31_6_11_i_7_n_6;
  wire cpuregs_reg_r1_0_31_6_11_i_7_n_7;
  wire cpuregs_reg_r1_0_31_6_11_n_0;
  wire cpuregs_reg_r1_0_31_6_11_n_1;
  wire cpuregs_reg_r1_0_31_6_11_n_2;
  wire cpuregs_reg_r1_0_31_6_11_n_3;
  wire cpuregs_reg_r1_0_31_6_11_n_4;
  wire cpuregs_reg_r1_0_31_6_11_n_5;
  wire [31:0]cpuregs_wrdata;
  wire [31:1]current_pc;
  wire [31:0]decoded_imm;
  wire \decoded_imm[0]_i_1_n_0 ;
  wire \decoded_imm[10]_i_1_n_0 ;
  wire \decoded_imm[10]_i_2_n_0 ;
  wire \decoded_imm[11]_i_1_n_0 ;
  wire \decoded_imm[11]_i_2_n_0 ;
  wire \decoded_imm[12]_i_1_n_0 ;
  wire \decoded_imm[13]_i_1_n_0 ;
  wire \decoded_imm[14]_i_1_n_0 ;
  wire \decoded_imm[15]_i_1_n_0 ;
  wire \decoded_imm[16]_i_1_n_0 ;
  wire \decoded_imm[17]_i_1_n_0 ;
  wire \decoded_imm[18]_i_1_n_0 ;
  wire \decoded_imm[19]_i_1_n_0 ;
  wire \decoded_imm[19]_i_2_n_0 ;
  wire \decoded_imm[1]_i_1_n_0 ;
  wire \decoded_imm[20]_i_1_n_0 ;
  wire \decoded_imm[21]_i_1_n_0 ;
  wire \decoded_imm[22]_i_1_n_0 ;
  wire \decoded_imm[23]_i_1_n_0 ;
  wire \decoded_imm[24]_i_1_n_0 ;
  wire \decoded_imm[25]_i_1_n_0 ;
  wire \decoded_imm[26]_i_1_n_0 ;
  wire \decoded_imm[27]_i_1_n_0 ;
  wire \decoded_imm[28]_i_1_n_0 ;
  wire \decoded_imm[29]_i_1_n_0 ;
  wire \decoded_imm[2]_i_1_n_0 ;
  wire \decoded_imm[30]_i_1_n_0 ;
  wire \decoded_imm[31]_i_1_n_0 ;
  wire \decoded_imm[31]_i_2_n_0 ;
  wire \decoded_imm[3]_i_1_n_0 ;
  wire \decoded_imm[4]_i_1_n_0 ;
  wire \decoded_imm[4]_i_2_n_0 ;
  wire \decoded_imm[4]_i_3_n_0 ;
  wire \decoded_imm[5]_i_1_n_0 ;
  wire \decoded_imm[6]_i_1_n_0 ;
  wire \decoded_imm[7]_i_1_n_0 ;
  wire \decoded_imm[8]_i_1_n_0 ;
  wire \decoded_imm[9]_i_1_n_0 ;
  wire [30:1]decoded_imm_j;
  wire \decoded_imm_j[10]_i_1_n_0 ;
  wire \decoded_imm_j[5]_i_1_n_0 ;
  wire \decoded_imm_j[6]_i_1_n_0 ;
  wire \decoded_imm_j[7]_i_1_n_0 ;
  wire \decoded_imm_j[8]_i_1_n_0 ;
  wire \decoded_imm_j[9]_i_1_n_0 ;
  wire [4:0]decoded_rd;
  wire \decoded_rd[0]_i_1_n_0 ;
  wire \decoded_rd[1]_i_1_n_0 ;
  wire \decoded_rd[2]_i_1_n_0 ;
  wire \decoded_rd[3]_i_1_n_0 ;
  wire \decoded_rd[4]_i_1_n_0 ;
  wire [4:0]decoded_rs1;
  wire \decoded_rs1_rep[0]_i_1_n_0 ;
  wire \decoded_rs1_rep[1]_i_1_n_0 ;
  wire \decoded_rs1_rep[2]_i_1_n_0 ;
  wire \decoded_rs1_rep[3]_i_1_n_0 ;
  wire \decoded_rs1_rep[4]_i_1_n_0 ;
  wire decoder_pseudo_trigger;
  wire decoder_pseudo_trigger_reg_n_0;
  wire decoder_trigger_i_10_n_0;
  wire decoder_trigger_i_11_n_0;
  wire decoder_trigger_i_12_n_0;
  wire decoder_trigger_i_13_n_0;
  wire decoder_trigger_i_14_n_0;
  wire decoder_trigger_i_18_n_0;
  wire decoder_trigger_i_19_n_0;
  wire decoder_trigger_i_1_n_0;
  wire decoder_trigger_i_20_n_0;
  wire decoder_trigger_i_21_n_0;
  wire decoder_trigger_i_22_n_0;
  wire decoder_trigger_i_23_n_0;
  wire decoder_trigger_i_24_n_0;
  wire decoder_trigger_i_25_n_0;
  wire decoder_trigger_i_28_n_0;
  wire decoder_trigger_i_29_n_0;
  wire decoder_trigger_i_2_n_0;
  wire decoder_trigger_i_31_n_0;
  wire decoder_trigger_i_32_n_0;
  wire decoder_trigger_i_33_n_0;
  wire decoder_trigger_i_3_n_0;
  wire decoder_trigger_i_40_n_0;
  wire decoder_trigger_i_41_n_0;
  wire decoder_trigger_i_42_n_0;
  wire decoder_trigger_i_43_n_0;
  wire decoder_trigger_i_44_n_0;
  wire decoder_trigger_i_45_n_0;
  wire decoder_trigger_i_46_n_0;
  wire decoder_trigger_i_47_n_0;
  wire decoder_trigger_i_49_n_0;
  wire decoder_trigger_i_50_n_0;
  wire decoder_trigger_i_51_n_0;
  wire decoder_trigger_i_52_n_0;
  wire decoder_trigger_i_5_n_0;
  wire decoder_trigger_i_62_n_0;
  wire decoder_trigger_i_63_n_0;
  wire decoder_trigger_i_64_n_0;
  wire decoder_trigger_i_65_n_0;
  wire decoder_trigger_i_66_n_0;
  wire decoder_trigger_i_67_n_0;
  wire decoder_trigger_i_68_n_0;
  wire decoder_trigger_i_69_n_0;
  wire decoder_trigger_i_70_n_0;
  wire decoder_trigger_i_71_n_0;
  wire decoder_trigger_i_72_n_0;
  wire decoder_trigger_i_73_n_0;
  wire decoder_trigger_i_7_n_0;
  wire decoder_trigger_reg_i_17_n_0;
  wire decoder_trigger_reg_i_26_n_0;
  wire decoder_trigger_reg_i_30_n_0;
  wire decoder_trigger_reg_i_39_n_0;
  wire decoder_trigger_reg_i_48_n_0;
  wire decoder_trigger_reg_i_53_n_0;
  wire decoder_trigger_reg_i_6_n_0;
  wire decoder_trigger_reg_i_74_n_0;
  wire decoder_trigger_reg_n_0;
  wire [31:0]eoi;
  wire instr_add;
  wire instr_add0;
  wire instr_addi;
  wire instr_addi0;
  wire instr_and;
  wire instr_and0;
  wire instr_and_i_1_n_0;
  wire instr_and_i_3_n_0;
  wire instr_andi;
  wire instr_andi0;
  wire instr_auipc;
  wire instr_auipc_i_1_n_0;
  wire instr_beq;
  wire instr_beq0;
  wire instr_bge;
  wire instr_bge0;
  wire instr_bgeu;
  wire instr_bgeu0;
  wire instr_blt;
  wire instr_blt0;
  wire instr_bltu;
  wire instr_bltu0;
  wire instr_bne;
  wire instr_bne0;
  wire instr_jal;
  wire instr_jal_i_1_n_0;
  wire instr_jal_i_2_n_0;
  wire instr_jal_i_3_n_0;
  wire instr_jal_i_4_n_0;
  wire instr_jalr;
  wire instr_jalr_i_1_n_0;
  wire instr_jalr_i_2_n_0;
  wire instr_lb;
  wire instr_lb_i_1_n_0;
  wire instr_lbu;
  wire instr_lbu_i_1_n_0;
  wire instr_lh;
  wire instr_lh_i_1_n_0;
  wire instr_lhu;
  wire instr_lhu_i_1_n_0;
  wire instr_lhu_i_2_n_0;
  wire instr_lui;
  wire instr_lui0;
  wire instr_lui_i_1_n_0;
  wire instr_lw;
  wire instr_lw_i_1_n_0;
  wire instr_or;
  wire instr_or0;
  wire instr_ori;
  wire instr_ori0;
  wire instr_rdcycle;
  wire instr_rdcycle0;
  wire instr_rdcycleh;
  wire instr_rdcycleh0;
  wire instr_rdcycleh_i_2_n_0;
  wire instr_rdcycleh_i_3_n_0;
  wire instr_rdinstr;
  wire instr_rdinstr0;
  wire instr_rdinstr_i_2_n_0;
  wire instr_rdinstr_i_3_n_0;
  wire instr_rdinstr_i_4_n_0;
  wire instr_rdinstr_i_5_n_0;
  wire instr_rdinstr_i_6_n_0;
  wire instr_rdinstrh;
  wire instr_rdinstrh0;
  wire instr_rdinstrh_i_2_n_0;
  wire instr_rdinstrh_i_3_n_0;
  wire instr_rdinstrh_i_4_n_0;
  wire instr_rdinstrh_i_5_n_0;
  wire instr_rdinstrh_i_6_n_0;
  wire instr_sb;
  wire instr_sb0;
  wire instr_sh;
  wire instr_sh0;
  wire instr_sll;
  wire instr_sll0;
  wire instr_slli;
  wire instr_slli0;
  wire instr_slt;
  wire instr_slt0;
  wire instr_slti;
  wire instr_slti0;
  wire instr_sltiu;
  wire instr_sltiu_i_1_n_0;
  wire instr_sltu;
  wire instr_sltu0;
  wire instr_sra;
  wire instr_sra0;
  wire instr_sra_i_2_n_0;
  wire instr_srai;
  wire instr_srai_i_1_n_0;
  wire instr_srai_i_2_n_0;
  wire instr_srl;
  wire instr_srl0;
  wire instr_srli;
  wire instr_srli0;
  wire instr_srli_i_2_n_0;
  wire instr_sub;
  wire instr_sub0;
  wire instr_sw;
  wire instr_sw0;
  wire instr_xor;
  wire instr_xor0;
  wire instr_xori;
  wire instr_xori0;
  wire is_alu_reg_imm;
  wire is_alu_reg_imm_i_1_n_0;
  wire is_alu_reg_reg;
  wire is_alu_reg_reg_i_1_n_0;
  wire is_beq_bne_blt_bge_bltu_bgeu;
  wire is_beq_bne_blt_bge_bltu_bgeu_i_1_n_0;
  wire is_compare;
  wire is_compare_i_1_n_0;
  wire is_compare_i_2_n_0;
  wire is_jalr_addi_slti_sltiu_xori_ori_andi;
  wire is_jalr_addi_slti_sltiu_xori_ori_andi0;
  wire is_lb_lh_lw_lbu_lhu;
  wire is_lb_lh_lw_lbu_lhu_i_1_n_0;
  wire is_lbu_lhu_lw;
  wire is_lbu_lhu_lw_i_1_n_0;
  wire is_lui_auipc_jal;
  wire is_lui_auipc_jal_i_1_n_0;
  wire is_lui_auipc_jal_jalr_addi_add_sub;
  wire is_lui_auipc_jal_jalr_addi_add_sub0;
  wire is_lui_auipc_jal_jalr_addi_add_sub_i_1_n_0;
  wire is_lui_auipc_jal_jalr_addi_add_sub_i_2_n_0;
  wire is_sb_sh_sw;
  wire is_sb_sh_sw_i_2_n_0;
  wire is_sb_sh_sw_i_3_n_0;
  wire is_sb_sh_sw_i_4_n_0;
  wire is_sb_sh_sw_i_5_n_0;
  wire is_sb_sh_sw_i_6_n_0;
  wire is_sb_sh_sw_i_7_n_0;
  wire is_sll_srl_sra;
  wire is_sll_srl_sra0;
  wire is_sll_srl_sra_i_3_n_0;
  wire is_sll_srl_sra_i_4_n_0;
  wire is_sll_srl_sra_i_5_n_0;
  wire is_sll_srl_sra_i_6_n_0;
  wire is_slli_srli_srai;
  wire is_slli_srli_srai0;
  wire is_slti_blt_slt;
  wire is_slti_blt_slt_i_1_n_0;
  wire is_sltiu_bltu_sltu;
  wire is_sltiu_bltu_sltu_i_1_n_0;
  wire latched_branch;
  wire latched_branch_i_1_n_0;
  wire latched_branch_i_2_n_0;
  wire latched_branch_reg_n_0;
  wire latched_is_lb_i_1_n_0;
  wire latched_is_lb_reg_n_0;
  wire latched_is_lh_i_1_n_0;
  wire latched_is_lh_reg_n_0;
  wire latched_is_lu;
  wire latched_is_lu_i_1_n_0;
  wire latched_is_lu_reg_n_0;
  wire [4:0]latched_rd;
  wire \latched_rd[4]_i_1_n_0 ;
  wire \latched_rd[4]_i_2_n_0 ;
  wire latched_stalu_i_1_n_0;
  wire latched_stalu_reg_n_0;
  wire latched_store_i_1_n_0;
  wire latched_store_i_2_n_0;
  wire latched_store_i_3_n_0;
  wire latched_store_reg_n_0;
  wire [31:0]mem_addr;
  wire [31:2]mem_addr_OBUF;
  wire mem_do_prefetch_i_1_n_0;
  wire mem_do_prefetch_i_2_n_0;
  wire mem_do_prefetch_reg_n_0;
  wire mem_do_rdata;
  wire mem_do_rdata_i_1_n_0;
  wire mem_do_rdata_i_4_n_0;
  wire mem_do_rdata_i_5_n_0;
  wire mem_do_rinst;
  wire mem_do_rinst_i_10_n_0;
  wire mem_do_rinst_i_11_n_0;
  wire mem_do_rinst_i_12_n_0;
  wire mem_do_rinst_i_13_n_0;
  wire mem_do_rinst_i_14_n_0;
  wire mem_do_rinst_i_15_n_0;
  wire mem_do_rinst_i_16_n_0;
  wire mem_do_rinst_i_17_n_0;
  wire mem_do_rinst_i_1_n_0;
  wire mem_do_rinst_i_2_n_0;
  wire mem_do_rinst_i_4_n_0;
  wire mem_do_rinst_i_5_n_0;
  wire mem_do_rinst_i_6_n_0;
  wire mem_do_rinst_i_7_n_0;
  wire mem_do_rinst_i_8_n_0;
  wire mem_do_rinst_i_9_n_0;
  wire mem_do_rinst_reg_n_0;
  wire mem_do_wdata;
  wire mem_do_wdata_i_1_n_0;
  wire mem_instr;
  wire mem_instr3_out;
  wire mem_instr_OBUF;
  wire mem_instr_i_2_n_0;
  wire mem_instr_i_3_n_0;
  wire mem_instr_i_4_n_0;
  wire [31:0]mem_la_addr;
  wire [31:2]mem_la_addr_OBUF;
  wire \mem_la_addr_OBUF[31]_inst_i_2_n_0 ;
  wire mem_la_read;
  wire mem_la_read_OBUF;
  wire [31:0]mem_la_wdata;
  wire [31:8]mem_la_wdata_OBUF;
  wire mem_la_write;
  wire mem_la_write_OBUF;
  wire [3:0]mem_la_wstrb;
  wire [3:0]mem_la_wstrb_OBUF;
  wire [31:0]mem_rdata;
  wire [31:0]mem_rdata_IBUF;
  wire \mem_rdata_q[0]_i_1_n_0 ;
  wire \mem_rdata_q[12]_i_1_n_0 ;
  wire \mem_rdata_q[13]_i_1_n_0 ;
  wire \mem_rdata_q[14]_i_1_n_0 ;
  wire \mem_rdata_q[1]_i_1_n_0 ;
  wire \mem_rdata_q[2]_i_1_n_0 ;
  wire \mem_rdata_q[31]_i_1_n_0 ;
  wire \mem_rdata_q[3]_i_1_n_0 ;
  wire \mem_rdata_q[4]_i_1_n_0 ;
  wire \mem_rdata_q[5]_i_1_n_0 ;
  wire \mem_rdata_q[6]_i_1_n_0 ;
  wire \mem_rdata_q_reg_n_0_[0] ;
  wire \mem_rdata_q_reg_n_0_[10] ;
  wire \mem_rdata_q_reg_n_0_[11] ;
  wire \mem_rdata_q_reg_n_0_[15] ;
  wire \mem_rdata_q_reg_n_0_[16] ;
  wire \mem_rdata_q_reg_n_0_[17] ;
  wire \mem_rdata_q_reg_n_0_[18] ;
  wire \mem_rdata_q_reg_n_0_[19] ;
  wire \mem_rdata_q_reg_n_0_[1] ;
  wire \mem_rdata_q_reg_n_0_[20] ;
  wire \mem_rdata_q_reg_n_0_[21] ;
  wire \mem_rdata_q_reg_n_0_[22] ;
  wire \mem_rdata_q_reg_n_0_[23] ;
  wire \mem_rdata_q_reg_n_0_[24] ;
  wire \mem_rdata_q_reg_n_0_[25] ;
  wire \mem_rdata_q_reg_n_0_[26] ;
  wire \mem_rdata_q_reg_n_0_[27] ;
  wire \mem_rdata_q_reg_n_0_[28] ;
  wire \mem_rdata_q_reg_n_0_[29] ;
  wire \mem_rdata_q_reg_n_0_[2] ;
  wire \mem_rdata_q_reg_n_0_[30] ;
  wire \mem_rdata_q_reg_n_0_[31] ;
  wire \mem_rdata_q_reg_n_0_[3] ;
  wire \mem_rdata_q_reg_n_0_[4] ;
  wire \mem_rdata_q_reg_n_0_[5] ;
  wire \mem_rdata_q_reg_n_0_[6] ;
  wire \mem_rdata_q_reg_n_0_[7] ;
  wire \mem_rdata_q_reg_n_0_[8] ;
  wire \mem_rdata_q_reg_n_0_[9] ;
  wire mem_ready;
  wire mem_ready_IBUF;
  wire mem_state;
  wire \mem_state[0]_i_1_n_0 ;
  wire \mem_state[1]_i_1_n_0 ;
  wire \mem_state[1]_i_3_n_0 ;
  wire \mem_state_reg_n_0_[0] ;
  wire \mem_state_reg_n_0_[1] ;
  wire mem_valid;
  wire mem_valid11_out;
  wire mem_valid_OBUF;
  wire mem_valid_i_1_n_0;
  wire mem_valid_i_2_n_0;
  wire [31:0]mem_wdata;
  wire \mem_wdata[31]_i_1_n_0 ;
  wire [31:0]mem_wdata_OBUF;
  wire [1:0]mem_wordsize;
  wire \mem_wordsize[0]_i_1_n_0 ;
  wire \mem_wordsize[1]_i_1_n_0 ;
  wire \mem_wordsize[1]_i_3_n_0 ;
  wire \mem_wordsize_reg_n_0_[0] ;
  wire \mem_wordsize_reg_n_0_[1] ;
  wire [3:0]mem_wstrb;
  wire \mem_wstrb[3]_i_1_n_0 ;
  wire [3:0]mem_wstrb_OBUF;
  wire [2:0]p_0_in;
  wire p_0_in0;
  wire [4:0]p_1_in;
  wire [31:0]pcpi_insn;
  wire [31:0]pcpi_rs1;
  wire [31:0]pcpi_rs1_OBUF;
  wire [31:0]pcpi_rs2;
  wire [31:0]pcpi_rs2_OBUF;
  wire pcpi_valid;
  wire reg_next_pc;
  wire [31:1]reg_next_pc1_in;
  wire \reg_next_pc[12]_i_2_n_0 ;
  wire \reg_next_pc[12]_i_3_n_0 ;
  wire \reg_next_pc[12]_i_4_n_0 ;
  wire \reg_next_pc[12]_i_5_n_0 ;
  wire \reg_next_pc[16]_i_2_n_0 ;
  wire \reg_next_pc[16]_i_3_n_0 ;
  wire \reg_next_pc[16]_i_4_n_0 ;
  wire \reg_next_pc[16]_i_5_n_0 ;
  wire \reg_next_pc[20]_i_2_n_0 ;
  wire \reg_next_pc[20]_i_3_n_0 ;
  wire \reg_next_pc[20]_i_4_n_0 ;
  wire \reg_next_pc[20]_i_5_n_0 ;
  wire \reg_next_pc[24]_i_2_n_0 ;
  wire \reg_next_pc[24]_i_3_n_0 ;
  wire \reg_next_pc[24]_i_4_n_0 ;
  wire \reg_next_pc[24]_i_5_n_0 ;
  wire \reg_next_pc[28]_i_2_n_0 ;
  wire \reg_next_pc[28]_i_3_n_0 ;
  wire \reg_next_pc[28]_i_4_n_0 ;
  wire \reg_next_pc[28]_i_5_n_0 ;
  wire \reg_next_pc[31]_i_2_n_0 ;
  wire \reg_next_pc[31]_i_3_n_0 ;
  wire \reg_next_pc[31]_i_4_n_0 ;
  wire \reg_next_pc[31]_i_5_n_0 ;
  wire \reg_next_pc[4]_i_2_n_0 ;
  wire \reg_next_pc[4]_i_3_n_0 ;
  wire \reg_next_pc[4]_i_4_n_0 ;
  wire \reg_next_pc[4]_i_5_n_0 ;
  wire \reg_next_pc[8]_i_2_n_0 ;
  wire \reg_next_pc[8]_i_3_n_0 ;
  wire \reg_next_pc[8]_i_4_n_0 ;
  wire \reg_next_pc[8]_i_5_n_0 ;
  wire \reg_next_pc_reg[12]_i_1_n_0 ;
  wire \reg_next_pc_reg[16]_i_1_n_0 ;
  wire \reg_next_pc_reg[20]_i_1_n_0 ;
  wire \reg_next_pc_reg[24]_i_1_n_0 ;
  wire \reg_next_pc_reg[28]_i_1_n_0 ;
  wire \reg_next_pc_reg[4]_i_1_n_0 ;
  wire \reg_next_pc_reg[8]_i_1_n_0 ;
  wire \reg_next_pc_reg_n_0_[10] ;
  wire \reg_next_pc_reg_n_0_[11] ;
  wire \reg_next_pc_reg_n_0_[12] ;
  wire \reg_next_pc_reg_n_0_[13] ;
  wire \reg_next_pc_reg_n_0_[14] ;
  wire \reg_next_pc_reg_n_0_[15] ;
  wire \reg_next_pc_reg_n_0_[16] ;
  wire \reg_next_pc_reg_n_0_[17] ;
  wire \reg_next_pc_reg_n_0_[18] ;
  wire \reg_next_pc_reg_n_0_[19] ;
  wire \reg_next_pc_reg_n_0_[1] ;
  wire \reg_next_pc_reg_n_0_[20] ;
  wire \reg_next_pc_reg_n_0_[21] ;
  wire \reg_next_pc_reg_n_0_[22] ;
  wire \reg_next_pc_reg_n_0_[23] ;
  wire \reg_next_pc_reg_n_0_[24] ;
  wire \reg_next_pc_reg_n_0_[25] ;
  wire \reg_next_pc_reg_n_0_[26] ;
  wire \reg_next_pc_reg_n_0_[27] ;
  wire \reg_next_pc_reg_n_0_[28] ;
  wire \reg_next_pc_reg_n_0_[29] ;
  wire \reg_next_pc_reg_n_0_[2] ;
  wire \reg_next_pc_reg_n_0_[30] ;
  wire \reg_next_pc_reg_n_0_[31] ;
  wire \reg_next_pc_reg_n_0_[3] ;
  wire \reg_next_pc_reg_n_0_[4] ;
  wire \reg_next_pc_reg_n_0_[5] ;
  wire \reg_next_pc_reg_n_0_[6] ;
  wire \reg_next_pc_reg_n_0_[7] ;
  wire \reg_next_pc_reg_n_0_[8] ;
  wire \reg_next_pc_reg_n_0_[9] ;
  wire [31:0]reg_op1;
  wire [31:0]reg_op12;
  wire \reg_op1[0]_i_2_n_0 ;
  wire \reg_op1[0]_i_3_n_0 ;
  wire \reg_op1[0]_i_4_n_0 ;
  wire \reg_op1[0]_i_5_n_0 ;
  wire \reg_op1[0]_i_6_n_0 ;
  wire \reg_op1[10]_i_2_n_0 ;
  wire \reg_op1[10]_i_3_n_0 ;
  wire \reg_op1[10]_i_4_n_0 ;
  wire \reg_op1[11]_i_2_n_0 ;
  wire \reg_op1[11]_i_4_n_0 ;
  wire \reg_op1[11]_i_5_n_0 ;
  wire \reg_op1[11]_i_6_n_0 ;
  wire \reg_op1[11]_i_7_n_0 ;
  wire \reg_op1[11]_i_8_n_0 ;
  wire \reg_op1[11]_i_9_n_0 ;
  wire \reg_op1[12]_i_2_n_0 ;
  wire \reg_op1[12]_i_3_n_0 ;
  wire \reg_op1[12]_i_4_n_0 ;
  wire \reg_op1[13]_i_2_n_0 ;
  wire \reg_op1[13]_i_3_n_0 ;
  wire \reg_op1[13]_i_4_n_0 ;
  wire \reg_op1[14]_i_2_n_0 ;
  wire \reg_op1[14]_i_3_n_0 ;
  wire \reg_op1[14]_i_4_n_0 ;
  wire \reg_op1[15]_i_2_n_0 ;
  wire \reg_op1[15]_i_4_n_0 ;
  wire \reg_op1[15]_i_5_n_0 ;
  wire \reg_op1[15]_i_6_n_0 ;
  wire \reg_op1[15]_i_7_n_0 ;
  wire \reg_op1[15]_i_8_n_0 ;
  wire \reg_op1[15]_i_9_n_0 ;
  wire \reg_op1[16]_i_2_n_0 ;
  wire \reg_op1[16]_i_3_n_0 ;
  wire \reg_op1[16]_i_4_n_0 ;
  wire \reg_op1[17]_i_2_n_0 ;
  wire \reg_op1[17]_i_3_n_0 ;
  wire \reg_op1[17]_i_4_n_0 ;
  wire \reg_op1[18]_i_2_n_0 ;
  wire \reg_op1[18]_i_3_n_0 ;
  wire \reg_op1[18]_i_4_n_0 ;
  wire \reg_op1[19]_i_2_n_0 ;
  wire \reg_op1[19]_i_4_n_0 ;
  wire \reg_op1[19]_i_5_n_0 ;
  wire \reg_op1[19]_i_6_n_0 ;
  wire \reg_op1[19]_i_7_n_0 ;
  wire \reg_op1[19]_i_8_n_0 ;
  wire \reg_op1[19]_i_9_n_0 ;
  wire \reg_op1[1]_i_2_n_0 ;
  wire \reg_op1[1]_i_3_n_0 ;
  wire \reg_op1[20]_i_2_n_0 ;
  wire \reg_op1[20]_i_3_n_0 ;
  wire \reg_op1[20]_i_4_n_0 ;
  wire \reg_op1[21]_i_2_n_0 ;
  wire \reg_op1[21]_i_3_n_0 ;
  wire \reg_op1[21]_i_4_n_0 ;
  wire \reg_op1[22]_i_2_n_0 ;
  wire \reg_op1[22]_i_3_n_0 ;
  wire \reg_op1[22]_i_4_n_0 ;
  wire \reg_op1[23]_i_2_n_0 ;
  wire \reg_op1[23]_i_4_n_0 ;
  wire \reg_op1[23]_i_5_n_0 ;
  wire \reg_op1[23]_i_6_n_0 ;
  wire \reg_op1[23]_i_7_n_0 ;
  wire \reg_op1[23]_i_8_n_0 ;
  wire \reg_op1[23]_i_9_n_0 ;
  wire \reg_op1[24]_i_2_n_0 ;
  wire \reg_op1[24]_i_3_n_0 ;
  wire \reg_op1[24]_i_4_n_0 ;
  wire \reg_op1[25]_i_2_n_0 ;
  wire \reg_op1[25]_i_3_n_0 ;
  wire \reg_op1[25]_i_4_n_0 ;
  wire \reg_op1[26]_i_2_n_0 ;
  wire \reg_op1[26]_i_3_n_0 ;
  wire \reg_op1[26]_i_4_n_0 ;
  wire \reg_op1[27]_i_2_n_0 ;
  wire \reg_op1[27]_i_3_n_0 ;
  wire \reg_op1[27]_i_4_n_0 ;
  wire \reg_op1[28]_i_2_n_0 ;
  wire \reg_op1[28]_i_3_n_0 ;
  wire \reg_op1[28]_i_4_n_0 ;
  wire \reg_op1[29]_i_2_n_0 ;
  wire \reg_op1[29]_i_3_n_0 ;
  wire \reg_op1[29]_i_4_n_0 ;
  wire \reg_op1[2]_i_2_n_0 ;
  wire \reg_op1[2]_i_3_n_0 ;
  wire \reg_op1[30]_i_2_n_0 ;
  wire \reg_op1[30]_i_3_n_0 ;
  wire \reg_op1[30]_i_4_n_0 ;
  wire \reg_op1[30]_i_5_n_0 ;
  wire \reg_op1[30]_i_6_n_0 ;
  wire \reg_op1[31]_i_10_n_0 ;
  wire \reg_op1[31]_i_11_n_0 ;
  wire \reg_op1[31]_i_12_n_0 ;
  wire \reg_op1[31]_i_13_n_0 ;
  wire \reg_op1[31]_i_14_n_0 ;
  wire \reg_op1[31]_i_15_n_0 ;
  wire \reg_op1[31]_i_16_n_0 ;
  wire \reg_op1[31]_i_17_n_0 ;
  wire \reg_op1[31]_i_18_n_0 ;
  wire \reg_op1[31]_i_19_n_0 ;
  wire \reg_op1[31]_i_1_n_0 ;
  wire \reg_op1[31]_i_3_n_0 ;
  wire \reg_op1[31]_i_4_n_0 ;
  wire \reg_op1[31]_i_6_n_0 ;
  wire \reg_op1[31]_i_7_n_0 ;
  wire \reg_op1[31]_i_8_n_0 ;
  wire \reg_op1[3]_i_2_n_0 ;
  wire \reg_op1[3]_i_4_n_0 ;
  wire \reg_op1[3]_i_5_n_0 ;
  wire \reg_op1[3]_i_6_n_0 ;
  wire \reg_op1[3]_i_7_n_0 ;
  wire \reg_op1[3]_i_8_n_0 ;
  wire \reg_op1[4]_i_2_n_0 ;
  wire \reg_op1[4]_i_3_n_0 ;
  wire \reg_op1[4]_i_4_n_0 ;
  wire \reg_op1[5]_i_2_n_0 ;
  wire \reg_op1[5]_i_3_n_0 ;
  wire \reg_op1[5]_i_4_n_0 ;
  wire \reg_op1[6]_i_2_n_0 ;
  wire \reg_op1[6]_i_3_n_0 ;
  wire \reg_op1[6]_i_4_n_0 ;
  wire \reg_op1[7]_i_2_n_0 ;
  wire \reg_op1[7]_i_4_n_0 ;
  wire \reg_op1[7]_i_5_n_0 ;
  wire \reg_op1[7]_i_6_n_0 ;
  wire \reg_op1[7]_i_7_n_0 ;
  wire \reg_op1[7]_i_8_n_0 ;
  wire \reg_op1[7]_i_9_n_0 ;
  wire \reg_op1[8]_i_2_n_0 ;
  wire \reg_op1[8]_i_3_n_0 ;
  wire \reg_op1[8]_i_4_n_0 ;
  wire \reg_op1[9]_i_2_n_0 ;
  wire \reg_op1[9]_i_3_n_0 ;
  wire \reg_op1[9]_i_4_n_0 ;
  wire \reg_op1_reg[11]_i_3_n_0 ;
  wire \reg_op1_reg[11]_i_3_n_4 ;
  wire \reg_op1_reg[11]_i_3_n_5 ;
  wire \reg_op1_reg[11]_i_3_n_6 ;
  wire \reg_op1_reg[11]_i_3_n_7 ;
  wire \reg_op1_reg[15]_i_3_n_0 ;
  wire \reg_op1_reg[15]_i_3_n_4 ;
  wire \reg_op1_reg[15]_i_3_n_5 ;
  wire \reg_op1_reg[15]_i_3_n_6 ;
  wire \reg_op1_reg[15]_i_3_n_7 ;
  wire \reg_op1_reg[19]_i_3_n_0 ;
  wire \reg_op1_reg[19]_i_3_n_4 ;
  wire \reg_op1_reg[19]_i_3_n_5 ;
  wire \reg_op1_reg[19]_i_3_n_6 ;
  wire \reg_op1_reg[19]_i_3_n_7 ;
  wire \reg_op1_reg[23]_i_3_n_0 ;
  wire \reg_op1_reg[23]_i_3_n_4 ;
  wire \reg_op1_reg[23]_i_3_n_5 ;
  wire \reg_op1_reg[23]_i_3_n_6 ;
  wire \reg_op1_reg[23]_i_3_n_7 ;
  wire \reg_op1_reg[31]_i_5_n_4 ;
  wire \reg_op1_reg[31]_i_5_n_5 ;
  wire \reg_op1_reg[31]_i_5_n_6 ;
  wire \reg_op1_reg[31]_i_5_n_7 ;
  wire \reg_op1_reg[31]_i_9_n_0 ;
  wire \reg_op1_reg[31]_i_9_n_4 ;
  wire \reg_op1_reg[31]_i_9_n_5 ;
  wire \reg_op1_reg[31]_i_9_n_6 ;
  wire \reg_op1_reg[31]_i_9_n_7 ;
  wire \reg_op1_reg[3]_i_3_n_0 ;
  wire \reg_op1_reg[3]_i_3_n_4 ;
  wire \reg_op1_reg[3]_i_3_n_5 ;
  wire \reg_op1_reg[3]_i_3_n_6 ;
  wire \reg_op1_reg[3]_i_3_n_7 ;
  wire \reg_op1_reg[7]_i_3_n_0 ;
  wire \reg_op1_reg[7]_i_3_n_4 ;
  wire \reg_op1_reg[7]_i_3_n_5 ;
  wire \reg_op1_reg[7]_i_3_n_6 ;
  wire \reg_op1_reg[7]_i_3_n_7 ;
  wire \reg_op2[0]_i_1_n_0 ;
  wire \reg_op2[0]_i_2_n_0 ;
  wire \reg_op2[10]_i_1_n_0 ;
  wire \reg_op2[11]_i_1_n_0 ;
  wire \reg_op2[12]_i_1_n_0 ;
  wire \reg_op2[13]_i_1_n_0 ;
  wire \reg_op2[14]_i_1_n_0 ;
  wire \reg_op2[15]_i_1_n_0 ;
  wire \reg_op2[16]_i_1_n_0 ;
  wire \reg_op2[17]_i_1_n_0 ;
  wire \reg_op2[18]_i_1_n_0 ;
  wire \reg_op2[19]_i_1_n_0 ;
  wire \reg_op2[1]_i_1_n_0 ;
  wire \reg_op2[1]_i_2_n_0 ;
  wire \reg_op2[20]_i_1_n_0 ;
  wire \reg_op2[21]_i_1_n_0 ;
  wire \reg_op2[22]_i_1_n_0 ;
  wire \reg_op2[23]_i_1_n_0 ;
  wire \reg_op2[24]_i_1_n_0 ;
  wire \reg_op2[25]_i_1_n_0 ;
  wire \reg_op2[26]_i_1_n_0 ;
  wire \reg_op2[27]_i_1_n_0 ;
  wire \reg_op2[28]_i_1_n_0 ;
  wire \reg_op2[29]_i_1_n_0 ;
  wire \reg_op2[2]_i_1_n_0 ;
  wire \reg_op2[2]_i_2_n_0 ;
  wire \reg_op2[30]_i_1_n_0 ;
  wire \reg_op2[31]_i_1_n_0 ;
  wire \reg_op2[31]_i_2_n_0 ;
  wire \reg_op2[31]_i_3_n_0 ;
  wire \reg_op2[31]_i_4_n_0 ;
  wire \reg_op2[31]_i_5_n_0 ;
  wire \reg_op2[3]_i_1_n_0 ;
  wire \reg_op2[3]_i_2_n_0 ;
  wire \reg_op2[4]_i_1_n_0 ;
  wire \reg_op2[4]_i_2_n_0 ;
  wire \reg_op2[5]_i_1_n_0 ;
  wire \reg_op2[6]_i_1_n_0 ;
  wire \reg_op2[7]_i_1_n_0 ;
  wire \reg_op2[8]_i_1_n_0 ;
  wire \reg_op2[9]_i_1_n_0 ;
  wire [31:0]reg_out;
  wire \reg_out[0]_i_2_n_0 ;
  wire \reg_out[0]_i_3_n_0 ;
  wire \reg_out[0]_i_4_n_0 ;
  wire \reg_out[0]_i_5_n_0 ;
  wire \reg_out[0]_i_6_n_0 ;
  wire \reg_out[10]_i_2_n_0 ;
  wire \reg_out[10]_i_3_n_0 ;
  wire \reg_out[10]_i_4_n_0 ;
  wire \reg_out[11]_i_2_n_0 ;
  wire \reg_out[11]_i_3_n_0 ;
  wire \reg_out[11]_i_4_n_0 ;
  wire \reg_out[12]_i_2_n_0 ;
  wire \reg_out[12]_i_4_n_0 ;
  wire \reg_out[12]_i_5_n_0 ;
  wire \reg_out[12]_i_6_n_0 ;
  wire \reg_out[12]_i_7_n_0 ;
  wire \reg_out[12]_i_8_n_0 ;
  wire \reg_out[12]_i_9_n_0 ;
  wire \reg_out[13]_i_2_n_0 ;
  wire \reg_out[13]_i_3_n_0 ;
  wire \reg_out[13]_i_4_n_0 ;
  wire \reg_out[14]_i_2_n_0 ;
  wire \reg_out[14]_i_3_n_0 ;
  wire \reg_out[14]_i_4_n_0 ;
  wire \reg_out[14]_i_5_n_0 ;
  wire \reg_out[15]_i_10_n_0 ;
  wire \reg_out[15]_i_11_n_0 ;
  wire \reg_out[15]_i_2_n_0 ;
  wire \reg_out[15]_i_3_n_0 ;
  wire \reg_out[15]_i_5_n_0 ;
  wire \reg_out[15]_i_6_n_0 ;
  wire \reg_out[15]_i_7_n_0 ;
  wire \reg_out[15]_i_8_n_0 ;
  wire \reg_out[15]_i_9_n_0 ;
  wire \reg_out[16]_i_2_n_0 ;
  wire \reg_out[16]_i_3_n_0 ;
  wire \reg_out[16]_i_4_n_0 ;
  wire \reg_out[17]_i_2_n_0 ;
  wire \reg_out[17]_i_3_n_0 ;
  wire \reg_out[17]_i_4_n_0 ;
  wire \reg_out[18]_i_2_n_0 ;
  wire \reg_out[18]_i_3_n_0 ;
  wire \reg_out[18]_i_4_n_0 ;
  wire \reg_out[19]_i_2_n_0 ;
  wire \reg_out[19]_i_3_n_0 ;
  wire \reg_out[19]_i_4_n_0 ;
  wire \reg_out[1]_i_2_n_0 ;
  wire \reg_out[1]_i_3_n_0 ;
  wire \reg_out[1]_i_4_n_0 ;
  wire \reg_out[1]_i_5_n_0 ;
  wire \reg_out[1]_i_6_n_0 ;
  wire \reg_out[20]_i_2_n_0 ;
  wire \reg_out[20]_i_3_n_0 ;
  wire \reg_out[20]_i_5_n_0 ;
  wire \reg_out[20]_i_6_n_0 ;
  wire \reg_out[20]_i_7_n_0 ;
  wire \reg_out[20]_i_8_n_0 ;
  wire \reg_out[20]_i_9_n_0 ;
  wire \reg_out[21]_i_2_n_0 ;
  wire \reg_out[21]_i_3_n_0 ;
  wire \reg_out[21]_i_4_n_0 ;
  wire \reg_out[22]_i_2_n_0 ;
  wire \reg_out[22]_i_3_n_0 ;
  wire \reg_out[22]_i_4_n_0 ;
  wire \reg_out[23]_i_2_n_0 ;
  wire \reg_out[23]_i_3_n_0 ;
  wire \reg_out[23]_i_4_n_0 ;
  wire \reg_out[24]_i_2_n_0 ;
  wire \reg_out[24]_i_3_n_0 ;
  wire \reg_out[24]_i_5_n_0 ;
  wire \reg_out[24]_i_6_n_0 ;
  wire \reg_out[24]_i_7_n_0 ;
  wire \reg_out[24]_i_8_n_0 ;
  wire \reg_out[24]_i_9_n_0 ;
  wire \reg_out[25]_i_2_n_0 ;
  wire \reg_out[25]_i_3_n_0 ;
  wire \reg_out[25]_i_4_n_0 ;
  wire \reg_out[26]_i_2_n_0 ;
  wire \reg_out[26]_i_3_n_0 ;
  wire \reg_out[26]_i_4_n_0 ;
  wire \reg_out[27]_i_2_n_0 ;
  wire \reg_out[27]_i_3_n_0 ;
  wire \reg_out[27]_i_4_n_0 ;
  wire \reg_out[28]_i_2_n_0 ;
  wire \reg_out[28]_i_3_n_0 ;
  wire \reg_out[28]_i_5_n_0 ;
  wire \reg_out[28]_i_6_n_0 ;
  wire \reg_out[28]_i_7_n_0 ;
  wire \reg_out[28]_i_8_n_0 ;
  wire \reg_out[28]_i_9_n_0 ;
  wire \reg_out[29]_i_2_n_0 ;
  wire \reg_out[29]_i_3_n_0 ;
  wire \reg_out[29]_i_4_n_0 ;
  wire \reg_out[2]_i_2_n_0 ;
  wire \reg_out[2]_i_3_n_0 ;
  wire \reg_out[2]_i_4_n_0 ;
  wire \reg_out[2]_i_5_n_0 ;
  wire \reg_out[2]_i_6_n_0 ;
  wire \reg_out[30]_i_2_n_0 ;
  wire \reg_out[30]_i_3_n_0 ;
  wire \reg_out[30]_i_4_n_0 ;
  wire \reg_out[31]_i_10_n_0 ;
  wire \reg_out[31]_i_11_n_0 ;
  wire \reg_out[31]_i_12_n_0 ;
  wire \reg_out[31]_i_13_n_0 ;
  wire \reg_out[31]_i_2_n_0 ;
  wire \reg_out[31]_i_3_n_0 ;
  wire \reg_out[31]_i_4_n_0 ;
  wire \reg_out[31]_i_5_n_0 ;
  wire \reg_out[31]_i_6_n_0 ;
  wire \reg_out[31]_i_7_n_0 ;
  wire \reg_out[31]_i_8_n_0 ;
  wire \reg_out[3]_i_2_n_0 ;
  wire \reg_out[3]_i_3_n_0 ;
  wire \reg_out[3]_i_4_n_0 ;
  wire \reg_out[3]_i_5_n_0 ;
  wire \reg_out[3]_i_6_n_0 ;
  wire \reg_out[3]_i_7_n_0 ;
  wire \reg_out[3]_i_8_n_0 ;
  wire \reg_out[4]_i_10_n_0 ;
  wire \reg_out[4]_i_11_n_0 ;
  wire \reg_out[4]_i_2_n_0 ;
  wire \reg_out[4]_i_4_n_0 ;
  wire \reg_out[4]_i_5_n_0 ;
  wire \reg_out[4]_i_6_n_0 ;
  wire \reg_out[4]_i_7_n_0 ;
  wire \reg_out[4]_i_8_n_0 ;
  wire \reg_out[4]_i_9_n_0 ;
  wire \reg_out[5]_i_2_n_0 ;
  wire \reg_out[5]_i_3_n_0 ;
  wire \reg_out[5]_i_4_n_0 ;
  wire \reg_out[5]_i_5_n_0 ;
  wire \reg_out[5]_i_6_n_0 ;
  wire \reg_out[6]_i_2_n_0 ;
  wire \reg_out[6]_i_3_n_0 ;
  wire \reg_out[6]_i_4_n_0 ;
  wire \reg_out[6]_i_5_n_0 ;
  wire \reg_out[6]_i_6_n_0 ;
  wire \reg_out[6]_i_7_n_0 ;
  wire \reg_out[7]_i_2_n_0 ;
  wire \reg_out[7]_i_3_n_0 ;
  wire \reg_out[7]_i_4_n_0 ;
  wire \reg_out[7]_i_5_n_0 ;
  wire \reg_out[7]_i_6_n_0 ;
  wire \reg_out[8]_i_2_n_0 ;
  wire \reg_out[8]_i_4_n_0 ;
  wire \reg_out[8]_i_5_n_0 ;
  wire \reg_out[8]_i_6_n_0 ;
  wire \reg_out[8]_i_7_n_0 ;
  wire \reg_out[8]_i_8_n_0 ;
  wire \reg_out[8]_i_9_n_0 ;
  wire \reg_out[9]_i_2_n_0 ;
  wire \reg_out[9]_i_3_n_0 ;
  wire \reg_out[9]_i_4_n_0 ;
  wire \reg_out_reg[12]_i_3_n_0 ;
  wire \reg_out_reg[12]_i_3_n_4 ;
  wire \reg_out_reg[12]_i_3_n_5 ;
  wire \reg_out_reg[12]_i_3_n_6 ;
  wire \reg_out_reg[12]_i_3_n_7 ;
  wire \reg_out_reg[15]_i_4_n_0 ;
  wire \reg_out_reg[15]_i_4_n_4 ;
  wire \reg_out_reg[15]_i_4_n_5 ;
  wire \reg_out_reg[15]_i_4_n_6 ;
  wire \reg_out_reg[15]_i_4_n_7 ;
  wire \reg_out_reg[20]_i_4_n_0 ;
  wire \reg_out_reg[20]_i_4_n_4 ;
  wire \reg_out_reg[20]_i_4_n_5 ;
  wire \reg_out_reg[20]_i_4_n_6 ;
  wire \reg_out_reg[20]_i_4_n_7 ;
  wire \reg_out_reg[24]_i_4_n_0 ;
  wire \reg_out_reg[24]_i_4_n_4 ;
  wire \reg_out_reg[24]_i_4_n_5 ;
  wire \reg_out_reg[24]_i_4_n_6 ;
  wire \reg_out_reg[24]_i_4_n_7 ;
  wire \reg_out_reg[28]_i_4_n_0 ;
  wire \reg_out_reg[28]_i_4_n_4 ;
  wire \reg_out_reg[28]_i_4_n_5 ;
  wire \reg_out_reg[28]_i_4_n_6 ;
  wire \reg_out_reg[28]_i_4_n_7 ;
  wire \reg_out_reg[31]_i_9_n_5 ;
  wire \reg_out_reg[31]_i_9_n_6 ;
  wire \reg_out_reg[31]_i_9_n_7 ;
  wire \reg_out_reg[4]_i_3_n_0 ;
  wire \reg_out_reg[4]_i_3_n_4 ;
  wire \reg_out_reg[4]_i_3_n_5 ;
  wire \reg_out_reg[4]_i_3_n_6 ;
  wire \reg_out_reg[4]_i_3_n_7 ;
  wire \reg_out_reg[8]_i_3_n_0 ;
  wire \reg_out_reg[8]_i_3_n_4 ;
  wire \reg_out_reg[8]_i_3_n_5 ;
  wire \reg_out_reg[8]_i_3_n_6 ;
  wire \reg_out_reg[8]_i_3_n_7 ;
  wire \reg_out_reg_n_0_[0] ;
  wire \reg_out_reg_n_0_[10] ;
  wire \reg_out_reg_n_0_[11] ;
  wire \reg_out_reg_n_0_[12] ;
  wire \reg_out_reg_n_0_[13] ;
  wire \reg_out_reg_n_0_[14] ;
  wire \reg_out_reg_n_0_[15] ;
  wire \reg_out_reg_n_0_[16] ;
  wire \reg_out_reg_n_0_[17] ;
  wire \reg_out_reg_n_0_[18] ;
  wire \reg_out_reg_n_0_[19] ;
  wire \reg_out_reg_n_0_[1] ;
  wire \reg_out_reg_n_0_[20] ;
  wire \reg_out_reg_n_0_[21] ;
  wire \reg_out_reg_n_0_[22] ;
  wire \reg_out_reg_n_0_[23] ;
  wire \reg_out_reg_n_0_[24] ;
  wire \reg_out_reg_n_0_[25] ;
  wire \reg_out_reg_n_0_[26] ;
  wire \reg_out_reg_n_0_[27] ;
  wire \reg_out_reg_n_0_[28] ;
  wire \reg_out_reg_n_0_[29] ;
  wire \reg_out_reg_n_0_[2] ;
  wire \reg_out_reg_n_0_[30] ;
  wire \reg_out_reg_n_0_[31] ;
  wire \reg_out_reg_n_0_[3] ;
  wire \reg_out_reg_n_0_[4] ;
  wire \reg_out_reg_n_0_[5] ;
  wire \reg_out_reg_n_0_[6] ;
  wire \reg_out_reg_n_0_[7] ;
  wire \reg_out_reg_n_0_[8] ;
  wire \reg_out_reg_n_0_[9] ;
  wire \reg_pc_reg_n_0_[10] ;
  wire \reg_pc_reg_n_0_[11] ;
  wire \reg_pc_reg_n_0_[12] ;
  wire \reg_pc_reg_n_0_[13] ;
  wire \reg_pc_reg_n_0_[14] ;
  wire \reg_pc_reg_n_0_[15] ;
  wire \reg_pc_reg_n_0_[16] ;
  wire \reg_pc_reg_n_0_[17] ;
  wire \reg_pc_reg_n_0_[18] ;
  wire \reg_pc_reg_n_0_[19] ;
  wire \reg_pc_reg_n_0_[1] ;
  wire \reg_pc_reg_n_0_[20] ;
  wire \reg_pc_reg_n_0_[21] ;
  wire \reg_pc_reg_n_0_[22] ;
  wire \reg_pc_reg_n_0_[23] ;
  wire \reg_pc_reg_n_0_[24] ;
  wire \reg_pc_reg_n_0_[25] ;
  wire \reg_pc_reg_n_0_[26] ;
  wire \reg_pc_reg_n_0_[27] ;
  wire \reg_pc_reg_n_0_[28] ;
  wire \reg_pc_reg_n_0_[29] ;
  wire \reg_pc_reg_n_0_[2] ;
  wire \reg_pc_reg_n_0_[30] ;
  wire \reg_pc_reg_n_0_[31] ;
  wire \reg_pc_reg_n_0_[3] ;
  wire \reg_pc_reg_n_0_[4] ;
  wire \reg_pc_reg_n_0_[5] ;
  wire \reg_pc_reg_n_0_[6] ;
  wire \reg_pc_reg_n_0_[7] ;
  wire \reg_pc_reg_n_0_[8] ;
  wire \reg_pc_reg_n_0_[9] ;
  wire [4:0]reg_sh;
  wire \reg_sh[0]_i_2_n_0 ;
  wire \reg_sh[1]_i_2_n_0 ;
  wire \reg_sh[2]_i_2_n_0 ;
  wire \reg_sh[2]_i_3_n_0 ;
  wire \reg_sh[3]_i_2_n_0 ;
  wire \reg_sh[4]_i_2_n_0 ;
  wire \reg_sh[4]_i_3_n_0 ;
  wire \reg_sh[4]_i_4_n_0 ;
  wire \reg_sh_reg_n_0_[0] ;
  wire \reg_sh_reg_n_0_[1] ;
  wire \reg_sh_reg_n_0_[2] ;
  wire \reg_sh_reg_n_0_[3] ;
  wire \reg_sh_reg_n_0_[4] ;
  wire resetn;
  wire resetn_IBUF;
  wire set_mem_do_rdata4_out;
  wire [35:0]trace_data;
  wire trace_valid;
  wire trap;
  wire trap_OBUF;
  wire [3:0]\NLW_alu_out_q_reg[11]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_alu_out_q_reg[11]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_alu_out_q_reg[15]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_alu_out_q_reg[15]_i_4_CO_UNCONNECTED ;
  wire [3:0]\NLW_alu_out_q_reg[19]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_alu_out_q_reg[19]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_alu_out_q_reg[23]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_alu_out_q_reg[23]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_alu_out_q_reg[27]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_alu_out_q_reg[27]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_alu_out_q_reg[3]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_alu_out_q_reg[3]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_alu_out_q_reg[7]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_alu_out_q_reg[7]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_cycle_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_cycle_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_cycle_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_cycle_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_cycle_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_cycle_reg[32]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_cycle_reg[36]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_cycle_reg[40]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_cycle_reg[44]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_cycle_reg[48]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_cycle_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_cycle_reg[52]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_cycle_reg[56]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_cycle_reg[60]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_cycle_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_instr_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_instr_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_instr_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_instr_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_instr_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_instr_reg[32]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_instr_reg[36]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_instr_reg[40]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_instr_reg[44]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_instr_reg[48]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_instr_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_instr_reg[52]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_instr_reg[56]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_instr_reg[60]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_instr_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_cpuregs_reg_r1_0_31_0_5_i_11_CO_UNCONNECTED;
  wire [3:0]NLW_cpuregs_reg_r1_0_31_0_5_i_11_O_UNCONNECTED;
  wire [3:0]NLW_cpuregs_reg_r1_0_31_0_5_i_13_CO_UNCONNECTED;
  wire [3:0]NLW_cpuregs_reg_r1_0_31_12_17_i_7_CO_UNCONNECTED;
  wire [3:0]NLW_cpuregs_reg_r1_0_31_12_17_i_8_CO_UNCONNECTED;
  wire [3:0]NLW_cpuregs_reg_r1_0_31_18_23_i_7_CO_UNCONNECTED;
  wire [3:0]NLW_cpuregs_reg_r1_0_31_24_29_i_7_CO_UNCONNECTED;
  wire [3:0]NLW_cpuregs_reg_r1_0_31_6_11_i_7_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_15_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_16_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_17_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_26_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_30_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_39_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_4_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_48_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_53_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_6_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_74_CO_UNCONNECTED;
  wire [3:0]\NLW_reg_next_pc_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_next_pc_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_next_pc_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_next_pc_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_next_pc_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_next_pc_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_next_pc_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_op1_reg[11]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_op1_reg[15]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_op1_reg[19]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_op1_reg[23]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_op1_reg[31]_i_9_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_op1_reg[3]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_op1_reg[7]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_out_reg[12]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_out_reg[15]_i_4_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_out_reg[20]_i_4_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_out_reg[24]_i_4_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_out_reg[28]_i_4_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_out_reg[4]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_out_reg[8]_i_3_CO_UNCONNECTED ;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hFF350035)) 
    \alu_out_q[0]_i_1 
       (.I0(\alu_out_q[0]_i_2_n_0 ),
        .I1(\alu_out_q[0]_i_3_n_0 ),
        .I2(is_compare),
        .I3(is_lui_auipc_jal_jalr_addi_add_sub),
        .I4(\alu_out_q[0]_i_4_n_0 ),
        .O(\alu_out_q[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2BC32BC32BC3ABC3)) 
    \alu_out_q[0]_i_2 
       (.I0(\alu_out_q[31]_i_15_n_0 ),
        .I1(pcpi_rs1_OBUF[0]),
        .I2(pcpi_rs2_OBUF[0]),
        .I3(\alu_out_q[31]_i_13_n_0 ),
        .I4(instr_andi),
        .I5(instr_and),
        .O(\alu_out_q[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h02A2)) 
    \alu_out_q[0]_i_3 
       (.I0(decoder_trigger_i_5_n_0),
        .I1(instr_bge),
        .I2(alu_lts),
        .I3(is_slti_blt_slt),
        .O(\alu_out_q[0]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \alu_out_q[0]_i_4 
       (.I0(alu_out_q20_out[0]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[0]),
        .O(\alu_out_q[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hF101F1F1F1010101)) 
    \alu_out_q[10]_i_1 
       (.I0(\alu_out_q[10]_i_2_n_0 ),
        .I1(is_compare),
        .I2(is_lui_auipc_jal_jalr_addi_add_sub),
        .I3(alu_out_q20_out[10]),
        .I4(instr_sub),
        .I5(alu_out_q22_out[10]),
        .O(\alu_out_q[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2BC32BC32BC3ABC3)) 
    \alu_out_q[10]_i_2 
       (.I0(\alu_out_q[31]_i_15_n_0 ),
        .I1(pcpi_rs1_OBUF[10]),
        .I2(pcpi_rs2_OBUF[10]),
        .I3(\alu_out_q[31]_i_13_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[11]_i_1 
       (.I0(alu_out_q20_out[11]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[11]),
        .I3(\alu_out_q[11]_i_4_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[11]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[11]_i_10 
       (.I0(pcpi_rs1_OBUF[10]),
        .I1(pcpi_rs2_OBUF[10]),
        .O(\alu_out_q[11]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[11]_i_11 
       (.I0(pcpi_rs1_OBUF[9]),
        .I1(pcpi_rs2_OBUF[9]),
        .O(\alu_out_q[11]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[11]_i_12 
       (.I0(pcpi_rs1_OBUF[8]),
        .I1(pcpi_rs2_OBUF[8]),
        .O(\alu_out_q[11]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[11]_i_4 
       (.I0(pcpi_rs2_OBUF[11]),
        .I1(pcpi_rs1_OBUF[11]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[11]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[11]_i_5 
       (.I0(pcpi_rs2_OBUF[11]),
        .I1(pcpi_rs1_OBUF[11]),
        .O(\alu_out_q[11]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[11]_i_6 
       (.I0(pcpi_rs2_OBUF[10]),
        .I1(pcpi_rs1_OBUF[10]),
        .O(\alu_out_q[11]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[11]_i_7 
       (.I0(pcpi_rs2_OBUF[9]),
        .I1(pcpi_rs1_OBUF[9]),
        .O(\alu_out_q[11]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[11]_i_8 
       (.I0(pcpi_rs2_OBUF[8]),
        .I1(pcpi_rs1_OBUF[8]),
        .O(\alu_out_q[11]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[11]_i_9 
       (.I0(pcpi_rs1_OBUF[11]),
        .I1(pcpi_rs2_OBUF[11]),
        .O(\alu_out_q[11]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[12]_i_1 
       (.I0(alu_out_q20_out[12]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[12]),
        .I3(\alu_out_q[12]_i_2_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[12]_i_2 
       (.I0(pcpi_rs2_OBUF[12]),
        .I1(pcpi_rs1_OBUF[12]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[13]_i_1 
       (.I0(alu_out_q20_out[13]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[13]),
        .I3(\alu_out_q[13]_i_2_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[13]_i_2 
       (.I0(pcpi_rs2_OBUF[13]),
        .I1(pcpi_rs1_OBUF[13]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF101F1F1F1010101)) 
    \alu_out_q[14]_i_1 
       (.I0(\alu_out_q[14]_i_2_n_0 ),
        .I1(is_compare),
        .I2(is_lui_auipc_jal_jalr_addi_add_sub),
        .I3(alu_out_q20_out[14]),
        .I4(instr_sub),
        .I5(alu_out_q22_out[14]),
        .O(\alu_out_q[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2BC32BC32BC3ABC3)) 
    \alu_out_q[14]_i_2 
       (.I0(\alu_out_q[31]_i_15_n_0 ),
        .I1(pcpi_rs1_OBUF[14]),
        .I2(pcpi_rs2_OBUF[14]),
        .I3(\alu_out_q[31]_i_13_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF101F1F1F1010101)) 
    \alu_out_q[15]_i_1 
       (.I0(\alu_out_q[15]_i_2_n_0 ),
        .I1(is_compare),
        .I2(is_lui_auipc_jal_jalr_addi_add_sub),
        .I3(alu_out_q20_out[15]),
        .I4(instr_sub),
        .I5(alu_out_q22_out[15]),
        .O(\alu_out_q[15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[15]_i_10 
       (.I0(pcpi_rs1_OBUF[14]),
        .I1(pcpi_rs2_OBUF[14]),
        .O(\alu_out_q[15]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[15]_i_11 
       (.I0(pcpi_rs1_OBUF[13]),
        .I1(pcpi_rs2_OBUF[13]),
        .O(\alu_out_q[15]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[15]_i_12 
       (.I0(pcpi_rs1_OBUF[12]),
        .I1(pcpi_rs2_OBUF[12]),
        .O(\alu_out_q[15]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h2BC32BC32BC3ABC3)) 
    \alu_out_q[15]_i_2 
       (.I0(\alu_out_q[31]_i_15_n_0 ),
        .I1(pcpi_rs1_OBUF[15]),
        .I2(pcpi_rs2_OBUF[15]),
        .I3(\alu_out_q[31]_i_13_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[15]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[15]_i_5 
       (.I0(pcpi_rs2_OBUF[15]),
        .I1(pcpi_rs1_OBUF[15]),
        .O(\alu_out_q[15]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[15]_i_6 
       (.I0(pcpi_rs2_OBUF[14]),
        .I1(pcpi_rs1_OBUF[14]),
        .O(\alu_out_q[15]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[15]_i_7 
       (.I0(pcpi_rs2_OBUF[13]),
        .I1(pcpi_rs1_OBUF[13]),
        .O(\alu_out_q[15]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[15]_i_8 
       (.I0(pcpi_rs2_OBUF[12]),
        .I1(pcpi_rs1_OBUF[12]),
        .O(\alu_out_q[15]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[15]_i_9 
       (.I0(pcpi_rs1_OBUF[15]),
        .I1(pcpi_rs2_OBUF[15]),
        .O(\alu_out_q[15]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[16]_i_1 
       (.I0(alu_out_q20_out[16]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[16]),
        .I3(\alu_out_q[16]_i_2_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[16]_i_2 
       (.I0(pcpi_rs2_OBUF[16]),
        .I1(pcpi_rs1_OBUF[16]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[17]_i_1 
       (.I0(alu_out_q20_out[17]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[17]),
        .I3(\alu_out_q[17]_i_2_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[17]_i_2 
       (.I0(pcpi_rs2_OBUF[17]),
        .I1(pcpi_rs1_OBUF[17]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF101F1F1F1010101)) 
    \alu_out_q[18]_i_1 
       (.I0(\alu_out_q[18]_i_2_n_0 ),
        .I1(is_compare),
        .I2(is_lui_auipc_jal_jalr_addi_add_sub),
        .I3(alu_out_q20_out[18]),
        .I4(instr_sub),
        .I5(alu_out_q22_out[18]),
        .O(\alu_out_q[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2BC32BC32BC3ABC3)) 
    \alu_out_q[18]_i_2 
       (.I0(\alu_out_q[31]_i_15_n_0 ),
        .I1(pcpi_rs1_OBUF[18]),
        .I2(pcpi_rs2_OBUF[18]),
        .I3(\alu_out_q[31]_i_13_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[19]_i_1 
       (.I0(alu_out_q20_out[19]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[19]),
        .I3(\alu_out_q[19]_i_4_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[19]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[19]_i_10 
       (.I0(pcpi_rs1_OBUF[18]),
        .I1(pcpi_rs2_OBUF[18]),
        .O(\alu_out_q[19]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[19]_i_11 
       (.I0(pcpi_rs1_OBUF[17]),
        .I1(pcpi_rs2_OBUF[17]),
        .O(\alu_out_q[19]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[19]_i_12 
       (.I0(pcpi_rs1_OBUF[16]),
        .I1(pcpi_rs2_OBUF[16]),
        .O(\alu_out_q[19]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[19]_i_4 
       (.I0(pcpi_rs2_OBUF[19]),
        .I1(pcpi_rs1_OBUF[19]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[19]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[19]_i_5 
       (.I0(pcpi_rs2_OBUF[19]),
        .I1(pcpi_rs1_OBUF[19]),
        .O(\alu_out_q[19]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[19]_i_6 
       (.I0(pcpi_rs2_OBUF[18]),
        .I1(pcpi_rs1_OBUF[18]),
        .O(\alu_out_q[19]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[19]_i_7 
       (.I0(pcpi_rs2_OBUF[17]),
        .I1(pcpi_rs1_OBUF[17]),
        .O(\alu_out_q[19]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[19]_i_8 
       (.I0(pcpi_rs2_OBUF[16]),
        .I1(pcpi_rs1_OBUF[16]),
        .O(\alu_out_q[19]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[19]_i_9 
       (.I0(pcpi_rs1_OBUF[19]),
        .I1(pcpi_rs2_OBUF[19]),
        .O(\alu_out_q[19]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[1]_i_1 
       (.I0(alu_out_q20_out[1]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[1]),
        .I3(\alu_out_q[1]_i_2_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[1]_i_2 
       (.I0(pcpi_rs2_OBUF[1]),
        .I1(pcpi_rs1_OBUF[1]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[20]_i_1 
       (.I0(alu_out_q20_out[20]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[20]),
        .I3(\alu_out_q[20]_i_2_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[20]_i_2 
       (.I0(pcpi_rs2_OBUF[20]),
        .I1(pcpi_rs1_OBUF[20]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF101F1F1F1010101)) 
    \alu_out_q[21]_i_1 
       (.I0(\alu_out_q[21]_i_2_n_0 ),
        .I1(is_compare),
        .I2(is_lui_auipc_jal_jalr_addi_add_sub),
        .I3(alu_out_q20_out[21]),
        .I4(instr_sub),
        .I5(alu_out_q22_out[21]),
        .O(\alu_out_q[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2BC32BC32BC3ABC3)) 
    \alu_out_q[21]_i_2 
       (.I0(\alu_out_q[31]_i_15_n_0 ),
        .I1(pcpi_rs1_OBUF[21]),
        .I2(pcpi_rs2_OBUF[21]),
        .I3(\alu_out_q[31]_i_13_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF101F1F1F1010101)) 
    \alu_out_q[22]_i_1 
       (.I0(\alu_out_q[22]_i_2_n_0 ),
        .I1(is_compare),
        .I2(is_lui_auipc_jal_jalr_addi_add_sub),
        .I3(alu_out_q20_out[22]),
        .I4(instr_sub),
        .I5(alu_out_q22_out[22]),
        .O(\alu_out_q[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2BC32BC32BC3ABC3)) 
    \alu_out_q[22]_i_2 
       (.I0(\alu_out_q[31]_i_15_n_0 ),
        .I1(pcpi_rs1_OBUF[22]),
        .I2(pcpi_rs2_OBUF[22]),
        .I3(\alu_out_q[31]_i_13_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[23]_i_1 
       (.I0(alu_out_q20_out[23]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[23]),
        .I3(\alu_out_q[23]_i_4_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[23]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[23]_i_10 
       (.I0(pcpi_rs1_OBUF[22]),
        .I1(pcpi_rs2_OBUF[22]),
        .O(\alu_out_q[23]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[23]_i_11 
       (.I0(pcpi_rs1_OBUF[21]),
        .I1(pcpi_rs2_OBUF[21]),
        .O(\alu_out_q[23]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[23]_i_12 
       (.I0(pcpi_rs1_OBUF[20]),
        .I1(pcpi_rs2_OBUF[20]),
        .O(\alu_out_q[23]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[23]_i_4 
       (.I0(pcpi_rs2_OBUF[23]),
        .I1(pcpi_rs1_OBUF[23]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[23]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[23]_i_5 
       (.I0(pcpi_rs2_OBUF[23]),
        .I1(pcpi_rs1_OBUF[23]),
        .O(\alu_out_q[23]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[23]_i_6 
       (.I0(pcpi_rs2_OBUF[22]),
        .I1(pcpi_rs1_OBUF[22]),
        .O(\alu_out_q[23]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[23]_i_7 
       (.I0(pcpi_rs2_OBUF[21]),
        .I1(pcpi_rs1_OBUF[21]),
        .O(\alu_out_q[23]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[23]_i_8 
       (.I0(pcpi_rs2_OBUF[20]),
        .I1(pcpi_rs1_OBUF[20]),
        .O(\alu_out_q[23]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[23]_i_9 
       (.I0(pcpi_rs1_OBUF[23]),
        .I1(pcpi_rs2_OBUF[23]),
        .O(\alu_out_q[23]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[24]_i_1 
       (.I0(alu_out_q20_out[24]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[24]),
        .I3(\alu_out_q[24]_i_2_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[24]_i_2 
       (.I0(pcpi_rs2_OBUF[24]),
        .I1(pcpi_rs1_OBUF[24]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[25]_i_1 
       (.I0(alu_out_q20_out[25]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[25]),
        .I3(\alu_out_q[25]_i_2_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[25]_i_2 
       (.I0(pcpi_rs2_OBUF[25]),
        .I1(pcpi_rs1_OBUF[25]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[26]_i_1 
       (.I0(alu_out_q20_out[26]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[26]),
        .I3(\alu_out_q[26]_i_2_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[26]_i_2 
       (.I0(pcpi_rs2_OBUF[26]),
        .I1(pcpi_rs1_OBUF[26]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[26]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[27]_i_1 
       (.I0(alu_out_q20_out[27]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[27]),
        .I3(\alu_out_q[27]_i_4_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[27]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[27]_i_10 
       (.I0(pcpi_rs1_OBUF[26]),
        .I1(pcpi_rs2_OBUF[26]),
        .O(\alu_out_q[27]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[27]_i_11 
       (.I0(pcpi_rs1_OBUF[25]),
        .I1(pcpi_rs2_OBUF[25]),
        .O(\alu_out_q[27]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[27]_i_12 
       (.I0(pcpi_rs1_OBUF[24]),
        .I1(pcpi_rs2_OBUF[24]),
        .O(\alu_out_q[27]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[27]_i_4 
       (.I0(pcpi_rs2_OBUF[27]),
        .I1(pcpi_rs1_OBUF[27]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[27]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[27]_i_5 
       (.I0(pcpi_rs2_OBUF[27]),
        .I1(pcpi_rs1_OBUF[27]),
        .O(\alu_out_q[27]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[27]_i_6 
       (.I0(pcpi_rs2_OBUF[26]),
        .I1(pcpi_rs1_OBUF[26]),
        .O(\alu_out_q[27]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[27]_i_7 
       (.I0(pcpi_rs2_OBUF[25]),
        .I1(pcpi_rs1_OBUF[25]),
        .O(\alu_out_q[27]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[27]_i_8 
       (.I0(pcpi_rs2_OBUF[24]),
        .I1(pcpi_rs1_OBUF[24]),
        .O(\alu_out_q[27]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[27]_i_9 
       (.I0(pcpi_rs1_OBUF[27]),
        .I1(pcpi_rs2_OBUF[27]),
        .O(\alu_out_q[27]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[28]_i_1 
       (.I0(alu_out_q20_out[28]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[28]),
        .I3(\alu_out_q[28]_i_2_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[28]_i_2 
       (.I0(pcpi_rs2_OBUF[28]),
        .I1(pcpi_rs1_OBUF[28]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[29]_i_1 
       (.I0(alu_out_q20_out[29]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[29]),
        .I3(\alu_out_q[29]_i_2_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[29]_i_2 
       (.I0(pcpi_rs2_OBUF[29]),
        .I1(pcpi_rs1_OBUF[29]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[2]_i_1 
       (.I0(alu_out_q20_out[2]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[2]),
        .I3(\alu_out_q[2]_i_2_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[2]_i_2 
       (.I0(pcpi_rs2_OBUF[2]),
        .I1(pcpi_rs1_OBUF[2]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF8A80)) 
    \alu_out_q[30]_i_1 
       (.I0(is_lui_auipc_jal_jalr_addi_add_sub),
        .I1(alu_out_q20_out[30]),
        .I2(instr_sub),
        .I3(alu_out_q22_out[30]),
        .I4(\alu_out_q[30]_i_2_n_0 ),
        .O(\alu_out_q[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0686E6E600000000)) 
    \alu_out_q[30]_i_2 
       (.I0(pcpi_rs2_OBUF[30]),
        .I1(pcpi_rs1_OBUF[30]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_14_n_0 ),
        .I4(\alu_out_q[31]_i_15_n_0 ),
        .I5(\alu_out_q[31]_i_16_n_0 ),
        .O(\alu_out_q[30]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF8A80)) 
    \alu_out_q[31]_i_1 
       (.I0(is_lui_auipc_jal_jalr_addi_add_sub),
        .I1(alu_out_q20_out[31]),
        .I2(instr_sub),
        .I3(alu_out_q22_out[31]),
        .I4(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[31]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[31]_i_10 
       (.I0(pcpi_rs1_OBUF[30]),
        .I1(pcpi_rs2_OBUF[30]),
        .O(\alu_out_q[31]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[31]_i_11 
       (.I0(pcpi_rs1_OBUF[29]),
        .I1(pcpi_rs2_OBUF[29]),
        .O(\alu_out_q[31]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[31]_i_12 
       (.I0(pcpi_rs1_OBUF[28]),
        .I1(pcpi_rs2_OBUF[28]),
        .O(\alu_out_q[31]_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \alu_out_q[31]_i_13 
       (.I0(instr_xor),
        .I1(instr_xori),
        .O(\alu_out_q[31]_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \alu_out_q[31]_i_14 
       (.I0(instr_and),
        .I1(instr_andi),
        .O(\alu_out_q[31]_i_14_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \alu_out_q[31]_i_15 
       (.I0(instr_or),
        .I1(instr_ori),
        .O(\alu_out_q[31]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \alu_out_q[31]_i_16 
       (.I0(is_compare),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[31]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h0686E6E600000000)) 
    \alu_out_q[31]_i_4 
       (.I0(pcpi_rs2_OBUF[31]),
        .I1(pcpi_rs1_OBUF[31]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_14_n_0 ),
        .I4(\alu_out_q[31]_i_15_n_0 ),
        .I5(\alu_out_q[31]_i_16_n_0 ),
        .O(\alu_out_q[31]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[31]_i_5 
       (.I0(pcpi_rs2_OBUF[31]),
        .I1(pcpi_rs1_OBUF[31]),
        .O(\alu_out_q[31]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[31]_i_6 
       (.I0(pcpi_rs2_OBUF[30]),
        .I1(pcpi_rs1_OBUF[30]),
        .O(\alu_out_q[31]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[31]_i_7 
       (.I0(pcpi_rs2_OBUF[29]),
        .I1(pcpi_rs1_OBUF[29]),
        .O(\alu_out_q[31]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[31]_i_8 
       (.I0(pcpi_rs2_OBUF[28]),
        .I1(pcpi_rs1_OBUF[28]),
        .O(\alu_out_q[31]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[31]_i_9 
       (.I0(pcpi_rs1_OBUF[31]),
        .I1(pcpi_rs2_OBUF[31]),
        .O(\alu_out_q[31]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[3]_i_1 
       (.I0(alu_out_q20_out[3]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[3]),
        .I3(\alu_out_q[3]_i_4_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[3]_i_10 
       (.I0(pcpi_rs1_OBUF[2]),
        .I1(pcpi_rs2_OBUF[2]),
        .O(\alu_out_q[3]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[3]_i_11 
       (.I0(pcpi_rs1_OBUF[1]),
        .I1(pcpi_rs2_OBUF[1]),
        .O(\alu_out_q[3]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[3]_i_12 
       (.I0(pcpi_rs1_OBUF[0]),
        .I1(pcpi_rs2_OBUF[0]),
        .O(\alu_out_q[3]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[3]_i_4 
       (.I0(pcpi_rs2_OBUF[3]),
        .I1(pcpi_rs1_OBUF[3]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[3]_i_5 
       (.I0(pcpi_rs2_OBUF[3]),
        .I1(pcpi_rs1_OBUF[3]),
        .O(\alu_out_q[3]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[3]_i_6 
       (.I0(pcpi_rs2_OBUF[2]),
        .I1(pcpi_rs1_OBUF[2]),
        .O(\alu_out_q[3]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[3]_i_7 
       (.I0(pcpi_rs2_OBUF[1]),
        .I1(pcpi_rs1_OBUF[1]),
        .O(\alu_out_q[3]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[3]_i_8 
       (.I0(pcpi_rs2_OBUF[0]),
        .I1(pcpi_rs1_OBUF[0]),
        .O(\alu_out_q[3]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[3]_i_9 
       (.I0(pcpi_rs1_OBUF[3]),
        .I1(pcpi_rs2_OBUF[3]),
        .O(\alu_out_q[3]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[4]_i_1 
       (.I0(alu_out_q20_out[4]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[4]),
        .I3(\alu_out_q[4]_i_2_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[4]_i_2 
       (.I0(pcpi_rs2_OBUF[4]),
        .I1(pcpi_rs1_OBUF[4]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[5]_i_1 
       (.I0(alu_out_q20_out[5]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[5]),
        .I3(\alu_out_q[5]_i_2_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[5]_i_2 
       (.I0(pcpi_rs2_OBUF[5]),
        .I1(pcpi_rs1_OBUF[5]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[6]_i_1 
       (.I0(alu_out_q20_out[6]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[6]),
        .I3(\alu_out_q[6]_i_2_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[6]_i_2 
       (.I0(pcpi_rs2_OBUF[6]),
        .I1(pcpi_rs1_OBUF[6]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[7]_i_1 
       (.I0(alu_out_q20_out[7]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[7]),
        .I3(\alu_out_q[7]_i_4_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[7]_i_10 
       (.I0(pcpi_rs1_OBUF[6]),
        .I1(pcpi_rs2_OBUF[6]),
        .O(\alu_out_q[7]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[7]_i_11 
       (.I0(pcpi_rs1_OBUF[5]),
        .I1(pcpi_rs2_OBUF[5]),
        .O(\alu_out_q[7]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[7]_i_12 
       (.I0(pcpi_rs1_OBUF[4]),
        .I1(pcpi_rs2_OBUF[4]),
        .O(\alu_out_q[7]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[7]_i_4 
       (.I0(pcpi_rs2_OBUF[7]),
        .I1(pcpi_rs1_OBUF[7]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[7]_i_5 
       (.I0(pcpi_rs2_OBUF[7]),
        .I1(pcpi_rs1_OBUF[7]),
        .O(\alu_out_q[7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[7]_i_6 
       (.I0(pcpi_rs2_OBUF[6]),
        .I1(pcpi_rs1_OBUF[6]),
        .O(\alu_out_q[7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[7]_i_7 
       (.I0(pcpi_rs2_OBUF[5]),
        .I1(pcpi_rs1_OBUF[5]),
        .O(\alu_out_q[7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \alu_out_q[7]_i_8 
       (.I0(pcpi_rs2_OBUF[4]),
        .I1(pcpi_rs1_OBUF[4]),
        .O(\alu_out_q[7]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \alu_out_q[7]_i_9 
       (.I0(pcpi_rs1_OBUF[7]),
        .I1(pcpi_rs2_OBUF[7]),
        .O(\alu_out_q[7]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[8]_i_1 
       (.I0(alu_out_q20_out[8]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[8]),
        .I3(\alu_out_q[8]_i_2_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[8]_i_2 
       (.I0(pcpi_rs2_OBUF[8]),
        .I1(pcpi_rs1_OBUF[8]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8000000FF)) 
    \alu_out_q[9]_i_1 
       (.I0(alu_out_q20_out[9]),
        .I1(instr_sub),
        .I2(alu_out_q22_out[9]),
        .I3(\alu_out_q[9]_i_2_n_0 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h791979197919F919)) 
    \alu_out_q[9]_i_2 
       (.I0(pcpi_rs2_OBUF[9]),
        .I1(pcpi_rs1_OBUF[9]),
        .I2(\alu_out_q[31]_i_13_n_0 ),
        .I3(\alu_out_q[31]_i_15_n_0 ),
        .I4(instr_and),
        .I5(instr_andi),
        .O(\alu_out_q[9]_i_2_n_0 ));
  FDRE \alu_out_q_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[0]_i_1_n_0 ),
        .Q(alu_out_q[0]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[10]_i_1_n_0 ),
        .Q(alu_out_q[10]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[11]_i_1_n_0 ),
        .Q(alu_out_q[11]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[11]_i_2 
       (.CI(\alu_out_q_reg[7]_i_2_n_0 ),
        .CO({\alu_out_q_reg[11]_i_2_n_0 ,\NLW_alu_out_q_reg[11]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[11:8]),
        .O(alu_out_q20_out[11:8]),
        .S({\alu_out_q[11]_i_5_n_0 ,\alu_out_q[11]_i_6_n_0 ,\alu_out_q[11]_i_7_n_0 ,\alu_out_q[11]_i_8_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[11]_i_3 
       (.CI(\alu_out_q_reg[7]_i_3_n_0 ),
        .CO({\alu_out_q_reg[11]_i_3_n_0 ,\NLW_alu_out_q_reg[11]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[11:8]),
        .O(alu_out_q22_out[11:8]),
        .S({\alu_out_q[11]_i_9_n_0 ,\alu_out_q[11]_i_10_n_0 ,\alu_out_q[11]_i_11_n_0 ,\alu_out_q[11]_i_12_n_0 }));
  FDRE \alu_out_q_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[12]_i_1_n_0 ),
        .Q(alu_out_q[12]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[13]_i_1_n_0 ),
        .Q(alu_out_q[13]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[14]_i_1_n_0 ),
        .Q(alu_out_q[14]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[15]_i_1_n_0 ),
        .Q(alu_out_q[15]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[15]_i_3 
       (.CI(\alu_out_q_reg[11]_i_2_n_0 ),
        .CO({\alu_out_q_reg[15]_i_3_n_0 ,\NLW_alu_out_q_reg[15]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[15:12]),
        .O(alu_out_q20_out[15:12]),
        .S({\alu_out_q[15]_i_5_n_0 ,\alu_out_q[15]_i_6_n_0 ,\alu_out_q[15]_i_7_n_0 ,\alu_out_q[15]_i_8_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[15]_i_4 
       (.CI(\alu_out_q_reg[11]_i_3_n_0 ),
        .CO({\alu_out_q_reg[15]_i_4_n_0 ,\NLW_alu_out_q_reg[15]_i_4_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[15:12]),
        .O(alu_out_q22_out[15:12]),
        .S({\alu_out_q[15]_i_9_n_0 ,\alu_out_q[15]_i_10_n_0 ,\alu_out_q[15]_i_11_n_0 ,\alu_out_q[15]_i_12_n_0 }));
  FDRE \alu_out_q_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[16]_i_1_n_0 ),
        .Q(alu_out_q[16]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[17]_i_1_n_0 ),
        .Q(alu_out_q[17]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[18]_i_1_n_0 ),
        .Q(alu_out_q[18]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[19]_i_1_n_0 ),
        .Q(alu_out_q[19]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[19]_i_2 
       (.CI(\alu_out_q_reg[15]_i_3_n_0 ),
        .CO({\alu_out_q_reg[19]_i_2_n_0 ,\NLW_alu_out_q_reg[19]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[19:16]),
        .O(alu_out_q20_out[19:16]),
        .S({\alu_out_q[19]_i_5_n_0 ,\alu_out_q[19]_i_6_n_0 ,\alu_out_q[19]_i_7_n_0 ,\alu_out_q[19]_i_8_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[19]_i_3 
       (.CI(\alu_out_q_reg[15]_i_4_n_0 ),
        .CO({\alu_out_q_reg[19]_i_3_n_0 ,\NLW_alu_out_q_reg[19]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[19:16]),
        .O(alu_out_q22_out[19:16]),
        .S({\alu_out_q[19]_i_9_n_0 ,\alu_out_q[19]_i_10_n_0 ,\alu_out_q[19]_i_11_n_0 ,\alu_out_q[19]_i_12_n_0 }));
  FDRE \alu_out_q_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[1]_i_1_n_0 ),
        .Q(alu_out_q[1]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[20]_i_1_n_0 ),
        .Q(alu_out_q[20]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[21]_i_1_n_0 ),
        .Q(alu_out_q[21]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[22]_i_1_n_0 ),
        .Q(alu_out_q[22]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[23]_i_1_n_0 ),
        .Q(alu_out_q[23]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[23]_i_2 
       (.CI(\alu_out_q_reg[19]_i_2_n_0 ),
        .CO({\alu_out_q_reg[23]_i_2_n_0 ,\NLW_alu_out_q_reg[23]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[23:20]),
        .O(alu_out_q20_out[23:20]),
        .S({\alu_out_q[23]_i_5_n_0 ,\alu_out_q[23]_i_6_n_0 ,\alu_out_q[23]_i_7_n_0 ,\alu_out_q[23]_i_8_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[23]_i_3 
       (.CI(\alu_out_q_reg[19]_i_3_n_0 ),
        .CO({\alu_out_q_reg[23]_i_3_n_0 ,\NLW_alu_out_q_reg[23]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[23:20]),
        .O(alu_out_q22_out[23:20]),
        .S({\alu_out_q[23]_i_9_n_0 ,\alu_out_q[23]_i_10_n_0 ,\alu_out_q[23]_i_11_n_0 ,\alu_out_q[23]_i_12_n_0 }));
  FDRE \alu_out_q_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[24]_i_1_n_0 ),
        .Q(alu_out_q[24]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[25]_i_1_n_0 ),
        .Q(alu_out_q[25]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[26]_i_1_n_0 ),
        .Q(alu_out_q[26]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[27]_i_1_n_0 ),
        .Q(alu_out_q[27]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[27]_i_2 
       (.CI(\alu_out_q_reg[23]_i_2_n_0 ),
        .CO({\alu_out_q_reg[27]_i_2_n_0 ,\NLW_alu_out_q_reg[27]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[27:24]),
        .O(alu_out_q20_out[27:24]),
        .S({\alu_out_q[27]_i_5_n_0 ,\alu_out_q[27]_i_6_n_0 ,\alu_out_q[27]_i_7_n_0 ,\alu_out_q[27]_i_8_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[27]_i_3 
       (.CI(\alu_out_q_reg[23]_i_3_n_0 ),
        .CO({\alu_out_q_reg[27]_i_3_n_0 ,\NLW_alu_out_q_reg[27]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[27:24]),
        .O(alu_out_q22_out[27:24]),
        .S({\alu_out_q[27]_i_9_n_0 ,\alu_out_q[27]_i_10_n_0 ,\alu_out_q[27]_i_11_n_0 ,\alu_out_q[27]_i_12_n_0 }));
  FDRE \alu_out_q_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[28]_i_1_n_0 ),
        .Q(alu_out_q[28]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[29]_i_1_n_0 ),
        .Q(alu_out_q[29]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[2]_i_1_n_0 ),
        .Q(alu_out_q[2]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[30]_i_1_n_0 ),
        .Q(alu_out_q[30]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[31]_i_1_n_0 ),
        .Q(alu_out_q[31]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[31]_i_2 
       (.CI(\alu_out_q_reg[27]_i_2_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,pcpi_rs1_OBUF[30:28]}),
        .O(alu_out_q20_out[31:28]),
        .S({\alu_out_q[31]_i_5_n_0 ,\alu_out_q[31]_i_6_n_0 ,\alu_out_q[31]_i_7_n_0 ,\alu_out_q[31]_i_8_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[31]_i_3 
       (.CI(\alu_out_q_reg[27]_i_3_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,pcpi_rs1_OBUF[30:28]}),
        .O(alu_out_q22_out[31:28]),
        .S({\alu_out_q[31]_i_9_n_0 ,\alu_out_q[31]_i_10_n_0 ,\alu_out_q[31]_i_11_n_0 ,\alu_out_q[31]_i_12_n_0 }));
  FDRE \alu_out_q_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[3]_i_1_n_0 ),
        .Q(alu_out_q[3]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[3]_i_2 
       (.CI(\<const0> ),
        .CO({\alu_out_q_reg[3]_i_2_n_0 ,\NLW_alu_out_q_reg[3]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const1> ),
        .DI(pcpi_rs1_OBUF[3:0]),
        .O(alu_out_q20_out[3:0]),
        .S({\alu_out_q[3]_i_5_n_0 ,\alu_out_q[3]_i_6_n_0 ,\alu_out_q[3]_i_7_n_0 ,\alu_out_q[3]_i_8_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[3]_i_3 
       (.CI(\<const0> ),
        .CO({\alu_out_q_reg[3]_i_3_n_0 ,\NLW_alu_out_q_reg[3]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[3:0]),
        .O(alu_out_q22_out[3:0]),
        .S({\alu_out_q[3]_i_9_n_0 ,\alu_out_q[3]_i_10_n_0 ,\alu_out_q[3]_i_11_n_0 ,\alu_out_q[3]_i_12_n_0 }));
  FDRE \alu_out_q_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[4]_i_1_n_0 ),
        .Q(alu_out_q[4]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[5]_i_1_n_0 ),
        .Q(alu_out_q[5]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[6]_i_1_n_0 ),
        .Q(alu_out_q[6]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[7]_i_1_n_0 ),
        .Q(alu_out_q[7]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[7]_i_2 
       (.CI(\alu_out_q_reg[3]_i_2_n_0 ),
        .CO({\alu_out_q_reg[7]_i_2_n_0 ,\NLW_alu_out_q_reg[7]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[7:4]),
        .O(alu_out_q20_out[7:4]),
        .S({\alu_out_q[7]_i_5_n_0 ,\alu_out_q[7]_i_6_n_0 ,\alu_out_q[7]_i_7_n_0 ,\alu_out_q[7]_i_8_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[7]_i_3 
       (.CI(\alu_out_q_reg[3]_i_3_n_0 ),
        .CO({\alu_out_q_reg[7]_i_3_n_0 ,\NLW_alu_out_q_reg[7]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[7:4]),
        .O(alu_out_q22_out[7:4]),
        .S({\alu_out_q[7]_i_9_n_0 ,\alu_out_q[7]_i_10_n_0 ,\alu_out_q[7]_i_11_n_0 ,\alu_out_q[7]_i_12_n_0 }));
  FDRE \alu_out_q_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[8]_i_1_n_0 ),
        .Q(alu_out_q[8]),
        .R(\<const0> ));
  FDRE \alu_out_q_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[9]_i_1_n_0 ),
        .Q(alu_out_q[9]),
        .R(\<const0> ));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  LUT1 #(
    .INIT(2'h1)) 
    \count_cycle[0]_i_1 
       (.I0(count_cycle[0]),
        .O(\count_cycle[0]_i_1_n_0 ));
  FDRE \count_cycle_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle[0]_i_1_n_0 ),
        .Q(count_cycle[0]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[12]_i_1_n_6 ),
        .Q(count_cycle[10]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[12]_i_1_n_5 ),
        .Q(count_cycle[11]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[12]_i_1_n_4 ),
        .Q(count_cycle[12]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[12]_i_1 
       (.CI(\count_cycle_reg[8]_i_1_n_0 ),
        .CO({\count_cycle_reg[12]_i_1_n_0 ,\NLW_count_cycle_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[12]_i_1_n_4 ,\count_cycle_reg[12]_i_1_n_5 ,\count_cycle_reg[12]_i_1_n_6 ,\count_cycle_reg[12]_i_1_n_7 }),
        .S(count_cycle[12:9]));
  FDRE \count_cycle_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[16]_i_1_n_7 ),
        .Q(count_cycle[13]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[16]_i_1_n_6 ),
        .Q(count_cycle[14]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[16]_i_1_n_5 ),
        .Q(count_cycle[15]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[16]_i_1_n_4 ),
        .Q(count_cycle[16]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[16]_i_1 
       (.CI(\count_cycle_reg[12]_i_1_n_0 ),
        .CO({\count_cycle_reg[16]_i_1_n_0 ,\NLW_count_cycle_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[16]_i_1_n_4 ,\count_cycle_reg[16]_i_1_n_5 ,\count_cycle_reg[16]_i_1_n_6 ,\count_cycle_reg[16]_i_1_n_7 }),
        .S(count_cycle[16:13]));
  FDRE \count_cycle_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[20]_i_1_n_7 ),
        .Q(count_cycle[17]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[20]_i_1_n_6 ),
        .Q(count_cycle[18]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[20]_i_1_n_5 ),
        .Q(count_cycle[19]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[4]_i_1_n_7 ),
        .Q(count_cycle[1]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[20]_i_1_n_4 ),
        .Q(count_cycle[20]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[20]_i_1 
       (.CI(\count_cycle_reg[16]_i_1_n_0 ),
        .CO({\count_cycle_reg[20]_i_1_n_0 ,\NLW_count_cycle_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[20]_i_1_n_4 ,\count_cycle_reg[20]_i_1_n_5 ,\count_cycle_reg[20]_i_1_n_6 ,\count_cycle_reg[20]_i_1_n_7 }),
        .S(count_cycle[20:17]));
  FDRE \count_cycle_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[24]_i_1_n_7 ),
        .Q(count_cycle[21]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[24]_i_1_n_6 ),
        .Q(count_cycle[22]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[24]_i_1_n_5 ),
        .Q(count_cycle[23]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[24]_i_1_n_4 ),
        .Q(count_cycle[24]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[24]_i_1 
       (.CI(\count_cycle_reg[20]_i_1_n_0 ),
        .CO({\count_cycle_reg[24]_i_1_n_0 ,\NLW_count_cycle_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[24]_i_1_n_4 ,\count_cycle_reg[24]_i_1_n_5 ,\count_cycle_reg[24]_i_1_n_6 ,\count_cycle_reg[24]_i_1_n_7 }),
        .S(count_cycle[24:21]));
  FDRE \count_cycle_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[28]_i_1_n_7 ),
        .Q(count_cycle[25]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[28]_i_1_n_6 ),
        .Q(count_cycle[26]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[28]_i_1_n_5 ),
        .Q(count_cycle[27]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[28]_i_1_n_4 ),
        .Q(count_cycle[28]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[28]_i_1 
       (.CI(\count_cycle_reg[24]_i_1_n_0 ),
        .CO({\count_cycle_reg[28]_i_1_n_0 ,\NLW_count_cycle_reg[28]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[28]_i_1_n_4 ,\count_cycle_reg[28]_i_1_n_5 ,\count_cycle_reg[28]_i_1_n_6 ,\count_cycle_reg[28]_i_1_n_7 }),
        .S(count_cycle[28:25]));
  FDRE \count_cycle_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[32]_i_1_n_7 ),
        .Q(count_cycle[29]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[4]_i_1_n_6 ),
        .Q(count_cycle[2]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[32]_i_1_n_6 ),
        .Q(count_cycle[30]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[32]_i_1_n_5 ),
        .Q(count_cycle[31]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[32] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[32]_i_1_n_4 ),
        .Q(count_cycle[32]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[32]_i_1 
       (.CI(\count_cycle_reg[28]_i_1_n_0 ),
        .CO({\count_cycle_reg[32]_i_1_n_0 ,\NLW_count_cycle_reg[32]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[32]_i_1_n_4 ,\count_cycle_reg[32]_i_1_n_5 ,\count_cycle_reg[32]_i_1_n_6 ,\count_cycle_reg[32]_i_1_n_7 }),
        .S(count_cycle[32:29]));
  FDRE \count_cycle_reg[33] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[36]_i_1_n_7 ),
        .Q(count_cycle[33]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[34] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[36]_i_1_n_6 ),
        .Q(count_cycle[34]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[35] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[36]_i_1_n_5 ),
        .Q(count_cycle[35]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[36] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[36]_i_1_n_4 ),
        .Q(count_cycle[36]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[36]_i_1 
       (.CI(\count_cycle_reg[32]_i_1_n_0 ),
        .CO({\count_cycle_reg[36]_i_1_n_0 ,\NLW_count_cycle_reg[36]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[36]_i_1_n_4 ,\count_cycle_reg[36]_i_1_n_5 ,\count_cycle_reg[36]_i_1_n_6 ,\count_cycle_reg[36]_i_1_n_7 }),
        .S(count_cycle[36:33]));
  FDRE \count_cycle_reg[37] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[40]_i_1_n_7 ),
        .Q(count_cycle[37]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[38] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[40]_i_1_n_6 ),
        .Q(count_cycle[38]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[39] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[40]_i_1_n_5 ),
        .Q(count_cycle[39]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[4]_i_1_n_5 ),
        .Q(count_cycle[3]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[40] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[40]_i_1_n_4 ),
        .Q(count_cycle[40]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[40]_i_1 
       (.CI(\count_cycle_reg[36]_i_1_n_0 ),
        .CO({\count_cycle_reg[40]_i_1_n_0 ,\NLW_count_cycle_reg[40]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[40]_i_1_n_4 ,\count_cycle_reg[40]_i_1_n_5 ,\count_cycle_reg[40]_i_1_n_6 ,\count_cycle_reg[40]_i_1_n_7 }),
        .S(count_cycle[40:37]));
  FDRE \count_cycle_reg[41] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[44]_i_1_n_7 ),
        .Q(count_cycle[41]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[42] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[44]_i_1_n_6 ),
        .Q(count_cycle[42]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[43] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[44]_i_1_n_5 ),
        .Q(count_cycle[43]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[44] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[44]_i_1_n_4 ),
        .Q(count_cycle[44]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[44]_i_1 
       (.CI(\count_cycle_reg[40]_i_1_n_0 ),
        .CO({\count_cycle_reg[44]_i_1_n_0 ,\NLW_count_cycle_reg[44]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[44]_i_1_n_4 ,\count_cycle_reg[44]_i_1_n_5 ,\count_cycle_reg[44]_i_1_n_6 ,\count_cycle_reg[44]_i_1_n_7 }),
        .S(count_cycle[44:41]));
  FDRE \count_cycle_reg[45] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[48]_i_1_n_7 ),
        .Q(count_cycle[45]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[46] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[48]_i_1_n_6 ),
        .Q(count_cycle[46]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[47] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[48]_i_1_n_5 ),
        .Q(count_cycle[47]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[48] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[48]_i_1_n_4 ),
        .Q(count_cycle[48]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[48]_i_1 
       (.CI(\count_cycle_reg[44]_i_1_n_0 ),
        .CO({\count_cycle_reg[48]_i_1_n_0 ,\NLW_count_cycle_reg[48]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[48]_i_1_n_4 ,\count_cycle_reg[48]_i_1_n_5 ,\count_cycle_reg[48]_i_1_n_6 ,\count_cycle_reg[48]_i_1_n_7 }),
        .S(count_cycle[48:45]));
  FDRE \count_cycle_reg[49] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[52]_i_1_n_7 ),
        .Q(count_cycle[49]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[4]_i_1_n_4 ),
        .Q(count_cycle[4]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[4]_i_1 
       (.CI(\<const0> ),
        .CO({\count_cycle_reg[4]_i_1_n_0 ,\NLW_count_cycle_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(count_cycle[0]),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[4]_i_1_n_4 ,\count_cycle_reg[4]_i_1_n_5 ,\count_cycle_reg[4]_i_1_n_6 ,\count_cycle_reg[4]_i_1_n_7 }),
        .S(count_cycle[4:1]));
  FDRE \count_cycle_reg[50] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[52]_i_1_n_6 ),
        .Q(count_cycle[50]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[51] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[52]_i_1_n_5 ),
        .Q(count_cycle[51]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[52] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[52]_i_1_n_4 ),
        .Q(count_cycle[52]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[52]_i_1 
       (.CI(\count_cycle_reg[48]_i_1_n_0 ),
        .CO({\count_cycle_reg[52]_i_1_n_0 ,\NLW_count_cycle_reg[52]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[52]_i_1_n_4 ,\count_cycle_reg[52]_i_1_n_5 ,\count_cycle_reg[52]_i_1_n_6 ,\count_cycle_reg[52]_i_1_n_7 }),
        .S(count_cycle[52:49]));
  FDRE \count_cycle_reg[53] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[56]_i_1_n_7 ),
        .Q(count_cycle[53]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[54] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[56]_i_1_n_6 ),
        .Q(count_cycle[54]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[55] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[56]_i_1_n_5 ),
        .Q(count_cycle[55]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[56] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[56]_i_1_n_4 ),
        .Q(count_cycle[56]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[56]_i_1 
       (.CI(\count_cycle_reg[52]_i_1_n_0 ),
        .CO({\count_cycle_reg[56]_i_1_n_0 ,\NLW_count_cycle_reg[56]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[56]_i_1_n_4 ,\count_cycle_reg[56]_i_1_n_5 ,\count_cycle_reg[56]_i_1_n_6 ,\count_cycle_reg[56]_i_1_n_7 }),
        .S(count_cycle[56:53]));
  FDRE \count_cycle_reg[57] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[60]_i_1_n_7 ),
        .Q(count_cycle[57]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[58] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[60]_i_1_n_6 ),
        .Q(count_cycle[58]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[59] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[60]_i_1_n_5 ),
        .Q(count_cycle[59]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[8]_i_1_n_7 ),
        .Q(count_cycle[5]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[60] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[60]_i_1_n_4 ),
        .Q(count_cycle[60]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[60]_i_1 
       (.CI(\count_cycle_reg[56]_i_1_n_0 ),
        .CO({\count_cycle_reg[60]_i_1_n_0 ,\NLW_count_cycle_reg[60]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[60]_i_1_n_4 ,\count_cycle_reg[60]_i_1_n_5 ,\count_cycle_reg[60]_i_1_n_6 ,\count_cycle_reg[60]_i_1_n_7 }),
        .S(count_cycle[60:57]));
  FDRE \count_cycle_reg[61] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[63]_i_1_n_7 ),
        .Q(count_cycle[61]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[62] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[63]_i_1_n_6 ),
        .Q(count_cycle[62]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[63] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[63]_i_1_n_5 ),
        .Q(count_cycle[63]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[63]_i_1 
       (.CI(\count_cycle_reg[60]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[63]_i_1_n_5 ,\count_cycle_reg[63]_i_1_n_6 ,\count_cycle_reg[63]_i_1_n_7 }),
        .S({\<const0> ,count_cycle[63:61]}));
  FDRE \count_cycle_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[8]_i_1_n_6 ),
        .Q(count_cycle[6]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[8]_i_1_n_5 ),
        .Q(count_cycle[7]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[8]_i_1_n_4 ),
        .Q(count_cycle[8]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[8]_i_1 
       (.CI(\count_cycle_reg[4]_i_1_n_0 ),
        .CO({\count_cycle_reg[8]_i_1_n_0 ,\NLW_count_cycle_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[8]_i_1_n_4 ,\count_cycle_reg[8]_i_1_n_5 ,\count_cycle_reg[8]_i_1_n_6 ,\count_cycle_reg[8]_i_1_n_7 }),
        .S(count_cycle[8:5]));
  FDRE \count_cycle_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[12]_i_1_n_7 ),
        .Q(count_cycle[9]),
        .R(instr_and_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \count_instr[0]_i_1 
       (.I0(\count_instr_reg_n_0_[0] ),
        .O(\count_instr[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \count_instr[63]_i_1 
       (.I0(decoder_trigger_reg_n_0),
        .I1(reg_next_pc),
        .O(count_instr));
  FDRE \count_instr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr[0]_i_1_n_0 ),
        .Q(\count_instr_reg_n_0_[0] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[12]_i_1_n_6 ),
        .Q(\count_instr_reg_n_0_[10] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[12]_i_1_n_5 ),
        .Q(\count_instr_reg_n_0_[11] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[12]_i_1_n_4 ),
        .Q(\count_instr_reg_n_0_[12] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[12]_i_1 
       (.CI(\count_instr_reg[8]_i_1_n_0 ),
        .CO({\count_instr_reg[12]_i_1_n_0 ,\NLW_count_instr_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[12]_i_1_n_4 ,\count_instr_reg[12]_i_1_n_5 ,\count_instr_reg[12]_i_1_n_6 ,\count_instr_reg[12]_i_1_n_7 }),
        .S({\count_instr_reg_n_0_[12] ,\count_instr_reg_n_0_[11] ,\count_instr_reg_n_0_[10] ,\count_instr_reg_n_0_[9] }));
  FDRE \count_instr_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[16]_i_1_n_7 ),
        .Q(\count_instr_reg_n_0_[13] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[16]_i_1_n_6 ),
        .Q(\count_instr_reg_n_0_[14] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[16]_i_1_n_5 ),
        .Q(\count_instr_reg_n_0_[15] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[16]_i_1_n_4 ),
        .Q(\count_instr_reg_n_0_[16] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[16]_i_1 
       (.CI(\count_instr_reg[12]_i_1_n_0 ),
        .CO({\count_instr_reg[16]_i_1_n_0 ,\NLW_count_instr_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[16]_i_1_n_4 ,\count_instr_reg[16]_i_1_n_5 ,\count_instr_reg[16]_i_1_n_6 ,\count_instr_reg[16]_i_1_n_7 }),
        .S({\count_instr_reg_n_0_[16] ,\count_instr_reg_n_0_[15] ,\count_instr_reg_n_0_[14] ,\count_instr_reg_n_0_[13] }));
  FDRE \count_instr_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[20]_i_1_n_7 ),
        .Q(\count_instr_reg_n_0_[17] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[20]_i_1_n_6 ),
        .Q(\count_instr_reg_n_0_[18] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[20]_i_1_n_5 ),
        .Q(\count_instr_reg_n_0_[19] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[4]_i_1_n_7 ),
        .Q(\count_instr_reg_n_0_[1] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[20]_i_1_n_4 ),
        .Q(\count_instr_reg_n_0_[20] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[20]_i_1 
       (.CI(\count_instr_reg[16]_i_1_n_0 ),
        .CO({\count_instr_reg[20]_i_1_n_0 ,\NLW_count_instr_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[20]_i_1_n_4 ,\count_instr_reg[20]_i_1_n_5 ,\count_instr_reg[20]_i_1_n_6 ,\count_instr_reg[20]_i_1_n_7 }),
        .S({\count_instr_reg_n_0_[20] ,\count_instr_reg_n_0_[19] ,\count_instr_reg_n_0_[18] ,\count_instr_reg_n_0_[17] }));
  FDRE \count_instr_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[24]_i_1_n_7 ),
        .Q(\count_instr_reg_n_0_[21] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[24]_i_1_n_6 ),
        .Q(\count_instr_reg_n_0_[22] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[24]_i_1_n_5 ),
        .Q(\count_instr_reg_n_0_[23] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[24]_i_1_n_4 ),
        .Q(\count_instr_reg_n_0_[24] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[24]_i_1 
       (.CI(\count_instr_reg[20]_i_1_n_0 ),
        .CO({\count_instr_reg[24]_i_1_n_0 ,\NLW_count_instr_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[24]_i_1_n_4 ,\count_instr_reg[24]_i_1_n_5 ,\count_instr_reg[24]_i_1_n_6 ,\count_instr_reg[24]_i_1_n_7 }),
        .S({\count_instr_reg_n_0_[24] ,\count_instr_reg_n_0_[23] ,\count_instr_reg_n_0_[22] ,\count_instr_reg_n_0_[21] }));
  FDRE \count_instr_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[28]_i_1_n_7 ),
        .Q(\count_instr_reg_n_0_[25] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[28]_i_1_n_6 ),
        .Q(\count_instr_reg_n_0_[26] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[28]_i_1_n_5 ),
        .Q(\count_instr_reg_n_0_[27] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[28]_i_1_n_4 ),
        .Q(\count_instr_reg_n_0_[28] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[28]_i_1 
       (.CI(\count_instr_reg[24]_i_1_n_0 ),
        .CO({\count_instr_reg[28]_i_1_n_0 ,\NLW_count_instr_reg[28]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[28]_i_1_n_4 ,\count_instr_reg[28]_i_1_n_5 ,\count_instr_reg[28]_i_1_n_6 ,\count_instr_reg[28]_i_1_n_7 }),
        .S({\count_instr_reg_n_0_[28] ,\count_instr_reg_n_0_[27] ,\count_instr_reg_n_0_[26] ,\count_instr_reg_n_0_[25] }));
  FDRE \count_instr_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[32]_i_1_n_7 ),
        .Q(\count_instr_reg_n_0_[29] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[4]_i_1_n_6 ),
        .Q(\count_instr_reg_n_0_[2] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[32]_i_1_n_6 ),
        .Q(\count_instr_reg_n_0_[30] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[32]_i_1_n_5 ),
        .Q(\count_instr_reg_n_0_[31] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[32] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[32]_i_1_n_4 ),
        .Q(\count_instr_reg_n_0_[32] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[32]_i_1 
       (.CI(\count_instr_reg[28]_i_1_n_0 ),
        .CO({\count_instr_reg[32]_i_1_n_0 ,\NLW_count_instr_reg[32]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[32]_i_1_n_4 ,\count_instr_reg[32]_i_1_n_5 ,\count_instr_reg[32]_i_1_n_6 ,\count_instr_reg[32]_i_1_n_7 }),
        .S({\count_instr_reg_n_0_[32] ,\count_instr_reg_n_0_[31] ,\count_instr_reg_n_0_[30] ,\count_instr_reg_n_0_[29] }));
  FDRE \count_instr_reg[33] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[36]_i_1_n_7 ),
        .Q(\count_instr_reg_n_0_[33] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[34] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[36]_i_1_n_6 ),
        .Q(\count_instr_reg_n_0_[34] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[35] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[36]_i_1_n_5 ),
        .Q(\count_instr_reg_n_0_[35] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[36] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[36]_i_1_n_4 ),
        .Q(\count_instr_reg_n_0_[36] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[36]_i_1 
       (.CI(\count_instr_reg[32]_i_1_n_0 ),
        .CO({\count_instr_reg[36]_i_1_n_0 ,\NLW_count_instr_reg[36]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[36]_i_1_n_4 ,\count_instr_reg[36]_i_1_n_5 ,\count_instr_reg[36]_i_1_n_6 ,\count_instr_reg[36]_i_1_n_7 }),
        .S({\count_instr_reg_n_0_[36] ,\count_instr_reg_n_0_[35] ,\count_instr_reg_n_0_[34] ,\count_instr_reg_n_0_[33] }));
  FDRE \count_instr_reg[37] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[40]_i_1_n_7 ),
        .Q(\count_instr_reg_n_0_[37] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[38] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[40]_i_1_n_6 ),
        .Q(\count_instr_reg_n_0_[38] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[39] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[40]_i_1_n_5 ),
        .Q(\count_instr_reg_n_0_[39] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[4]_i_1_n_5 ),
        .Q(\count_instr_reg_n_0_[3] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[40] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[40]_i_1_n_4 ),
        .Q(\count_instr_reg_n_0_[40] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[40]_i_1 
       (.CI(\count_instr_reg[36]_i_1_n_0 ),
        .CO({\count_instr_reg[40]_i_1_n_0 ,\NLW_count_instr_reg[40]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[40]_i_1_n_4 ,\count_instr_reg[40]_i_1_n_5 ,\count_instr_reg[40]_i_1_n_6 ,\count_instr_reg[40]_i_1_n_7 }),
        .S({\count_instr_reg_n_0_[40] ,\count_instr_reg_n_0_[39] ,\count_instr_reg_n_0_[38] ,\count_instr_reg_n_0_[37] }));
  FDRE \count_instr_reg[41] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[44]_i_1_n_7 ),
        .Q(\count_instr_reg_n_0_[41] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[42] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[44]_i_1_n_6 ),
        .Q(\count_instr_reg_n_0_[42] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[43] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[44]_i_1_n_5 ),
        .Q(\count_instr_reg_n_0_[43] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[44] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[44]_i_1_n_4 ),
        .Q(\count_instr_reg_n_0_[44] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[44]_i_1 
       (.CI(\count_instr_reg[40]_i_1_n_0 ),
        .CO({\count_instr_reg[44]_i_1_n_0 ,\NLW_count_instr_reg[44]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[44]_i_1_n_4 ,\count_instr_reg[44]_i_1_n_5 ,\count_instr_reg[44]_i_1_n_6 ,\count_instr_reg[44]_i_1_n_7 }),
        .S({\count_instr_reg_n_0_[44] ,\count_instr_reg_n_0_[43] ,\count_instr_reg_n_0_[42] ,\count_instr_reg_n_0_[41] }));
  FDRE \count_instr_reg[45] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[48]_i_1_n_7 ),
        .Q(\count_instr_reg_n_0_[45] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[46] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[48]_i_1_n_6 ),
        .Q(\count_instr_reg_n_0_[46] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[47] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[48]_i_1_n_5 ),
        .Q(\count_instr_reg_n_0_[47] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[48] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[48]_i_1_n_4 ),
        .Q(\count_instr_reg_n_0_[48] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[48]_i_1 
       (.CI(\count_instr_reg[44]_i_1_n_0 ),
        .CO({\count_instr_reg[48]_i_1_n_0 ,\NLW_count_instr_reg[48]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[48]_i_1_n_4 ,\count_instr_reg[48]_i_1_n_5 ,\count_instr_reg[48]_i_1_n_6 ,\count_instr_reg[48]_i_1_n_7 }),
        .S({\count_instr_reg_n_0_[48] ,\count_instr_reg_n_0_[47] ,\count_instr_reg_n_0_[46] ,\count_instr_reg_n_0_[45] }));
  FDRE \count_instr_reg[49] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[52]_i_1_n_7 ),
        .Q(\count_instr_reg_n_0_[49] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[4]_i_1_n_4 ),
        .Q(\count_instr_reg_n_0_[4] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[4]_i_1 
       (.CI(\<const0> ),
        .CO({\count_instr_reg[4]_i_1_n_0 ,\NLW_count_instr_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\count_instr_reg_n_0_[0] ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[4]_i_1_n_4 ,\count_instr_reg[4]_i_1_n_5 ,\count_instr_reg[4]_i_1_n_6 ,\count_instr_reg[4]_i_1_n_7 }),
        .S({\count_instr_reg_n_0_[4] ,\count_instr_reg_n_0_[3] ,\count_instr_reg_n_0_[2] ,\count_instr_reg_n_0_[1] }));
  FDRE \count_instr_reg[50] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[52]_i_1_n_6 ),
        .Q(\count_instr_reg_n_0_[50] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[51] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[52]_i_1_n_5 ),
        .Q(\count_instr_reg_n_0_[51] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[52] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[52]_i_1_n_4 ),
        .Q(\count_instr_reg_n_0_[52] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[52]_i_1 
       (.CI(\count_instr_reg[48]_i_1_n_0 ),
        .CO({\count_instr_reg[52]_i_1_n_0 ,\NLW_count_instr_reg[52]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[52]_i_1_n_4 ,\count_instr_reg[52]_i_1_n_5 ,\count_instr_reg[52]_i_1_n_6 ,\count_instr_reg[52]_i_1_n_7 }),
        .S({\count_instr_reg_n_0_[52] ,\count_instr_reg_n_0_[51] ,\count_instr_reg_n_0_[50] ,\count_instr_reg_n_0_[49] }));
  FDRE \count_instr_reg[53] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[56]_i_1_n_7 ),
        .Q(\count_instr_reg_n_0_[53] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[54] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[56]_i_1_n_6 ),
        .Q(\count_instr_reg_n_0_[54] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[55] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[56]_i_1_n_5 ),
        .Q(\count_instr_reg_n_0_[55] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[56] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[56]_i_1_n_4 ),
        .Q(\count_instr_reg_n_0_[56] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[56]_i_1 
       (.CI(\count_instr_reg[52]_i_1_n_0 ),
        .CO({\count_instr_reg[56]_i_1_n_0 ,\NLW_count_instr_reg[56]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[56]_i_1_n_4 ,\count_instr_reg[56]_i_1_n_5 ,\count_instr_reg[56]_i_1_n_6 ,\count_instr_reg[56]_i_1_n_7 }),
        .S({\count_instr_reg_n_0_[56] ,\count_instr_reg_n_0_[55] ,\count_instr_reg_n_0_[54] ,\count_instr_reg_n_0_[53] }));
  FDRE \count_instr_reg[57] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[60]_i_1_n_7 ),
        .Q(\count_instr_reg_n_0_[57] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[58] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[60]_i_1_n_6 ),
        .Q(\count_instr_reg_n_0_[58] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[59] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[60]_i_1_n_5 ),
        .Q(\count_instr_reg_n_0_[59] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[8]_i_1_n_7 ),
        .Q(\count_instr_reg_n_0_[5] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[60] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[60]_i_1_n_4 ),
        .Q(\count_instr_reg_n_0_[60] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[60]_i_1 
       (.CI(\count_instr_reg[56]_i_1_n_0 ),
        .CO({\count_instr_reg[60]_i_1_n_0 ,\NLW_count_instr_reg[60]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[60]_i_1_n_4 ,\count_instr_reg[60]_i_1_n_5 ,\count_instr_reg[60]_i_1_n_6 ,\count_instr_reg[60]_i_1_n_7 }),
        .S({\count_instr_reg_n_0_[60] ,\count_instr_reg_n_0_[59] ,\count_instr_reg_n_0_[58] ,\count_instr_reg_n_0_[57] }));
  FDRE \count_instr_reg[61] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[63]_i_2_n_7 ),
        .Q(\count_instr_reg_n_0_[61] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[62] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[63]_i_2_n_6 ),
        .Q(\count_instr_reg_n_0_[62] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[63] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[63]_i_2_n_5 ),
        .Q(\count_instr_reg_n_0_[63] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[63]_i_2 
       (.CI(\count_instr_reg[60]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[63]_i_2_n_5 ,\count_instr_reg[63]_i_2_n_6 ,\count_instr_reg[63]_i_2_n_7 }),
        .S({\<const0> ,\count_instr_reg_n_0_[63] ,\count_instr_reg_n_0_[62] ,\count_instr_reg_n_0_[61] }));
  FDRE \count_instr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[8]_i_1_n_6 ),
        .Q(\count_instr_reg_n_0_[6] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[8]_i_1_n_5 ),
        .Q(\count_instr_reg_n_0_[7] ),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[8]_i_1_n_4 ),
        .Q(\count_instr_reg_n_0_[8] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[8]_i_1 
       (.CI(\count_instr_reg[4]_i_1_n_0 ),
        .CO({\count_instr_reg[8]_i_1_n_0 ,\NLW_count_instr_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[8]_i_1_n_4 ,\count_instr_reg[8]_i_1_n_5 ,\count_instr_reg[8]_i_1_n_6 ,\count_instr_reg[8]_i_1_n_7 }),
        .S({\count_instr_reg_n_0_[8] ,\count_instr_reg_n_0_[7] ,\count_instr_reg_n_0_[6] ,\count_instr_reg_n_0_[5] }));
  FDRE \count_instr_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[12]_i_1_n_7 ),
        .Q(\count_instr_reg_n_0_[9] ),
        .R(instr_and_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \cpu_state[0]_i_1 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(resetn_IBUF),
        .I2(is_lui_auipc_jal),
        .I3(\cpu_state[6]_i_2_n_0 ),
        .I4(\cpu_state[7]_i_7_n_0 ),
        .I5(is_lb_lh_lw_lbu_lhu),
        .O(cpu_state0_out[0]));
  LUT6 #(
    .INIT(64'h0000000001000000)) 
    \cpu_state[1]_i_1 
       (.I0(is_slli_srli_srai),
        .I1(\cpu_state[1]_i_2_n_0 ),
        .I2(is_lb_lh_lw_lbu_lhu),
        .I3(\reg_op2[31]_i_1_n_0 ),
        .I4(\cpu_state[1]_i_3_n_0 ),
        .I5(\cpu_state[7]_i_7_n_0 ),
        .O(cpu_state0_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \cpu_state[1]_i_2 
       (.I0(is_lui_auipc_jal),
        .I1(instr_rdcycle),
        .I2(instr_rdcycleh),
        .I3(instr_rdinstr),
        .I4(instr_rdinstrh),
        .O(\cpu_state[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cpu_state[1]_i_3 
       (.I0(is_sb_sh_sw),
        .I1(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\cpu_state[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    \cpu_state[2]_i_1 
       (.I0(is_lui_auipc_jal),
        .I1(\cpu_state[2]_i_2_n_0 ),
        .I2(is_lb_lh_lw_lbu_lhu),
        .I3(\reg_op2[31]_i_1_n_0 ),
        .I4(\cpu_state[7]_i_7_n_0 ),
        .I5(\cpu_state[6]_i_2_n_0 ),
        .O(cpu_state0_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'h45)) 
    \cpu_state[2]_i_2 
       (.I0(is_slli_srli_srai),
        .I1(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I2(is_sll_srl_sra),
        .O(\cpu_state[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000F100)) 
    \cpu_state[3]_i_1 
       (.I0(is_lb_lh_lw_lbu_lhu),
        .I1(\cpu_state[3]_i_2_n_0 ),
        .I2(is_lui_auipc_jal),
        .I3(\reg_op2[31]_i_1_n_0 ),
        .I4(\cpu_state[7]_i_7_n_0 ),
        .I5(\cpu_state[6]_i_2_n_0 ),
        .O(cpu_state0_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'hFF0E)) 
    \cpu_state[3]_i_2 
       (.I0(is_sb_sh_sw),
        .I1(is_sll_srl_sra),
        .I2(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I3(is_slli_srli_srai),
        .O(\cpu_state[3]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \cpu_state[5]_i_1 
       (.I0(resetn_IBUF),
        .I1(reg_next_pc),
        .O(cpu_state0_out[5]));
  LUT6 #(
    .INIT(64'hFFF2FFFFFFFFFFFF)) 
    \cpu_state[6]_i_1 
       (.I0(\cpu_state[6]_i_2_n_0 ),
        .I1(reg_next_pc),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[3] ),
        .I4(resetn_IBUF),
        .I5(\cpu_state[7]_i_5_n_0 ),
        .O(cpu_state0_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cpu_state[6]_i_2 
       (.I0(instr_rdinstrh),
        .I1(instr_rdinstr),
        .I2(instr_rdcycleh),
        .I3(instr_rdcycle),
        .O(\cpu_state[6]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h80AA)) 
    \cpu_state[7]_i_1 
       (.I0(resetn_IBUF),
        .I1(mem_do_rinst_reg_n_0),
        .I2(\reg_pc_reg_n_0_[1] ),
        .I3(\cpu_state[7]_i_4_n_0 ),
        .O(\cpu_state[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \cpu_state[7]_i_10 
       (.I0(instr_or),
        .I1(instr_addi),
        .I2(instr_srai),
        .I3(instr_ori),
        .I4(\cpu_state[7]_i_14_n_0 ),
        .O(\cpu_state[7]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \cpu_state[7]_i_11 
       (.I0(instr_rdcycleh),
        .I1(instr_rdcycle),
        .I2(instr_sll),
        .I3(instr_slli),
        .I4(instr_slt),
        .I5(instr_sltu),
        .O(\cpu_state[7]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \cpu_state[7]_i_12 
       (.I0(instr_and),
        .I1(instr_bne),
        .I2(instr_srl),
        .I3(instr_beq),
        .I4(\cpu_state[7]_i_15_n_0 ),
        .O(\cpu_state[7]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \cpu_state[7]_i_13 
       (.I0(instr_lh),
        .I1(instr_bltu),
        .I2(instr_andi),
        .I3(instr_add),
        .I4(\cpu_state[7]_i_16_n_0 ),
        .O(\cpu_state[7]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cpu_state[7]_i_14 
       (.I0(instr_bgeu),
        .I1(instr_sra),
        .I2(instr_xori),
        .I3(instr_srli),
        .O(\cpu_state[7]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cpu_state[7]_i_15 
       (.I0(instr_rdinstrh),
        .I1(instr_rdinstr),
        .I2(instr_sub),
        .I3(instr_slti),
        .O(\cpu_state[7]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cpu_state[7]_i_16 
       (.I0(instr_sw),
        .I1(instr_bge),
        .I2(instr_sh),
        .I3(instr_lb),
        .O(\cpu_state[7]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hFF00FF00FFFFFF04)) 
    \cpu_state[7]_i_2 
       (.I0(mem_do_prefetch_reg_n_0),
        .I1(resetn_IBUF),
        .I2(\cpu_state[7]_i_5_n_0 ),
        .I3(\cpu_state[7]_i_6_n_0 ),
        .I4(\cpu_state_reg_n_0_[3] ),
        .I5(is_sb_sh_sw_i_3_n_0),
        .O(\cpu_state[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \cpu_state[7]_i_3 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(resetn_IBUF),
        .I2(\cpu_state[7]_i_7_n_0 ),
        .O(\cpu_state[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCECFCECFCECFFFFF)) 
    \cpu_state[7]_i_4 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs1_OBUF[0]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(mem_do_rdata),
        .I5(mem_do_wdata),
        .O(\cpu_state[7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \cpu_state[7]_i_5 
       (.I0(\cpu_state_reg_n_0_[1] ),
        .I1(\cpu_state_reg_n_0_[0] ),
        .O(\cpu_state[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFEFFFEFFFEF)) 
    \cpu_state[7]_i_6 
       (.I0(\reg_out[15]_i_3_n_0 ),
        .I1(\cpu_state[7]_i_8_n_0 ),
        .I2(resetn_IBUF),
        .I3(\cpu_state_reg_n_0_[5] ),
        .I4(mem_do_prefetch_i_2_n_0),
        .I5(reg_next_pc),
        .O(\cpu_state[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    \cpu_state[7]_i_7 
       (.I0(\cpu_state[7]_i_9_n_0 ),
        .I1(\cpu_state[7]_i_10_n_0 ),
        .I2(is_lui_auipc_jal_jalr_addi_add_sub_i_2_n_0),
        .I3(\cpu_state[7]_i_11_n_0 ),
        .I4(\cpu_state[7]_i_12_n_0 ),
        .I5(\cpu_state[7]_i_13_n_0 ),
        .O(\cpu_state[7]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cpu_state[7]_i_8 
       (.I0(\cpu_state_reg_n_0_[3] ),
        .I1(is_beq_bne_blt_bge_bltu_bgeu),
        .O(\cpu_state[7]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \cpu_state[7]_i_9 
       (.I0(is_lbu_lhu_lw_i_1_n_0),
        .I1(instr_xor),
        .I2(instr_sltiu),
        .I3(instr_blt),
        .I4(instr_sb),
        .O(\cpu_state[7]_i_9_n_0 ));
  FDRE \cpu_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu_state[7]_i_2_n_0 ),
        .D(cpu_state0_out[0]),
        .Q(\cpu_state_reg_n_0_[0] ),
        .R(\cpu_state[7]_i_1_n_0 ));
  FDRE \cpu_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu_state[7]_i_2_n_0 ),
        .D(cpu_state0_out[1]),
        .Q(\cpu_state_reg_n_0_[1] ),
        .R(\cpu_state[7]_i_1_n_0 ));
  FDRE \cpu_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu_state[7]_i_2_n_0 ),
        .D(cpu_state0_out[2]),
        .Q(\cpu_state_reg_n_0_[2] ),
        .R(\cpu_state[7]_i_1_n_0 ));
  FDRE \cpu_state_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu_state[7]_i_2_n_0 ),
        .D(cpu_state0_out[3]),
        .Q(\cpu_state_reg_n_0_[3] ),
        .R(\cpu_state[7]_i_1_n_0 ));
  FDRE \cpu_state_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu_state[7]_i_2_n_0 ),
        .D(cpu_state0_out[5]),
        .Q(\cpu_state_reg_n_0_[5] ),
        .R(\cpu_state[7]_i_1_n_0 ));
  FDRE \cpu_state_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu_state[7]_i_2_n_0 ),
        .D(cpu_state0_out[6]),
        .Q(reg_next_pc),
        .R(\cpu_state[7]_i_1_n_0 ));
  FDSE \cpu_state_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu_state[7]_i_2_n_0 ),
        .D(\cpu_state[7]_i_3_n_0 ),
        .Q(\cpu_state_reg_n_0_[7] ),
        .S(\cpu_state[7]_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "cpuregs" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M cpuregs_reg_r1_0_31_0_5
       (.ADDRA({decoded_imm_j[4:1],decoded_imm_j[11]}),
        .ADDRB({decoded_imm_j[4:1],decoded_imm_j[11]}),
        .ADDRC({decoded_imm_j[4:1],decoded_imm_j[11]}),
        .ADDRD(latched_rd),
        .DIA(cpuregs_wrdata[1:0]),
        .DIB(cpuregs_wrdata[3:2]),
        .DIC(cpuregs_wrdata[5:4]),
        .DID({\<const0> ,\<const0> }),
        .DOA({cpuregs_reg_r1_0_31_0_5_n_0,cpuregs_reg_r1_0_31_0_5_n_1}),
        .DOB({cpuregs_reg_r1_0_31_0_5_n_2,cpuregs_reg_r1_0_31_0_5_n_3}),
        .DOC({cpuregs_reg_r1_0_31_0_5_n_4,cpuregs_reg_r1_0_31_0_5_n_5}),
        .WCLK(clk_IBUF_BUFG),
        .WE(cpuregs_reg_r1_0_31_0_5_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000020202000)) 
    cpuregs_reg_r1_0_31_0_5_i_1
       (.I0(cpuregs_reg_r1_0_31_0_5_i_8_n_0),
        .I1(cpuregs_reg_r1_0_31_0_5_i_9_n_0),
        .I2(reg_next_pc),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(cpuregs_reg_r1_0_31_0_5_i_10_n_0),
        .O(cpuregs_reg_r1_0_31_0_5_i_1_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    cpuregs_reg_r1_0_31_0_5_i_10
       (.I0(latched_rd[0]),
        .I1(latched_rd[2]),
        .I2(latched_rd[4]),
        .I3(latched_rd[3]),
        .I4(latched_rd[1]),
        .O(cpuregs_reg_r1_0_31_0_5_i_10_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "PROPCONST POST_PROCESS_NETLIST" *) 
  CARRY4 cpuregs_reg_r1_0_31_0_5_i_11
       (.CI(\<const0> ),
        .CO({cpuregs_reg_r1_0_31_0_5_i_11_n_0,NLW_cpuregs_reg_r1_0_31_0_5_i_11_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\reg_pc_reg_n_0_[2] ,\reg_pc_reg_n_0_[1] ,\<const0> }),
        .O({cpuregs_reg_r1_0_31_0_5_i_11_n_4,cpuregs_reg_r1_0_31_0_5_i_11_n_5,cpuregs_reg_r1_0_31_0_5_i_11_n_6,NLW_cpuregs_reg_r1_0_31_0_5_i_11_O_UNCONNECTED[0]}),
        .S({\reg_pc_reg_n_0_[3] ,cpuregs_reg_r1_0_31_0_5_i_14_n_0,\reg_pc_reg_n_0_[1] ,\<const0> }));
  LUT6 #(
    .INIT(64'hFFFEFFFFFFFFFFFF)) 
    cpuregs_reg_r1_0_31_0_5_i_12
       (.I0(cpuregs_reg_r1_0_31_0_5_i_15_n_0),
        .I1(\cpu_state_reg_n_0_[1] ),
        .I2(\cpu_state_reg_n_0_[0] ),
        .I3(latched_branch_reg_n_0),
        .I4(reg_next_pc),
        .I5(latched_store_reg_n_0),
        .O(cpuregs_reg_r1_0_31_0_5_i_12_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 cpuregs_reg_r1_0_31_0_5_i_13
       (.CI(cpuregs_reg_r1_0_31_0_5_i_11_n_0),
        .CO({cpuregs_reg_r1_0_31_0_5_i_13_n_0,NLW_cpuregs_reg_r1_0_31_0_5_i_13_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({cpuregs_reg_r1_0_31_0_5_i_13_n_4,cpuregs_reg_r1_0_31_0_5_i_13_n_5,cpuregs_reg_r1_0_31_0_5_i_13_n_6,cpuregs_reg_r1_0_31_0_5_i_13_n_7}),
        .S({\reg_pc_reg_n_0_[7] ,\reg_pc_reg_n_0_[6] ,\reg_pc_reg_n_0_[5] ,\reg_pc_reg_n_0_[4] }));
  LUT1 #(
    .INIT(2'h1)) 
    cpuregs_reg_r1_0_31_0_5_i_14
       (.I0(\reg_pc_reg_n_0_[2] ),
        .O(cpuregs_reg_r1_0_31_0_5_i_14_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    cpuregs_reg_r1_0_31_0_5_i_15
       (.I0(\cpu_state_reg_n_0_[2] ),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(\cpu_state_reg_n_0_[7] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(cpuregs_reg_r1_0_31_0_5_i_15_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_0_5_i_2
       (.I0(cpuregs_reg_r1_0_31_0_5_i_11_n_6),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[1]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[1] ),
        .O(cpuregs_wrdata[1]));
  LUT4 #(
    .INIT(16'h00E2)) 
    cpuregs_reg_r1_0_31_0_5_i_3
       (.I0(\reg_out_reg_n_0_[0] ),
        .I1(latched_stalu_reg_n_0),
        .I2(alu_out_q[0]),
        .I3(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .O(cpuregs_wrdata[0]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_0_5_i_4
       (.I0(cpuregs_reg_r1_0_31_0_5_i_11_n_4),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[3]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[3] ),
        .O(cpuregs_wrdata[3]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_0_5_i_5
       (.I0(cpuregs_reg_r1_0_31_0_5_i_11_n_5),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[2]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[2] ),
        .O(cpuregs_wrdata[2]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_0_5_i_6
       (.I0(cpuregs_reg_r1_0_31_0_5_i_13_n_6),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[5]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[5] ),
        .O(cpuregs_wrdata[5]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_0_5_i_7
       (.I0(cpuregs_reg_r1_0_31_0_5_i_13_n_7),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[4]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[4] ),
        .O(cpuregs_wrdata[4]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    cpuregs_reg_r1_0_31_0_5_i_8
       (.I0(\cpu_state_reg_n_0_[0] ),
        .I1(\cpu_state_reg_n_0_[1] ),
        .I2(resetn_IBUF),
        .I3(\cpu_state_reg_n_0_[3] ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .O(cpuregs_reg_r1_0_31_0_5_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'hE)) 
    cpuregs_reg_r1_0_31_0_5_i_9
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\cpu_state_reg_n_0_[7] ),
        .O(cpuregs_reg_r1_0_31_0_5_i_9_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "cpuregs" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "17" *) 
  RAM32M cpuregs_reg_r1_0_31_12_17
       (.ADDRA({decoded_imm_j[4:1],decoded_imm_j[11]}),
        .ADDRB({decoded_imm_j[4:1],decoded_imm_j[11]}),
        .ADDRC({decoded_imm_j[4:1],decoded_imm_j[11]}),
        .ADDRD(latched_rd),
        .DIA(cpuregs_wrdata[13:12]),
        .DIB(cpuregs_wrdata[15:14]),
        .DIC(cpuregs_wrdata[17:16]),
        .DID({\<const0> ,\<const0> }),
        .DOA({cpuregs_reg_r1_0_31_12_17_n_0,cpuregs_reg_r1_0_31_12_17_n_1}),
        .DOB({cpuregs_reg_r1_0_31_12_17_n_2,cpuregs_reg_r1_0_31_12_17_n_3}),
        .DOC({cpuregs_reg_r1_0_31_12_17_n_4,cpuregs_reg_r1_0_31_12_17_n_5}),
        .WCLK(clk_IBUF_BUFG),
        .WE(cpuregs_reg_r1_0_31_0_5_i_1_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_12_17_i_1
       (.I0(cpuregs_reg_r1_0_31_12_17_i_7_n_6),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[13]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[13] ),
        .O(cpuregs_wrdata[13]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_12_17_i_2
       (.I0(cpuregs_reg_r1_0_31_12_17_i_7_n_7),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[12]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[12] ),
        .O(cpuregs_wrdata[12]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_12_17_i_3
       (.I0(cpuregs_reg_r1_0_31_12_17_i_7_n_4),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[15]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[15] ),
        .O(cpuregs_wrdata[15]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_12_17_i_4
       (.I0(cpuregs_reg_r1_0_31_12_17_i_7_n_5),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[14]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[14] ),
        .O(cpuregs_wrdata[14]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_12_17_i_5
       (.I0(cpuregs_reg_r1_0_31_12_17_i_8_n_6),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[17]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[17] ),
        .O(cpuregs_wrdata[17]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_12_17_i_6
       (.I0(cpuregs_reg_r1_0_31_12_17_i_8_n_7),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[16]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[16] ),
        .O(cpuregs_wrdata[16]));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 cpuregs_reg_r1_0_31_12_17_i_7
       (.CI(cpuregs_reg_r1_0_31_6_11_i_7_n_0),
        .CO({cpuregs_reg_r1_0_31_12_17_i_7_n_0,NLW_cpuregs_reg_r1_0_31_12_17_i_7_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({cpuregs_reg_r1_0_31_12_17_i_7_n_4,cpuregs_reg_r1_0_31_12_17_i_7_n_5,cpuregs_reg_r1_0_31_12_17_i_7_n_6,cpuregs_reg_r1_0_31_12_17_i_7_n_7}),
        .S({\reg_pc_reg_n_0_[15] ,\reg_pc_reg_n_0_[14] ,\reg_pc_reg_n_0_[13] ,\reg_pc_reg_n_0_[12] }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 cpuregs_reg_r1_0_31_12_17_i_8
       (.CI(cpuregs_reg_r1_0_31_12_17_i_7_n_0),
        .CO({cpuregs_reg_r1_0_31_12_17_i_8_n_0,NLW_cpuregs_reg_r1_0_31_12_17_i_8_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({cpuregs_reg_r1_0_31_12_17_i_8_n_4,cpuregs_reg_r1_0_31_12_17_i_8_n_5,cpuregs_reg_r1_0_31_12_17_i_8_n_6,cpuregs_reg_r1_0_31_12_17_i_8_n_7}),
        .S({\reg_pc_reg_n_0_[19] ,\reg_pc_reg_n_0_[18] ,\reg_pc_reg_n_0_[17] ,\reg_pc_reg_n_0_[16] }));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "cpuregs" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "23" *) 
  RAM32M cpuregs_reg_r1_0_31_18_23
       (.ADDRA({decoded_imm_j[4:1],decoded_imm_j[11]}),
        .ADDRB({decoded_imm_j[4:1],decoded_imm_j[11]}),
        .ADDRC({decoded_imm_j[4:1],decoded_imm_j[11]}),
        .ADDRD(latched_rd),
        .DIA(cpuregs_wrdata[19:18]),
        .DIB(cpuregs_wrdata[21:20]),
        .DIC(cpuregs_wrdata[23:22]),
        .DID({\<const0> ,\<const0> }),
        .DOA({cpuregs_reg_r1_0_31_18_23_n_0,cpuregs_reg_r1_0_31_18_23_n_1}),
        .DOB({cpuregs_reg_r1_0_31_18_23_n_2,cpuregs_reg_r1_0_31_18_23_n_3}),
        .DOC({cpuregs_reg_r1_0_31_18_23_n_4,cpuregs_reg_r1_0_31_18_23_n_5}),
        .WCLK(clk_IBUF_BUFG),
        .WE(cpuregs_reg_r1_0_31_0_5_i_1_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_18_23_i_1
       (.I0(cpuregs_reg_r1_0_31_12_17_i_8_n_4),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[19]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[19] ),
        .O(cpuregs_wrdata[19]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_18_23_i_2
       (.I0(cpuregs_reg_r1_0_31_12_17_i_8_n_5),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[18]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[18] ),
        .O(cpuregs_wrdata[18]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_18_23_i_3
       (.I0(cpuregs_reg_r1_0_31_18_23_i_7_n_6),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[21]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[21] ),
        .O(cpuregs_wrdata[21]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_18_23_i_4
       (.I0(cpuregs_reg_r1_0_31_18_23_i_7_n_7),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[20]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[20] ),
        .O(cpuregs_wrdata[20]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_18_23_i_5
       (.I0(cpuregs_reg_r1_0_31_18_23_i_7_n_4),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[23]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[23] ),
        .O(cpuregs_wrdata[23]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_18_23_i_6
       (.I0(cpuregs_reg_r1_0_31_18_23_i_7_n_5),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[22]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[22] ),
        .O(cpuregs_wrdata[22]));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 cpuregs_reg_r1_0_31_18_23_i_7
       (.CI(cpuregs_reg_r1_0_31_12_17_i_8_n_0),
        .CO({cpuregs_reg_r1_0_31_18_23_i_7_n_0,NLW_cpuregs_reg_r1_0_31_18_23_i_7_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({cpuregs_reg_r1_0_31_18_23_i_7_n_4,cpuregs_reg_r1_0_31_18_23_i_7_n_5,cpuregs_reg_r1_0_31_18_23_i_7_n_6,cpuregs_reg_r1_0_31_18_23_i_7_n_7}),
        .S({\reg_pc_reg_n_0_[23] ,\reg_pc_reg_n_0_[22] ,\reg_pc_reg_n_0_[21] ,\reg_pc_reg_n_0_[20] }));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "cpuregs" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "29" *) 
  RAM32M cpuregs_reg_r1_0_31_24_29
       (.ADDRA({decoded_imm_j[4:1],decoded_imm_j[11]}),
        .ADDRB({decoded_imm_j[4:1],decoded_imm_j[11]}),
        .ADDRC({decoded_imm_j[4:1],decoded_imm_j[11]}),
        .ADDRD(latched_rd),
        .DIA(cpuregs_wrdata[25:24]),
        .DIB(cpuregs_wrdata[27:26]),
        .DIC(cpuregs_wrdata[29:28]),
        .DID({\<const0> ,\<const0> }),
        .DOA({cpuregs_reg_r1_0_31_24_29_n_0,cpuregs_reg_r1_0_31_24_29_n_1}),
        .DOB({cpuregs_reg_r1_0_31_24_29_n_2,cpuregs_reg_r1_0_31_24_29_n_3}),
        .DOC({cpuregs_reg_r1_0_31_24_29_n_4,cpuregs_reg_r1_0_31_24_29_n_5}),
        .WCLK(clk_IBUF_BUFG),
        .WE(cpuregs_reg_r1_0_31_0_5_i_1_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_24_29_i_1
       (.I0(cpuregs_reg_r1_0_31_24_29_i_7_n_6),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[25]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[25] ),
        .O(cpuregs_wrdata[25]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_24_29_i_2
       (.I0(cpuregs_reg_r1_0_31_24_29_i_7_n_7),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[24]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[24] ),
        .O(cpuregs_wrdata[24]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_24_29_i_3
       (.I0(cpuregs_reg_r1_0_31_24_29_i_7_n_4),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[27]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[27] ),
        .O(cpuregs_wrdata[27]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_24_29_i_4
       (.I0(cpuregs_reg_r1_0_31_24_29_i_7_n_5),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[26]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[26] ),
        .O(cpuregs_wrdata[26]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_24_29_i_5
       (.I0(cpuregs_reg_r1_0_31_24_29_i_8_n_6),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[29]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[29] ),
        .O(cpuregs_wrdata[29]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_24_29_i_6
       (.I0(cpuregs_reg_r1_0_31_24_29_i_8_n_7),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[28]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[28] ),
        .O(cpuregs_wrdata[28]));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 cpuregs_reg_r1_0_31_24_29_i_7
       (.CI(cpuregs_reg_r1_0_31_18_23_i_7_n_0),
        .CO({cpuregs_reg_r1_0_31_24_29_i_7_n_0,NLW_cpuregs_reg_r1_0_31_24_29_i_7_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({cpuregs_reg_r1_0_31_24_29_i_7_n_4,cpuregs_reg_r1_0_31_24_29_i_7_n_5,cpuregs_reg_r1_0_31_24_29_i_7_n_6,cpuregs_reg_r1_0_31_24_29_i_7_n_7}),
        .S({\reg_pc_reg_n_0_[27] ,\reg_pc_reg_n_0_[26] ,\reg_pc_reg_n_0_[25] ,\reg_pc_reg_n_0_[24] }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 cpuregs_reg_r1_0_31_24_29_i_8
       (.CI(cpuregs_reg_r1_0_31_24_29_i_7_n_0),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({cpuregs_reg_r1_0_31_24_29_i_8_n_4,cpuregs_reg_r1_0_31_24_29_i_8_n_5,cpuregs_reg_r1_0_31_24_29_i_8_n_6,cpuregs_reg_r1_0_31_24_29_i_8_n_7}),
        .S({\reg_pc_reg_n_0_[31] ,\reg_pc_reg_n_0_[30] ,\reg_pc_reg_n_0_[29] ,\reg_pc_reg_n_0_[28] }));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "cpuregs" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM32X1D cpuregs_reg_r1_0_31_30_31
       (.A0(latched_rd[0]),
        .A1(latched_rd[1]),
        .A2(latched_rd[2]),
        .A3(latched_rd[3]),
        .A4(latched_rd[4]),
        .D(cpuregs_wrdata[30]),
        .DPO(cpuregs_reg_r1_0_31_30_31_n_0),
        .DPRA0(decoded_imm_j[11]),
        .DPRA1(decoded_imm_j[1]),
        .DPRA2(decoded_imm_j[2]),
        .DPRA3(decoded_imm_j[3]),
        .DPRA4(decoded_imm_j[4]),
        .WCLK(clk_IBUF_BUFG),
        .WE(cpuregs_reg_r1_0_31_0_5_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "cpuregs" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM32X1D cpuregs_reg_r1_0_31_30_31__0
       (.A0(latched_rd[0]),
        .A1(latched_rd[1]),
        .A2(latched_rd[2]),
        .A3(latched_rd[3]),
        .A4(latched_rd[4]),
        .D(cpuregs_wrdata[31]),
        .DPO(cpuregs_reg_r1_0_31_30_31__0_n_0),
        .DPRA0(decoded_imm_j[11]),
        .DPRA1(decoded_imm_j[1]),
        .DPRA2(decoded_imm_j[2]),
        .DPRA3(decoded_imm_j[3]),
        .DPRA4(decoded_imm_j[4]),
        .WCLK(clk_IBUF_BUFG),
        .WE(cpuregs_reg_r1_0_31_0_5_i_1_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_30_31__0_i_1
       (.I0(cpuregs_reg_r1_0_31_24_29_i_8_n_4),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[31]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[31] ),
        .O(cpuregs_wrdata[31]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_30_31_i_1
       (.I0(cpuregs_reg_r1_0_31_24_29_i_8_n_5),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[30]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[30] ),
        .O(cpuregs_wrdata[30]));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "cpuregs" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "11" *) 
  RAM32M cpuregs_reg_r1_0_31_6_11
       (.ADDRA({decoded_imm_j[4:1],decoded_imm_j[11]}),
        .ADDRB({decoded_imm_j[4:1],decoded_imm_j[11]}),
        .ADDRC({decoded_imm_j[4:1],decoded_imm_j[11]}),
        .ADDRD(latched_rd),
        .DIA(cpuregs_wrdata[7:6]),
        .DIB(cpuregs_wrdata[9:8]),
        .DIC(cpuregs_wrdata[11:10]),
        .DID({\<const0> ,\<const0> }),
        .DOA({cpuregs_reg_r1_0_31_6_11_n_0,cpuregs_reg_r1_0_31_6_11_n_1}),
        .DOB({cpuregs_reg_r1_0_31_6_11_n_2,cpuregs_reg_r1_0_31_6_11_n_3}),
        .DOC({cpuregs_reg_r1_0_31_6_11_n_4,cpuregs_reg_r1_0_31_6_11_n_5}),
        .WCLK(clk_IBUF_BUFG),
        .WE(cpuregs_reg_r1_0_31_0_5_i_1_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_6_11_i_1
       (.I0(cpuregs_reg_r1_0_31_0_5_i_13_n_4),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[7]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[7] ),
        .O(cpuregs_wrdata[7]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_6_11_i_2
       (.I0(cpuregs_reg_r1_0_31_0_5_i_13_n_5),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[6]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[6] ),
        .O(cpuregs_wrdata[6]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_6_11_i_3
       (.I0(cpuregs_reg_r1_0_31_6_11_i_7_n_6),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[9]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[9] ),
        .O(cpuregs_wrdata[9]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_6_11_i_4
       (.I0(cpuregs_reg_r1_0_31_6_11_i_7_n_7),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[8]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[8] ),
        .O(cpuregs_wrdata[8]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_6_11_i_5
       (.I0(cpuregs_reg_r1_0_31_6_11_i_7_n_4),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[11]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[11] ),
        .O(cpuregs_wrdata[11]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_6_11_i_6
       (.I0(cpuregs_reg_r1_0_31_6_11_i_7_n_5),
        .I1(cpuregs_reg_r1_0_31_0_5_i_12_n_0),
        .I2(alu_out_q[10]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[10] ),
        .O(cpuregs_wrdata[10]));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 cpuregs_reg_r1_0_31_6_11_i_7
       (.CI(cpuregs_reg_r1_0_31_0_5_i_13_n_0),
        .CO({cpuregs_reg_r1_0_31_6_11_i_7_n_0,NLW_cpuregs_reg_r1_0_31_6_11_i_7_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({cpuregs_reg_r1_0_31_6_11_i_7_n_4,cpuregs_reg_r1_0_31_6_11_i_7_n_5,cpuregs_reg_r1_0_31_6_11_i_7_n_6,cpuregs_reg_r1_0_31_6_11_i_7_n_7}),
        .S({\reg_pc_reg_n_0_[11] ,\reg_pc_reg_n_0_[10] ,\reg_pc_reg_n_0_[9] ,\reg_pc_reg_n_0_[8] }));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "cpuregs" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M cpuregs_reg_r2_0_31_0_5
       (.ADDRA(decoded_rs1),
        .ADDRB(decoded_rs1),
        .ADDRC(decoded_rs1),
        .ADDRD(latched_rd),
        .DIA(cpuregs_wrdata[1:0]),
        .DIB(cpuregs_wrdata[3:2]),
        .DIC(cpuregs_wrdata[5:4]),
        .DID({\<const0> ,\<const0> }),
        .DOA(reg_op12[1:0]),
        .DOB(reg_op12[3:2]),
        .DOC(reg_op12[5:4]),
        .WCLK(clk_IBUF_BUFG),
        .WE(cpuregs_reg_r1_0_31_0_5_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "cpuregs" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "17" *) 
  RAM32M cpuregs_reg_r2_0_31_12_17
       (.ADDRA(decoded_rs1),
        .ADDRB(decoded_rs1),
        .ADDRC(decoded_rs1),
        .ADDRD(latched_rd),
        .DIA(cpuregs_wrdata[13:12]),
        .DIB(cpuregs_wrdata[15:14]),
        .DIC(cpuregs_wrdata[17:16]),
        .DID({\<const0> ,\<const0> }),
        .DOA(reg_op12[13:12]),
        .DOB(reg_op12[15:14]),
        .DOC(reg_op12[17:16]),
        .WCLK(clk_IBUF_BUFG),
        .WE(cpuregs_reg_r1_0_31_0_5_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "cpuregs" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "23" *) 
  RAM32M cpuregs_reg_r2_0_31_18_23
       (.ADDRA(decoded_rs1),
        .ADDRB(decoded_rs1),
        .ADDRC(decoded_rs1),
        .ADDRD(latched_rd),
        .DIA(cpuregs_wrdata[19:18]),
        .DIB(cpuregs_wrdata[21:20]),
        .DIC(cpuregs_wrdata[23:22]),
        .DID({\<const0> ,\<const0> }),
        .DOA(reg_op12[19:18]),
        .DOB(reg_op12[21:20]),
        .DOC(reg_op12[23:22]),
        .WCLK(clk_IBUF_BUFG),
        .WE(cpuregs_reg_r1_0_31_0_5_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "cpuregs" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "29" *) 
  RAM32M cpuregs_reg_r2_0_31_24_29
       (.ADDRA(decoded_rs1),
        .ADDRB(decoded_rs1),
        .ADDRC(decoded_rs1),
        .ADDRD(latched_rd),
        .DIA(cpuregs_wrdata[25:24]),
        .DIB(cpuregs_wrdata[27:26]),
        .DIC(cpuregs_wrdata[29:28]),
        .DID({\<const0> ,\<const0> }),
        .DOA(reg_op12[25:24]),
        .DOB(reg_op12[27:26]),
        .DOC(reg_op12[29:28]),
        .WCLK(clk_IBUF_BUFG),
        .WE(cpuregs_reg_r1_0_31_0_5_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "cpuregs" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM32X1D cpuregs_reg_r2_0_31_30_31
       (.A0(latched_rd[0]),
        .A1(latched_rd[1]),
        .A2(latched_rd[2]),
        .A3(latched_rd[3]),
        .A4(latched_rd[4]),
        .D(cpuregs_wrdata[30]),
        .DPO(reg_op12[30]),
        .DPRA0(decoded_rs1[0]),
        .DPRA1(decoded_rs1[1]),
        .DPRA2(decoded_rs1[2]),
        .DPRA3(decoded_rs1[3]),
        .DPRA4(decoded_rs1[4]),
        .WCLK(clk_IBUF_BUFG),
        .WE(cpuregs_reg_r1_0_31_0_5_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "cpuregs" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM32X1D cpuregs_reg_r2_0_31_30_31__0
       (.A0(latched_rd[0]),
        .A1(latched_rd[1]),
        .A2(latched_rd[2]),
        .A3(latched_rd[3]),
        .A4(latched_rd[4]),
        .D(cpuregs_wrdata[31]),
        .DPO(reg_op12[31]),
        .DPRA0(decoded_rs1[0]),
        .DPRA1(decoded_rs1[1]),
        .DPRA2(decoded_rs1[2]),
        .DPRA3(decoded_rs1[3]),
        .DPRA4(decoded_rs1[4]),
        .WCLK(clk_IBUF_BUFG),
        .WE(cpuregs_reg_r1_0_31_0_5_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "cpuregs" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "11" *) 
  RAM32M cpuregs_reg_r2_0_31_6_11
       (.ADDRA(decoded_rs1),
        .ADDRB(decoded_rs1),
        .ADDRC(decoded_rs1),
        .ADDRD(latched_rd),
        .DIA(cpuregs_wrdata[7:6]),
        .DIB(cpuregs_wrdata[9:8]),
        .DIC(cpuregs_wrdata[11:10]),
        .DID({\<const0> ,\<const0> }),
        .DOA(reg_op12[7:6]),
        .DOB(reg_op12[9:8]),
        .DOC(reg_op12[11:10]),
        .WCLK(clk_IBUF_BUFG),
        .WE(cpuregs_reg_r1_0_31_0_5_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFF888888888)) 
    \decoded_imm[0]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[7] ),
        .I1(is_sb_sh_sw),
        .I2(instr_jalr),
        .I3(is_lb_lh_lw_lbu_lhu),
        .I4(is_alu_reg_imm),
        .I5(\mem_rdata_q_reg_n_0_[20] ),
        .O(\decoded_imm[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \decoded_imm[10]_i_1 
       (.I0(decoded_imm_j[10]),
        .I1(instr_jal),
        .I2(\decoded_imm[10]_i_2_n_0 ),
        .I3(\mem_rdata_q_reg_n_0_[30] ),
        .O(\decoded_imm[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \decoded_imm[10]_i_2 
       (.I0(is_sb_sh_sw),
        .I1(instr_jalr),
        .I2(is_lb_lh_lw_lbu_lhu),
        .I3(is_alu_reg_imm),
        .I4(is_beq_bne_blt_bge_bltu_bgeu),
        .O(\decoded_imm[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF444F444F444)) 
    \decoded_imm[11]_i_1 
       (.I0(\decoded_imm[11]_i_2_n_0 ),
        .I1(\mem_rdata_q_reg_n_0_[31] ),
        .I2(is_beq_bne_blt_bge_bltu_bgeu),
        .I3(\mem_rdata_q_reg_n_0_[7] ),
        .I4(instr_jal),
        .I5(decoded_imm_j[11]),
        .O(\decoded_imm[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \decoded_imm[11]_i_2 
       (.I0(is_alu_reg_imm),
        .I1(is_lb_lh_lw_lbu_lhu),
        .I2(instr_jalr),
        .I3(is_sb_sh_sw),
        .O(\decoded_imm[11]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFF88888)) 
    \decoded_imm[12]_i_1 
       (.I0(decoded_imm_j[12]),
        .I1(instr_jal),
        .I2(instr_lui),
        .I3(instr_auipc),
        .I4(p_0_in[0]),
        .O(\decoded_imm[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF8F8F888)) 
    \decoded_imm[13]_i_1 
       (.I0(decoded_imm_j[13]),
        .I1(instr_jal),
        .I2(p_0_in[1]),
        .I3(instr_lui),
        .I4(instr_auipc),
        .O(\decoded_imm[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF8F8F888)) 
    \decoded_imm[14]_i_1 
       (.I0(decoded_imm_j[14]),
        .I1(instr_jal),
        .I2(p_0_in[2]),
        .I3(instr_lui),
        .I4(instr_auipc),
        .O(\decoded_imm[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFF88888)) 
    \decoded_imm[15]_i_1 
       (.I0(decoded_rs1[0]),
        .I1(instr_jal),
        .I2(instr_lui),
        .I3(instr_auipc),
        .I4(\mem_rdata_q_reg_n_0_[15] ),
        .O(\decoded_imm[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFF88888)) 
    \decoded_imm[16]_i_1 
       (.I0(decoded_rs1[1]),
        .I1(instr_jal),
        .I2(instr_lui),
        .I3(instr_auipc),
        .I4(\mem_rdata_q_reg_n_0_[16] ),
        .O(\decoded_imm[16]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFF88888)) 
    \decoded_imm[17]_i_1 
       (.I0(decoded_rs1[2]),
        .I1(instr_jal),
        .I2(instr_lui),
        .I3(instr_auipc),
        .I4(\mem_rdata_q_reg_n_0_[17] ),
        .O(\decoded_imm[17]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFF88888)) 
    \decoded_imm[18]_i_1 
       (.I0(decoded_rs1[3]),
        .I1(instr_jal),
        .I2(instr_lui),
        .I3(instr_auipc),
        .I4(\mem_rdata_q_reg_n_0_[18] ),
        .O(\decoded_imm[18]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0400)) 
    \decoded_imm[19]_i_1 
       (.I0(\decoded_imm[10]_i_2_n_0 ),
        .I1(\mem_rdata_q_reg_n_0_[31] ),
        .I2(decoder_pseudo_trigger_reg_n_0),
        .I3(decoder_trigger_reg_n_0),
        .O(\decoded_imm[19]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFF88888)) 
    \decoded_imm[19]_i_2 
       (.I0(decoded_rs1[4]),
        .I1(instr_jal),
        .I2(instr_lui),
        .I3(instr_auipc),
        .I4(\mem_rdata_q_reg_n_0_[19] ),
        .O(\decoded_imm[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444F444F4)) 
    \decoded_imm[1]_i_1 
       (.I0(\decoded_imm[4]_i_2_n_0 ),
        .I1(\mem_rdata_q_reg_n_0_[21] ),
        .I2(\mem_rdata_q_reg_n_0_[8] ),
        .I3(\decoded_imm[4]_i_3_n_0 ),
        .I4(instr_jal),
        .I5(decoded_imm_j[1]),
        .O(\decoded_imm[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hE0)) 
    \decoded_imm[20]_i_1 
       (.I0(instr_auipc),
        .I1(instr_lui),
        .I2(\mem_rdata_q_reg_n_0_[20] ),
        .O(\decoded_imm[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \decoded_imm[21]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[21] ),
        .I1(instr_auipc),
        .I2(instr_lui),
        .O(\decoded_imm[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \decoded_imm[22]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[22] ),
        .I1(instr_auipc),
        .I2(instr_lui),
        .O(\decoded_imm[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \decoded_imm[23]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[23] ),
        .I1(instr_auipc),
        .I2(instr_lui),
        .O(\decoded_imm[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \decoded_imm[24]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[24] ),
        .I1(instr_auipc),
        .I2(instr_lui),
        .O(\decoded_imm[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \decoded_imm[25]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[25] ),
        .I1(instr_auipc),
        .I2(instr_lui),
        .O(\decoded_imm[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \decoded_imm[26]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[26] ),
        .I1(instr_auipc),
        .I2(instr_lui),
        .O(\decoded_imm[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \decoded_imm[27]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[27] ),
        .I1(instr_auipc),
        .I2(instr_lui),
        .O(\decoded_imm[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \decoded_imm[28]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[28] ),
        .I1(instr_auipc),
        .I2(instr_lui),
        .O(\decoded_imm[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \decoded_imm[29]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[29] ),
        .I1(instr_auipc),
        .I2(instr_lui),
        .O(\decoded_imm[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444F444F4)) 
    \decoded_imm[2]_i_1 
       (.I0(\decoded_imm[4]_i_2_n_0 ),
        .I1(\mem_rdata_q_reg_n_0_[22] ),
        .I2(\mem_rdata_q_reg_n_0_[9] ),
        .I3(\decoded_imm[4]_i_3_n_0 ),
        .I4(instr_jal),
        .I5(decoded_imm_j[2]),
        .O(\decoded_imm[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \decoded_imm[30]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[30] ),
        .I1(instr_auipc),
        .I2(instr_lui),
        .O(\decoded_imm[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000F22200000000)) 
    \decoded_imm[31]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[31] ),
        .I1(\decoded_imm[10]_i_2_n_0 ),
        .I2(instr_jal),
        .I3(decoded_imm_j[30]),
        .I4(decoder_pseudo_trigger_reg_n_0),
        .I5(decoder_trigger_reg_n_0),
        .O(\decoded_imm[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \decoded_imm[31]_i_2 
       (.I0(\mem_rdata_q_reg_n_0_[31] ),
        .I1(instr_auipc),
        .I2(instr_lui),
        .O(\decoded_imm[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444F444F4)) 
    \decoded_imm[3]_i_1 
       (.I0(\decoded_imm[4]_i_2_n_0 ),
        .I1(\mem_rdata_q_reg_n_0_[23] ),
        .I2(\mem_rdata_q_reg_n_0_[10] ),
        .I3(\decoded_imm[4]_i_3_n_0 ),
        .I4(instr_jal),
        .I5(decoded_imm_j[3]),
        .O(\decoded_imm[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF44F444F444F4)) 
    \decoded_imm[4]_i_1 
       (.I0(\decoded_imm[4]_i_2_n_0 ),
        .I1(\mem_rdata_q_reg_n_0_[24] ),
        .I2(\mem_rdata_q_reg_n_0_[11] ),
        .I3(\decoded_imm[4]_i_3_n_0 ),
        .I4(instr_jal),
        .I5(decoded_imm_j[4]),
        .O(\decoded_imm[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \decoded_imm[4]_i_2 
       (.I0(instr_jalr),
        .I1(is_lb_lh_lw_lbu_lhu),
        .I2(is_alu_reg_imm),
        .O(\decoded_imm[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \decoded_imm[4]_i_3 
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(is_sb_sh_sw),
        .O(\decoded_imm[4]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \decoded_imm[5]_i_1 
       (.I0(decoded_imm_j[5]),
        .I1(instr_jal),
        .I2(\decoded_imm[10]_i_2_n_0 ),
        .I3(\mem_rdata_q_reg_n_0_[25] ),
        .O(\decoded_imm[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \decoded_imm[6]_i_1 
       (.I0(decoded_imm_j[6]),
        .I1(instr_jal),
        .I2(\decoded_imm[10]_i_2_n_0 ),
        .I3(\mem_rdata_q_reg_n_0_[26] ),
        .O(\decoded_imm[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \decoded_imm[7]_i_1 
       (.I0(decoded_imm_j[7]),
        .I1(instr_jal),
        .I2(\decoded_imm[10]_i_2_n_0 ),
        .I3(\mem_rdata_q_reg_n_0_[27] ),
        .O(\decoded_imm[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \decoded_imm[8]_i_1 
       (.I0(decoded_imm_j[8]),
        .I1(instr_jal),
        .I2(\decoded_imm[10]_i_2_n_0 ),
        .I3(\mem_rdata_q_reg_n_0_[28] ),
        .O(\decoded_imm[8]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \decoded_imm[9]_i_1 
       (.I0(decoded_imm_j[9]),
        .I1(instr_jal),
        .I2(\decoded_imm[10]_i_2_n_0 ),
        .I3(\mem_rdata_q_reg_n_0_[29] ),
        .O(\decoded_imm[9]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_imm_j[10]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[30] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[30]),
        .O(\decoded_imm_j[10]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_imm_j[30]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[31] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[31]),
        .O(p_0_in0));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_imm_j[5]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[25] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[25]),
        .O(\decoded_imm_j[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_imm_j[6]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[26] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[26]),
        .O(\decoded_imm_j[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_imm_j[7]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[27] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[27]),
        .O(\decoded_imm_j[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_imm_j[8]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[28] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[28]),
        .O(\decoded_imm_j[8]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_imm_j[9]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[29] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[29]),
        .O(\decoded_imm_j[9]_i_1_n_0 ));
  FDRE \decoded_imm_j_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(\decoded_imm_j[10]_i_1_n_0 ),
        .Q(decoded_imm_j[10]),
        .R(\<const0> ));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  FDRE \decoded_imm_j_reg[11]_lopt_merged 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(p_1_in[0]),
        .Q(decoded_imm_j[11]),
        .R(\<const0> ));
  FDRE \decoded_imm_j_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(\mem_rdata_q[12]_i_1_n_0 ),
        .Q(decoded_imm_j[12]),
        .R(\<const0> ));
  FDRE \decoded_imm_j_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(\mem_rdata_q[13]_i_1_n_0 ),
        .Q(decoded_imm_j[13]),
        .R(\<const0> ));
  FDRE \decoded_imm_j_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(\mem_rdata_q[14]_i_1_n_0 ),
        .Q(decoded_imm_j[14]),
        .R(\<const0> ));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  FDRE \decoded_imm_j_reg[1]_lopt_merged 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(p_1_in[1]),
        .Q(decoded_imm_j[1]),
        .R(\<const0> ));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  FDRE \decoded_imm_j_reg[2]_lopt_merged 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(p_1_in[2]),
        .Q(decoded_imm_j[2]),
        .R(\<const0> ));
  FDRE \decoded_imm_j_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(p_0_in0),
        .Q(decoded_imm_j[30]),
        .R(\<const0> ));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  FDRE \decoded_imm_j_reg[3]_lopt_merged 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(p_1_in[3]),
        .Q(decoded_imm_j[3]),
        .R(\<const0> ));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  FDRE \decoded_imm_j_reg[4]_lopt_merged 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(p_1_in[4]),
        .Q(decoded_imm_j[4]),
        .R(\<const0> ));
  FDRE \decoded_imm_j_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(\decoded_imm_j[5]_i_1_n_0 ),
        .Q(decoded_imm_j[5]),
        .R(\<const0> ));
  FDRE \decoded_imm_j_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(\decoded_imm_j[6]_i_1_n_0 ),
        .Q(decoded_imm_j[6]),
        .R(\<const0> ));
  FDRE \decoded_imm_j_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(\decoded_imm_j[7]_i_1_n_0 ),
        .Q(decoded_imm_j[7]),
        .R(\<const0> ));
  FDRE \decoded_imm_j_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(\decoded_imm_j[8]_i_1_n_0 ),
        .Q(decoded_imm_j[8]),
        .R(\<const0> ));
  FDRE \decoded_imm_j_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(\decoded_imm_j[9]_i_1_n_0 ),
        .Q(decoded_imm_j[9]),
        .R(\<const0> ));
  FDRE \decoded_imm_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[0]_i_1_n_0 ),
        .Q(decoded_imm[0]),
        .R(\<const0> ));
  FDRE \decoded_imm_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[10]_i_1_n_0 ),
        .Q(decoded_imm[10]),
        .R(\<const0> ));
  FDRE \decoded_imm_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[11]_i_1_n_0 ),
        .Q(decoded_imm[11]),
        .R(\<const0> ));
  FDSE \decoded_imm_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[12]_i_1_n_0 ),
        .Q(decoded_imm[12]),
        .S(\decoded_imm[19]_i_1_n_0 ));
  FDSE \decoded_imm_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[13]_i_1_n_0 ),
        .Q(decoded_imm[13]),
        .S(\decoded_imm[19]_i_1_n_0 ));
  FDSE \decoded_imm_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[14]_i_1_n_0 ),
        .Q(decoded_imm[14]),
        .S(\decoded_imm[19]_i_1_n_0 ));
  FDSE \decoded_imm_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[15]_i_1_n_0 ),
        .Q(decoded_imm[15]),
        .S(\decoded_imm[19]_i_1_n_0 ));
  FDSE \decoded_imm_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[16]_i_1_n_0 ),
        .Q(decoded_imm[16]),
        .S(\decoded_imm[19]_i_1_n_0 ));
  FDSE \decoded_imm_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[17]_i_1_n_0 ),
        .Q(decoded_imm[17]),
        .S(\decoded_imm[19]_i_1_n_0 ));
  FDSE \decoded_imm_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[18]_i_1_n_0 ),
        .Q(decoded_imm[18]),
        .S(\decoded_imm[19]_i_1_n_0 ));
  FDSE \decoded_imm_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[19]_i_2_n_0 ),
        .Q(decoded_imm[19]),
        .S(\decoded_imm[19]_i_1_n_0 ));
  FDRE \decoded_imm_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[1]_i_1_n_0 ),
        .Q(decoded_imm[1]),
        .R(\<const0> ));
  FDSE \decoded_imm_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[20]_i_1_n_0 ),
        .Q(decoded_imm[20]),
        .S(\decoded_imm[31]_i_1_n_0 ));
  FDSE \decoded_imm_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[21]_i_1_n_0 ),
        .Q(decoded_imm[21]),
        .S(\decoded_imm[31]_i_1_n_0 ));
  FDSE \decoded_imm_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[22]_i_1_n_0 ),
        .Q(decoded_imm[22]),
        .S(\decoded_imm[31]_i_1_n_0 ));
  FDSE \decoded_imm_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[23]_i_1_n_0 ),
        .Q(decoded_imm[23]),
        .S(\decoded_imm[31]_i_1_n_0 ));
  FDSE \decoded_imm_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[24]_i_1_n_0 ),
        .Q(decoded_imm[24]),
        .S(\decoded_imm[31]_i_1_n_0 ));
  FDSE \decoded_imm_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[25]_i_1_n_0 ),
        .Q(decoded_imm[25]),
        .S(\decoded_imm[31]_i_1_n_0 ));
  FDSE \decoded_imm_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[26]_i_1_n_0 ),
        .Q(decoded_imm[26]),
        .S(\decoded_imm[31]_i_1_n_0 ));
  FDSE \decoded_imm_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[27]_i_1_n_0 ),
        .Q(decoded_imm[27]),
        .S(\decoded_imm[31]_i_1_n_0 ));
  FDSE \decoded_imm_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[28]_i_1_n_0 ),
        .Q(decoded_imm[28]),
        .S(\decoded_imm[31]_i_1_n_0 ));
  FDSE \decoded_imm_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[29]_i_1_n_0 ),
        .Q(decoded_imm[29]),
        .S(\decoded_imm[31]_i_1_n_0 ));
  FDRE \decoded_imm_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[2]_i_1_n_0 ),
        .Q(decoded_imm[2]),
        .R(\<const0> ));
  FDSE \decoded_imm_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[30]_i_1_n_0 ),
        .Q(decoded_imm[30]),
        .S(\decoded_imm[31]_i_1_n_0 ));
  FDSE \decoded_imm_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[31]_i_2_n_0 ),
        .Q(decoded_imm[31]),
        .S(\decoded_imm[31]_i_1_n_0 ));
  FDRE \decoded_imm_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[3]_i_1_n_0 ),
        .Q(decoded_imm[3]),
        .R(\<const0> ));
  FDRE \decoded_imm_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[4]_i_1_n_0 ),
        .Q(decoded_imm[4]),
        .R(\<const0> ));
  FDRE \decoded_imm_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[5]_i_1_n_0 ),
        .Q(decoded_imm[5]),
        .R(\<const0> ));
  FDRE \decoded_imm_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[6]_i_1_n_0 ),
        .Q(decoded_imm[6]),
        .R(\<const0> ));
  FDRE \decoded_imm_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[7]_i_1_n_0 ),
        .Q(decoded_imm[7]),
        .R(\<const0> ));
  FDRE \decoded_imm_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[8]_i_1_n_0 ),
        .Q(decoded_imm[8]),
        .R(\<const0> ));
  FDRE \decoded_imm_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[9]_i_1_n_0 ),
        .Q(decoded_imm[9]),
        .R(\<const0> ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_rd[0]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[7] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[7]),
        .O(\decoded_rd[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_rd[1]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[8] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[8]),
        .O(\decoded_rd[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_rd[2]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[9] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[9]),
        .O(\decoded_rd[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_rd[3]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[10] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[10]),
        .O(\decoded_rd[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_rd[4]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[11] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[11]),
        .O(\decoded_rd[4]_i_1_n_0 ));
  FDRE \decoded_rd_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(\decoded_rd[0]_i_1_n_0 ),
        .Q(decoded_rd[0]),
        .R(\<const0> ));
  FDRE \decoded_rd_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(\decoded_rd[1]_i_1_n_0 ),
        .Q(decoded_rd[1]),
        .R(\<const0> ));
  FDRE \decoded_rd_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(\decoded_rd[2]_i_1_n_0 ),
        .Q(decoded_rd[2]),
        .R(\<const0> ));
  FDRE \decoded_rd_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(\decoded_rd[3]_i_1_n_0 ),
        .Q(decoded_rd[3]),
        .R(\<const0> ));
  FDRE \decoded_rd_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(\decoded_rd[4]_i_1_n_0 ),
        .Q(decoded_rd[4]),
        .R(\<const0> ));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  FDRE \decoded_rs1_reg[0]_lopt_merged 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(\decoded_rs1_rep[0]_i_1_n_0 ),
        .Q(decoded_rs1[0]),
        .R(\<const0> ));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  FDRE \decoded_rs1_reg[1]_lopt_merged 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(\decoded_rs1_rep[1]_i_1_n_0 ),
        .Q(decoded_rs1[1]),
        .R(\<const0> ));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  FDRE \decoded_rs1_reg[2]_lopt_merged 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(\decoded_rs1_rep[2]_i_1_n_0 ),
        .Q(decoded_rs1[2]),
        .R(\<const0> ));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  FDRE \decoded_rs1_reg[3]_lopt_merged 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(\decoded_rs1_rep[3]_i_1_n_0 ),
        .Q(decoded_rs1[3]),
        .R(\<const0> ));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  FDRE \decoded_rs1_reg[4]_lopt_merged 
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(\decoded_rs1_rep[4]_i_1_n_0 ),
        .Q(decoded_rs1[4]),
        .R(\<const0> ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_rs1_rep[0]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[15] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[15]),
        .O(\decoded_rs1_rep[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_rs1_rep[1]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[16] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[16]),
        .O(\decoded_rs1_rep[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_rs1_rep[2]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[17] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[17]),
        .O(\decoded_rs1_rep[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_rs1_rep[3]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[18] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[18]),
        .O(\decoded_rs1_rep[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_rs1_rep[4]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[19] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[19]),
        .O(\decoded_rs1_rep[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_rs2_rep[0]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[20] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[20]),
        .O(p_1_in[0]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_rs2_rep[1]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[21] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[21]),
        .O(p_1_in[1]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_rs2_rep[2]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[22] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[22]),
        .O(p_1_in[2]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_rs2_rep[3]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[23] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[23]),
        .O(p_1_in[3]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \decoded_rs2_rep[4]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[24] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[24]),
        .O(p_1_in[4]));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    decoder_pseudo_trigger_i_1
       (.I0(\cpu_state_reg_n_0_[2] ),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(\cpu_state_reg_n_0_[7] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .I4(reg_next_pc),
        .I5(decoder_trigger_i_2_n_0),
        .O(decoder_pseudo_trigger));
  FDRE decoder_pseudo_trigger_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(decoder_pseudo_trigger),
        .Q(decoder_pseudo_trigger_reg_n_0),
        .R(instr_and_i_1_n_0));
  LUT6 #(
    .INIT(64'hD0D0D0D0D0D000C0)) 
    decoder_trigger_i_1
       (.I0(decoder_trigger_i_2_n_0),
        .I1(instr_lui0),
        .I2(resetn_IBUF),
        .I3(decoder_trigger_i_3_n_0),
        .I4(\cpu_state_reg_n_0_[0] ),
        .I5(\cpu_state_reg_n_0_[1] ),
        .O(decoder_trigger_i_1_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h44D4)) 
    decoder_trigger_i_10_lopt_merged
       (.I0(pcpi_rs1_OBUF[25]),
        .I1(pcpi_rs2_OBUF[25]),
        .I2(pcpi_rs2_OBUF[24]),
        .I3(pcpi_rs1_OBUF[24]),
        .O(decoder_trigger_i_10_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_11_lopt_merged
       (.I0(pcpi_rs2_OBUF[31]),
        .I1(pcpi_rs1_OBUF[31]),
        .I2(pcpi_rs2_OBUF[30]),
        .I3(pcpi_rs1_OBUF[30]),
        .O(decoder_trigger_i_11_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_12_lopt_merged
       (.I0(pcpi_rs2_OBUF[29]),
        .I1(pcpi_rs1_OBUF[29]),
        .I2(pcpi_rs2_OBUF[28]),
        .I3(pcpi_rs1_OBUF[28]),
        .O(decoder_trigger_i_12_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_13_lopt_merged
       (.I0(pcpi_rs2_OBUF[26]),
        .I1(pcpi_rs1_OBUF[26]),
        .I2(pcpi_rs2_OBUF[27]),
        .I3(pcpi_rs1_OBUF[27]),
        .O(decoder_trigger_i_13_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_14_lopt_merged
       (.I0(pcpi_rs2_OBUF[24]),
        .I1(pcpi_rs1_OBUF[24]),
        .I2(pcpi_rs2_OBUF[25]),
        .I3(pcpi_rs1_OBUF[25]),
        .O(decoder_trigger_i_14_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h44D4)) 
    decoder_trigger_i_18_lopt_merged
       (.I0(pcpi_rs1_OBUF[23]),
        .I1(pcpi_rs2_OBUF[23]),
        .I2(pcpi_rs2_OBUF[22]),
        .I3(pcpi_rs1_OBUF[22]),
        .O(decoder_trigger_i_18_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h44D4)) 
    decoder_trigger_i_19_lopt_merged
       (.I0(pcpi_rs1_OBUF[21]),
        .I1(pcpi_rs2_OBUF[21]),
        .I2(pcpi_rs2_OBUF[20]),
        .I3(pcpi_rs1_OBUF[20]),
        .O(decoder_trigger_i_19_n_0));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    decoder_trigger_i_2
       (.I0(mem_do_prefetch_reg_n_0),
        .I1(resetn_IBUF),
        .I2(is_sb_sh_sw_i_3_n_0),
        .O(decoder_trigger_i_2_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h44D4)) 
    decoder_trigger_i_20_lopt_merged
       (.I0(pcpi_rs1_OBUF[19]),
        .I1(pcpi_rs2_OBUF[19]),
        .I2(pcpi_rs2_OBUF[18]),
        .I3(pcpi_rs1_OBUF[18]),
        .O(decoder_trigger_i_20_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h44D4)) 
    decoder_trigger_i_21_lopt_merged
       (.I0(pcpi_rs1_OBUF[17]),
        .I1(pcpi_rs2_OBUF[17]),
        .I2(pcpi_rs2_OBUF[16]),
        .I3(pcpi_rs1_OBUF[16]),
        .O(decoder_trigger_i_21_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_22_lopt_merged
       (.I0(pcpi_rs2_OBUF[23]),
        .I1(pcpi_rs1_OBUF[23]),
        .I2(pcpi_rs2_OBUF[22]),
        .I3(pcpi_rs1_OBUF[22]),
        .O(decoder_trigger_i_22_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_23_lopt_merged
       (.I0(pcpi_rs2_OBUF[20]),
        .I1(pcpi_rs1_OBUF[20]),
        .I2(pcpi_rs2_OBUF[21]),
        .I3(pcpi_rs1_OBUF[21]),
        .O(decoder_trigger_i_23_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_24_lopt_merged
       (.I0(pcpi_rs2_OBUF[18]),
        .I1(pcpi_rs1_OBUF[18]),
        .I2(pcpi_rs2_OBUF[19]),
        .I3(pcpi_rs1_OBUF[19]),
        .O(decoder_trigger_i_24_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_25_lopt_merged
       (.I0(pcpi_rs2_OBUF[17]),
        .I1(pcpi_rs1_OBUF[17]),
        .I2(pcpi_rs2_OBUF[16]),
        .I3(pcpi_rs1_OBUF[16]),
        .O(decoder_trigger_i_25_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    decoder_trigger_i_28
       (.I0(pcpi_rs1_OBUF[28]),
        .I1(pcpi_rs2_OBUF[28]),
        .I2(pcpi_rs1_OBUF[29]),
        .I3(pcpi_rs2_OBUF[29]),
        .I4(pcpi_rs2_OBUF[27]),
        .I5(pcpi_rs1_OBUF[27]),
        .O(decoder_trigger_i_28_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    decoder_trigger_i_29
       (.I0(pcpi_rs1_OBUF[25]),
        .I1(pcpi_rs2_OBUF[25]),
        .I2(pcpi_rs1_OBUF[24]),
        .I3(pcpi_rs2_OBUF[24]),
        .I4(pcpi_rs2_OBUF[26]),
        .I5(pcpi_rs1_OBUF[26]),
        .O(decoder_trigger_i_29_n_0));
  LUT6 #(
    .INIT(64'h8088800088888888)) 
    decoder_trigger_i_3
       (.I0(\cpu_state_reg_n_0_[3] ),
        .I1(is_beq_bne_blt_bge_bltu_bgeu),
        .I2(is_slti_blt_slt),
        .I3(alu_lts),
        .I4(instr_bge),
        .I5(decoder_trigger_i_5_n_0),
        .O(decoder_trigger_i_3_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    decoder_trigger_i_31
       (.I0(pcpi_rs1_OBUF[31]),
        .I1(pcpi_rs2_OBUF[31]),
        .I2(pcpi_rs2_OBUF[30]),
        .I3(pcpi_rs1_OBUF[30]),
        .O(decoder_trigger_i_31_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h44D4)) 
    decoder_trigger_i_32_lopt_merged
       (.I0(pcpi_rs1_OBUF[29]),
        .I1(pcpi_rs2_OBUF[29]),
        .I2(pcpi_rs2_OBUF[28]),
        .I3(pcpi_rs1_OBUF[28]),
        .O(decoder_trigger_i_32_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h44D4)) 
    decoder_trigger_i_33_lopt_merged
       (.I0(pcpi_rs1_OBUF[27]),
        .I1(pcpi_rs2_OBUF[27]),
        .I2(pcpi_rs2_OBUF[26]),
        .I3(pcpi_rs1_OBUF[26]),
        .O(decoder_trigger_i_33_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h44D4)) 
    decoder_trigger_i_40_lopt_merged
       (.I0(pcpi_rs1_OBUF[15]),
        .I1(pcpi_rs2_OBUF[15]),
        .I2(pcpi_rs2_OBUF[14]),
        .I3(pcpi_rs1_OBUF[14]),
        .O(decoder_trigger_i_40_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h44D4)) 
    decoder_trigger_i_41_lopt_merged
       (.I0(pcpi_rs1_OBUF[13]),
        .I1(pcpi_rs2_OBUF[13]),
        .I2(pcpi_rs2_OBUF[12]),
        .I3(pcpi_rs1_OBUF[12]),
        .O(decoder_trigger_i_41_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h44D4)) 
    decoder_trigger_i_42_lopt_merged
       (.I0(pcpi_rs1_OBUF[11]),
        .I1(pcpi_rs2_OBUF[11]),
        .I2(pcpi_rs2_OBUF[10]),
        .I3(pcpi_rs1_OBUF[10]),
        .O(decoder_trigger_i_42_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h44D4)) 
    decoder_trigger_i_43_lopt_merged
       (.I0(pcpi_rs1_OBUF[9]),
        .I1(pcpi_rs2_OBUF[9]),
        .I2(pcpi_rs2_OBUF[8]),
        .I3(pcpi_rs1_OBUF[8]),
        .O(decoder_trigger_i_43_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_44_lopt_merged
       (.I0(pcpi_rs2_OBUF[14]),
        .I1(pcpi_rs1_OBUF[14]),
        .I2(pcpi_rs2_OBUF[15]),
        .I3(pcpi_rs1_OBUF[15]),
        .O(decoder_trigger_i_44_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_45_lopt_merged
       (.I0(pcpi_rs2_OBUF[12]),
        .I1(pcpi_rs1_OBUF[12]),
        .I2(pcpi_rs2_OBUF[13]),
        .I3(pcpi_rs1_OBUF[13]),
        .O(decoder_trigger_i_45_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_46_lopt_merged
       (.I0(pcpi_rs2_OBUF[11]),
        .I1(pcpi_rs1_OBUF[11]),
        .I2(pcpi_rs2_OBUF[10]),
        .I3(pcpi_rs1_OBUF[10]),
        .O(decoder_trigger_i_46_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_47_lopt_merged
       (.I0(pcpi_rs2_OBUF[8]),
        .I1(pcpi_rs1_OBUF[8]),
        .I2(pcpi_rs2_OBUF[9]),
        .I3(pcpi_rs1_OBUF[9]),
        .O(decoder_trigger_i_47_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    decoder_trigger_i_49
       (.I0(pcpi_rs1_OBUF[22]),
        .I1(pcpi_rs2_OBUF[22]),
        .I2(pcpi_rs1_OBUF[23]),
        .I3(pcpi_rs2_OBUF[23]),
        .I4(pcpi_rs2_OBUF[21]),
        .I5(pcpi_rs1_OBUF[21]),
        .O(decoder_trigger_i_49_n_0));
  LUT6 #(
    .INIT(64'h0000001D1D1D001D)) 
    decoder_trigger_i_5
       (.I0(instr_bne),
        .I1(alu_eq),
        .I2(instr_beq),
        .I3(instr_bgeu),
        .I4(alu_ltu),
        .I5(is_sltiu_bltu_sltu),
        .O(decoder_trigger_i_5_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    decoder_trigger_i_50
       (.I0(pcpi_rs1_OBUF[19]),
        .I1(pcpi_rs2_OBUF[19]),
        .I2(pcpi_rs1_OBUF[18]),
        .I3(pcpi_rs2_OBUF[18]),
        .I4(pcpi_rs2_OBUF[20]),
        .I5(pcpi_rs1_OBUF[20]),
        .O(decoder_trigger_i_50_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    decoder_trigger_i_51
       (.I0(pcpi_rs1_OBUF[16]),
        .I1(pcpi_rs2_OBUF[16]),
        .I2(pcpi_rs1_OBUF[17]),
        .I3(pcpi_rs2_OBUF[17]),
        .I4(pcpi_rs2_OBUF[15]),
        .I5(pcpi_rs1_OBUF[15]),
        .O(decoder_trigger_i_51_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    decoder_trigger_i_52
       (.I0(pcpi_rs1_OBUF[13]),
        .I1(pcpi_rs2_OBUF[13]),
        .I2(pcpi_rs1_OBUF[12]),
        .I3(pcpi_rs2_OBUF[12]),
        .I4(pcpi_rs2_OBUF[14]),
        .I5(pcpi_rs1_OBUF[14]),
        .O(decoder_trigger_i_52_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h44D4)) 
    decoder_trigger_i_62_lopt_merged
       (.I0(pcpi_rs1_OBUF[7]),
        .I1(pcpi_rs2_OBUF[7]),
        .I2(pcpi_rs2_OBUF[6]),
        .I3(pcpi_rs1_OBUF[6]),
        .O(decoder_trigger_i_62_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h44D4)) 
    decoder_trigger_i_63_lopt_merged
       (.I0(pcpi_rs1_OBUF[5]),
        .I1(pcpi_rs2_OBUF[5]),
        .I2(pcpi_rs2_OBUF[4]),
        .I3(pcpi_rs1_OBUF[4]),
        .O(decoder_trigger_i_63_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h44D4)) 
    decoder_trigger_i_64_lopt_merged
       (.I0(pcpi_rs1_OBUF[3]),
        .I1(pcpi_rs2_OBUF[3]),
        .I2(pcpi_rs2_OBUF[2]),
        .I3(pcpi_rs1_OBUF[2]),
        .O(decoder_trigger_i_64_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h44D4)) 
    decoder_trigger_i_65_lopt_merged
       (.I0(pcpi_rs1_OBUF[1]),
        .I1(pcpi_rs2_OBUF[1]),
        .I2(pcpi_rs2_OBUF[0]),
        .I3(pcpi_rs1_OBUF[0]),
        .O(decoder_trigger_i_65_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_66_lopt_merged
       (.I0(pcpi_rs2_OBUF[6]),
        .I1(pcpi_rs1_OBUF[6]),
        .I2(pcpi_rs2_OBUF[7]),
        .I3(pcpi_rs1_OBUF[7]),
        .O(decoder_trigger_i_66_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_67_lopt_merged
       (.I0(pcpi_rs2_OBUF[5]),
        .I1(pcpi_rs1_OBUF[5]),
        .I2(pcpi_rs2_OBUF[4]),
        .I3(pcpi_rs1_OBUF[4]),
        .O(decoder_trigger_i_67_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_68_lopt_merged
       (.I0(pcpi_rs2_OBUF[2]),
        .I1(pcpi_rs1_OBUF[2]),
        .I2(pcpi_rs2_OBUF[3]),
        .I3(pcpi_rs1_OBUF[3]),
        .O(decoder_trigger_i_68_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_69_lopt_merged
       (.I0(pcpi_rs2_OBUF[0]),
        .I1(pcpi_rs1_OBUF[0]),
        .I2(pcpi_rs2_OBUF[1]),
        .I3(pcpi_rs1_OBUF[1]),
        .O(decoder_trigger_i_69_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    decoder_trigger_i_7
       (.I0(pcpi_rs2_OBUF[30]),
        .I1(pcpi_rs1_OBUF[30]),
        .I2(pcpi_rs2_OBUF[31]),
        .I3(pcpi_rs1_OBUF[31]),
        .O(decoder_trigger_i_7_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    decoder_trigger_i_70
       (.I0(pcpi_rs1_OBUF[10]),
        .I1(pcpi_rs2_OBUF[10]),
        .I2(pcpi_rs1_OBUF[11]),
        .I3(pcpi_rs2_OBUF[11]),
        .I4(pcpi_rs2_OBUF[9]),
        .I5(pcpi_rs1_OBUF[9]),
        .O(decoder_trigger_i_70_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    decoder_trigger_i_71
       (.I0(pcpi_rs1_OBUF[7]),
        .I1(pcpi_rs2_OBUF[7]),
        .I2(pcpi_rs1_OBUF[6]),
        .I3(pcpi_rs2_OBUF[6]),
        .I4(pcpi_rs2_OBUF[8]),
        .I5(pcpi_rs1_OBUF[8]),
        .O(decoder_trigger_i_71_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    decoder_trigger_i_72
       (.I0(pcpi_rs1_OBUF[4]),
        .I1(pcpi_rs2_OBUF[4]),
        .I2(pcpi_rs1_OBUF[5]),
        .I3(pcpi_rs2_OBUF[5]),
        .I4(pcpi_rs2_OBUF[3]),
        .I5(pcpi_rs1_OBUF[3]),
        .O(decoder_trigger_i_72_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    decoder_trigger_i_73
       (.I0(pcpi_rs1_OBUF[1]),
        .I1(pcpi_rs2_OBUF[1]),
        .I2(pcpi_rs1_OBUF[0]),
        .I3(pcpi_rs2_OBUF[0]),
        .I4(pcpi_rs2_OBUF[2]),
        .I5(pcpi_rs1_OBUF[2]),
        .O(decoder_trigger_i_73_n_0));
  FDRE decoder_trigger_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(decoder_trigger_i_1_n_0),
        .Q(decoder_trigger_reg_n_0),
        .R(\<const0> ));
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_15
       (.CI(decoder_trigger_reg_i_26_n_0),
        .CO({alu_eq,NLW_decoder_trigger_reg_i_15_CO_UNCONNECTED[1:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({\<const0> ,decoder_trigger_i_11_n_0,decoder_trigger_i_28_n_0,decoder_trigger_i_29_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_16
       (.CI(decoder_trigger_reg_i_30_n_0),
        .CO({alu_ltu,NLW_decoder_trigger_reg_i_16_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({decoder_trigger_i_31_n_0,decoder_trigger_i_32_n_0,decoder_trigger_i_33_n_0,decoder_trigger_i_10_n_0}),
        .S({decoder_trigger_i_11_n_0,decoder_trigger_i_12_n_0,decoder_trigger_i_13_n_0,decoder_trigger_i_14_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_17
       (.CI(decoder_trigger_reg_i_39_n_0),
        .CO({decoder_trigger_reg_i_17_n_0,NLW_decoder_trigger_reg_i_17_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({decoder_trigger_i_40_n_0,decoder_trigger_i_41_n_0,decoder_trigger_i_42_n_0,decoder_trigger_i_43_n_0}),
        .S({decoder_trigger_i_44_n_0,decoder_trigger_i_45_n_0,decoder_trigger_i_46_n_0,decoder_trigger_i_47_n_0}));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_26
       (.CI(decoder_trigger_reg_i_48_n_0),
        .CO({decoder_trigger_reg_i_26_n_0,NLW_decoder_trigger_reg_i_26_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({decoder_trigger_i_49_n_0,decoder_trigger_i_50_n_0,decoder_trigger_i_51_n_0,decoder_trigger_i_52_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_30
       (.CI(decoder_trigger_reg_i_53_n_0),
        .CO({decoder_trigger_reg_i_30_n_0,NLW_decoder_trigger_reg_i_30_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({decoder_trigger_i_18_n_0,decoder_trigger_i_19_n_0,decoder_trigger_i_20_n_0,decoder_trigger_i_21_n_0}),
        .S({decoder_trigger_i_22_n_0,decoder_trigger_i_23_n_0,decoder_trigger_i_24_n_0,decoder_trigger_i_25_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_39
       (.CI(\<const0> ),
        .CO({decoder_trigger_reg_i_39_n_0,NLW_decoder_trigger_reg_i_39_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({decoder_trigger_i_62_n_0,decoder_trigger_i_63_n_0,decoder_trigger_i_64_n_0,decoder_trigger_i_65_n_0}),
        .S({decoder_trigger_i_66_n_0,decoder_trigger_i_67_n_0,decoder_trigger_i_68_n_0,decoder_trigger_i_69_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_4
       (.CI(decoder_trigger_reg_i_6_n_0),
        .CO({alu_lts,NLW_decoder_trigger_reg_i_4_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({decoder_trigger_i_7_n_0,decoder_trigger_i_32_n_0,decoder_trigger_i_33_n_0,decoder_trigger_i_10_n_0}),
        .S({decoder_trigger_i_11_n_0,decoder_trigger_i_12_n_0,decoder_trigger_i_13_n_0,decoder_trigger_i_14_n_0}));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_48
       (.CI(\<const0> ),
        .CO({decoder_trigger_reg_i_48_n_0,NLW_decoder_trigger_reg_i_48_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const1> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({decoder_trigger_i_70_n_0,decoder_trigger_i_71_n_0,decoder_trigger_i_72_n_0,decoder_trigger_i_73_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_53
       (.CI(decoder_trigger_reg_i_74_n_0),
        .CO({decoder_trigger_reg_i_53_n_0,NLW_decoder_trigger_reg_i_53_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({decoder_trigger_i_40_n_0,decoder_trigger_i_41_n_0,decoder_trigger_i_42_n_0,decoder_trigger_i_43_n_0}),
        .S({decoder_trigger_i_44_n_0,decoder_trigger_i_45_n_0,decoder_trigger_i_46_n_0,decoder_trigger_i_47_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_6
       (.CI(decoder_trigger_reg_i_17_n_0),
        .CO({decoder_trigger_reg_i_6_n_0,NLW_decoder_trigger_reg_i_6_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({decoder_trigger_i_18_n_0,decoder_trigger_i_19_n_0,decoder_trigger_i_20_n_0,decoder_trigger_i_21_n_0}),
        .S({decoder_trigger_i_22_n_0,decoder_trigger_i_23_n_0,decoder_trigger_i_24_n_0,decoder_trigger_i_25_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_74
       (.CI(\<const0> ),
        .CO({decoder_trigger_reg_i_74_n_0,NLW_decoder_trigger_reg_i_74_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({decoder_trigger_i_62_n_0,decoder_trigger_i_63_n_0,decoder_trigger_i_64_n_0,decoder_trigger_i_65_n_0}),
        .S({decoder_trigger_i_66_n_0,decoder_trigger_i_67_n_0,decoder_trigger_i_68_n_0,decoder_trigger_i_69_n_0}));
  OBUF \eoi_OBUF[0]_inst 
       (.I(\<const0> ),
        .O(eoi[0]));
  OBUF \eoi_OBUF[10]_inst 
       (.I(\<const0> ),
        .O(eoi[10]));
  OBUF \eoi_OBUF[11]_inst 
       (.I(\<const0> ),
        .O(eoi[11]));
  OBUF \eoi_OBUF[12]_inst 
       (.I(\<const0> ),
        .O(eoi[12]));
  OBUF \eoi_OBUF[13]_inst 
       (.I(\<const0> ),
        .O(eoi[13]));
  OBUF \eoi_OBUF[14]_inst 
       (.I(\<const0> ),
        .O(eoi[14]));
  OBUF \eoi_OBUF[15]_inst 
       (.I(\<const0> ),
        .O(eoi[15]));
  OBUF \eoi_OBUF[16]_inst 
       (.I(\<const0> ),
        .O(eoi[16]));
  OBUF \eoi_OBUF[17]_inst 
       (.I(\<const0> ),
        .O(eoi[17]));
  OBUF \eoi_OBUF[18]_inst 
       (.I(\<const0> ),
        .O(eoi[18]));
  OBUF \eoi_OBUF[19]_inst 
       (.I(\<const0> ),
        .O(eoi[19]));
  OBUF \eoi_OBUF[1]_inst 
       (.I(\<const0> ),
        .O(eoi[1]));
  OBUF \eoi_OBUF[20]_inst 
       (.I(\<const0> ),
        .O(eoi[20]));
  OBUF \eoi_OBUF[21]_inst 
       (.I(\<const0> ),
        .O(eoi[21]));
  OBUF \eoi_OBUF[22]_inst 
       (.I(\<const0> ),
        .O(eoi[22]));
  OBUF \eoi_OBUF[23]_inst 
       (.I(\<const0> ),
        .O(eoi[23]));
  OBUF \eoi_OBUF[24]_inst 
       (.I(\<const0> ),
        .O(eoi[24]));
  OBUF \eoi_OBUF[25]_inst 
       (.I(\<const0> ),
        .O(eoi[25]));
  OBUF \eoi_OBUF[26]_inst 
       (.I(\<const0> ),
        .O(eoi[26]));
  OBUF \eoi_OBUF[27]_inst 
       (.I(\<const0> ),
        .O(eoi[27]));
  OBUF \eoi_OBUF[28]_inst 
       (.I(\<const0> ),
        .O(eoi[28]));
  OBUF \eoi_OBUF[29]_inst 
       (.I(\<const0> ),
        .O(eoi[29]));
  OBUF \eoi_OBUF[2]_inst 
       (.I(\<const0> ),
        .O(eoi[2]));
  OBUF \eoi_OBUF[30]_inst 
       (.I(\<const0> ),
        .O(eoi[30]));
  OBUF \eoi_OBUF[31]_inst 
       (.I(\<const0> ),
        .O(eoi[31]));
  OBUF \eoi_OBUF[3]_inst 
       (.I(\<const0> ),
        .O(eoi[3]));
  OBUF \eoi_OBUF[4]_inst 
       (.I(\<const0> ),
        .O(eoi[4]));
  OBUF \eoi_OBUF[5]_inst 
       (.I(\<const0> ),
        .O(eoi[5]));
  OBUF \eoi_OBUF[6]_inst 
       (.I(\<const0> ),
        .O(eoi[6]));
  OBUF \eoi_OBUF[7]_inst 
       (.I(\<const0> ),
        .O(eoi[7]));
  OBUF \eoi_OBUF[8]_inst 
       (.I(\<const0> ),
        .O(eoi[8]));
  OBUF \eoi_OBUF[9]_inst 
       (.I(\<const0> ),
        .O(eoi[9]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    instr_add_i_1
       (.I0(instr_and_i_3_n_0),
        .I1(p_0_in[2]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(instr_add0));
  FDRE instr_add_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_add0),
        .Q(instr_add),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    instr_addi_i_1
       (.I0(is_alu_reg_imm),
        .I1(p_0_in[2]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(instr_addi0));
  FDRE instr_addi_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_addi0),
        .Q(instr_addi),
        .R(instr_and_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    instr_and_i_1
       (.I0(resetn_IBUF),
        .O(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    instr_and_i_2
       (.I0(instr_and_i_3_n_0),
        .I1(p_0_in[2]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(instr_and0));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    instr_and_i_3
       (.I0(is_alu_reg_reg),
        .I1(\mem_rdata_q_reg_n_0_[28] ),
        .I2(\mem_rdata_q_reg_n_0_[31] ),
        .I3(\mem_rdata_q_reg_n_0_[30] ),
        .I4(\mem_rdata_q_reg_n_0_[25] ),
        .I5(is_sll_srl_sra_i_4_n_0),
        .O(instr_and_i_3_n_0));
  FDRE instr_and_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_and0),
        .Q(instr_and),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    instr_andi_i_1
       (.I0(is_alu_reg_imm),
        .I1(p_0_in[2]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(instr_andi0));
  FDRE instr_andi_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_andi0),
        .Q(instr_andi),
        .R(instr_and_i_1_n_0));
  LUT6 #(
    .INIT(64'h001D0011000C0000)) 
    instr_auipc_i_1
       (.I0(mem_rdata_IBUF[5]),
        .I1(is_sb_sh_sw_i_6_n_0),
        .I2(\mem_rdata_q_reg_n_0_[5] ),
        .I3(is_sb_sh_sw_i_5_n_0),
        .I4(\mem_rdata_q_reg_n_0_[4] ),
        .I5(mem_rdata_IBUF[4]),
        .O(instr_auipc_i_1_n_0));
  FDRE instr_auipc_reg
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(instr_auipc_i_1_n_0),
        .Q(instr_auipc),
        .R(instr_jal_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    instr_beq_i_1
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(p_0_in[2]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(instr_beq0));
  FDRE instr_beq_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_beq0),
        .Q(instr_beq),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    instr_bge_i_1
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(p_0_in[2]),
        .I2(p_0_in[1]),
        .I3(p_0_in[0]),
        .O(instr_bge0));
  FDRE instr_bge_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_bge0),
        .Q(instr_bge),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    instr_bgeu_i_1
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(p_0_in[2]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(instr_bgeu0));
  FDRE instr_bgeu_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_bgeu0),
        .Q(instr_bgeu),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    instr_blt_i_1
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(p_0_in[0]),
        .I2(p_0_in[2]),
        .I3(p_0_in[1]),
        .O(instr_blt0));
  FDRE instr_blt_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_blt0),
        .Q(instr_blt),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    instr_bltu_i_1
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in[2]),
        .O(instr_bltu0));
  FDRE instr_bltu_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_bltu0),
        .Q(instr_bltu),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    instr_bne_i_1
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in[2]),
        .O(instr_bne0));
  FDRE instr_bne_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_bne0),
        .Q(instr_bne),
        .R(instr_and_i_1_n_0));
  LUT6 #(
    .INIT(64'h888A8A8AAA8A8A8A)) 
    instr_jal_i_1
       (.I0(instr_lui0),
        .I1(instr_jal_i_3_n_0),
        .I2(\mem_rdata_q_reg_n_0_[2] ),
        .I3(mem_valid_OBUF),
        .I4(mem_ready_IBUF),
        .I5(mem_rdata_IBUF[2]),
        .O(instr_jal_i_1_n_0));
  LUT6 #(
    .INIT(64'h4540050040400000)) 
    instr_jal_i_2
       (.I0(instr_jal_i_4_n_0),
        .I1(\mem_rdata_q_reg_n_0_[3] ),
        .I2(is_sb_sh_sw_i_6_n_0),
        .I3(mem_rdata_IBUF[3]),
        .I4(\mem_rdata_q_reg_n_0_[6] ),
        .I5(mem_rdata_IBUF[6]),
        .O(instr_jal_i_2_n_0));
  LUT6 #(
    .INIT(64'h5F3333335FFFFFFF)) 
    instr_jal_i_3
       (.I0(mem_rdata_IBUF[1]),
        .I1(\mem_rdata_q_reg_n_0_[1] ),
        .I2(mem_rdata_IBUF[0]),
        .I3(mem_ready_IBUF),
        .I4(mem_valid_OBUF),
        .I5(\mem_rdata_q_reg_n_0_[0] ),
        .O(instr_jal_i_3_n_0));
  LUT6 #(
    .INIT(64'hF5FFFFFFF5333333)) 
    instr_jal_i_4
       (.I0(mem_rdata_IBUF[5]),
        .I1(\mem_rdata_q_reg_n_0_[5] ),
        .I2(mem_rdata_IBUF[4]),
        .I3(mem_ready_IBUF),
        .I4(mem_valid_OBUF),
        .I5(\mem_rdata_q_reg_n_0_[4] ),
        .O(instr_jal_i_4_n_0));
  FDRE instr_jal_reg
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(instr_jal_i_2_n_0),
        .Q(instr_jal),
        .R(instr_jal_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000001000111)) 
    instr_jalr_i_1
       (.I0(\mem_rdata_q[14]_i_1_n_0 ),
        .I1(\mem_rdata_q[13]_i_1_n_0 ),
        .I2(p_0_in[0]),
        .I3(is_sb_sh_sw_i_6_n_0),
        .I4(mem_rdata_IBUF[12]),
        .I5(instr_jalr_i_2_n_0),
        .O(instr_jalr_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFBFBFFAFFBABF)) 
    instr_jalr_i_2
       (.I0(instr_jal_i_4_n_0),
        .I1(\mem_rdata_q_reg_n_0_[6] ),
        .I2(is_sb_sh_sw_i_6_n_0),
        .I3(mem_rdata_IBUF[6]),
        .I4(\mem_rdata_q_reg_n_0_[3] ),
        .I5(mem_rdata_IBUF[3]),
        .O(instr_jalr_i_2_n_0));
  FDRE instr_jalr_reg
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(instr_jalr_i_1_n_0),
        .Q(instr_jalr),
        .R(instr_jal_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'h01)) 
    instr_lb_i_1
       (.I0(p_0_in[2]),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .O(instr_lb_i_1_n_0));
  FDRE instr_lb_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_lb_i_1_n_0),
        .Q(instr_lb),
        .R(instr_lhu_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'h04)) 
    instr_lbu_i_1
       (.I0(p_0_in[0]),
        .I1(p_0_in[2]),
        .I2(p_0_in[1]),
        .O(instr_lbu_i_1_n_0));
  FDRE instr_lbu_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_lbu_i_1_n_0),
        .Q(instr_lbu),
        .R(instr_lhu_i_1_n_0));
  LUT3 #(
    .INIT(8'h04)) 
    instr_lh_i_1
       (.I0(p_0_in[1]),
        .I1(p_0_in[0]),
        .I2(p_0_in[2]),
        .O(instr_lh_i_1_n_0));
  FDRE instr_lh_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_lh_i_1_n_0),
        .Q(instr_lh),
        .R(instr_lhu_i_1_n_0));
  LUT3 #(
    .INIT(8'h04)) 
    instr_lhu_i_1
       (.I0(decoder_pseudo_trigger_reg_n_0),
        .I1(decoder_trigger_reg_n_0),
        .I2(is_lb_lh_lw_lbu_lhu),
        .O(instr_lhu_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'h20)) 
    instr_lhu_i_2
       (.I0(p_0_in[2]),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .O(instr_lhu_i_2_n_0));
  FDRE instr_lhu_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_lhu_i_2_n_0),
        .Q(instr_lhu),
        .R(instr_lhu_i_1_n_0));
  LUT6 #(
    .INIT(64'h00000000CCA000A0)) 
    instr_lui_i_1
       (.I0(mem_rdata_IBUF[4]),
        .I1(\mem_rdata_q_reg_n_0_[4] ),
        .I2(mem_rdata_IBUF[5]),
        .I3(is_sb_sh_sw_i_6_n_0),
        .I4(\mem_rdata_q_reg_n_0_[5] ),
        .I5(is_sb_sh_sw_i_5_n_0),
        .O(instr_lui_i_1_n_0));
  FDRE instr_lui_reg
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(instr_lui_i_1_n_0),
        .Q(instr_lui),
        .R(instr_jal_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'h02)) 
    instr_lw_i_1
       (.I0(p_0_in[1]),
        .I1(p_0_in[2]),
        .I2(p_0_in[0]),
        .O(instr_lw_i_1_n_0));
  FDRE instr_lw_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_lw_i_1_n_0),
        .Q(instr_lw),
        .R(instr_lhu_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    instr_or_i_1
       (.I0(instr_and_i_3_n_0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in[2]),
        .O(instr_or0));
  FDRE instr_or_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_or0),
        .Q(instr_or),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    instr_ori_i_1
       (.I0(is_alu_reg_imm),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in[2]),
        .O(instr_ori0));
  FDRE instr_ori_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_ori0),
        .Q(instr_ori),
        .R(instr_and_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    instr_rdcycle_i_1
       (.I0(instr_rdinstr_i_2_n_0),
        .I1(instr_rdcycleh_i_3_n_0),
        .O(instr_rdcycle0));
  FDRE instr_rdcycle_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_rdcycle0),
        .Q(instr_rdcycle),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h00000000101F1010)) 
    instr_rdcycleh_i_1
       (.I0(\mem_rdata_q_reg_n_0_[21] ),
        .I1(instr_rdinstrh_i_3_n_0),
        .I2(\mem_rdata_q_reg_n_0_[20] ),
        .I3(instr_rdcycleh_i_2_n_0),
        .I4(instr_rdcycleh_i_3_n_0),
        .I5(instr_rdinstrh_i_2_n_0),
        .O(instr_rdcycleh0));
  LUT6 #(
    .INIT(64'hFFFFFFFBFFFFFFFF)) 
    instr_rdcycleh_i_2
       (.I0(p_0_in[2]),
        .I1(\mem_rdata_q_reg_n_0_[30] ),
        .I2(\mem_rdata_q_reg_n_0_[26] ),
        .I3(\mem_rdata_q_reg_n_0_[25] ),
        .I4(\mem_rdata_q_reg_n_0_[24] ),
        .I5(instr_rdinstrh_i_6_n_0),
        .O(instr_rdcycleh_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000000000400)) 
    instr_rdcycleh_i_3
       (.I0(\mem_rdata_q_reg_n_0_[22] ),
        .I1(p_0_in[1]),
        .I2(\mem_rdata_q_reg_n_0_[23] ),
        .I3(\mem_rdata_q_reg_n_0_[31] ),
        .I4(instr_rdinstr_i_4_n_0),
        .I5(\mem_rdata_q_reg_n_0_[21] ),
        .O(instr_rdcycleh_i_3_n_0));
  FDRE instr_rdcycleh_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_rdcycleh0),
        .Q(instr_rdcycleh),
        .R(\<const0> ));
  LUT5 #(
    .INIT(32'h00000020)) 
    instr_rdinstr_i_1
       (.I0(instr_rdinstr_i_2_n_0),
        .I1(instr_rdinstr_i_3_n_0),
        .I2(\mem_rdata_q_reg_n_0_[21] ),
        .I3(\mem_rdata_q_reg_n_0_[20] ),
        .I4(instr_rdinstr_i_4_n_0),
        .O(instr_rdinstr0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    instr_rdinstr_i_2
       (.I0(p_0_in[0]),
        .I1(\mem_rdata_q_reg_n_0_[15] ),
        .I2(\mem_rdata_q_reg_n_0_[28] ),
        .I3(\mem_rdata_q_reg_n_0_[29] ),
        .I4(instr_rdinstr_i_5_n_0),
        .I5(instr_rdinstr_i_6_n_0),
        .O(instr_rdinstr_i_2_n_0));
  LUT4 #(
    .INIT(16'hFFDF)) 
    instr_rdinstr_i_3
       (.I0(\mem_rdata_q_reg_n_0_[31] ),
        .I1(\mem_rdata_q_reg_n_0_[23] ),
        .I2(p_0_in[1]),
        .I3(\mem_rdata_q_reg_n_0_[22] ),
        .O(instr_rdinstr_i_3_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    instr_rdinstr_i_4
       (.I0(\mem_rdata_q_reg_n_0_[19] ),
        .I1(\mem_rdata_q_reg_n_0_[18] ),
        .I2(\mem_rdata_q_reg_n_0_[17] ),
        .I3(\mem_rdata_q_reg_n_0_[16] ),
        .O(instr_rdinstr_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEFF)) 
    instr_rdinstr_i_5
       (.I0(\mem_rdata_q_reg_n_0_[27] ),
        .I1(\mem_rdata_q_reg_n_0_[26] ),
        .I2(p_0_in[2]),
        .I3(\mem_rdata_q_reg_n_0_[30] ),
        .I4(\mem_rdata_q_reg_n_0_[24] ),
        .I5(\mem_rdata_q_reg_n_0_[25] ),
        .O(instr_rdinstr_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hFFDF)) 
    instr_rdinstr_i_6
       (.I0(\mem_rdata_q_reg_n_0_[4] ),
        .I1(\mem_rdata_q_reg_n_0_[2] ),
        .I2(\mem_rdata_q_reg_n_0_[5] ),
        .I3(instr_rdinstrh_i_4_n_0),
        .O(instr_rdinstr_i_6_n_0));
  FDRE instr_rdinstr_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_rdinstr0),
        .Q(instr_rdinstr),
        .R(\<const0> ));
  LUT4 #(
    .INIT(16'h0010)) 
    instr_rdinstrh_i_1
       (.I0(instr_rdinstrh_i_2_n_0),
        .I1(\mem_rdata_q_reg_n_0_[20] ),
        .I2(\mem_rdata_q_reg_n_0_[21] ),
        .I3(instr_rdinstrh_i_3_n_0),
        .O(instr_rdinstrh0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'hFBFFFFFF)) 
    instr_rdinstrh_i_2
       (.I0(instr_rdinstrh_i_4_n_0),
        .I1(\mem_rdata_q_reg_n_0_[5] ),
        .I2(\mem_rdata_q_reg_n_0_[2] ),
        .I3(\mem_rdata_q_reg_n_0_[4] ),
        .I4(\mem_rdata_q_reg_n_0_[27] ),
        .O(instr_rdinstrh_i_2_n_0));
  LUT4 #(
    .INIT(16'hFFFB)) 
    instr_rdinstrh_i_3
       (.I0(instr_rdinstrh_i_5_n_0),
        .I1(instr_rdinstrh_i_6_n_0),
        .I2(instr_rdinstr_i_3_n_0),
        .I3(instr_rdinstr_i_4_n_0),
        .O(instr_rdinstrh_i_3_n_0));
  LUT4 #(
    .INIT(16'hFF7F)) 
    instr_rdinstrh_i_4
       (.I0(\mem_rdata_q_reg_n_0_[1] ),
        .I1(\mem_rdata_q_reg_n_0_[0] ),
        .I2(\mem_rdata_q_reg_n_0_[6] ),
        .I3(\mem_rdata_q_reg_n_0_[3] ),
        .O(instr_rdinstrh_i_4_n_0));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    instr_rdinstrh_i_5
       (.I0(\mem_rdata_q_reg_n_0_[24] ),
        .I1(\mem_rdata_q_reg_n_0_[25] ),
        .I2(\mem_rdata_q_reg_n_0_[26] ),
        .I3(\mem_rdata_q_reg_n_0_[30] ),
        .I4(p_0_in[2]),
        .O(instr_rdinstrh_i_5_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    instr_rdinstrh_i_6
       (.I0(\mem_rdata_q_reg_n_0_[29] ),
        .I1(\mem_rdata_q_reg_n_0_[28] ),
        .I2(\mem_rdata_q_reg_n_0_[15] ),
        .I3(p_0_in[0]),
        .O(instr_rdinstrh_i_6_n_0));
  FDRE instr_rdinstrh_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_rdinstrh0),
        .Q(instr_rdinstrh),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    instr_sb_i_1
       (.I0(is_sb_sh_sw),
        .I1(p_0_in[2]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(instr_sb0));
  FDRE instr_sb_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_sb0),
        .Q(instr_sb),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    instr_sh_i_1
       (.I0(is_sb_sh_sw),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in[2]),
        .O(instr_sh0));
  FDRE instr_sh_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_sh0),
        .Q(instr_sh),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    instr_sll_i_1
       (.I0(instr_and_i_3_n_0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in[2]),
        .O(instr_sll0));
  FDRE instr_sll_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_sll0),
        .Q(instr_sll),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00000400)) 
    instr_slli_i_1
       (.I0(p_0_in[1]),
        .I1(p_0_in[0]),
        .I2(p_0_in[2]),
        .I3(is_alu_reg_imm),
        .I4(instr_srli_i_2_n_0),
        .O(instr_slli0));
  FDRE instr_slli_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_slli0),
        .Q(instr_slli),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    instr_slt_i_1
       (.I0(instr_and_i_3_n_0),
        .I1(p_0_in[1]),
        .I2(p_0_in[2]),
        .I3(p_0_in[0]),
        .O(instr_slt0));
  FDRE instr_slt_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_slt0),
        .Q(instr_slt),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    instr_slti_i_1
       (.I0(is_alu_reg_imm),
        .I1(p_0_in[1]),
        .I2(p_0_in[2]),
        .I3(p_0_in[0]),
        .O(instr_slti0));
  FDRE instr_slti_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_slti0),
        .Q(instr_slti),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    instr_sltiu_i_1
       (.I0(p_0_in[0]),
        .I1(p_0_in[1]),
        .I2(p_0_in[2]),
        .I3(is_alu_reg_imm),
        .O(instr_sltiu_i_1_n_0));
  FDRE instr_sltiu_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_sltiu_i_1_n_0),
        .Q(instr_sltiu),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    instr_sltu_i_1
       (.I0(p_0_in[0]),
        .I1(p_0_in[1]),
        .I2(p_0_in[2]),
        .I3(instr_and_i_3_n_0),
        .O(instr_sltu0));
  FDRE instr_sltu_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_sltu0),
        .Q(instr_sltu),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    instr_sra_i_1
       (.I0(p_0_in[2]),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(instr_sra_i_2_n_0),
        .O(instr_sra0));
  LUT6 #(
    .INIT(64'hFFFFFFEFFFFFFFFF)) 
    instr_sra_i_2
       (.I0(\mem_rdata_q_reg_n_0_[28] ),
        .I1(\mem_rdata_q_reg_n_0_[31] ),
        .I2(\mem_rdata_q_reg_n_0_[30] ),
        .I3(\mem_rdata_q_reg_n_0_[25] ),
        .I4(is_sll_srl_sra_i_4_n_0),
        .I5(is_alu_reg_reg),
        .O(instr_sra_i_2_n_0));
  FDRE instr_sra_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_sra0),
        .Q(instr_sra),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'h04000000)) 
    instr_srai_i_1
       (.I0(instr_srai_i_2_n_0),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .I3(p_0_in[2]),
        .I4(is_alu_reg_imm),
        .O(instr_srai_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hFFFFFFEF)) 
    instr_srai_i_2
       (.I0(is_sll_srl_sra_i_4_n_0),
        .I1(\mem_rdata_q_reg_n_0_[25] ),
        .I2(\mem_rdata_q_reg_n_0_[30] ),
        .I3(\mem_rdata_q_reg_n_0_[31] ),
        .I4(\mem_rdata_q_reg_n_0_[28] ),
        .O(instr_srai_i_2_n_0));
  FDRE instr_srai_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_srai_i_1_n_0),
        .Q(instr_srai),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    instr_srl_i_1
       (.I0(instr_and_i_3_n_0),
        .I1(p_0_in[2]),
        .I2(p_0_in[1]),
        .I3(p_0_in[0]),
        .O(instr_srl0));
  FDRE instr_srl_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_srl0),
        .Q(instr_srl),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00002000)) 
    instr_srli_i_1
       (.I0(p_0_in[2]),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(is_alu_reg_imm),
        .I4(instr_srli_i_2_n_0),
        .O(instr_srli0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    instr_srli_i_2
       (.I0(is_sll_srl_sra_i_4_n_0),
        .I1(\mem_rdata_q_reg_n_0_[25] ),
        .I2(\mem_rdata_q_reg_n_0_[30] ),
        .I3(\mem_rdata_q_reg_n_0_[31] ),
        .I4(\mem_rdata_q_reg_n_0_[28] ),
        .O(instr_srli_i_2_n_0));
  FDRE instr_srli_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_srli0),
        .Q(instr_srli),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    instr_sub_i_1
       (.I0(p_0_in[2]),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .I3(instr_sra_i_2_n_0),
        .O(instr_sub0));
  FDRE instr_sub_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_sub0),
        .Q(instr_sub),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    instr_sw_i_1
       (.I0(is_sb_sh_sw),
        .I1(p_0_in[1]),
        .I2(p_0_in[2]),
        .I3(p_0_in[0]),
        .O(instr_sw0));
  FDRE instr_sw_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_sw0),
        .Q(instr_sw),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    instr_xor_i_1
       (.I0(instr_and_i_3_n_0),
        .I1(p_0_in[0]),
        .I2(p_0_in[2]),
        .I3(p_0_in[1]),
        .O(instr_xor0));
  FDRE instr_xor_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_xor0),
        .Q(instr_xor),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    instr_xori_i_1
       (.I0(is_alu_reg_imm),
        .I1(p_0_in[0]),
        .I2(p_0_in[2]),
        .I3(p_0_in[1]),
        .O(instr_xori0));
  FDRE instr_xori_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_xori0),
        .Q(instr_xori),
        .R(instr_and_i_1_n_0));
  LUT6 #(
    .INIT(64'h00000000000002A2)) 
    is_alu_reg_imm_i_1
       (.I0(is_sb_sh_sw_i_4_n_0),
        .I1(mem_rdata_IBUF[5]),
        .I2(is_sb_sh_sw_i_6_n_0),
        .I3(\mem_rdata_q_reg_n_0_[5] ),
        .I4(is_sb_sh_sw_i_5_n_0),
        .I5(is_sb_sh_sw_i_7_n_0),
        .O(is_alu_reg_imm_i_1_n_0));
  FDRE is_alu_reg_imm_reg
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(is_alu_reg_imm_i_1_n_0),
        .Q(is_alu_reg_imm),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h0000000022200020)) 
    is_alu_reg_reg_i_1
       (.I0(is_sb_sh_sw_i_4_n_0),
        .I1(is_sb_sh_sw_i_7_n_0),
        .I2(mem_rdata_IBUF[5]),
        .I3(is_sb_sh_sw_i_6_n_0),
        .I4(\mem_rdata_q_reg_n_0_[5] ),
        .I5(is_sb_sh_sw_i_5_n_0),
        .O(is_alu_reg_reg_i_1_n_0));
  FDRE is_alu_reg_reg_reg
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(is_alu_reg_reg_i_1_n_0),
        .Q(is_alu_reg_reg),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT4 #(
    .INIT(16'h2F20)) 
    is_beq_bne_blt_bge_bltu_bgeu_i_1
       (.I0(is_sb_sh_sw_i_4_n_0),
        .I1(instr_jalr_i_2_n_0),
        .I2(instr_lui0),
        .I3(is_beq_bne_blt_bge_bltu_bgeu),
        .O(is_beq_bne_blt_bge_bltu_bgeu_i_1_n_0));
  FDRE is_beq_bne_blt_bge_bltu_bgeu_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(is_beq_bne_blt_bge_bltu_bgeu_i_1_n_0),
        .Q(is_beq_bne_blt_bge_bltu_bgeu),
        .R(instr_and_i_1_n_0));
  LUT6 #(
    .INIT(64'h00000000FFFE0000)) 
    is_compare_i_1
       (.I0(instr_slti),
        .I1(instr_sltiu),
        .I2(is_beq_bne_blt_bge_bltu_bgeu),
        .I3(is_compare_i_2_n_0),
        .I4(resetn_IBUF),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub0),
        .O(is_compare_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'hE)) 
    is_compare_i_2
       (.I0(instr_slt),
        .I1(instr_sltu),
        .O(is_compare_i_2_n_0));
  FDRE is_compare_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(is_compare_i_1_n_0),
        .Q(is_compare),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'hEAEE)) 
    is_jalr_addi_slti_sltiu_xori_ori_andi_i_1
       (.I0(instr_jalr),
        .I1(is_alu_reg_imm),
        .I2(p_0_in[1]),
        .I3(p_0_in[0]),
        .O(is_jalr_addi_slti_sltiu_xori_ori_andi0));
  FDRE is_jalr_addi_slti_sltiu_xori_ori_andi_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(is_jalr_addi_slti_sltiu_xori_ori_andi0),
        .Q(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h1015000000000000)) 
    is_lb_lh_lw_lbu_lhu_i_1
       (.I0(is_sb_sh_sw_i_5_n_0),
        .I1(\mem_rdata_q_reg_n_0_[5] ),
        .I2(is_sb_sh_sw_i_6_n_0),
        .I3(mem_rdata_IBUF[5]),
        .I4(is_sb_sh_sw_i_4_n_0),
        .I5(is_sb_sh_sw_i_7_n_0),
        .O(is_lb_lh_lw_lbu_lhu_i_1_n_0));
  FDRE is_lb_lh_lw_lbu_lhu_reg
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(is_lb_lh_lw_lbu_lhu_i_1_n_0),
        .Q(is_lb_lh_lw_lbu_lhu),
        .R(\<const0> ));
  LUT3 #(
    .INIT(8'hFE)) 
    is_lbu_lhu_lw_i_1
       (.I0(instr_lw),
        .I1(instr_lbu),
        .I2(instr_lhu),
        .O(is_lbu_lhu_lw_i_1_n_0));
  FDRE is_lbu_lhu_lw_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(is_lbu_lhu_lw_i_1_n_0),
        .Q(is_lbu_lhu_lw),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    is_lui_auipc_jal_i_1
       (.I0(instr_jal),
        .I1(instr_auipc),
        .I2(instr_lui),
        .O(is_lui_auipc_jal_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFE0000FFFEFFFE)) 
    is_lui_auipc_jal_jalr_addi_add_sub_i_1
       (.I0(instr_sub),
        .I1(instr_add),
        .I2(instr_addi),
        .I3(is_lui_auipc_jal_jalr_addi_add_sub_i_2_n_0),
        .I4(decoder_pseudo_trigger_reg_n_0),
        .I5(decoder_trigger_reg_n_0),
        .O(is_lui_auipc_jal_jalr_addi_add_sub_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    is_lui_auipc_jal_jalr_addi_add_sub_i_2
       (.I0(instr_jalr),
        .I1(instr_lui),
        .I2(instr_auipc),
        .I3(instr_jal),
        .O(is_lui_auipc_jal_jalr_addi_add_sub_i_2_n_0));
  FDRE is_lui_auipc_jal_jalr_addi_add_sub_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(is_lui_auipc_jal_jalr_addi_add_sub_i_1_n_0),
        .Q(is_lui_auipc_jal_jalr_addi_add_sub),
        .R(\<const0> ));
  FDRE is_lui_auipc_jal_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(is_lui_auipc_jal_i_1_n_0),
        .Q(is_lui_auipc_jal),
        .R(\<const0> ));
  LUT3 #(
    .INIT(8'h08)) 
    is_sb_sh_sw_i_1
       (.I0(mem_do_rinst_reg_n_0),
        .I1(resetn_IBUF),
        .I2(is_sb_sh_sw_i_3_n_0),
        .O(instr_lui0));
  LUT6 #(
    .INIT(64'h2220002000000000)) 
    is_sb_sh_sw_i_2
       (.I0(is_sb_sh_sw_i_4_n_0),
        .I1(is_sb_sh_sw_i_5_n_0),
        .I2(mem_rdata_IBUF[5]),
        .I3(is_sb_sh_sw_i_6_n_0),
        .I4(\mem_rdata_q_reg_n_0_[5] ),
        .I5(is_sb_sh_sw_i_7_n_0),
        .O(is_sb_sh_sw_i_2_n_0));
  LUT6 #(
    .INIT(64'h71717171F1F1F1FF)) 
    is_sb_sh_sw_i_3
       (.I0(\mem_state_reg_n_0_[0] ),
        .I1(\mem_state_reg_n_0_[1] ),
        .I2(is_sb_sh_sw_i_6_n_0),
        .I3(mem_do_wdata),
        .I4(mem_do_rdata),
        .I5(mem_do_rinst_reg_n_0),
        .O(is_sb_sh_sw_i_3_n_0));
  LUT6 #(
    .INIT(64'h4540050040400000)) 
    is_sb_sh_sw_i_4
       (.I0(\mem_rdata_q[2]_i_1_n_0 ),
        .I1(\mem_rdata_q_reg_n_0_[0] ),
        .I2(is_sb_sh_sw_i_6_n_0),
        .I3(mem_rdata_IBUF[0]),
        .I4(\mem_rdata_q_reg_n_0_[1] ),
        .I5(mem_rdata_IBUF[1]),
        .O(is_sb_sh_sw_i_4_n_0));
  LUT6 #(
    .INIT(64'hFAFFFFFFFACCCCCC)) 
    is_sb_sh_sw_i_5
       (.I0(mem_rdata_IBUF[6]),
        .I1(\mem_rdata_q_reg_n_0_[6] ),
        .I2(mem_rdata_IBUF[3]),
        .I3(mem_ready_IBUF),
        .I4(mem_valid_OBUF),
        .I5(\mem_rdata_q_reg_n_0_[3] ),
        .O(is_sb_sh_sw_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h7)) 
    is_sb_sh_sw_i_6
       (.I0(mem_valid_OBUF),
        .I1(mem_ready_IBUF),
        .O(is_sb_sh_sw_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h15D5)) 
    is_sb_sh_sw_i_7
       (.I0(\mem_rdata_q_reg_n_0_[4] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[4]),
        .O(is_sb_sh_sw_i_7_n_0));
  FDRE is_sb_sh_sw_reg
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(is_sb_sh_sw_i_2_n_0),
        .Q(is_sb_sh_sw),
        .R(\<const0> ));
  LUT2 #(
    .INIT(4'h2)) 
    is_sll_srl_sra_i_1
       (.I0(decoder_trigger_reg_n_0),
        .I1(decoder_pseudo_trigger_reg_n_0),
        .O(is_lui_auipc_jal_jalr_addi_add_sub0));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT2 #(
    .INIT(4'h2)) 
    is_sll_srl_sra_i_2
       (.I0(is_alu_reg_reg),
        .I1(is_sll_srl_sra_i_3_n_0),
        .O(is_sll_srl_sra0));
  LUT6 #(
    .INIT(64'hFFFFFFEEFFFFFFFE)) 
    is_sll_srl_sra_i_3
       (.I0(is_sll_srl_sra_i_4_n_0),
        .I1(\mem_rdata_q_reg_n_0_[25] ),
        .I2(\mem_rdata_q_reg_n_0_[30] ),
        .I3(is_sll_srl_sra_i_5_n_0),
        .I4(is_sll_srl_sra_i_6_n_0),
        .I5(p_0_in[2]),
        .O(is_sll_srl_sra_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    is_sll_srl_sra_i_4
       (.I0(\mem_rdata_q_reg_n_0_[29] ),
        .I1(\mem_rdata_q_reg_n_0_[27] ),
        .I2(\mem_rdata_q_reg_n_0_[26] ),
        .O(is_sll_srl_sra_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'hE)) 
    is_sll_srl_sra_i_5
       (.I0(\mem_rdata_q_reg_n_0_[31] ),
        .I1(\mem_rdata_q_reg_n_0_[28] ),
        .O(is_sll_srl_sra_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'hB)) 
    is_sll_srl_sra_i_6
       (.I0(p_0_in[1]),
        .I1(p_0_in[0]),
        .O(is_sll_srl_sra_i_6_n_0));
  FDRE is_sll_srl_sra_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(is_sll_srl_sra0),
        .Q(is_sll_srl_sra),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT2 #(
    .INIT(4'h2)) 
    is_slli_srli_srai_i_1
       (.I0(is_alu_reg_imm),
        .I1(is_sll_srl_sra_i_3_n_0),
        .O(is_slli_srli_srai0));
  FDRE is_slli_srli_srai_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(is_slli_srli_srai0),
        .Q(is_slli_srli_srai),
        .R(\<const0> ));
  LUT3 #(
    .INIT(8'hFE)) 
    is_slti_blt_slt_i_1
       (.I0(instr_slt),
        .I1(instr_slti),
        .I2(instr_blt),
        .O(is_slti_blt_slt_i_1_n_0));
  FDRE is_slti_blt_slt_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(is_slti_blt_slt_i_1_n_0),
        .Q(is_slti_blt_slt),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    is_sltiu_bltu_sltu_i_1
       (.I0(instr_sltu),
        .I1(instr_sltiu),
        .I2(instr_bltu),
        .O(is_sltiu_bltu_sltu_i_1_n_0));
  FDRE is_sltiu_bltu_sltu_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(is_sltiu_bltu_sltu_i_1_n_0),
        .Q(is_sltiu_bltu_sltu),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'hEEEFEEE0)) 
    latched_branch_i_1
       (.I0(decoder_trigger_i_3_n_0),
        .I1(latched_branch_i_2_n_0),
        .I2(reg_next_pc),
        .I3(\cpu_state_reg_n_0_[3] ),
        .I4(latched_branch_reg_n_0),
        .O(latched_branch_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h0088F088)) 
    latched_branch_i_2
       (.I0(decoder_trigger_reg_n_0),
        .I1(instr_jal),
        .I2(instr_jalr),
        .I3(\cpu_state_reg_n_0_[3] ),
        .I4(is_beq_bne_blt_bge_bltu_bgeu),
        .O(latched_branch_i_2_n_0));
  FDRE latched_branch_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(latched_branch_i_1_n_0),
        .Q(latched_branch_reg_n_0),
        .R(instr_and_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F20)) 
    latched_is_lb_i_1
       (.I0(instr_lb),
        .I1(reg_next_pc),
        .I2(latched_is_lu),
        .I3(latched_is_lb_reg_n_0),
        .O(latched_is_lb_i_1_n_0));
  FDRE latched_is_lb_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(latched_is_lb_i_1_n_0),
        .Q(latched_is_lb_reg_n_0),
        .R(instr_and_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F20)) 
    latched_is_lh_i_1
       (.I0(instr_lh),
        .I1(reg_next_pc),
        .I2(latched_is_lu),
        .I3(latched_is_lh_reg_n_0),
        .O(latched_is_lh_i_1_n_0));
  FDRE latched_is_lh_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(latched_is_lh_i_1_n_0),
        .Q(latched_is_lh_reg_n_0),
        .R(instr_and_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F20)) 
    latched_is_lu_i_1
       (.I0(is_lbu_lhu_lw),
        .I1(reg_next_pc),
        .I2(latched_is_lu),
        .I3(latched_is_lu_reg_n_0),
        .O(latched_is_lu_i_1_n_0));
  FDRE latched_is_lu_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(latched_is_lu_i_1_n_0),
        .Q(latched_is_lu_reg_n_0),
        .R(instr_and_i_1_n_0));
  LUT4 #(
    .INIT(16'h0080)) 
    \latched_rd[4]_i_1 
       (.I0(\cpu_state_reg_n_0_[3] ),
        .I1(is_beq_bne_blt_bge_bltu_bgeu),
        .I2(resetn_IBUF),
        .I3(reg_next_pc),
        .O(\latched_rd[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hAA80)) 
    \latched_rd[4]_i_2 
       (.I0(resetn_IBUF),
        .I1(is_beq_bne_blt_bge_bltu_bgeu),
        .I2(\cpu_state_reg_n_0_[3] ),
        .I3(reg_next_pc),
        .O(\latched_rd[4]_i_2_n_0 ));
  FDRE \latched_rd_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\latched_rd[4]_i_2_n_0 ),
        .D(decoded_rd[0]),
        .Q(latched_rd[0]),
        .R(\latched_rd[4]_i_1_n_0 ));
  FDRE \latched_rd_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\latched_rd[4]_i_2_n_0 ),
        .D(decoded_rd[1]),
        .Q(latched_rd[1]),
        .R(\latched_rd[4]_i_1_n_0 ));
  FDRE \latched_rd_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\latched_rd[4]_i_2_n_0 ),
        .D(decoded_rd[2]),
        .Q(latched_rd[2]),
        .R(\latched_rd[4]_i_1_n_0 ));
  FDRE \latched_rd_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\latched_rd[4]_i_2_n_0 ),
        .D(decoded_rd[3]),
        .Q(latched_rd[3]),
        .R(\latched_rd[4]_i_1_n_0 ));
  FDRE \latched_rd_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\latched_rd[4]_i_2_n_0 ),
        .D(decoded_rd[4]),
        .Q(latched_rd[4]),
        .R(\latched_rd[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'h5510)) 
    latched_stalu_i_1
       (.I0(reg_next_pc),
        .I1(is_beq_bne_blt_bge_bltu_bgeu),
        .I2(\cpu_state_reg_n_0_[3] ),
        .I3(latched_stalu_reg_n_0),
        .O(latched_stalu_i_1_n_0));
  FDRE latched_stalu_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(latched_stalu_i_1_n_0),
        .Q(latched_stalu_reg_n_0),
        .R(instr_and_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFF1FFFFFFF10000)) 
    latched_store_i_1
       (.I0(\alu_out_q[0]_i_3_n_0 ),
        .I1(reg_next_pc),
        .I2(latched_store_i_2_n_0),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(latched_store_i_3_n_0),
        .I5(latched_store_reg_n_0),
        .O(latched_store_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'h15)) 
    latched_store_i_2
       (.I0(reg_next_pc),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(is_beq_bne_blt_bge_bltu_bgeu),
        .O(latched_store_i_2_n_0));
  LUT6 #(
    .INIT(64'h5455545454555455)) 
    latched_store_i_3
       (.I0(\cpu_state_reg_n_0_[1] ),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[7] ),
        .I4(\cpu_state[6]_i_2_n_0 ),
        .I5(\cpu_state_reg_n_0_[5] ),
        .O(latched_store_i_3_n_0));
  FDRE latched_store_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(latched_store_i_1_n_0),
        .Q(latched_store_reg_n_0),
        .R(instr_and_i_1_n_0));
  OBUF \mem_addr_OBUF[0]_inst 
       (.I(\<const0> ),
        .O(mem_addr[0]));
  OBUF \mem_addr_OBUF[10]_inst 
       (.I(mem_addr_OBUF[10]),
        .O(mem_addr[10]));
  OBUF \mem_addr_OBUF[11]_inst 
       (.I(mem_addr_OBUF[11]),
        .O(mem_addr[11]));
  OBUF \mem_addr_OBUF[12]_inst 
       (.I(mem_addr_OBUF[12]),
        .O(mem_addr[12]));
  OBUF \mem_addr_OBUF[13]_inst 
       (.I(mem_addr_OBUF[13]),
        .O(mem_addr[13]));
  OBUF \mem_addr_OBUF[14]_inst 
       (.I(mem_addr_OBUF[14]),
        .O(mem_addr[14]));
  OBUF \mem_addr_OBUF[15]_inst 
       (.I(mem_addr_OBUF[15]),
        .O(mem_addr[15]));
  OBUF \mem_addr_OBUF[16]_inst 
       (.I(mem_addr_OBUF[16]),
        .O(mem_addr[16]));
  OBUF \mem_addr_OBUF[17]_inst 
       (.I(mem_addr_OBUF[17]),
        .O(mem_addr[17]));
  OBUF \mem_addr_OBUF[18]_inst 
       (.I(mem_addr_OBUF[18]),
        .O(mem_addr[18]));
  OBUF \mem_addr_OBUF[19]_inst 
       (.I(mem_addr_OBUF[19]),
        .O(mem_addr[19]));
  OBUF \mem_addr_OBUF[1]_inst 
       (.I(\<const0> ),
        .O(mem_addr[1]));
  OBUF \mem_addr_OBUF[20]_inst 
       (.I(mem_addr_OBUF[20]),
        .O(mem_addr[20]));
  OBUF \mem_addr_OBUF[21]_inst 
       (.I(mem_addr_OBUF[21]),
        .O(mem_addr[21]));
  OBUF \mem_addr_OBUF[22]_inst 
       (.I(mem_addr_OBUF[22]),
        .O(mem_addr[22]));
  OBUF \mem_addr_OBUF[23]_inst 
       (.I(mem_addr_OBUF[23]),
        .O(mem_addr[23]));
  OBUF \mem_addr_OBUF[24]_inst 
       (.I(mem_addr_OBUF[24]),
        .O(mem_addr[24]));
  OBUF \mem_addr_OBUF[25]_inst 
       (.I(mem_addr_OBUF[25]),
        .O(mem_addr[25]));
  OBUF \mem_addr_OBUF[26]_inst 
       (.I(mem_addr_OBUF[26]),
        .O(mem_addr[26]));
  OBUF \mem_addr_OBUF[27]_inst 
       (.I(mem_addr_OBUF[27]),
        .O(mem_addr[27]));
  OBUF \mem_addr_OBUF[28]_inst 
       (.I(mem_addr_OBUF[28]),
        .O(mem_addr[28]));
  OBUF \mem_addr_OBUF[29]_inst 
       (.I(mem_addr_OBUF[29]),
        .O(mem_addr[29]));
  OBUF \mem_addr_OBUF[2]_inst 
       (.I(mem_addr_OBUF[2]),
        .O(mem_addr[2]));
  OBUF \mem_addr_OBUF[30]_inst 
       (.I(mem_addr_OBUF[30]),
        .O(mem_addr[30]));
  OBUF \mem_addr_OBUF[31]_inst 
       (.I(mem_addr_OBUF[31]),
        .O(mem_addr[31]));
  OBUF \mem_addr_OBUF[3]_inst 
       (.I(mem_addr_OBUF[3]),
        .O(mem_addr[3]));
  OBUF \mem_addr_OBUF[4]_inst 
       (.I(mem_addr_OBUF[4]),
        .O(mem_addr[4]));
  OBUF \mem_addr_OBUF[5]_inst 
       (.I(mem_addr_OBUF[5]),
        .O(mem_addr[5]));
  OBUF \mem_addr_OBUF[6]_inst 
       (.I(mem_addr_OBUF[6]),
        .O(mem_addr[6]));
  OBUF \mem_addr_OBUF[7]_inst 
       (.I(mem_addr_OBUF[7]),
        .O(mem_addr[7]));
  OBUF \mem_addr_OBUF[8]_inst 
       (.I(mem_addr_OBUF[8]),
        .O(mem_addr[8]));
  OBUF \mem_addr_OBUF[9]_inst 
       (.I(mem_addr_OBUF[9]),
        .O(mem_addr[9]));
  FDRE \mem_addr_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[10]),
        .Q(mem_addr_OBUF[10]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[11]),
        .Q(mem_addr_OBUF[11]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[12]),
        .Q(mem_addr_OBUF[12]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[13]),
        .Q(mem_addr_OBUF[13]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[14]),
        .Q(mem_addr_OBUF[14]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[15]),
        .Q(mem_addr_OBUF[15]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[16]),
        .Q(mem_addr_OBUF[16]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[17]),
        .Q(mem_addr_OBUF[17]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[18]),
        .Q(mem_addr_OBUF[18]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[19]),
        .Q(mem_addr_OBUF[19]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[20]),
        .Q(mem_addr_OBUF[20]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[21]),
        .Q(mem_addr_OBUF[21]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[22]),
        .Q(mem_addr_OBUF[22]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[23]),
        .Q(mem_addr_OBUF[23]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[24]),
        .Q(mem_addr_OBUF[24]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[25]),
        .Q(mem_addr_OBUF[25]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[26]),
        .Q(mem_addr_OBUF[26]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[27]),
        .Q(mem_addr_OBUF[27]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[28]),
        .Q(mem_addr_OBUF[28]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[29]),
        .Q(mem_addr_OBUF[29]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[2]),
        .Q(mem_addr_OBUF[2]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[30]),
        .Q(mem_addr_OBUF[30]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[31]),
        .Q(mem_addr_OBUF[31]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[3]),
        .Q(mem_addr_OBUF[3]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[4]),
        .Q(mem_addr_OBUF[4]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[5]),
        .Q(mem_addr_OBUF[5]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[6]),
        .Q(mem_addr_OBUF[6]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[7]),
        .Q(mem_addr_OBUF[7]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[8]),
        .Q(mem_addr_OBUF[8]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_addr_OBUF[9]),
        .Q(mem_addr_OBUF[9]),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h0080808088808080)) 
    mem_do_prefetch_i_1
       (.I0(resetn_IBUF),
        .I1(is_sb_sh_sw_i_3_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(reg_next_pc),
        .I4(mem_do_prefetch_i_2_n_0),
        .I5(instr_jalr),
        .O(mem_do_prefetch_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    mem_do_prefetch_i_2
       (.I0(decoder_trigger_reg_n_0),
        .I1(instr_jal),
        .O(mem_do_prefetch_i_2_n_0));
  FDRE mem_do_prefetch_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(mem_do_prefetch_i_1_n_0),
        .Q(mem_do_prefetch_reg_n_0),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT4 #(
    .INIT(16'hF8F0)) 
    mem_do_rdata_i_1
       (.I0(resetn_IBUF),
        .I1(is_sb_sh_sw_i_3_n_0),
        .I2(set_mem_do_rdata4_out),
        .I3(mem_do_rdata),
        .O(mem_do_rdata_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000400)) 
    mem_do_rdata_i_2
       (.I0(latched_branch),
        .I1(mem_do_rdata_i_4_n_0),
        .I2(\cpu_state_reg_n_0_[7] ),
        .I3(resetn_IBUF),
        .I4(\cpu_state_reg_n_0_[1] ),
        .I5(mem_do_rdata_i_5_n_0),
        .O(set_mem_do_rdata4_out));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'hE)) 
    mem_do_rdata_i_3
       (.I0(reg_next_pc),
        .I1(\cpu_state_reg_n_0_[3] ),
        .O(latched_branch));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h1)) 
    mem_do_rdata_i_4
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .O(mem_do_rdata_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'hEAEE)) 
    mem_do_rdata_i_5
       (.I0(mem_do_rdata),
        .I1(mem_do_prefetch_reg_n_0),
        .I2(is_sb_sh_sw_i_3_n_0),
        .I3(resetn_IBUF),
        .O(mem_do_rdata_i_5_n_0));
  FDRE mem_do_rdata_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(mem_do_rdata_i_1_n_0),
        .Q(mem_do_rdata),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'hAAAAAAAA80888000)) 
    mem_do_rinst_i_1
       (.I0(resetn_IBUF),
        .I1(is_sb_sh_sw_i_3_n_0),
        .I2(mem_do_rinst_reg_n_0),
        .I3(mem_do_rinst_i_2_n_0),
        .I4(mem_do_rinst),
        .I5(decoder_trigger_i_3_n_0),
        .O(mem_do_rinst_i_1_n_0));
  LUT3 #(
    .INIT(8'h45)) 
    mem_do_rinst_i_10
       (.I0(mem_do_prefetch_reg_n_0),
        .I1(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I2(is_sb_sh_sw),
        .O(mem_do_rinst_i_10_n_0));
  LUT6 #(
    .INIT(64'h0000000000005575)) 
    mem_do_rinst_i_11
       (.I0(is_lb_lh_lw_lbu_lhu),
        .I1(\cpu_state[7]_i_9_n_0 ),
        .I2(\cpu_state[7]_i_10_n_0 ),
        .I3(mem_do_rinst_i_14_n_0),
        .I4(\cpu_state[1]_i_2_n_0 ),
        .I5(is_slli_srli_srai),
        .O(mem_do_rinst_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hFF8F8888)) 
    mem_do_rinst_i_12
       (.I0(\cpu_state_reg_n_0_[2] ),
        .I1(mem_do_prefetch_reg_n_0),
        .I2(decoder_trigger_reg_n_0),
        .I3(instr_jal),
        .I4(reg_next_pc),
        .O(mem_do_rinst_i_12_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    mem_do_rinst_i_13
       (.I0(mem_do_rinst_i_15_n_0),
        .I1(instr_sub),
        .I2(instr_slti),
        .I3(mem_do_rinst_i_16_n_0),
        .I4(\cpu_state[7]_i_16_n_0 ),
        .I5(mem_do_rinst_i_17_n_0),
        .O(mem_do_rinst_i_13_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    mem_do_rinst_i_14
       (.I0(mem_do_rinst_i_17_n_0),
        .I1(\cpu_state[7]_i_16_n_0 ),
        .I2(mem_do_rinst_i_16_n_0),
        .I3(\cpu_state[7]_i_15_n_0 ),
        .I4(\cpu_state[7]_i_11_n_0 ),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub_i_2_n_0),
        .O(mem_do_rinst_i_14_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'hE)) 
    mem_do_rinst_i_15
       (.I0(instr_rdinstr),
        .I1(instr_rdinstrh),
        .O(mem_do_rinst_i_15_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    mem_do_rinst_i_16
       (.I0(instr_beq),
        .I1(instr_srl),
        .I2(instr_bne),
        .I3(instr_and),
        .O(mem_do_rinst_i_16_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    mem_do_rinst_i_17
       (.I0(instr_add),
        .I1(instr_andi),
        .I2(instr_bltu),
        .I3(instr_lh),
        .O(mem_do_rinst_i_17_n_0));
  LUT6 #(
    .INIT(64'h00000000DDDDDDDF)) 
    mem_do_rinst_i_2
       (.I0(mem_do_rinst_i_4_n_0),
        .I1(\cpu_state[7]_i_7_n_0 ),
        .I2(mem_do_rinst_i_5_n_0),
        .I3(mem_do_rinst_i_6_n_0),
        .I4(is_lb_lh_lw_lbu_lhu),
        .I5(mem_do_rinst_i_7_n_0),
        .O(mem_do_rinst_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFBFBB0000)) 
    mem_do_rinst_i_3
       (.I0(mem_do_rinst_i_8_n_0),
        .I1(mem_do_rinst_i_9_n_0),
        .I2(mem_do_rinst_i_10_n_0),
        .I3(mem_do_rinst_i_11_n_0),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(mem_do_rinst_i_12_n_0),
        .O(mem_do_rinst));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    mem_do_rinst_i_4
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(instr_rdcycle),
        .I2(instr_rdcycleh),
        .I3(instr_rdinstr),
        .I4(instr_rdinstrh),
        .O(mem_do_rinst_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h2)) 
    mem_do_rinst_i_5
       (.I0(is_sb_sh_sw),
        .I1(is_slli_srli_srai),
        .O(mem_do_rinst_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'hAAFB)) 
    mem_do_rinst_i_6
       (.I0(is_lui_auipc_jal),
        .I1(is_sll_srl_sra),
        .I2(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I3(is_slli_srli_srai),
        .O(mem_do_rinst_i_6_n_0));
  LUT5 #(
    .INIT(32'hAAAAAEAA)) 
    mem_do_rinst_i_7
       (.I0(reg_next_pc),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\reg_sh_reg_n_0_[1] ),
        .I3(\reg_sh[2]_i_2_n_0 ),
        .I4(\reg_sh_reg_n_0_[0] ),
        .O(mem_do_rinst_i_7_n_0));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    mem_do_rinst_i_8
       (.I0(mem_do_prefetch_reg_n_0),
        .I1(is_lui_auipc_jal),
        .I2(instr_rdinstrh),
        .I3(instr_rdinstr),
        .I4(instr_rdcycleh),
        .I5(instr_rdcycle),
        .O(mem_do_rinst_i_8_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF55555575)) 
    mem_do_rinst_i_9
       (.I0(is_lb_lh_lw_lbu_lhu),
        .I1(\cpu_state[7]_i_9_n_0 ),
        .I2(\cpu_state[7]_i_10_n_0 ),
        .I3(\reg_out[3]_i_6_n_0 ),
        .I4(mem_do_rinst_i_13_n_0),
        .I5(\cpu_state[1]_i_2_n_0 ),
        .O(mem_do_rinst_i_9_n_0));
  FDRE mem_do_rinst_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(mem_do_rinst_i_1_n_0),
        .Q(mem_do_rinst_reg_n_0),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hA040E040)) 
    mem_do_wdata_i_1
       (.I0(mem_do_wdata),
        .I1(\cpu_state_reg_n_0_[1] ),
        .I2(resetn_IBUF),
        .I3(is_sb_sh_sw_i_3_n_0),
        .I4(mem_do_prefetch_reg_n_0),
        .O(mem_do_wdata_i_1_n_0));
  FDRE mem_do_wdata_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(mem_do_wdata_i_1_n_0),
        .Q(mem_do_wdata),
        .R(\<const0> ));
  OBUF mem_instr_OBUF_inst
       (.I(mem_instr_OBUF),
        .O(mem_instr));
  LUT6 #(
    .INIT(64'h4444440400000000)) 
    mem_instr_i_1
       (.I0(trap_OBUF),
        .I1(resetn_IBUF),
        .I2(mem_instr_i_3_n_0),
        .I3(mem_do_wdata),
        .I4(mem_do_rdata),
        .I5(mem_instr_i_4_n_0),
        .O(mem_instr3_out));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'h54)) 
    mem_instr_i_2
       (.I0(mem_do_wdata),
        .I1(mem_do_prefetch_reg_n_0),
        .I2(mem_do_rinst_reg_n_0),
        .O(mem_instr_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT2 #(
    .INIT(4'h1)) 
    mem_instr_i_3
       (.I0(mem_do_rinst_reg_n_0),
        .I1(mem_do_prefetch_reg_n_0),
        .O(mem_instr_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h1)) 
    mem_instr_i_4
       (.I0(\mem_state_reg_n_0_[1] ),
        .I1(\mem_state_reg_n_0_[0] ),
        .O(mem_instr_i_4_n_0));
  FDRE mem_instr_reg
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_instr_i_2_n_0),
        .Q(mem_instr_OBUF),
        .R(\<const0> ));
  OBUF \mem_la_addr_OBUF[0]_inst 
       (.I(\<const0> ),
        .O(mem_la_addr[0]));
  OBUF \mem_la_addr_OBUF[10]_inst 
       (.I(mem_la_addr_OBUF[10]),
        .O(mem_la_addr[10]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[10]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[10]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[10] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[10] ),
        .O(mem_la_addr_OBUF[10]));
  OBUF \mem_la_addr_OBUF[11]_inst 
       (.I(mem_la_addr_OBUF[11]),
        .O(mem_la_addr[11]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[11]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[11]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[11] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[11] ),
        .O(mem_la_addr_OBUF[11]));
  OBUF \mem_la_addr_OBUF[12]_inst 
       (.I(mem_la_addr_OBUF[12]),
        .O(mem_la_addr[12]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[12]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[12]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[12] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[12] ),
        .O(mem_la_addr_OBUF[12]));
  OBUF \mem_la_addr_OBUF[13]_inst 
       (.I(mem_la_addr_OBUF[13]),
        .O(mem_la_addr[13]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[13]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[13]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[13] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[13] ),
        .O(mem_la_addr_OBUF[13]));
  OBUF \mem_la_addr_OBUF[14]_inst 
       (.I(mem_la_addr_OBUF[14]),
        .O(mem_la_addr[14]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[14]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[14]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[14] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[14] ),
        .O(mem_la_addr_OBUF[14]));
  OBUF \mem_la_addr_OBUF[15]_inst 
       (.I(mem_la_addr_OBUF[15]),
        .O(mem_la_addr[15]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[15]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[15]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[15] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[15] ),
        .O(mem_la_addr_OBUF[15]));
  OBUF \mem_la_addr_OBUF[16]_inst 
       (.I(mem_la_addr_OBUF[16]),
        .O(mem_la_addr[16]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[16]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[16]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[16] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[16] ),
        .O(mem_la_addr_OBUF[16]));
  OBUF \mem_la_addr_OBUF[17]_inst 
       (.I(mem_la_addr_OBUF[17]),
        .O(mem_la_addr[17]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[17]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[17]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[17] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[17] ),
        .O(mem_la_addr_OBUF[17]));
  OBUF \mem_la_addr_OBUF[18]_inst 
       (.I(mem_la_addr_OBUF[18]),
        .O(mem_la_addr[18]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[18]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[18]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[18] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[18] ),
        .O(mem_la_addr_OBUF[18]));
  OBUF \mem_la_addr_OBUF[19]_inst 
       (.I(mem_la_addr_OBUF[19]),
        .O(mem_la_addr[19]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[19]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[19]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[19] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[19] ),
        .O(mem_la_addr_OBUF[19]));
  OBUF \mem_la_addr_OBUF[1]_inst 
       (.I(\<const0> ),
        .O(mem_la_addr[1]));
  OBUF \mem_la_addr_OBUF[20]_inst 
       (.I(mem_la_addr_OBUF[20]),
        .O(mem_la_addr[20]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[20]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[20]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[20] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[20] ),
        .O(mem_la_addr_OBUF[20]));
  OBUF \mem_la_addr_OBUF[21]_inst 
       (.I(mem_la_addr_OBUF[21]),
        .O(mem_la_addr[21]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[21]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[21]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[21] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[21] ),
        .O(mem_la_addr_OBUF[21]));
  OBUF \mem_la_addr_OBUF[22]_inst 
       (.I(mem_la_addr_OBUF[22]),
        .O(mem_la_addr[22]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[22]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[22]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[22] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[22] ),
        .O(mem_la_addr_OBUF[22]));
  OBUF \mem_la_addr_OBUF[23]_inst 
       (.I(mem_la_addr_OBUF[23]),
        .O(mem_la_addr[23]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[23]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[23]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[23] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[23] ),
        .O(mem_la_addr_OBUF[23]));
  OBUF \mem_la_addr_OBUF[24]_inst 
       (.I(mem_la_addr_OBUF[24]),
        .O(mem_la_addr[24]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[24]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[24]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[24] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[24] ),
        .O(mem_la_addr_OBUF[24]));
  OBUF \mem_la_addr_OBUF[25]_inst 
       (.I(mem_la_addr_OBUF[25]),
        .O(mem_la_addr[25]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[25]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[25]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[25] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[25] ),
        .O(mem_la_addr_OBUF[25]));
  OBUF \mem_la_addr_OBUF[26]_inst 
       (.I(mem_la_addr_OBUF[26]),
        .O(mem_la_addr[26]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[26]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[26]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[26] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[26] ),
        .O(mem_la_addr_OBUF[26]));
  OBUF \mem_la_addr_OBUF[27]_inst 
       (.I(mem_la_addr_OBUF[27]),
        .O(mem_la_addr[27]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[27]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[27]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[27] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[27] ),
        .O(mem_la_addr_OBUF[27]));
  OBUF \mem_la_addr_OBUF[28]_inst 
       (.I(mem_la_addr_OBUF[28]),
        .O(mem_la_addr[28]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[28]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[28]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[28] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[28] ),
        .O(mem_la_addr_OBUF[28]));
  OBUF \mem_la_addr_OBUF[29]_inst 
       (.I(mem_la_addr_OBUF[29]),
        .O(mem_la_addr[29]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[29]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[29]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[29] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[29] ),
        .O(mem_la_addr_OBUF[29]));
  OBUF \mem_la_addr_OBUF[2]_inst 
       (.I(mem_la_addr_OBUF[2]),
        .O(mem_la_addr[2]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[2]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[2]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[2] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[2] ),
        .O(mem_la_addr_OBUF[2]));
  OBUF \mem_la_addr_OBUF[30]_inst 
       (.I(mem_la_addr_OBUF[30]),
        .O(mem_la_addr[30]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[30]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[30]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[30] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[30] ),
        .O(mem_la_addr_OBUF[30]));
  OBUF \mem_la_addr_OBUF[31]_inst 
       (.I(mem_la_addr_OBUF[31]),
        .O(mem_la_addr[31]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[31]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[31]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[31] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[31] ),
        .O(mem_la_addr_OBUF[31]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem_la_addr_OBUF[31]_inst_i_2 
       (.I0(latched_branch_reg_n_0),
        .I1(latched_store_reg_n_0),
        .O(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ));
  OBUF \mem_la_addr_OBUF[3]_inst 
       (.I(mem_la_addr_OBUF[3]),
        .O(mem_la_addr[3]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[3]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[3]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[3] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[3] ),
        .O(mem_la_addr_OBUF[3]));
  OBUF \mem_la_addr_OBUF[4]_inst 
       (.I(mem_la_addr_OBUF[4]),
        .O(mem_la_addr[4]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[4]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[4]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[4] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[4] ),
        .O(mem_la_addr_OBUF[4]));
  OBUF \mem_la_addr_OBUF[5]_inst 
       (.I(mem_la_addr_OBUF[5]),
        .O(mem_la_addr[5]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[5]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[5]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[5] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[5] ),
        .O(mem_la_addr_OBUF[5]));
  OBUF \mem_la_addr_OBUF[6]_inst 
       (.I(mem_la_addr_OBUF[6]),
        .O(mem_la_addr[6]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[6]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[6]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[6] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[6] ),
        .O(mem_la_addr_OBUF[6]));
  OBUF \mem_la_addr_OBUF[7]_inst 
       (.I(mem_la_addr_OBUF[7]),
        .O(mem_la_addr[7]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[7]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[7]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[7] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[7] ),
        .O(mem_la_addr_OBUF[7]));
  OBUF \mem_la_addr_OBUF[8]_inst 
       (.I(mem_la_addr_OBUF[8]),
        .O(mem_la_addr[8]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[8]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[8]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[8] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[8] ),
        .O(mem_la_addr_OBUF[8]));
  OBUF \mem_la_addr_OBUF[9]_inst 
       (.I(mem_la_addr_OBUF[9]),
        .O(mem_la_addr[9]));
  LUT6 #(
    .INIT(64'hFE02FEFEFE020202)) 
    \mem_la_addr_OBUF[9]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[9]),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\reg_out_reg_n_0_[9] ),
        .I4(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[9] ),
        .O(mem_la_addr_OBUF[9]));
  OBUF mem_la_read_OBUF_inst
       (.I(mem_la_read_OBUF),
        .O(mem_la_read));
  LUT6 #(
    .INIT(64'h000000FE00000000)) 
    mem_la_read_OBUF_inst_i_1
       (.I0(mem_do_rdata),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(\mem_state_reg_n_0_[1] ),
        .I4(\mem_state_reg_n_0_[0] ),
        .I5(resetn_IBUF),
        .O(mem_la_read_OBUF));
  OBUF \mem_la_wdata_OBUF[0]_inst 
       (.I(pcpi_rs2_OBUF[0]),
        .O(mem_la_wdata[0]));
  OBUF \mem_la_wdata_OBUF[10]_inst 
       (.I(mem_la_wdata_OBUF[10]),
        .O(mem_la_wdata[10]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mem_la_wdata_OBUF[10]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[2]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[10]),
        .O(mem_la_wdata_OBUF[10]));
  OBUF \mem_la_wdata_OBUF[11]_inst 
       (.I(mem_la_wdata_OBUF[11]),
        .O(mem_la_wdata[11]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mem_la_wdata_OBUF[11]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[3]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[11]),
        .O(mem_la_wdata_OBUF[11]));
  OBUF \mem_la_wdata_OBUF[12]_inst 
       (.I(mem_la_wdata_OBUF[12]),
        .O(mem_la_wdata[12]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mem_la_wdata_OBUF[12]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[4]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[12]),
        .O(mem_la_wdata_OBUF[12]));
  OBUF \mem_la_wdata_OBUF[13]_inst 
       (.I(mem_la_wdata_OBUF[13]),
        .O(mem_la_wdata[13]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mem_la_wdata_OBUF[13]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[5]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[13]),
        .O(mem_la_wdata_OBUF[13]));
  OBUF \mem_la_wdata_OBUF[14]_inst 
       (.I(mem_la_wdata_OBUF[14]),
        .O(mem_la_wdata[14]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mem_la_wdata_OBUF[14]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[6]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[14]),
        .O(mem_la_wdata_OBUF[14]));
  OBUF \mem_la_wdata_OBUF[15]_inst 
       (.I(mem_la_wdata_OBUF[15]),
        .O(mem_la_wdata[15]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mem_la_wdata_OBUF[15]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[7]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[15]),
        .O(mem_la_wdata_OBUF[15]));
  OBUF \mem_la_wdata_OBUF[16]_inst 
       (.I(mem_la_wdata_OBUF[16]),
        .O(mem_la_wdata[16]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT4 #(
    .INIT(16'hFE02)) 
    \mem_la_wdata_OBUF[16]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[16]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(\mem_wordsize_reg_n_0_[0] ),
        .I3(pcpi_rs2_OBUF[0]),
        .O(mem_la_wdata_OBUF[16]));
  OBUF \mem_la_wdata_OBUF[17]_inst 
       (.I(mem_la_wdata_OBUF[17]),
        .O(mem_la_wdata[17]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \mem_la_wdata_OBUF[17]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[17]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(\mem_wordsize_reg_n_0_[0] ),
        .I3(pcpi_rs2_OBUF[1]),
        .O(mem_la_wdata_OBUF[17]));
  OBUF \mem_la_wdata_OBUF[18]_inst 
       (.I(mem_la_wdata_OBUF[18]),
        .O(mem_la_wdata[18]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \mem_la_wdata_OBUF[18]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[18]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(\mem_wordsize_reg_n_0_[0] ),
        .I3(pcpi_rs2_OBUF[2]),
        .O(mem_la_wdata_OBUF[18]));
  OBUF \mem_la_wdata_OBUF[19]_inst 
       (.I(mem_la_wdata_OBUF[19]),
        .O(mem_la_wdata[19]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \mem_la_wdata_OBUF[19]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[19]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(\mem_wordsize_reg_n_0_[0] ),
        .I3(pcpi_rs2_OBUF[3]),
        .O(mem_la_wdata_OBUF[19]));
  OBUF \mem_la_wdata_OBUF[1]_inst 
       (.I(pcpi_rs2_OBUF[1]),
        .O(mem_la_wdata[1]));
  OBUF \mem_la_wdata_OBUF[20]_inst 
       (.I(mem_la_wdata_OBUF[20]),
        .O(mem_la_wdata[20]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \mem_la_wdata_OBUF[20]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[20]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(\mem_wordsize_reg_n_0_[0] ),
        .I3(pcpi_rs2_OBUF[4]),
        .O(mem_la_wdata_OBUF[20]));
  OBUF \mem_la_wdata_OBUF[21]_inst 
       (.I(mem_la_wdata_OBUF[21]),
        .O(mem_la_wdata[21]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \mem_la_wdata_OBUF[21]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[21]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(\mem_wordsize_reg_n_0_[0] ),
        .I3(pcpi_rs2_OBUF[5]),
        .O(mem_la_wdata_OBUF[21]));
  OBUF \mem_la_wdata_OBUF[22]_inst 
       (.I(mem_la_wdata_OBUF[22]),
        .O(mem_la_wdata[22]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \mem_la_wdata_OBUF[22]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[22]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(\mem_wordsize_reg_n_0_[0] ),
        .I3(pcpi_rs2_OBUF[6]),
        .O(mem_la_wdata_OBUF[22]));
  OBUF \mem_la_wdata_OBUF[23]_inst 
       (.I(mem_la_wdata_OBUF[23]),
        .O(mem_la_wdata[23]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \mem_la_wdata_OBUF[23]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[23]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(\mem_wordsize_reg_n_0_[0] ),
        .I3(pcpi_rs2_OBUF[7]),
        .O(mem_la_wdata_OBUF[23]));
  OBUF \mem_la_wdata_OBUF[24]_inst 
       (.I(mem_la_wdata_OBUF[24]),
        .O(mem_la_wdata[24]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \mem_la_wdata_OBUF[24]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[0]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[8]),
        .I3(\mem_wordsize_reg_n_0_[0] ),
        .I4(pcpi_rs2_OBUF[24]),
        .O(mem_la_wdata_OBUF[24]));
  OBUF \mem_la_wdata_OBUF[25]_inst 
       (.I(mem_la_wdata_OBUF[25]),
        .O(mem_la_wdata[25]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \mem_la_wdata_OBUF[25]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[1]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[9]),
        .I3(\mem_wordsize_reg_n_0_[0] ),
        .I4(pcpi_rs2_OBUF[25]),
        .O(mem_la_wdata_OBUF[25]));
  OBUF \mem_la_wdata_OBUF[26]_inst 
       (.I(mem_la_wdata_OBUF[26]),
        .O(mem_la_wdata[26]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \mem_la_wdata_OBUF[26]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[2]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[10]),
        .I3(\mem_wordsize_reg_n_0_[0] ),
        .I4(pcpi_rs2_OBUF[26]),
        .O(mem_la_wdata_OBUF[26]));
  OBUF \mem_la_wdata_OBUF[27]_inst 
       (.I(mem_la_wdata_OBUF[27]),
        .O(mem_la_wdata[27]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \mem_la_wdata_OBUF[27]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[3]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[11]),
        .I3(\mem_wordsize_reg_n_0_[0] ),
        .I4(pcpi_rs2_OBUF[27]),
        .O(mem_la_wdata_OBUF[27]));
  OBUF \mem_la_wdata_OBUF[28]_inst 
       (.I(mem_la_wdata_OBUF[28]),
        .O(mem_la_wdata[28]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \mem_la_wdata_OBUF[28]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[4]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[12]),
        .I3(\mem_wordsize_reg_n_0_[0] ),
        .I4(pcpi_rs2_OBUF[28]),
        .O(mem_la_wdata_OBUF[28]));
  OBUF \mem_la_wdata_OBUF[29]_inst 
       (.I(mem_la_wdata_OBUF[29]),
        .O(mem_la_wdata[29]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \mem_la_wdata_OBUF[29]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[5]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[13]),
        .I3(\mem_wordsize_reg_n_0_[0] ),
        .I4(pcpi_rs2_OBUF[29]),
        .O(mem_la_wdata_OBUF[29]));
  OBUF \mem_la_wdata_OBUF[2]_inst 
       (.I(pcpi_rs2_OBUF[2]),
        .O(mem_la_wdata[2]));
  OBUF \mem_la_wdata_OBUF[30]_inst 
       (.I(mem_la_wdata_OBUF[30]),
        .O(mem_la_wdata[30]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \mem_la_wdata_OBUF[30]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[6]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[14]),
        .I3(\mem_wordsize_reg_n_0_[0] ),
        .I4(pcpi_rs2_OBUF[30]),
        .O(mem_la_wdata_OBUF[30]));
  OBUF \mem_la_wdata_OBUF[31]_inst 
       (.I(mem_la_wdata_OBUF[31]),
        .O(mem_la_wdata[31]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \mem_la_wdata_OBUF[31]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[7]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[15]),
        .I3(\mem_wordsize_reg_n_0_[0] ),
        .I4(pcpi_rs2_OBUF[31]),
        .O(mem_la_wdata_OBUF[31]));
  OBUF \mem_la_wdata_OBUF[3]_inst 
       (.I(pcpi_rs2_OBUF[3]),
        .O(mem_la_wdata[3]));
  OBUF \mem_la_wdata_OBUF[4]_inst 
       (.I(pcpi_rs2_OBUF[4]),
        .O(mem_la_wdata[4]));
  OBUF \mem_la_wdata_OBUF[5]_inst 
       (.I(pcpi_rs2_OBUF[5]),
        .O(mem_la_wdata[5]));
  OBUF \mem_la_wdata_OBUF[6]_inst 
       (.I(pcpi_rs2_OBUF[6]),
        .O(mem_la_wdata[6]));
  OBUF \mem_la_wdata_OBUF[7]_inst 
       (.I(pcpi_rs2_OBUF[7]),
        .O(mem_la_wdata[7]));
  OBUF \mem_la_wdata_OBUF[8]_inst 
       (.I(mem_la_wdata_OBUF[8]),
        .O(mem_la_wdata[8]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mem_la_wdata_OBUF[8]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[0]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[8]),
        .O(mem_la_wdata_OBUF[8]));
  OBUF \mem_la_wdata_OBUF[9]_inst 
       (.I(mem_la_wdata_OBUF[9]),
        .O(mem_la_wdata[9]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \mem_la_wdata_OBUF[9]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[1]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[9]),
        .O(mem_la_wdata_OBUF[9]));
  OBUF mem_la_write_OBUF_inst
       (.I(mem_la_write_OBUF),
        .O(mem_la_write));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    mem_la_write_OBUF_inst_i_1
       (.I0(mem_do_wdata),
        .I1(\mem_state_reg_n_0_[1] ),
        .I2(\mem_state_reg_n_0_[0] ),
        .I3(resetn_IBUF),
        .O(mem_la_write_OBUF));
  OBUF \mem_la_wstrb_OBUF[0]_inst 
       (.I(mem_la_wstrb_OBUF[0]),
        .O(mem_la_wstrb[0]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'h03F7)) 
    \mem_la_wstrb_OBUF[0]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[0]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(\mem_wordsize_reg_n_0_[0] ),
        .I3(pcpi_rs1_OBUF[1]),
        .O(mem_la_wstrb_OBUF[0]));
  OBUF \mem_la_wstrb_OBUF[1]_inst 
       (.I(mem_la_wstrb_OBUF[1]),
        .O(mem_la_wstrb[1]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'h03FB)) 
    \mem_la_wstrb_OBUF[1]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[0]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(\mem_wordsize_reg_n_0_[0] ),
        .I3(pcpi_rs1_OBUF[1]),
        .O(mem_la_wstrb_OBUF[1]));
  OBUF \mem_la_wstrb_OBUF[2]_inst 
       (.I(mem_la_wstrb_OBUF[2]),
        .O(mem_la_wstrb[2]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'hB1F1)) 
    \mem_la_wstrb_OBUF[2]_inst_i_1 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs1_OBUF[1]),
        .I3(pcpi_rs1_OBUF[0]),
        .O(mem_la_wstrb_OBUF[2]));
  OBUF \mem_la_wstrb_OBUF[3]_inst 
       (.I(mem_la_wstrb_OBUF[3]),
        .O(mem_la_wstrb[3]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'hF1B1)) 
    \mem_la_wstrb_OBUF[3]_inst_i_1 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs1_OBUF[1]),
        .I3(pcpi_rs1_OBUF[0]),
        .O(mem_la_wstrb_OBUF[3]));
  IBUF \mem_rdata_IBUF[0]_inst 
       (.I(mem_rdata[0]),
        .O(mem_rdata_IBUF[0]));
  IBUF \mem_rdata_IBUF[10]_inst 
       (.I(mem_rdata[10]),
        .O(mem_rdata_IBUF[10]));
  IBUF \mem_rdata_IBUF[11]_inst 
       (.I(mem_rdata[11]),
        .O(mem_rdata_IBUF[11]));
  IBUF \mem_rdata_IBUF[12]_inst 
       (.I(mem_rdata[12]),
        .O(mem_rdata_IBUF[12]));
  IBUF \mem_rdata_IBUF[13]_inst 
       (.I(mem_rdata[13]),
        .O(mem_rdata_IBUF[13]));
  IBUF \mem_rdata_IBUF[14]_inst 
       (.I(mem_rdata[14]),
        .O(mem_rdata_IBUF[14]));
  IBUF \mem_rdata_IBUF[15]_inst 
       (.I(mem_rdata[15]),
        .O(mem_rdata_IBUF[15]));
  IBUF \mem_rdata_IBUF[16]_inst 
       (.I(mem_rdata[16]),
        .O(mem_rdata_IBUF[16]));
  IBUF \mem_rdata_IBUF[17]_inst 
       (.I(mem_rdata[17]),
        .O(mem_rdata_IBUF[17]));
  IBUF \mem_rdata_IBUF[18]_inst 
       (.I(mem_rdata[18]),
        .O(mem_rdata_IBUF[18]));
  IBUF \mem_rdata_IBUF[19]_inst 
       (.I(mem_rdata[19]),
        .O(mem_rdata_IBUF[19]));
  IBUF \mem_rdata_IBUF[1]_inst 
       (.I(mem_rdata[1]),
        .O(mem_rdata_IBUF[1]));
  IBUF \mem_rdata_IBUF[20]_inst 
       (.I(mem_rdata[20]),
        .O(mem_rdata_IBUF[20]));
  IBUF \mem_rdata_IBUF[21]_inst 
       (.I(mem_rdata[21]),
        .O(mem_rdata_IBUF[21]));
  IBUF \mem_rdata_IBUF[22]_inst 
       (.I(mem_rdata[22]),
        .O(mem_rdata_IBUF[22]));
  IBUF \mem_rdata_IBUF[23]_inst 
       (.I(mem_rdata[23]),
        .O(mem_rdata_IBUF[23]));
  IBUF \mem_rdata_IBUF[24]_inst 
       (.I(mem_rdata[24]),
        .O(mem_rdata_IBUF[24]));
  IBUF \mem_rdata_IBUF[25]_inst 
       (.I(mem_rdata[25]),
        .O(mem_rdata_IBUF[25]));
  IBUF \mem_rdata_IBUF[26]_inst 
       (.I(mem_rdata[26]),
        .O(mem_rdata_IBUF[26]));
  IBUF \mem_rdata_IBUF[27]_inst 
       (.I(mem_rdata[27]),
        .O(mem_rdata_IBUF[27]));
  IBUF \mem_rdata_IBUF[28]_inst 
       (.I(mem_rdata[28]),
        .O(mem_rdata_IBUF[28]));
  IBUF \mem_rdata_IBUF[29]_inst 
       (.I(mem_rdata[29]),
        .O(mem_rdata_IBUF[29]));
  IBUF \mem_rdata_IBUF[2]_inst 
       (.I(mem_rdata[2]),
        .O(mem_rdata_IBUF[2]));
  IBUF \mem_rdata_IBUF[30]_inst 
       (.I(mem_rdata[30]),
        .O(mem_rdata_IBUF[30]));
  IBUF \mem_rdata_IBUF[31]_inst 
       (.I(mem_rdata[31]),
        .O(mem_rdata_IBUF[31]));
  IBUF \mem_rdata_IBUF[3]_inst 
       (.I(mem_rdata[3]),
        .O(mem_rdata_IBUF[3]));
  IBUF \mem_rdata_IBUF[4]_inst 
       (.I(mem_rdata[4]),
        .O(mem_rdata_IBUF[4]));
  IBUF \mem_rdata_IBUF[5]_inst 
       (.I(mem_rdata[5]),
        .O(mem_rdata_IBUF[5]));
  IBUF \mem_rdata_IBUF[6]_inst 
       (.I(mem_rdata[6]),
        .O(mem_rdata_IBUF[6]));
  IBUF \mem_rdata_IBUF[7]_inst 
       (.I(mem_rdata[7]),
        .O(mem_rdata_IBUF[7]));
  IBUF \mem_rdata_IBUF[8]_inst 
       (.I(mem_rdata[8]),
        .O(mem_rdata_IBUF[8]));
  IBUF \mem_rdata_IBUF[9]_inst 
       (.I(mem_rdata[9]),
        .O(mem_rdata_IBUF[9]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'hEA2A)) 
    \mem_rdata_q[0]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[0] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[0]),
        .O(\mem_rdata_q[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \mem_rdata_q[12]_i_1 
       (.I0(p_0_in[0]),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[12]),
        .O(\mem_rdata_q[12]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \mem_rdata_q[13]_i_1 
       (.I0(p_0_in[1]),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[13]),
        .O(\mem_rdata_q[13]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \mem_rdata_q[14]_i_1 
       (.I0(p_0_in[2]),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[14]),
        .O(\mem_rdata_q[14]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \mem_rdata_q[1]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[1] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[1]),
        .O(\mem_rdata_q[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \mem_rdata_q[2]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[2] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[2]),
        .O(\mem_rdata_q[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \mem_rdata_q[31]_i_1 
       (.I0(mem_ready_IBUF),
        .I1(mem_valid_OBUF),
        .O(\mem_rdata_q[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \mem_rdata_q[3]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[3] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[3]),
        .O(\mem_rdata_q[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'hBF80)) 
    \mem_rdata_q[4]_i_1 
       (.I0(mem_rdata_IBUF[4]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[4] ),
        .O(\mem_rdata_q[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \mem_rdata_q[5]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[5] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[5]),
        .O(\mem_rdata_q[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \mem_rdata_q[6]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[6] ),
        .I1(mem_valid_OBUF),
        .I2(mem_ready_IBUF),
        .I3(mem_rdata_IBUF[6]),
        .O(\mem_rdata_q[6]_i_1_n_0 ));
  FDRE \mem_rdata_q_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\mem_rdata_q[0]_i_1_n_0 ),
        .Q(\mem_rdata_q_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[10]),
        .Q(\mem_rdata_q_reg_n_0_[10] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[11]),
        .Q(\mem_rdata_q_reg_n_0_[11] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\mem_rdata_q[12]_i_1_n_0 ),
        .Q(p_0_in[0]),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\mem_rdata_q[13]_i_1_n_0 ),
        .Q(p_0_in[1]),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\mem_rdata_q[14]_i_1_n_0 ),
        .Q(p_0_in[2]),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[15]),
        .Q(\mem_rdata_q_reg_n_0_[15] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[16]),
        .Q(\mem_rdata_q_reg_n_0_[16] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[17]),
        .Q(\mem_rdata_q_reg_n_0_[17] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[18]),
        .Q(\mem_rdata_q_reg_n_0_[18] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[19]),
        .Q(\mem_rdata_q_reg_n_0_[19] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\mem_rdata_q[1]_i_1_n_0 ),
        .Q(\mem_rdata_q_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[20]),
        .Q(\mem_rdata_q_reg_n_0_[20] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[21]),
        .Q(\mem_rdata_q_reg_n_0_[21] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[22]),
        .Q(\mem_rdata_q_reg_n_0_[22] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[23]),
        .Q(\mem_rdata_q_reg_n_0_[23] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[24]),
        .Q(\mem_rdata_q_reg_n_0_[24] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[25]),
        .Q(\mem_rdata_q_reg_n_0_[25] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[26]),
        .Q(\mem_rdata_q_reg_n_0_[26] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[27]),
        .Q(\mem_rdata_q_reg_n_0_[27] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[28]),
        .Q(\mem_rdata_q_reg_n_0_[28] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[29]),
        .Q(\mem_rdata_q_reg_n_0_[29] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\mem_rdata_q[2]_i_1_n_0 ),
        .Q(\mem_rdata_q_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[30]),
        .Q(\mem_rdata_q_reg_n_0_[30] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[31]),
        .Q(\mem_rdata_q_reg_n_0_[31] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\mem_rdata_q[3]_i_1_n_0 ),
        .Q(\mem_rdata_q_reg_n_0_[3] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\mem_rdata_q[4]_i_1_n_0 ),
        .Q(\mem_rdata_q_reg_n_0_[4] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\mem_rdata_q[5]_i_1_n_0 ),
        .Q(\mem_rdata_q_reg_n_0_[5] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\mem_rdata_q[6]_i_1_n_0 ),
        .Q(\mem_rdata_q_reg_n_0_[6] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[7]),
        .Q(\mem_rdata_q_reg_n_0_[7] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[8]),
        .Q(\mem_rdata_q_reg_n_0_[8] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_rdata_q[31]_i_1_n_0 ),
        .D(mem_rdata_IBUF[9]),
        .Q(\mem_rdata_q_reg_n_0_[9] ),
        .R(\<const0> ));
  IBUF mem_ready_IBUF_inst
       (.I(mem_ready),
        .O(mem_ready_IBUF));
  LUT6 #(
    .INIT(64'h0003FFFF00550000)) 
    \mem_state[0]_i_1 
       (.I0(mem_do_wdata),
        .I1(mem_do_rdata),
        .I2(mem_do_rinst_reg_n_0),
        .I3(\mem_state_reg_n_0_[1] ),
        .I4(mem_state),
        .I5(\mem_state_reg_n_0_[0] ),
        .O(\mem_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000FFFF222E0000)) 
    \mem_state[1]_i_1 
       (.I0(mem_do_wdata),
        .I1(\mem_state_reg_n_0_[0] ),
        .I2(mem_do_rdata),
        .I3(mem_do_rinst_reg_n_0),
        .I4(mem_state),
        .I5(\mem_state_reg_n_0_[1] ),
        .O(\mem_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF880C0C00)) 
    \mem_state[1]_i_2 
       (.I0(mem_do_rinst_reg_n_0),
        .I1(\mem_state[1]_i_3_n_0 ),
        .I2(is_sb_sh_sw_i_6_n_0),
        .I3(\mem_state_reg_n_0_[1] ),
        .I4(\mem_state_reg_n_0_[0] ),
        .I5(mem_instr3_out),
        .O(mem_state));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \mem_state[1]_i_3 
       (.I0(resetn_IBUF),
        .I1(trap_OBUF),
        .O(\mem_state[1]_i_3_n_0 ));
  FDRE \mem_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\mem_state[0]_i_1_n_0 ),
        .Q(\mem_state_reg_n_0_[0] ),
        .R(instr_and_i_1_n_0));
  FDRE \mem_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\mem_state[1]_i_1_n_0 ),
        .Q(\mem_state_reg_n_0_[1] ),
        .R(instr_and_i_1_n_0));
  OBUF mem_valid_OBUF_inst
       (.I(mem_valid_OBUF),
        .O(mem_valid));
  LUT6 #(
    .INIT(64'h7077700000000000)) 
    mem_valid_i_1
       (.I0(mem_ready_IBUF),
        .I1(trap_OBUF),
        .I2(mem_valid_i_2_n_0),
        .I3(mem_valid11_out),
        .I4(mem_valid_OBUF),
        .I5(resetn_IBUF),
        .O(mem_valid_i_1_n_0));
  LUT6 #(
    .INIT(64'h1111111111111110)) 
    mem_valid_i_2
       (.I0(\mem_state_reg_n_0_[0] ),
        .I1(\mem_state_reg_n_0_[1] ),
        .I2(mem_do_rdata),
        .I3(mem_do_wdata),
        .I4(mem_do_rinst_reg_n_0),
        .I5(mem_do_prefetch_reg_n_0),
        .O(mem_valid_i_2_n_0));
  LUT6 #(
    .INIT(64'hAAAAAABEAAAAAAAA)) 
    mem_valid_i_3
       (.I0(mem_instr3_out),
        .I1(\mem_state_reg_n_0_[0] ),
        .I2(\mem_state_reg_n_0_[1] ),
        .I3(is_sb_sh_sw_i_6_n_0),
        .I4(trap_OBUF),
        .I5(resetn_IBUF),
        .O(mem_valid11_out));
  FDRE mem_valid_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(mem_valid_i_1_n_0),
        .Q(mem_valid_OBUF),
        .R(\<const0> ));
  LUT5 #(
    .INIT(32'h00000200)) 
    \mem_wdata[31]_i_1 
       (.I0(resetn_IBUF),
        .I1(\mem_state_reg_n_0_[0] ),
        .I2(\mem_state_reg_n_0_[1] ),
        .I3(mem_do_wdata),
        .I4(trap_OBUF),
        .O(\mem_wdata[31]_i_1_n_0 ));
  OBUF \mem_wdata_OBUF[0]_inst 
       (.I(mem_wdata_OBUF[0]),
        .O(mem_wdata[0]));
  OBUF \mem_wdata_OBUF[10]_inst 
       (.I(mem_wdata_OBUF[10]),
        .O(mem_wdata[10]));
  OBUF \mem_wdata_OBUF[11]_inst 
       (.I(mem_wdata_OBUF[11]),
        .O(mem_wdata[11]));
  OBUF \mem_wdata_OBUF[12]_inst 
       (.I(mem_wdata_OBUF[12]),
        .O(mem_wdata[12]));
  OBUF \mem_wdata_OBUF[13]_inst 
       (.I(mem_wdata_OBUF[13]),
        .O(mem_wdata[13]));
  OBUF \mem_wdata_OBUF[14]_inst 
       (.I(mem_wdata_OBUF[14]),
        .O(mem_wdata[14]));
  OBUF \mem_wdata_OBUF[15]_inst 
       (.I(mem_wdata_OBUF[15]),
        .O(mem_wdata[15]));
  OBUF \mem_wdata_OBUF[16]_inst 
       (.I(mem_wdata_OBUF[16]),
        .O(mem_wdata[16]));
  OBUF \mem_wdata_OBUF[17]_inst 
       (.I(mem_wdata_OBUF[17]),
        .O(mem_wdata[17]));
  OBUF \mem_wdata_OBUF[18]_inst 
       (.I(mem_wdata_OBUF[18]),
        .O(mem_wdata[18]));
  OBUF \mem_wdata_OBUF[19]_inst 
       (.I(mem_wdata_OBUF[19]),
        .O(mem_wdata[19]));
  OBUF \mem_wdata_OBUF[1]_inst 
       (.I(mem_wdata_OBUF[1]),
        .O(mem_wdata[1]));
  OBUF \mem_wdata_OBUF[20]_inst 
       (.I(mem_wdata_OBUF[20]),
        .O(mem_wdata[20]));
  OBUF \mem_wdata_OBUF[21]_inst 
       (.I(mem_wdata_OBUF[21]),
        .O(mem_wdata[21]));
  OBUF \mem_wdata_OBUF[22]_inst 
       (.I(mem_wdata_OBUF[22]),
        .O(mem_wdata[22]));
  OBUF \mem_wdata_OBUF[23]_inst 
       (.I(mem_wdata_OBUF[23]),
        .O(mem_wdata[23]));
  OBUF \mem_wdata_OBUF[24]_inst 
       (.I(mem_wdata_OBUF[24]),
        .O(mem_wdata[24]));
  OBUF \mem_wdata_OBUF[25]_inst 
       (.I(mem_wdata_OBUF[25]),
        .O(mem_wdata[25]));
  OBUF \mem_wdata_OBUF[26]_inst 
       (.I(mem_wdata_OBUF[26]),
        .O(mem_wdata[26]));
  OBUF \mem_wdata_OBUF[27]_inst 
       (.I(mem_wdata_OBUF[27]),
        .O(mem_wdata[27]));
  OBUF \mem_wdata_OBUF[28]_inst 
       (.I(mem_wdata_OBUF[28]),
        .O(mem_wdata[28]));
  OBUF \mem_wdata_OBUF[29]_inst 
       (.I(mem_wdata_OBUF[29]),
        .O(mem_wdata[29]));
  OBUF \mem_wdata_OBUF[2]_inst 
       (.I(mem_wdata_OBUF[2]),
        .O(mem_wdata[2]));
  OBUF \mem_wdata_OBUF[30]_inst 
       (.I(mem_wdata_OBUF[30]),
        .O(mem_wdata[30]));
  OBUF \mem_wdata_OBUF[31]_inst 
       (.I(mem_wdata_OBUF[31]),
        .O(mem_wdata[31]));
  OBUF \mem_wdata_OBUF[3]_inst 
       (.I(mem_wdata_OBUF[3]),
        .O(mem_wdata[3]));
  OBUF \mem_wdata_OBUF[4]_inst 
       (.I(mem_wdata_OBUF[4]),
        .O(mem_wdata[4]));
  OBUF \mem_wdata_OBUF[5]_inst 
       (.I(mem_wdata_OBUF[5]),
        .O(mem_wdata[5]));
  OBUF \mem_wdata_OBUF[6]_inst 
       (.I(mem_wdata_OBUF[6]),
        .O(mem_wdata[6]));
  OBUF \mem_wdata_OBUF[7]_inst 
       (.I(mem_wdata_OBUF[7]),
        .O(mem_wdata[7]));
  OBUF \mem_wdata_OBUF[8]_inst 
       (.I(mem_wdata_OBUF[8]),
        .O(mem_wdata[8]));
  OBUF \mem_wdata_OBUF[9]_inst 
       (.I(mem_wdata_OBUF[9]),
        .O(mem_wdata[9]));
  FDRE \mem_wdata_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(pcpi_rs2_OBUF[0]),
        .Q(mem_wdata_OBUF[0]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[10]),
        .Q(mem_wdata_OBUF[10]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[11]),
        .Q(mem_wdata_OBUF[11]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[12]),
        .Q(mem_wdata_OBUF[12]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[13]),
        .Q(mem_wdata_OBUF[13]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[14]),
        .Q(mem_wdata_OBUF[14]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[15]),
        .Q(mem_wdata_OBUF[15]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[16]),
        .Q(mem_wdata_OBUF[16]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[17]),
        .Q(mem_wdata_OBUF[17]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[18]),
        .Q(mem_wdata_OBUF[18]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[19]),
        .Q(mem_wdata_OBUF[19]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(pcpi_rs2_OBUF[1]),
        .Q(mem_wdata_OBUF[1]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[20]),
        .Q(mem_wdata_OBUF[20]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[21]),
        .Q(mem_wdata_OBUF[21]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[22]),
        .Q(mem_wdata_OBUF[22]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[23]),
        .Q(mem_wdata_OBUF[23]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[24]),
        .Q(mem_wdata_OBUF[24]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[25]),
        .Q(mem_wdata_OBUF[25]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[26]),
        .Q(mem_wdata_OBUF[26]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[27]),
        .Q(mem_wdata_OBUF[27]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[28]),
        .Q(mem_wdata_OBUF[28]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[29]),
        .Q(mem_wdata_OBUF[29]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(pcpi_rs2_OBUF[2]),
        .Q(mem_wdata_OBUF[2]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[30]),
        .Q(mem_wdata_OBUF[30]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[31]),
        .Q(mem_wdata_OBUF[31]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(pcpi_rs2_OBUF[3]),
        .Q(mem_wdata_OBUF[3]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(pcpi_rs2_OBUF[4]),
        .Q(mem_wdata_OBUF[4]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(pcpi_rs2_OBUF[5]),
        .Q(mem_wdata_OBUF[5]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(pcpi_rs2_OBUF[6]),
        .Q(mem_wdata_OBUF[6]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(pcpi_rs2_OBUF[7]),
        .Q(mem_wdata_OBUF[7]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[8]),
        .Q(mem_wdata_OBUF[8]),
        .R(\<const0> ));
  FDRE \mem_wdata_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wdata[31]_i_1_n_0 ),
        .D(mem_la_wdata_OBUF[9]),
        .Q(mem_wdata_OBUF[9]),
        .R(\<const0> ));
  LUT5 #(
    .INIT(32'hAFEFA020)) 
    \mem_wordsize[0]_i_1 
       (.I0(mem_wordsize[0]),
        .I1(\mem_wordsize[1]_i_3_n_0 ),
        .I2(resetn_IBUF),
        .I3(latched_is_lu),
        .I4(\mem_wordsize_reg_n_0_[0] ),
        .O(\mem_wordsize[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0E0EFE0)) 
    \mem_wordsize[0]_i_2 
       (.I0(instr_lhu),
        .I1(instr_lh),
        .I2(\cpu_state_reg_n_0_[0] ),
        .I3(instr_sh),
        .I4(reg_next_pc),
        .O(mem_wordsize[0]));
  LUT5 #(
    .INIT(32'hAFEFA020)) 
    \mem_wordsize[1]_i_1 
       (.I0(mem_wordsize[1]),
        .I1(\mem_wordsize[1]_i_3_n_0 ),
        .I2(resetn_IBUF),
        .I3(latched_is_lu),
        .I4(\mem_wordsize_reg_n_0_[1] ),
        .O(\mem_wordsize[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0E0EFE0)) 
    \mem_wordsize[1]_i_2 
       (.I0(instr_lbu),
        .I1(instr_lb),
        .I2(\cpu_state_reg_n_0_[0] ),
        .I3(instr_sb),
        .I4(reg_next_pc),
        .O(mem_wordsize[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFF8AFF)) 
    \mem_wordsize[1]_i_3 
       (.I0(mem_do_prefetch_reg_n_0),
        .I1(is_sb_sh_sw_i_3_n_0),
        .I2(resetn_IBUF),
        .I3(\cpu_state_reg_n_0_[1] ),
        .I4(mem_do_wdata),
        .O(\mem_wordsize[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hABBBABABAAAAAAAA)) 
    \mem_wordsize[1]_i_4 
       (.I0(reg_next_pc),
        .I1(mem_do_rdata),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(is_sb_sh_sw_i_3_n_0),
        .I4(resetn_IBUF),
        .I5(\cpu_state_reg_n_0_[0] ),
        .O(latched_is_lu));
  FDRE \mem_wordsize_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\mem_wordsize[0]_i_1_n_0 ),
        .Q(\mem_wordsize_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE \mem_wordsize_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\mem_wordsize[1]_i_1_n_0 ),
        .Q(\mem_wordsize_reg_n_0_[1] ),
        .R(\<const0> ));
  LUT5 #(
    .INIT(32'h00008A00)) 
    \mem_wstrb[3]_i_1 
       (.I0(mem_instr_i_4_n_0),
        .I1(mem_do_rdata),
        .I2(mem_instr_i_3_n_0),
        .I3(resetn_IBUF),
        .I4(trap_OBUF),
        .O(\mem_wstrb[3]_i_1_n_0 ));
  OBUF \mem_wstrb_OBUF[0]_inst 
       (.I(mem_wstrb_OBUF[0]),
        .O(mem_wstrb[0]));
  OBUF \mem_wstrb_OBUF[1]_inst 
       (.I(mem_wstrb_OBUF[1]),
        .O(mem_wstrb[1]));
  OBUF \mem_wstrb_OBUF[2]_inst 
       (.I(mem_wstrb_OBUF[2]),
        .O(mem_wstrb[2]));
  OBUF \mem_wstrb_OBUF[3]_inst 
       (.I(mem_wstrb_OBUF[3]),
        .O(mem_wstrb[3]));
  FDRE \mem_wstrb_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_wstrb_OBUF[0]),
        .Q(mem_wstrb_OBUF[0]),
        .R(\mem_wstrb[3]_i_1_n_0 ));
  FDRE \mem_wstrb_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_wstrb_OBUF[1]),
        .Q(mem_wstrb_OBUF[1]),
        .R(\mem_wstrb[3]_i_1_n_0 ));
  FDRE \mem_wstrb_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_wstrb_OBUF[2]),
        .Q(mem_wstrb_OBUF[2]),
        .R(\mem_wstrb[3]_i_1_n_0 ));
  FDRE \mem_wstrb_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_instr3_out),
        .D(mem_la_wstrb_OBUF[3]),
        .Q(mem_wstrb_OBUF[3]),
        .R(\mem_wstrb[3]_i_1_n_0 ));
  OBUF \pcpi_insn_OBUF[0]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[0]));
  OBUF \pcpi_insn_OBUF[10]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[10]));
  OBUF \pcpi_insn_OBUF[11]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[11]));
  OBUF \pcpi_insn_OBUF[12]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[12]));
  OBUF \pcpi_insn_OBUF[13]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[13]));
  OBUF \pcpi_insn_OBUF[14]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[14]));
  OBUF \pcpi_insn_OBUF[15]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[15]));
  OBUF \pcpi_insn_OBUF[16]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[16]));
  OBUF \pcpi_insn_OBUF[17]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[17]));
  OBUF \pcpi_insn_OBUF[18]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[18]));
  OBUF \pcpi_insn_OBUF[19]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[19]));
  OBUF \pcpi_insn_OBUF[1]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[1]));
  OBUF \pcpi_insn_OBUF[20]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[20]));
  OBUF \pcpi_insn_OBUF[21]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[21]));
  OBUF \pcpi_insn_OBUF[22]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[22]));
  OBUF \pcpi_insn_OBUF[23]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[23]));
  OBUF \pcpi_insn_OBUF[24]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[24]));
  OBUF \pcpi_insn_OBUF[25]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[25]));
  OBUF \pcpi_insn_OBUF[26]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[26]));
  OBUF \pcpi_insn_OBUF[27]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[27]));
  OBUF \pcpi_insn_OBUF[28]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[28]));
  OBUF \pcpi_insn_OBUF[29]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[29]));
  OBUF \pcpi_insn_OBUF[2]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[2]));
  OBUF \pcpi_insn_OBUF[30]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[30]));
  OBUF \pcpi_insn_OBUF[31]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[31]));
  OBUF \pcpi_insn_OBUF[3]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[3]));
  OBUF \pcpi_insn_OBUF[4]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[4]));
  OBUF \pcpi_insn_OBUF[5]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[5]));
  OBUF \pcpi_insn_OBUF[6]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[6]));
  OBUF \pcpi_insn_OBUF[7]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[7]));
  OBUF \pcpi_insn_OBUF[8]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[8]));
  OBUF \pcpi_insn_OBUF[9]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[9]));
  OBUF \pcpi_rs1_OBUF[0]_inst 
       (.I(pcpi_rs1_OBUF[0]),
        .O(pcpi_rs1[0]));
  OBUF \pcpi_rs1_OBUF[10]_inst 
       (.I(pcpi_rs1_OBUF[10]),
        .O(pcpi_rs1[10]));
  OBUF \pcpi_rs1_OBUF[11]_inst 
       (.I(pcpi_rs1_OBUF[11]),
        .O(pcpi_rs1[11]));
  OBUF \pcpi_rs1_OBUF[12]_inst 
       (.I(pcpi_rs1_OBUF[12]),
        .O(pcpi_rs1[12]));
  OBUF \pcpi_rs1_OBUF[13]_inst 
       (.I(pcpi_rs1_OBUF[13]),
        .O(pcpi_rs1[13]));
  OBUF \pcpi_rs1_OBUF[14]_inst 
       (.I(pcpi_rs1_OBUF[14]),
        .O(pcpi_rs1[14]));
  OBUF \pcpi_rs1_OBUF[15]_inst 
       (.I(pcpi_rs1_OBUF[15]),
        .O(pcpi_rs1[15]));
  OBUF \pcpi_rs1_OBUF[16]_inst 
       (.I(pcpi_rs1_OBUF[16]),
        .O(pcpi_rs1[16]));
  OBUF \pcpi_rs1_OBUF[17]_inst 
       (.I(pcpi_rs1_OBUF[17]),
        .O(pcpi_rs1[17]));
  OBUF \pcpi_rs1_OBUF[18]_inst 
       (.I(pcpi_rs1_OBUF[18]),
        .O(pcpi_rs1[18]));
  OBUF \pcpi_rs1_OBUF[19]_inst 
       (.I(pcpi_rs1_OBUF[19]),
        .O(pcpi_rs1[19]));
  OBUF \pcpi_rs1_OBUF[1]_inst 
       (.I(pcpi_rs1_OBUF[1]),
        .O(pcpi_rs1[1]));
  OBUF \pcpi_rs1_OBUF[20]_inst 
       (.I(pcpi_rs1_OBUF[20]),
        .O(pcpi_rs1[20]));
  OBUF \pcpi_rs1_OBUF[21]_inst 
       (.I(pcpi_rs1_OBUF[21]),
        .O(pcpi_rs1[21]));
  OBUF \pcpi_rs1_OBUF[22]_inst 
       (.I(pcpi_rs1_OBUF[22]),
        .O(pcpi_rs1[22]));
  OBUF \pcpi_rs1_OBUF[23]_inst 
       (.I(pcpi_rs1_OBUF[23]),
        .O(pcpi_rs1[23]));
  OBUF \pcpi_rs1_OBUF[24]_inst 
       (.I(pcpi_rs1_OBUF[24]),
        .O(pcpi_rs1[24]));
  OBUF \pcpi_rs1_OBUF[25]_inst 
       (.I(pcpi_rs1_OBUF[25]),
        .O(pcpi_rs1[25]));
  OBUF \pcpi_rs1_OBUF[26]_inst 
       (.I(pcpi_rs1_OBUF[26]),
        .O(pcpi_rs1[26]));
  OBUF \pcpi_rs1_OBUF[27]_inst 
       (.I(pcpi_rs1_OBUF[27]),
        .O(pcpi_rs1[27]));
  OBUF \pcpi_rs1_OBUF[28]_inst 
       (.I(pcpi_rs1_OBUF[28]),
        .O(pcpi_rs1[28]));
  OBUF \pcpi_rs1_OBUF[29]_inst 
       (.I(pcpi_rs1_OBUF[29]),
        .O(pcpi_rs1[29]));
  OBUF \pcpi_rs1_OBUF[2]_inst 
       (.I(pcpi_rs1_OBUF[2]),
        .O(pcpi_rs1[2]));
  OBUF \pcpi_rs1_OBUF[30]_inst 
       (.I(pcpi_rs1_OBUF[30]),
        .O(pcpi_rs1[30]));
  OBUF \pcpi_rs1_OBUF[31]_inst 
       (.I(pcpi_rs1_OBUF[31]),
        .O(pcpi_rs1[31]));
  OBUF \pcpi_rs1_OBUF[3]_inst 
       (.I(pcpi_rs1_OBUF[3]),
        .O(pcpi_rs1[3]));
  OBUF \pcpi_rs1_OBUF[4]_inst 
       (.I(pcpi_rs1_OBUF[4]),
        .O(pcpi_rs1[4]));
  OBUF \pcpi_rs1_OBUF[5]_inst 
       (.I(pcpi_rs1_OBUF[5]),
        .O(pcpi_rs1[5]));
  OBUF \pcpi_rs1_OBUF[6]_inst 
       (.I(pcpi_rs1_OBUF[6]),
        .O(pcpi_rs1[6]));
  OBUF \pcpi_rs1_OBUF[7]_inst 
       (.I(pcpi_rs1_OBUF[7]),
        .O(pcpi_rs1[7]));
  OBUF \pcpi_rs1_OBUF[8]_inst 
       (.I(pcpi_rs1_OBUF[8]),
        .O(pcpi_rs1[8]));
  OBUF \pcpi_rs1_OBUF[9]_inst 
       (.I(pcpi_rs1_OBUF[9]),
        .O(pcpi_rs1[9]));
  OBUF \pcpi_rs2_OBUF[0]_inst 
       (.I(pcpi_rs2_OBUF[0]),
        .O(pcpi_rs2[0]));
  OBUF \pcpi_rs2_OBUF[10]_inst 
       (.I(pcpi_rs2_OBUF[10]),
        .O(pcpi_rs2[10]));
  OBUF \pcpi_rs2_OBUF[11]_inst 
       (.I(pcpi_rs2_OBUF[11]),
        .O(pcpi_rs2[11]));
  OBUF \pcpi_rs2_OBUF[12]_inst 
       (.I(pcpi_rs2_OBUF[12]),
        .O(pcpi_rs2[12]));
  OBUF \pcpi_rs2_OBUF[13]_inst 
       (.I(pcpi_rs2_OBUF[13]),
        .O(pcpi_rs2[13]));
  OBUF \pcpi_rs2_OBUF[14]_inst 
       (.I(pcpi_rs2_OBUF[14]),
        .O(pcpi_rs2[14]));
  OBUF \pcpi_rs2_OBUF[15]_inst 
       (.I(pcpi_rs2_OBUF[15]),
        .O(pcpi_rs2[15]));
  OBUF \pcpi_rs2_OBUF[16]_inst 
       (.I(pcpi_rs2_OBUF[16]),
        .O(pcpi_rs2[16]));
  OBUF \pcpi_rs2_OBUF[17]_inst 
       (.I(pcpi_rs2_OBUF[17]),
        .O(pcpi_rs2[17]));
  OBUF \pcpi_rs2_OBUF[18]_inst 
       (.I(pcpi_rs2_OBUF[18]),
        .O(pcpi_rs2[18]));
  OBUF \pcpi_rs2_OBUF[19]_inst 
       (.I(pcpi_rs2_OBUF[19]),
        .O(pcpi_rs2[19]));
  OBUF \pcpi_rs2_OBUF[1]_inst 
       (.I(pcpi_rs2_OBUF[1]),
        .O(pcpi_rs2[1]));
  OBUF \pcpi_rs2_OBUF[20]_inst 
       (.I(pcpi_rs2_OBUF[20]),
        .O(pcpi_rs2[20]));
  OBUF \pcpi_rs2_OBUF[21]_inst 
       (.I(pcpi_rs2_OBUF[21]),
        .O(pcpi_rs2[21]));
  OBUF \pcpi_rs2_OBUF[22]_inst 
       (.I(pcpi_rs2_OBUF[22]),
        .O(pcpi_rs2[22]));
  OBUF \pcpi_rs2_OBUF[23]_inst 
       (.I(pcpi_rs2_OBUF[23]),
        .O(pcpi_rs2[23]));
  OBUF \pcpi_rs2_OBUF[24]_inst 
       (.I(pcpi_rs2_OBUF[24]),
        .O(pcpi_rs2[24]));
  OBUF \pcpi_rs2_OBUF[25]_inst 
       (.I(pcpi_rs2_OBUF[25]),
        .O(pcpi_rs2[25]));
  OBUF \pcpi_rs2_OBUF[26]_inst 
       (.I(pcpi_rs2_OBUF[26]),
        .O(pcpi_rs2[26]));
  OBUF \pcpi_rs2_OBUF[27]_inst 
       (.I(pcpi_rs2_OBUF[27]),
        .O(pcpi_rs2[27]));
  OBUF \pcpi_rs2_OBUF[28]_inst 
       (.I(pcpi_rs2_OBUF[28]),
        .O(pcpi_rs2[28]));
  OBUF \pcpi_rs2_OBUF[29]_inst 
       (.I(pcpi_rs2_OBUF[29]),
        .O(pcpi_rs2[29]));
  OBUF \pcpi_rs2_OBUF[2]_inst 
       (.I(pcpi_rs2_OBUF[2]),
        .O(pcpi_rs2[2]));
  OBUF \pcpi_rs2_OBUF[30]_inst 
       (.I(pcpi_rs2_OBUF[30]),
        .O(pcpi_rs2[30]));
  OBUF \pcpi_rs2_OBUF[31]_inst 
       (.I(pcpi_rs2_OBUF[31]),
        .O(pcpi_rs2[31]));
  OBUF \pcpi_rs2_OBUF[3]_inst 
       (.I(pcpi_rs2_OBUF[3]),
        .O(pcpi_rs2[3]));
  OBUF \pcpi_rs2_OBUF[4]_inst 
       (.I(pcpi_rs2_OBUF[4]),
        .O(pcpi_rs2[4]));
  OBUF \pcpi_rs2_OBUF[5]_inst 
       (.I(pcpi_rs2_OBUF[5]),
        .O(pcpi_rs2[5]));
  OBUF \pcpi_rs2_OBUF[6]_inst 
       (.I(pcpi_rs2_OBUF[6]),
        .O(pcpi_rs2[6]));
  OBUF \pcpi_rs2_OBUF[7]_inst 
       (.I(pcpi_rs2_OBUF[7]),
        .O(pcpi_rs2[7]));
  OBUF \pcpi_rs2_OBUF[8]_inst 
       (.I(pcpi_rs2_OBUF[8]),
        .O(pcpi_rs2[8]));
  OBUF \pcpi_rs2_OBUF[9]_inst 
       (.I(pcpi_rs2_OBUF[9]),
        .O(pcpi_rs2[9]));
  OBUF pcpi_valid_OBUF_inst
       (.I(\<const0> ),
        .O(pcpi_valid));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \reg_next_pc[12]_i_2 
       (.I0(current_pc[12]),
        .I1(decoder_trigger_reg_n_0),
        .I2(instr_jal),
        .I3(decoded_imm_j[12]),
        .O(\reg_next_pc[12]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \reg_next_pc[12]_i_3 
       (.I0(current_pc[11]),
        .I1(decoder_trigger_reg_n_0),
        .I2(instr_jal),
        .I3(decoded_imm_j[11]),
        .O(\reg_next_pc[12]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \reg_next_pc[12]_i_4 
       (.I0(current_pc[10]),
        .I1(decoder_trigger_reg_n_0),
        .I2(instr_jal),
        .I3(decoded_imm_j[10]),
        .O(\reg_next_pc[12]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \reg_next_pc[12]_i_5 
       (.I0(current_pc[9]),
        .I1(decoder_trigger_reg_n_0),
        .I2(instr_jal),
        .I3(decoded_imm_j[9]),
        .O(\reg_next_pc[12]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \reg_next_pc[16]_i_2 
       (.I0(current_pc[16]),
        .I1(decoder_trigger_reg_n_0),
        .I2(instr_jal),
        .I3(decoded_rs1[1]),
        .O(\reg_next_pc[16]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \reg_next_pc[16]_i_3 
       (.I0(current_pc[15]),
        .I1(decoder_trigger_reg_n_0),
        .I2(instr_jal),
        .I3(decoded_rs1[0]),
        .O(\reg_next_pc[16]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \reg_next_pc[16]_i_4 
       (.I0(current_pc[14]),
        .I1(decoder_trigger_reg_n_0),
        .I2(instr_jal),
        .I3(decoded_imm_j[14]),
        .O(\reg_next_pc[16]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \reg_next_pc[16]_i_5 
       (.I0(current_pc[13]),
        .I1(decoder_trigger_reg_n_0),
        .I2(instr_jal),
        .I3(decoded_imm_j[13]),
        .O(\reg_next_pc[16]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h111DDD1DEEE222E2)) 
    \reg_next_pc[20]_i_2 
       (.I0(\reg_next_pc_reg_n_0_[20] ),
        .I1(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I2(\reg_out_reg_n_0_[20] ),
        .I3(latched_stalu_reg_n_0),
        .I4(alu_out_q[20]),
        .I5(\reg_next_pc[31]_i_2_n_0 ),
        .O(\reg_next_pc[20]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \reg_next_pc[20]_i_3 
       (.I0(current_pc[19]),
        .I1(decoder_trigger_reg_n_0),
        .I2(instr_jal),
        .I3(decoded_rs1[4]),
        .O(\reg_next_pc[20]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \reg_next_pc[20]_i_4 
       (.I0(current_pc[18]),
        .I1(decoder_trigger_reg_n_0),
        .I2(instr_jal),
        .I3(decoded_rs1[3]),
        .O(\reg_next_pc[20]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \reg_next_pc[20]_i_5 
       (.I0(current_pc[17]),
        .I1(decoder_trigger_reg_n_0),
        .I2(instr_jal),
        .I3(decoded_rs1[2]),
        .O(\reg_next_pc[20]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h111DDD1DEEE222E2)) 
    \reg_next_pc[24]_i_2 
       (.I0(\reg_next_pc_reg_n_0_[24] ),
        .I1(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I2(\reg_out_reg_n_0_[24] ),
        .I3(latched_stalu_reg_n_0),
        .I4(alu_out_q[24]),
        .I5(\reg_next_pc[31]_i_2_n_0 ),
        .O(\reg_next_pc[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h111DDD1DEEE222E2)) 
    \reg_next_pc[24]_i_3 
       (.I0(\reg_next_pc_reg_n_0_[23] ),
        .I1(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I2(\reg_out_reg_n_0_[23] ),
        .I3(latched_stalu_reg_n_0),
        .I4(alu_out_q[23]),
        .I5(\reg_next_pc[31]_i_2_n_0 ),
        .O(\reg_next_pc[24]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h111DDD1DEEE222E2)) 
    \reg_next_pc[24]_i_4 
       (.I0(\reg_next_pc_reg_n_0_[22] ),
        .I1(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I2(\reg_out_reg_n_0_[22] ),
        .I3(latched_stalu_reg_n_0),
        .I4(alu_out_q[22]),
        .I5(\reg_next_pc[31]_i_2_n_0 ),
        .O(\reg_next_pc[24]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h111DDD1DEEE222E2)) 
    \reg_next_pc[24]_i_5 
       (.I0(\reg_next_pc_reg_n_0_[21] ),
        .I1(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I2(\reg_out_reg_n_0_[21] ),
        .I3(latched_stalu_reg_n_0),
        .I4(alu_out_q[21]),
        .I5(\reg_next_pc[31]_i_2_n_0 ),
        .O(\reg_next_pc[24]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h111DDD1DEEE222E2)) 
    \reg_next_pc[28]_i_2 
       (.I0(\reg_next_pc_reg_n_0_[28] ),
        .I1(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I2(\reg_out_reg_n_0_[28] ),
        .I3(latched_stalu_reg_n_0),
        .I4(alu_out_q[28]),
        .I5(\reg_next_pc[31]_i_2_n_0 ),
        .O(\reg_next_pc[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h111DDD1DEEE222E2)) 
    \reg_next_pc[28]_i_3 
       (.I0(\reg_next_pc_reg_n_0_[27] ),
        .I1(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I2(\reg_out_reg_n_0_[27] ),
        .I3(latched_stalu_reg_n_0),
        .I4(alu_out_q[27]),
        .I5(\reg_next_pc[31]_i_2_n_0 ),
        .O(\reg_next_pc[28]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h111DDD1DEEE222E2)) 
    \reg_next_pc[28]_i_4 
       (.I0(\reg_next_pc_reg_n_0_[26] ),
        .I1(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I2(\reg_out_reg_n_0_[26] ),
        .I3(latched_stalu_reg_n_0),
        .I4(alu_out_q[26]),
        .I5(\reg_next_pc[31]_i_2_n_0 ),
        .O(\reg_next_pc[28]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h111DDD1DEEE222E2)) 
    \reg_next_pc[28]_i_5 
       (.I0(\reg_next_pc_reg_n_0_[25] ),
        .I1(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I2(\reg_out_reg_n_0_[25] ),
        .I3(latched_stalu_reg_n_0),
        .I4(alu_out_q[25]),
        .I5(\reg_next_pc[31]_i_2_n_0 ),
        .O(\reg_next_pc[28]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \reg_next_pc[31]_i_2 
       (.I0(decoded_imm_j[30]),
        .I1(instr_jal),
        .I2(decoder_trigger_reg_n_0),
        .O(\reg_next_pc[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h565656A6A6A656A6)) 
    \reg_next_pc[31]_i_3 
       (.I0(\reg_next_pc[31]_i_2_n_0 ),
        .I1(\reg_next_pc_reg_n_0_[31] ),
        .I2(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I3(\reg_out_reg_n_0_[31] ),
        .I4(latched_stalu_reg_n_0),
        .I5(alu_out_q[31]),
        .O(\reg_next_pc[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h111DDD1DEEE222E2)) 
    \reg_next_pc[31]_i_4 
       (.I0(\reg_next_pc_reg_n_0_[30] ),
        .I1(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I2(\reg_out_reg_n_0_[30] ),
        .I3(latched_stalu_reg_n_0),
        .I4(alu_out_q[30]),
        .I5(\reg_next_pc[31]_i_2_n_0 ),
        .O(\reg_next_pc[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h111DDD1DEEE222E2)) 
    \reg_next_pc[31]_i_5 
       (.I0(\reg_next_pc_reg_n_0_[29] ),
        .I1(\mem_la_addr_OBUF[31]_inst_i_2_n_0 ),
        .I2(\reg_out_reg_n_0_[29] ),
        .I3(latched_stalu_reg_n_0),
        .I4(alu_out_q[29]),
        .I5(\reg_next_pc[31]_i_2_n_0 ),
        .O(\reg_next_pc[31]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \reg_next_pc[4]_i_2 
       (.I0(current_pc[4]),
        .I1(decoder_trigger_reg_n_0),
        .I2(instr_jal),
        .I3(decoded_imm_j[4]),
        .O(\reg_next_pc[4]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \reg_next_pc[4]_i_3 
       (.I0(current_pc[3]),
        .I1(decoder_trigger_reg_n_0),
        .I2(instr_jal),
        .I3(decoded_imm_j[3]),
        .O(\reg_next_pc[4]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h59AA)) 
    \reg_next_pc[4]_i_4 
       (.I0(current_pc[2]),
        .I1(instr_jal),
        .I2(decoded_imm_j[2]),
        .I3(decoder_trigger_reg_n_0),
        .O(\reg_next_pc[4]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \reg_next_pc[4]_i_5 
       (.I0(current_pc[1]),
        .I1(decoder_trigger_reg_n_0),
        .I2(instr_jal),
        .I3(decoded_imm_j[1]),
        .O(\reg_next_pc[4]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \reg_next_pc[8]_i_2 
       (.I0(current_pc[8]),
        .I1(decoder_trigger_reg_n_0),
        .I2(instr_jal),
        .I3(decoded_imm_j[8]),
        .O(\reg_next_pc[8]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \reg_next_pc[8]_i_3 
       (.I0(current_pc[7]),
        .I1(decoder_trigger_reg_n_0),
        .I2(instr_jal),
        .I3(decoded_imm_j[7]),
        .O(\reg_next_pc[8]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \reg_next_pc[8]_i_4 
       (.I0(current_pc[6]),
        .I1(decoder_trigger_reg_n_0),
        .I2(instr_jal),
        .I3(decoded_imm_j[6]),
        .O(\reg_next_pc[8]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \reg_next_pc[8]_i_5 
       (.I0(current_pc[5]),
        .I1(decoder_trigger_reg_n_0),
        .I2(instr_jal),
        .I3(decoded_imm_j[5]),
        .O(\reg_next_pc[8]_i_5_n_0 ));
  FDRE \reg_next_pc_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[10]),
        .Q(\reg_next_pc_reg_n_0_[10] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[11]),
        .Q(\reg_next_pc_reg_n_0_[11] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[12]),
        .Q(\reg_next_pc_reg_n_0_[12] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_next_pc_reg[12]_i_1 
       (.CI(\reg_next_pc_reg[8]_i_1_n_0 ),
        .CO({\reg_next_pc_reg[12]_i_1_n_0 ,\NLW_reg_next_pc_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(current_pc[12:9]),
        .O(reg_next_pc1_in[12:9]),
        .S({\reg_next_pc[12]_i_2_n_0 ,\reg_next_pc[12]_i_3_n_0 ,\reg_next_pc[12]_i_4_n_0 ,\reg_next_pc[12]_i_5_n_0 }));
  FDRE \reg_next_pc_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[13]),
        .Q(\reg_next_pc_reg_n_0_[13] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[14]),
        .Q(\reg_next_pc_reg_n_0_[14] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[15]),
        .Q(\reg_next_pc_reg_n_0_[15] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[16]),
        .Q(\reg_next_pc_reg_n_0_[16] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_next_pc_reg[16]_i_1 
       (.CI(\reg_next_pc_reg[12]_i_1_n_0 ),
        .CO({\reg_next_pc_reg[16]_i_1_n_0 ,\NLW_reg_next_pc_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(current_pc[16:13]),
        .O(reg_next_pc1_in[16:13]),
        .S({\reg_next_pc[16]_i_2_n_0 ,\reg_next_pc[16]_i_3_n_0 ,\reg_next_pc[16]_i_4_n_0 ,\reg_next_pc[16]_i_5_n_0 }));
  FDRE \reg_next_pc_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[17]),
        .Q(\reg_next_pc_reg_n_0_[17] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[18]),
        .Q(\reg_next_pc_reg_n_0_[18] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[19]),
        .Q(\reg_next_pc_reg_n_0_[19] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[1]),
        .Q(\reg_next_pc_reg_n_0_[1] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[20]),
        .Q(\reg_next_pc_reg_n_0_[20] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_next_pc_reg[20]_i_1 
       (.CI(\reg_next_pc_reg[16]_i_1_n_0 ),
        .CO({\reg_next_pc_reg[20]_i_1_n_0 ,\NLW_reg_next_pc_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_next_pc[31]_i_2_n_0 ,current_pc[19:17]}),
        .O(reg_next_pc1_in[20:17]),
        .S({\reg_next_pc[20]_i_2_n_0 ,\reg_next_pc[20]_i_3_n_0 ,\reg_next_pc[20]_i_4_n_0 ,\reg_next_pc[20]_i_5_n_0 }));
  FDRE \reg_next_pc_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[21]),
        .Q(\reg_next_pc_reg_n_0_[21] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[22]),
        .Q(\reg_next_pc_reg_n_0_[22] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[23]),
        .Q(\reg_next_pc_reg_n_0_[23] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[24]),
        .Q(\reg_next_pc_reg_n_0_[24] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_next_pc_reg[24]_i_1 
       (.CI(\reg_next_pc_reg[20]_i_1_n_0 ),
        .CO({\reg_next_pc_reg[24]_i_1_n_0 ,\NLW_reg_next_pc_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_next_pc[31]_i_2_n_0 ,\reg_next_pc[31]_i_2_n_0 ,\reg_next_pc[31]_i_2_n_0 ,\reg_next_pc[31]_i_2_n_0 }),
        .O(reg_next_pc1_in[24:21]),
        .S({\reg_next_pc[24]_i_2_n_0 ,\reg_next_pc[24]_i_3_n_0 ,\reg_next_pc[24]_i_4_n_0 ,\reg_next_pc[24]_i_5_n_0 }));
  FDRE \reg_next_pc_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[25]),
        .Q(\reg_next_pc_reg_n_0_[25] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[26]),
        .Q(\reg_next_pc_reg_n_0_[26] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[27]),
        .Q(\reg_next_pc_reg_n_0_[27] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[28]),
        .Q(\reg_next_pc_reg_n_0_[28] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_next_pc_reg[28]_i_1 
       (.CI(\reg_next_pc_reg[24]_i_1_n_0 ),
        .CO({\reg_next_pc_reg[28]_i_1_n_0 ,\NLW_reg_next_pc_reg[28]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_next_pc[31]_i_2_n_0 ,\reg_next_pc[31]_i_2_n_0 ,\reg_next_pc[31]_i_2_n_0 ,\reg_next_pc[31]_i_2_n_0 }),
        .O(reg_next_pc1_in[28:25]),
        .S({\reg_next_pc[28]_i_2_n_0 ,\reg_next_pc[28]_i_3_n_0 ,\reg_next_pc[28]_i_4_n_0 ,\reg_next_pc[28]_i_5_n_0 }));
  FDRE \reg_next_pc_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[29]),
        .Q(\reg_next_pc_reg_n_0_[29] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[2]),
        .Q(\reg_next_pc_reg_n_0_[2] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[30]),
        .Q(\reg_next_pc_reg_n_0_[30] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[31]),
        .Q(\reg_next_pc_reg_n_0_[31] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_next_pc_reg[31]_i_1 
       (.CI(\reg_next_pc_reg[28]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\reg_next_pc[31]_i_2_n_0 ,\reg_next_pc[31]_i_2_n_0 }),
        .O(reg_next_pc1_in[31:29]),
        .S({\<const0> ,\reg_next_pc[31]_i_3_n_0 ,\reg_next_pc[31]_i_4_n_0 ,\reg_next_pc[31]_i_5_n_0 }));
  FDRE \reg_next_pc_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[3]),
        .Q(\reg_next_pc_reg_n_0_[3] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[4]),
        .Q(\reg_next_pc_reg_n_0_[4] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_next_pc_reg[4]_i_1 
       (.CI(\<const0> ),
        .CO({\reg_next_pc_reg[4]_i_1_n_0 ,\NLW_reg_next_pc_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(current_pc[4:1]),
        .O(reg_next_pc1_in[4:1]),
        .S({\reg_next_pc[4]_i_2_n_0 ,\reg_next_pc[4]_i_3_n_0 ,\reg_next_pc[4]_i_4_n_0 ,\reg_next_pc[4]_i_5_n_0 }));
  FDRE \reg_next_pc_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[5]),
        .Q(\reg_next_pc_reg_n_0_[5] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[6]),
        .Q(\reg_next_pc_reg_n_0_[6] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[7]),
        .Q(\reg_next_pc_reg_n_0_[7] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_next_pc_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[8]),
        .Q(\reg_next_pc_reg_n_0_[8] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_next_pc_reg[8]_i_1 
       (.CI(\reg_next_pc_reg[4]_i_1_n_0 ),
        .CO({\reg_next_pc_reg[8]_i_1_n_0 ,\NLW_reg_next_pc_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(current_pc[8:5]),
        .O(reg_next_pc1_in[8:5]),
        .S({\reg_next_pc[8]_i_2_n_0 ,\reg_next_pc[8]_i_3_n_0 ,\reg_next_pc[8]_i_4_n_0 ,\reg_next_pc[8]_i_5_n_0 }));
  FDRE \reg_next_pc_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[9]),
        .Q(\reg_next_pc_reg_n_0_[9] ),
        .R(instr_and_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFF0400)) 
    \reg_op1[0]_i_1 
       (.I0(\reg_op1[0]_i_2_n_0 ),
        .I1(reg_op12[0]),
        .I2(is_lui_auipc_jal),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .I4(\reg_op1[0]_i_4_n_0 ),
        .O(reg_op1[0]));
  LUT5 #(
    .INIT(32'h00000001)) 
    \reg_op1[0]_i_2 
       (.I0(decoded_rs1[3]),
        .I1(decoded_rs1[4]),
        .I2(decoded_rs1[1]),
        .I3(decoded_rs1[0]),
        .I4(decoded_rs1[2]),
        .O(\reg_op1[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \reg_op1[0]_i_3 
       (.I0(instr_rdinstrh),
        .I1(instr_rdinstr),
        .I2(instr_rdcycleh),
        .I3(instr_rdcycle),
        .I4(\cpu_state_reg_n_0_[5] ),
        .I5(\cpu_state[7]_i_7_n_0 ),
        .O(\reg_op1[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h0000444F)) 
    \reg_op1[0]_i_4 
       (.I0(\cpu_state_reg_n_0_[2] ),
        .I1(\reg_op1_reg[3]_i_3_n_7 ),
        .I2(\reg_op1[0]_i_5_n_0 ),
        .I3(\reg_op1[0]_i_6_n_0 ),
        .I4(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \reg_op1[0]_i_5 
       (.I0(instr_srai),
        .I1(instr_sra),
        .I2(instr_srli),
        .I3(instr_srl),
        .O(\reg_op1[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h777777757777777F)) 
    \reg_op1[0]_i_6 
       (.I0(\cpu_state_reg_n_0_[2] ),
        .I1(pcpi_rs1_OBUF[4]),
        .I2(\reg_sh_reg_n_0_[3] ),
        .I3(\reg_sh_reg_n_0_[2] ),
        .I4(\reg_sh_reg_n_0_[4] ),
        .I5(pcpi_rs1_OBUF[1]),
        .O(\reg_op1[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[10]_i_1 
       (.I0(\reg_pc_reg_n_0_[10] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[10]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[10]_i_2_n_0 ),
        .O(reg_op1[10]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[10]_i_2 
       (.I0(\reg_op1_reg[11]_i_3_n_5 ),
        .I1(\reg_op1[10]_i_3_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[10]_i_3 
       (.I0(pcpi_rs1_OBUF[9]),
        .I1(\reg_op1[10]_i_4_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[13]_i_4_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[6]),
        .O(\reg_op1[10]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[10]_i_4 
       (.I0(pcpi_rs1_OBUF[11]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[10]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[11]_i_1 
       (.I0(\reg_pc_reg_n_0_[11] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[11]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[11]_i_2_n_0 ),
        .O(reg_op1[11]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[11]_i_2 
       (.I0(\reg_op1_reg[11]_i_3_n_4 ),
        .I1(\reg_op1[11]_i_4_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[11]_i_4 
       (.I0(pcpi_rs1_OBUF[10]),
        .I1(\reg_op1[11]_i_9_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[14]_i_4_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[7]),
        .O(\reg_op1[11]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[11]_i_5 
       (.I0(pcpi_rs1_OBUF[11]),
        .I1(decoded_imm[11]),
        .O(\reg_op1[11]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[11]_i_6 
       (.I0(pcpi_rs1_OBUF[10]),
        .I1(decoded_imm[10]),
        .O(\reg_op1[11]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[11]_i_7 
       (.I0(pcpi_rs1_OBUF[9]),
        .I1(decoded_imm[9]),
        .O(\reg_op1[11]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[11]_i_8 
       (.I0(pcpi_rs1_OBUF[8]),
        .I1(decoded_imm[8]),
        .O(\reg_op1[11]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[11]_i_9 
       (.I0(pcpi_rs1_OBUF[12]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[11]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[12]_i_1 
       (.I0(\reg_pc_reg_n_0_[12] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[12]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[12]_i_2_n_0 ),
        .O(reg_op1[12]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[12]_i_2 
       (.I0(\reg_op1_reg[15]_i_3_n_7 ),
        .I1(\reg_op1[12]_i_3_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[12]_i_3 
       (.I0(pcpi_rs1_OBUF[11]),
        .I1(\reg_op1[12]_i_4_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[15]_i_9_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[8]),
        .O(\reg_op1[12]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[12]_i_4 
       (.I0(pcpi_rs1_OBUF[13]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[12]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[13]_i_1 
       (.I0(\reg_pc_reg_n_0_[13] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[13]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[13]_i_2_n_0 ),
        .O(reg_op1[13]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[13]_i_2 
       (.I0(\reg_op1_reg[15]_i_3_n_6 ),
        .I1(\reg_op1[13]_i_3_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[13]_i_3 
       (.I0(pcpi_rs1_OBUF[12]),
        .I1(\reg_op1[13]_i_4_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[16]_i_4_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[9]),
        .O(\reg_op1[13]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[13]_i_4 
       (.I0(pcpi_rs1_OBUF[14]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[13]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[14]_i_1 
       (.I0(\reg_pc_reg_n_0_[14] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[14]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[14]_i_2_n_0 ),
        .O(reg_op1[14]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[14]_i_2 
       (.I0(\reg_op1_reg[15]_i_3_n_5 ),
        .I1(\reg_op1[14]_i_3_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[14]_i_3 
       (.I0(pcpi_rs1_OBUF[13]),
        .I1(\reg_op1[14]_i_4_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[17]_i_4_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[10]),
        .O(\reg_op1[14]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[14]_i_4 
       (.I0(pcpi_rs1_OBUF[15]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[14]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[15]_i_1 
       (.I0(\reg_pc_reg_n_0_[15] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[15]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[15]_i_2_n_0 ),
        .O(reg_op1[15]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[15]_i_2 
       (.I0(\reg_op1_reg[15]_i_3_n_4 ),
        .I1(\reg_op1[15]_i_4_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[15]_i_4 
       (.I0(pcpi_rs1_OBUF[14]),
        .I1(\reg_op1[15]_i_9_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[18]_i_4_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[11]),
        .O(\reg_op1[15]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[15]_i_5 
       (.I0(pcpi_rs1_OBUF[15]),
        .I1(decoded_imm[15]),
        .O(\reg_op1[15]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[15]_i_6 
       (.I0(pcpi_rs1_OBUF[14]),
        .I1(decoded_imm[14]),
        .O(\reg_op1[15]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[15]_i_7 
       (.I0(pcpi_rs1_OBUF[13]),
        .I1(decoded_imm[13]),
        .O(\reg_op1[15]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[15]_i_8 
       (.I0(pcpi_rs1_OBUF[12]),
        .I1(decoded_imm[12]),
        .O(\reg_op1[15]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[15]_i_9 
       (.I0(pcpi_rs1_OBUF[16]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[15]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[16]_i_1 
       (.I0(\reg_pc_reg_n_0_[16] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[16]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[16]_i_2_n_0 ),
        .O(reg_op1[16]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[16]_i_2 
       (.I0(\reg_op1_reg[19]_i_3_n_7 ),
        .I1(\reg_op1[16]_i_3_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[16]_i_3 
       (.I0(pcpi_rs1_OBUF[15]),
        .I1(\reg_op1[16]_i_4_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[19]_i_9_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[12]),
        .O(\reg_op1[16]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[16]_i_4 
       (.I0(pcpi_rs1_OBUF[17]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[16]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[17]_i_1 
       (.I0(\reg_pc_reg_n_0_[17] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[17]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[17]_i_2_n_0 ),
        .O(reg_op1[17]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[17]_i_2 
       (.I0(\reg_op1_reg[19]_i_3_n_6 ),
        .I1(\reg_op1[17]_i_3_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[17]_i_3 
       (.I0(pcpi_rs1_OBUF[16]),
        .I1(\reg_op1[17]_i_4_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[20]_i_4_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[13]),
        .O(\reg_op1[17]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[17]_i_4 
       (.I0(pcpi_rs1_OBUF[18]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[17]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[18]_i_1 
       (.I0(\reg_pc_reg_n_0_[18] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[18]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[18]_i_2_n_0 ),
        .O(reg_op1[18]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[18]_i_2 
       (.I0(\reg_op1_reg[19]_i_3_n_5 ),
        .I1(\reg_op1[18]_i_3_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[18]_i_3 
       (.I0(pcpi_rs1_OBUF[17]),
        .I1(\reg_op1[18]_i_4_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[21]_i_4_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[14]),
        .O(\reg_op1[18]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[18]_i_4 
       (.I0(pcpi_rs1_OBUF[19]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[18]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[19]_i_1 
       (.I0(\reg_pc_reg_n_0_[19] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[19]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[19]_i_2_n_0 ),
        .O(reg_op1[19]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[19]_i_2 
       (.I0(\reg_op1_reg[19]_i_3_n_4 ),
        .I1(\reg_op1[19]_i_4_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[19]_i_4 
       (.I0(pcpi_rs1_OBUF[18]),
        .I1(\reg_op1[19]_i_9_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[22]_i_4_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[15]),
        .O(\reg_op1[19]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[19]_i_5 
       (.I0(pcpi_rs1_OBUF[19]),
        .I1(decoded_imm[19]),
        .O(\reg_op1[19]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[19]_i_6 
       (.I0(pcpi_rs1_OBUF[18]),
        .I1(decoded_imm[18]),
        .O(\reg_op1[19]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[19]_i_7 
       (.I0(pcpi_rs1_OBUF[17]),
        .I1(decoded_imm[17]),
        .O(\reg_op1[19]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[19]_i_8 
       (.I0(pcpi_rs1_OBUF[16]),
        .I1(decoded_imm[16]),
        .O(\reg_op1[19]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[19]_i_9 
       (.I0(pcpi_rs1_OBUF[20]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[19]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[1]_i_1 
       (.I0(\reg_pc_reg_n_0_[1] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[1]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[1]_i_2_n_0 ),
        .O(reg_op1[1]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \reg_op1[1]_i_2 
       (.I0(\reg_op1_reg[3]_i_3_n_6 ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\reg_op1[1]_i_3_n_0 ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h44004400F4FFF400)) 
    \reg_op1[1]_i_3 
       (.I0(\reg_op1[31]_i_15_n_0 ),
        .I1(pcpi_rs1_OBUF[0]),
        .I2(pcpi_rs1_OBUF[2]),
        .I3(\reg_sh[2]_i_2_n_0 ),
        .I4(pcpi_rs1_OBUF[5]),
        .I5(\reg_op1[0]_i_5_n_0 ),
        .O(\reg_op1[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[20]_i_1 
       (.I0(\reg_pc_reg_n_0_[20] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[20]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[20]_i_2_n_0 ),
        .O(reg_op1[20]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[20]_i_2 
       (.I0(\reg_op1_reg[23]_i_3_n_7 ),
        .I1(\reg_op1[20]_i_3_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[20]_i_3 
       (.I0(pcpi_rs1_OBUF[19]),
        .I1(\reg_op1[20]_i_4_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[23]_i_9_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[16]),
        .O(\reg_op1[20]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[20]_i_4 
       (.I0(pcpi_rs1_OBUF[21]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[20]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[21]_i_1 
       (.I0(\reg_pc_reg_n_0_[21] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[21]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[21]_i_2_n_0 ),
        .O(reg_op1[21]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[21]_i_2 
       (.I0(\reg_op1_reg[23]_i_3_n_6 ),
        .I1(\reg_op1[21]_i_3_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[21]_i_3 
       (.I0(pcpi_rs1_OBUF[20]),
        .I1(\reg_op1[21]_i_4_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[24]_i_4_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[17]),
        .O(\reg_op1[21]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[21]_i_4 
       (.I0(pcpi_rs1_OBUF[22]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[21]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[22]_i_1 
       (.I0(\reg_pc_reg_n_0_[22] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[22]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[22]_i_2_n_0 ),
        .O(reg_op1[22]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[22]_i_2 
       (.I0(\reg_op1_reg[23]_i_3_n_5 ),
        .I1(\reg_op1[22]_i_3_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[22]_i_3 
       (.I0(pcpi_rs1_OBUF[21]),
        .I1(\reg_op1[22]_i_4_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[25]_i_4_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[18]),
        .O(\reg_op1[22]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[22]_i_4 
       (.I0(pcpi_rs1_OBUF[23]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[22]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[23]_i_1 
       (.I0(\reg_pc_reg_n_0_[23] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[23]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[23]_i_2_n_0 ),
        .O(reg_op1[23]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[23]_i_2 
       (.I0(\reg_op1_reg[23]_i_3_n_4 ),
        .I1(\reg_op1[23]_i_4_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[23]_i_4 
       (.I0(pcpi_rs1_OBUF[22]),
        .I1(\reg_op1[23]_i_9_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[26]_i_4_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[19]),
        .O(\reg_op1[23]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[23]_i_5 
       (.I0(pcpi_rs1_OBUF[23]),
        .I1(decoded_imm[23]),
        .O(\reg_op1[23]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[23]_i_6 
       (.I0(pcpi_rs1_OBUF[22]),
        .I1(decoded_imm[22]),
        .O(\reg_op1[23]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[23]_i_7 
       (.I0(pcpi_rs1_OBUF[21]),
        .I1(decoded_imm[21]),
        .O(\reg_op1[23]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[23]_i_8 
       (.I0(pcpi_rs1_OBUF[20]),
        .I1(decoded_imm[20]),
        .O(\reg_op1[23]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[23]_i_9 
       (.I0(pcpi_rs1_OBUF[24]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[23]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[24]_i_1 
       (.I0(\reg_pc_reg_n_0_[24] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[24]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[24]_i_2_n_0 ),
        .O(reg_op1[24]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[24]_i_2 
       (.I0(\reg_op1_reg[31]_i_9_n_7 ),
        .I1(\reg_op1[24]_i_3_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[24]_i_3 
       (.I0(pcpi_rs1_OBUF[23]),
        .I1(\reg_op1[24]_i_4_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[27]_i_4_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[20]),
        .O(\reg_op1[24]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[24]_i_4 
       (.I0(pcpi_rs1_OBUF[25]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[24]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[25]_i_1 
       (.I0(\reg_pc_reg_n_0_[25] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[25]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[25]_i_2_n_0 ),
        .O(reg_op1[25]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[25]_i_2 
       (.I0(\reg_op1_reg[31]_i_9_n_6 ),
        .I1(\reg_op1[25]_i_3_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[25]_i_3 
       (.I0(pcpi_rs1_OBUF[24]),
        .I1(\reg_op1[25]_i_4_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[28]_i_4_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[21]),
        .O(\reg_op1[25]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[25]_i_4 
       (.I0(pcpi_rs1_OBUF[26]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[25]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[26]_i_1 
       (.I0(\reg_pc_reg_n_0_[26] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[26]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[26]_i_2_n_0 ),
        .O(reg_op1[26]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[26]_i_2 
       (.I0(\reg_op1_reg[31]_i_9_n_5 ),
        .I1(\reg_op1[26]_i_3_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[26]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[26]_i_3 
       (.I0(pcpi_rs1_OBUF[25]),
        .I1(\reg_op1[26]_i_4_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[29]_i_4_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[22]),
        .O(\reg_op1[26]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[26]_i_4 
       (.I0(pcpi_rs1_OBUF[27]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[26]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[27]_i_1 
       (.I0(\reg_pc_reg_n_0_[27] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[27]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[27]_i_2_n_0 ),
        .O(reg_op1[27]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[27]_i_2 
       (.I0(\reg_op1_reg[31]_i_9_n_4 ),
        .I1(\reg_op1[27]_i_3_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[27]_i_3 
       (.I0(pcpi_rs1_OBUF[26]),
        .I1(\reg_op1[27]_i_4_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[30]_i_6_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[23]),
        .O(\reg_op1[27]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[27]_i_4 
       (.I0(pcpi_rs1_OBUF[28]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[27]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[28]_i_1 
       (.I0(\reg_pc_reg_n_0_[28] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[28]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[28]_i_2_n_0 ),
        .O(reg_op1[28]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[28]_i_2 
       (.I0(\reg_op1_reg[31]_i_5_n_7 ),
        .I1(\reg_op1[28]_i_3_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[28]_i_3 
       (.I0(pcpi_rs1_OBUF[27]),
        .I1(\reg_op1[28]_i_4_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[31]_i_14_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[24]),
        .O(\reg_op1[28]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[28]_i_4 
       (.I0(pcpi_rs1_OBUF[29]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[28]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[29]_i_1 
       (.I0(\reg_pc_reg_n_0_[29] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[29]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[29]_i_2_n_0 ),
        .O(reg_op1[29]));
  LUT4 #(
    .INIT(16'h1310)) 
    \reg_op1[29]_i_2 
       (.I0(\reg_op1[29]_i_3_n_0 ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\reg_op1_reg[31]_i_5_n_6 ),
        .O(\reg_op1[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h505F1010505F101F)) 
    \reg_op1[29]_i_3 
       (.I0(\reg_op1[29]_i_4_n_0 ),
        .I1(pcpi_rs1_OBUF[28]),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[31]_i_14_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[25]),
        .O(\reg_op1[29]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[29]_i_4 
       (.I0(pcpi_rs1_OBUF[30]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[29]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[2]_i_1 
       (.I0(\reg_pc_reg_n_0_[2] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[2]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[2]_i_2_n_0 ),
        .O(reg_op1[2]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \reg_op1[2]_i_2 
       (.I0(\reg_op1_reg[3]_i_3_n_5 ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\reg_op1[2]_i_3_n_0 ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h44004400F4FFF400)) 
    \reg_op1[2]_i_3 
       (.I0(\reg_op1[31]_i_15_n_0 ),
        .I1(pcpi_rs1_OBUF[1]),
        .I2(pcpi_rs1_OBUF[3]),
        .I3(\reg_sh[2]_i_2_n_0 ),
        .I4(pcpi_rs1_OBUF[6]),
        .I5(\reg_op1[0]_i_5_n_0 ),
        .O(\reg_op1[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[30]_i_1 
       (.I0(\reg_pc_reg_n_0_[30] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[30]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[30]_i_4_n_0 ),
        .O(reg_op1[30]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \reg_op1[30]_i_2 
       (.I0(instr_lui),
        .I1(is_lui_auipc_jal),
        .I2(instr_rdinstrh),
        .I3(instr_rdinstr),
        .I4(instr_rdcycleh),
        .I5(instr_rdcycle),
        .O(\reg_op1[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAAB)) 
    \reg_op1[30]_i_3 
       (.I0(\cpu_state[1]_i_2_n_0 ),
        .I1(decoded_rs1[2]),
        .I2(decoded_rs1[0]),
        .I3(decoded_rs1[1]),
        .I4(decoded_rs1[4]),
        .I5(decoded_rs1[3]),
        .O(\reg_op1[30]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h1310)) 
    \reg_op1[30]_i_4 
       (.I0(\reg_op1[30]_i_5_n_0 ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\reg_op1_reg[31]_i_5_n_5 ),
        .O(\reg_op1[30]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h505F1010505F101F)) 
    \reg_op1[30]_i_5 
       (.I0(\reg_op1[30]_i_6_n_0 ),
        .I1(pcpi_rs1_OBUF[29]),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[31]_i_14_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[26]),
        .O(\reg_op1[30]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[30]_i_6 
       (.I0(pcpi_rs1_OBUF[31]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[30]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h1010101010D0D0D0)) 
    \reg_op1[31]_i_1 
       (.I0(\reg_op1[31]_i_3_n_0 ),
        .I1(\cpu_state_reg_n_0_[0] ),
        .I2(resetn_IBUF),
        .I3(is_sb_sh_sw_i_3_n_0),
        .I4(mem_do_prefetch_reg_n_0),
        .I5(mem_do_rdata),
        .O(\reg_op1[31]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[31]_i_10 
       (.I0(decoded_imm[31]),
        .I1(pcpi_rs1_OBUF[31]),
        .O(\reg_op1[31]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[31]_i_11 
       (.I0(pcpi_rs1_OBUF[30]),
        .I1(decoded_imm[30]),
        .O(\reg_op1[31]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[31]_i_12 
       (.I0(pcpi_rs1_OBUF[29]),
        .I1(decoded_imm[29]),
        .O(\reg_op1[31]_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[31]_i_13 
       (.I0(pcpi_rs1_OBUF[28]),
        .I1(decoded_imm[28]),
        .O(\reg_op1[31]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \reg_op1[31]_i_14 
       (.I0(pcpi_rs1_OBUF[31]),
        .I1(instr_srai),
        .I2(instr_sra),
        .O(\reg_op1[31]_i_14_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \reg_op1[31]_i_15 
       (.I0(instr_sll),
        .I1(instr_slli),
        .O(\reg_op1[31]_i_15_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[31]_i_16 
       (.I0(pcpi_rs1_OBUF[27]),
        .I1(decoded_imm[27]),
        .O(\reg_op1[31]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[31]_i_17 
       (.I0(pcpi_rs1_OBUF[26]),
        .I1(decoded_imm[26]),
        .O(\reg_op1[31]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[31]_i_18 
       (.I0(pcpi_rs1_OBUF[25]),
        .I1(decoded_imm[25]),
        .O(\reg_op1[31]_i_18_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[31]_i_19 
       (.I0(pcpi_rs1_OBUF[24]),
        .I1(decoded_imm[24]),
        .O(\reg_op1[31]_i_19_n_0 ));
  LUT5 #(
    .INIT(32'hBBBAAAAA)) 
    \reg_op1[31]_i_2 
       (.I0(\reg_op1[31]_i_4_n_0 ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(\reg_op1_reg[31]_i_5_n_4 ),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\reg_op1[31]_i_6_n_0 ),
        .O(reg_op1[31]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hAAAAAA02)) 
    \reg_op1[31]_i_3 
       (.I0(\mem_wordsize[1]_i_3_n_0 ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(\reg_out[15]_i_3_n_0 ),
        .I4(\cpu_state_reg_n_0_[1] ),
        .O(\reg_op1[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AEAC0000)) 
    \reg_op1[31]_i_4 
       (.I0(\reg_op1[31]_i_7_n_0 ),
        .I1(\reg_op1[31]_i_8_n_0 ),
        .I2(\cpu_state[1]_i_2_n_0 ),
        .I3(is_lb_lh_lw_lbu_lhu),
        .I4(\cpu_state_reg_n_0_[5] ),
        .I5(\cpu_state[7]_i_7_n_0 ),
        .O(\reg_op1[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hCFCFCFCFFFEFCFEF)) 
    \reg_op1[31]_i_6 
       (.I0(pcpi_rs1_OBUF[27]),
        .I1(\reg_op1[31]_i_14_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\reg_sh[2]_i_2_n_0 ),
        .I4(pcpi_rs1_OBUF[30]),
        .I5(\reg_op1[31]_i_15_n_0 ),
        .O(\reg_op1[31]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \reg_op1[31]_i_7 
       (.I0(\reg_pc_reg_n_0_[31] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .O(\reg_op1[31]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \reg_op1[31]_i_8 
       (.I0(reg_op12[31]),
        .I1(decoded_rs1[2]),
        .I2(decoded_rs1[0]),
        .I3(decoded_rs1[1]),
        .I4(decoded_rs1[4]),
        .I5(decoded_rs1[3]),
        .O(\reg_op1[31]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[3]_i_1 
       (.I0(\reg_pc_reg_n_0_[3] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[3]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[3]_i_2_n_0 ),
        .O(reg_op1[3]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \reg_op1[3]_i_2 
       (.I0(\reg_op1_reg[3]_i_3_n_4 ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\reg_op1[3]_i_4_n_0 ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h44004400F4FFF400)) 
    \reg_op1[3]_i_4 
       (.I0(\reg_op1[31]_i_15_n_0 ),
        .I1(pcpi_rs1_OBUF[2]),
        .I2(pcpi_rs1_OBUF[4]),
        .I3(\reg_sh[2]_i_2_n_0 ),
        .I4(pcpi_rs1_OBUF[7]),
        .I5(\reg_op1[0]_i_5_n_0 ),
        .O(\reg_op1[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[3]_i_5 
       (.I0(pcpi_rs1_OBUF[3]),
        .I1(decoded_imm[3]),
        .O(\reg_op1[3]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[3]_i_6 
       (.I0(pcpi_rs1_OBUF[2]),
        .I1(decoded_imm[2]),
        .O(\reg_op1[3]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[3]_i_7 
       (.I0(pcpi_rs1_OBUF[1]),
        .I1(decoded_imm[1]),
        .O(\reg_op1[3]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[3]_i_8 
       (.I0(pcpi_rs1_OBUF[0]),
        .I1(decoded_imm[0]),
        .O(\reg_op1[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[4]_i_1 
       (.I0(\reg_pc_reg_n_0_[4] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[4]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[4]_i_2_n_0 ),
        .O(reg_op1[4]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[4]_i_2 
       (.I0(\reg_op1_reg[7]_i_3_n_7 ),
        .I1(\reg_op1[4]_i_3_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[4]_i_3 
       (.I0(pcpi_rs1_OBUF[3]),
        .I1(\reg_op1[4]_i_4_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[7]_i_9_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[0]),
        .O(\reg_op1[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[4]_i_4 
       (.I0(pcpi_rs1_OBUF[5]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[5]_i_1 
       (.I0(\reg_pc_reg_n_0_[5] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[5]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[5]_i_2_n_0 ),
        .O(reg_op1[5]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[5]_i_2 
       (.I0(\reg_op1_reg[7]_i_3_n_6 ),
        .I1(\reg_op1[5]_i_3_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[5]_i_3 
       (.I0(pcpi_rs1_OBUF[4]),
        .I1(\reg_op1[5]_i_4_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[8]_i_4_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[1]),
        .O(\reg_op1[5]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[5]_i_4 
       (.I0(pcpi_rs1_OBUF[6]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[6]_i_1 
       (.I0(\reg_pc_reg_n_0_[6] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[6]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[6]_i_2_n_0 ),
        .O(reg_op1[6]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[6]_i_2 
       (.I0(\reg_op1_reg[7]_i_3_n_5 ),
        .I1(\reg_op1[6]_i_3_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[6]_i_3 
       (.I0(pcpi_rs1_OBUF[5]),
        .I1(\reg_op1[6]_i_4_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[9]_i_4_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[2]),
        .O(\reg_op1[6]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[6]_i_4 
       (.I0(pcpi_rs1_OBUF[7]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[7]_i_1 
       (.I0(\reg_pc_reg_n_0_[7] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[7]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[7]_i_2_n_0 ),
        .O(reg_op1[7]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[7]_i_2 
       (.I0(\reg_op1_reg[7]_i_3_n_4 ),
        .I1(\reg_op1[7]_i_4_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[7]_i_4 
       (.I0(pcpi_rs1_OBUF[6]),
        .I1(\reg_op1[7]_i_9_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[10]_i_4_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[3]),
        .O(\reg_op1[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[7]_i_5 
       (.I0(pcpi_rs1_OBUF[7]),
        .I1(decoded_imm[7]),
        .O(\reg_op1[7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[7]_i_6 
       (.I0(pcpi_rs1_OBUF[6]),
        .I1(decoded_imm[6]),
        .O(\reg_op1[7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[7]_i_7 
       (.I0(pcpi_rs1_OBUF[5]),
        .I1(decoded_imm[5]),
        .O(\reg_op1[7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[7]_i_8 
       (.I0(pcpi_rs1_OBUF[4]),
        .I1(decoded_imm[4]),
        .O(\reg_op1[7]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[7]_i_9 
       (.I0(pcpi_rs1_OBUF[8]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[7]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[8]_i_1 
       (.I0(\reg_pc_reg_n_0_[8] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[8]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[8]_i_2_n_0 ),
        .O(reg_op1[8]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[8]_i_2 
       (.I0(\reg_op1_reg[11]_i_3_n_7 ),
        .I1(\reg_op1[8]_i_3_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[8]_i_3 
       (.I0(pcpi_rs1_OBUF[7]),
        .I1(\reg_op1[8]_i_4_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[11]_i_9_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[4]),
        .O(\reg_op1[8]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[8]_i_4 
       (.I0(pcpi_rs1_OBUF[9]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2F220000)) 
    \reg_op1[9]_i_1 
       (.I0(\reg_pc_reg_n_0_[9] ),
        .I1(\reg_op1[30]_i_2_n_0 ),
        .I2(\reg_op1[30]_i_3_n_0 ),
        .I3(reg_op12[9]),
        .I4(\reg_out[3]_i_3_n_0 ),
        .I5(\reg_op1[9]_i_2_n_0 ),
        .O(reg_op1[9]));
  LUT4 #(
    .INIT(16'h003A)) 
    \reg_op1[9]_i_2 
       (.I0(\reg_op1_reg[11]_i_3_n_6 ),
        .I1(\reg_op1[9]_i_3_n_0 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h303F1010303F101F)) 
    \reg_op1[9]_i_3 
       (.I0(pcpi_rs1_OBUF[8]),
        .I1(\reg_op1[9]_i_4_n_0 ),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_op1[12]_i_4_n_0 ),
        .I4(\reg_op1[31]_i_15_n_0 ),
        .I5(pcpi_rs1_OBUF[5]),
        .O(\reg_op1[9]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \reg_op1[9]_i_4 
       (.I0(pcpi_rs1_OBUF[10]),
        .I1(instr_srl),
        .I2(instr_srli),
        .I3(instr_sra),
        .I4(instr_srai),
        .O(\reg_op1[9]_i_4_n_0 ));
  FDRE \reg_op1_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[0]),
        .Q(pcpi_rs1_OBUF[0]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[10]),
        .Q(pcpi_rs1_OBUF[10]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[11]),
        .Q(pcpi_rs1_OBUF[11]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_op1_reg[11]_i_3 
       (.CI(\reg_op1_reg[7]_i_3_n_0 ),
        .CO({\reg_op1_reg[11]_i_3_n_0 ,\NLW_reg_op1_reg[11]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[11:8]),
        .O({\reg_op1_reg[11]_i_3_n_4 ,\reg_op1_reg[11]_i_3_n_5 ,\reg_op1_reg[11]_i_3_n_6 ,\reg_op1_reg[11]_i_3_n_7 }),
        .S({\reg_op1[11]_i_5_n_0 ,\reg_op1[11]_i_6_n_0 ,\reg_op1[11]_i_7_n_0 ,\reg_op1[11]_i_8_n_0 }));
  FDRE \reg_op1_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[12]),
        .Q(pcpi_rs1_OBUF[12]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[13]),
        .Q(pcpi_rs1_OBUF[13]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[14]),
        .Q(pcpi_rs1_OBUF[14]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[15]),
        .Q(pcpi_rs1_OBUF[15]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_op1_reg[15]_i_3 
       (.CI(\reg_op1_reg[11]_i_3_n_0 ),
        .CO({\reg_op1_reg[15]_i_3_n_0 ,\NLW_reg_op1_reg[15]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[15:12]),
        .O({\reg_op1_reg[15]_i_3_n_4 ,\reg_op1_reg[15]_i_3_n_5 ,\reg_op1_reg[15]_i_3_n_6 ,\reg_op1_reg[15]_i_3_n_7 }),
        .S({\reg_op1[15]_i_5_n_0 ,\reg_op1[15]_i_6_n_0 ,\reg_op1[15]_i_7_n_0 ,\reg_op1[15]_i_8_n_0 }));
  FDRE \reg_op1_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[16]),
        .Q(pcpi_rs1_OBUF[16]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[17]),
        .Q(pcpi_rs1_OBUF[17]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[18]),
        .Q(pcpi_rs1_OBUF[18]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[19]),
        .Q(pcpi_rs1_OBUF[19]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_op1_reg[19]_i_3 
       (.CI(\reg_op1_reg[15]_i_3_n_0 ),
        .CO({\reg_op1_reg[19]_i_3_n_0 ,\NLW_reg_op1_reg[19]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[19:16]),
        .O({\reg_op1_reg[19]_i_3_n_4 ,\reg_op1_reg[19]_i_3_n_5 ,\reg_op1_reg[19]_i_3_n_6 ,\reg_op1_reg[19]_i_3_n_7 }),
        .S({\reg_op1[19]_i_5_n_0 ,\reg_op1[19]_i_6_n_0 ,\reg_op1[19]_i_7_n_0 ,\reg_op1[19]_i_8_n_0 }));
  FDRE \reg_op1_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[1]),
        .Q(pcpi_rs1_OBUF[1]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[20]),
        .Q(pcpi_rs1_OBUF[20]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[21]),
        .Q(pcpi_rs1_OBUF[21]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[22]),
        .Q(pcpi_rs1_OBUF[22]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[23]),
        .Q(pcpi_rs1_OBUF[23]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_op1_reg[23]_i_3 
       (.CI(\reg_op1_reg[19]_i_3_n_0 ),
        .CO({\reg_op1_reg[23]_i_3_n_0 ,\NLW_reg_op1_reg[23]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[23:20]),
        .O({\reg_op1_reg[23]_i_3_n_4 ,\reg_op1_reg[23]_i_3_n_5 ,\reg_op1_reg[23]_i_3_n_6 ,\reg_op1_reg[23]_i_3_n_7 }),
        .S({\reg_op1[23]_i_5_n_0 ,\reg_op1[23]_i_6_n_0 ,\reg_op1[23]_i_7_n_0 ,\reg_op1[23]_i_8_n_0 }));
  FDRE \reg_op1_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[24]),
        .Q(pcpi_rs1_OBUF[24]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[25]),
        .Q(pcpi_rs1_OBUF[25]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[26]),
        .Q(pcpi_rs1_OBUF[26]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[27]),
        .Q(pcpi_rs1_OBUF[27]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[28]),
        .Q(pcpi_rs1_OBUF[28]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[29]),
        .Q(pcpi_rs1_OBUF[29]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[2]),
        .Q(pcpi_rs1_OBUF[2]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[30]),
        .Q(pcpi_rs1_OBUF[30]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[31]),
        .Q(pcpi_rs1_OBUF[31]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_op1_reg[31]_i_5 
       (.CI(\reg_op1_reg[31]_i_9_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,pcpi_rs1_OBUF[30:28]}),
        .O({\reg_op1_reg[31]_i_5_n_4 ,\reg_op1_reg[31]_i_5_n_5 ,\reg_op1_reg[31]_i_5_n_6 ,\reg_op1_reg[31]_i_5_n_7 }),
        .S({\reg_op1[31]_i_10_n_0 ,\reg_op1[31]_i_11_n_0 ,\reg_op1[31]_i_12_n_0 ,\reg_op1[31]_i_13_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_op1_reg[31]_i_9 
       (.CI(\reg_op1_reg[23]_i_3_n_0 ),
        .CO({\reg_op1_reg[31]_i_9_n_0 ,\NLW_reg_op1_reg[31]_i_9_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[27:24]),
        .O({\reg_op1_reg[31]_i_9_n_4 ,\reg_op1_reg[31]_i_9_n_5 ,\reg_op1_reg[31]_i_9_n_6 ,\reg_op1_reg[31]_i_9_n_7 }),
        .S({\reg_op1[31]_i_16_n_0 ,\reg_op1[31]_i_17_n_0 ,\reg_op1[31]_i_18_n_0 ,\reg_op1[31]_i_19_n_0 }));
  FDRE \reg_op1_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[3]),
        .Q(pcpi_rs1_OBUF[3]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_op1_reg[3]_i_3 
       (.CI(\<const0> ),
        .CO({\reg_op1_reg[3]_i_3_n_0 ,\NLW_reg_op1_reg[3]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[3:0]),
        .O({\reg_op1_reg[3]_i_3_n_4 ,\reg_op1_reg[3]_i_3_n_5 ,\reg_op1_reg[3]_i_3_n_6 ,\reg_op1_reg[3]_i_3_n_7 }),
        .S({\reg_op1[3]_i_5_n_0 ,\reg_op1[3]_i_6_n_0 ,\reg_op1[3]_i_7_n_0 ,\reg_op1[3]_i_8_n_0 }));
  FDRE \reg_op1_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[4]),
        .Q(pcpi_rs1_OBUF[4]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[5]),
        .Q(pcpi_rs1_OBUF[5]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[6]),
        .Q(pcpi_rs1_OBUF[6]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[7]),
        .Q(pcpi_rs1_OBUF[7]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_op1_reg[7]_i_3 
       (.CI(\reg_op1_reg[3]_i_3_n_0 ),
        .CO({\reg_op1_reg[7]_i_3_n_0 ,\NLW_reg_op1_reg[7]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[7:4]),
        .O({\reg_op1_reg[7]_i_3_n_4 ,\reg_op1_reg[7]_i_3_n_5 ,\reg_op1_reg[7]_i_3_n_6 ,\reg_op1_reg[7]_i_3_n_7 }),
        .S({\reg_op1[7]_i_5_n_0 ,\reg_op1[7]_i_6_n_0 ,\reg_op1[7]_i_7_n_0 ,\reg_op1[7]_i_8_n_0 }));
  FDRE \reg_op1_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[8]),
        .Q(pcpi_rs1_OBUF[8]),
        .R(\<const0> ));
  FDRE \reg_op1_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[9]),
        .Q(pcpi_rs1_OBUF[9]),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h5500FFFF55005D00)) 
    \reg_op2[0]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I2(is_slli_srli_srai),
        .I3(decoded_imm[0]),
        .I4(\reg_sh[4]_i_2_n_0 ),
        .I5(\reg_op2[0]_i_2_n_0 ),
        .O(\reg_op2[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \reg_op2[0]_i_2 
       (.I0(\reg_op2[31]_i_5_n_0 ),
        .I1(cpuregs_reg_r1_0_31_0_5_n_1),
        .I2(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I3(is_slli_srli_srai),
        .O(\reg_op2[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[10]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_6_11_n_5),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[10]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[11]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_6_11_n_4),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[11]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCCC4F4444444444)) 
    \reg_op2[12]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(decoded_imm[12]),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(cpuregs_reg_r1_0_31_12_17_n_1),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[13]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_12_17_n_0),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[13]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[14]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_12_17_n_3),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[14]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[15]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_12_17_n_2),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[15]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[16]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_12_17_n_5),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[16]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[17]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_12_17_n_4),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[17]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[18]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_18_23_n_1),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[18]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[19]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_18_23_n_0),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[19]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5500FFFF55005D00)) 
    \reg_op2[1]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I2(is_slli_srli_srai),
        .I3(decoded_imm[1]),
        .I4(\reg_sh[4]_i_2_n_0 ),
        .I5(\reg_op2[1]_i_2_n_0 ),
        .O(\reg_op2[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \reg_op2[1]_i_2 
       (.I0(\reg_op2[31]_i_5_n_0 ),
        .I1(cpuregs_reg_r1_0_31_0_5_n_0),
        .I2(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I3(is_slli_srli_srai),
        .O(\reg_op2[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[20]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_18_23_n_3),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[20]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[21]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_18_23_n_2),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[21]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[22]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_18_23_n_5),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[22]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[23]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_18_23_n_4),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[23]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[24]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_24_29_n_1),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[24]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[25]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_24_29_n_0),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[25]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[26]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_24_29_n_3),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[26]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[27]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_24_29_n_2),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[27]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[28]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_24_29_n_5),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[28]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[29]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_24_29_n_4),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[29]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5500FFFF55005D00)) 
    \reg_op2[2]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I2(is_slli_srli_srai),
        .I3(decoded_imm[2]),
        .I4(\reg_sh[4]_i_2_n_0 ),
        .I5(\reg_op2[2]_i_2_n_0 ),
        .O(\reg_op2[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \reg_op2[2]_i_2 
       (.I0(\reg_op2[31]_i_5_n_0 ),
        .I1(cpuregs_reg_r1_0_31_0_5_n_3),
        .I2(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I3(is_slli_srli_srai),
        .O(\reg_op2[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[30]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_30_31_n_0),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[30]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[30]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_op2[31]_i_1 
       (.I0(resetn_IBUF),
        .I1(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op2[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hD050D050D0DCD050)) 
    \reg_op2[31]_i_2 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(\reg_op2[31]_i_4_n_0 ),
        .I2(decoded_imm[31]),
        .I3(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I4(cpuregs_reg_r1_0_31_30_31__0_n_0),
        .I5(\reg_op2[31]_i_5_n_0 ),
        .O(\reg_op2[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \reg_op2[31]_i_3 
       (.I0(\cpu_state[7]_i_7_n_0 ),
        .I1(is_lui_auipc_jal),
        .I2(instr_rdinstrh),
        .I3(instr_rdinstr),
        .I4(instr_rdcycleh),
        .I5(instr_rdcycle),
        .O(\reg_op2[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \reg_op2[31]_i_4 
       (.I0(is_slli_srli_srai),
        .I1(is_lb_lh_lw_lbu_lhu),
        .I2(\cpu_state[6]_i_2_n_0 ),
        .I3(is_lui_auipc_jal),
        .I4(\cpu_state[7]_i_7_n_0 ),
        .O(\reg_op2[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \reg_op2[31]_i_5 
       (.I0(decoded_imm_j[4]),
        .I1(decoded_imm_j[11]),
        .I2(decoded_imm_j[1]),
        .I3(decoded_imm_j[2]),
        .I4(decoded_imm_j[3]),
        .O(\reg_op2[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h5500FFFF55005D00)) 
    \reg_op2[3]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I2(is_slli_srli_srai),
        .I3(decoded_imm[3]),
        .I4(\reg_sh[4]_i_2_n_0 ),
        .I5(\reg_op2[3]_i_2_n_0 ),
        .O(\reg_op2[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \reg_op2[3]_i_2 
       (.I0(\reg_op2[31]_i_5_n_0 ),
        .I1(cpuregs_reg_r1_0_31_0_5_n_2),
        .I2(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I3(is_slli_srli_srai),
        .O(\reg_op2[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h5500FFFF55005D00)) 
    \reg_op2[4]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I2(is_slli_srli_srai),
        .I3(decoded_imm[4]),
        .I4(\reg_sh[4]_i_2_n_0 ),
        .I5(\reg_op2[4]_i_2_n_0 ),
        .O(\reg_op2[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \reg_op2[4]_i_2 
       (.I0(\reg_op2[31]_i_5_n_0 ),
        .I1(cpuregs_reg_r1_0_31_0_5_n_5),
        .I2(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I3(is_slli_srli_srai),
        .O(\reg_op2[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[5]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_0_5_n_4),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[5]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[6]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_6_11_n_1),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[6]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[7]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_6_11_n_0),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[7]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[8]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_6_11_n_3),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[8]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF005D0C55005500)) 
    \reg_op2[9]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_6_11_n_2),
        .I2(\reg_op2[31]_i_5_n_0 ),
        .I3(decoded_imm[9]),
        .I4(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I5(\reg_op2[31]_i_4_n_0 ),
        .O(\reg_op2[9]_i_1_n_0 ));
  FDRE \reg_op2_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[0]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[0]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[10]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[10]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[11]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[11]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[12]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[12]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[13]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[13]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[14]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[14]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[15]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[15]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[16]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[16]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[17]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[17]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[18]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[18]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[19]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[19]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[1]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[1]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[20]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[20]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[21]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[21]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[22]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[22]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[23]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[23]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[24]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[24]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[25]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[25]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[26]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[26]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[27]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[27]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[28]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[28]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[29]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[29]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[2]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[2]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[30]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[30]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[31]_i_2_n_0 ),
        .Q(pcpi_rs2_OBUF[31]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[3]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[3]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[4]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[4]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[5]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[5]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[6]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[6]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[7]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[7]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[8]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[8]),
        .R(\<const0> ));
  FDRE \reg_op2_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op2[31]_i_1_n_0 ),
        .D(\reg_op2[9]_i_1_n_0 ),
        .Q(pcpi_rs2_OBUF[9]),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'hFFEAFFEAFFFFFFEA)) 
    \reg_out[0]_i_1 
       (.I0(\reg_out[0]_i_2_n_0 ),
        .I1(decoded_imm[0]),
        .I2(\cpu_state_reg_n_0_[3] ),
        .I3(\reg_out[0]_i_3_n_0 ),
        .I4(\reg_out[6]_i_4_n_0 ),
        .I5(\reg_out[0]_i_4_n_0 ),
        .O(reg_out[0]));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[0]_i_2 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[0]_i_5_n_0 ),
        .I2(instr_rdinstr),
        .I3(\count_instr_reg_n_0_[0] ),
        .I4(instr_rdcycle),
        .I5(count_cycle[0]),
        .O(\reg_out[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \reg_out[0]_i_3 
       (.I0(pcpi_rs1_OBUF[0]),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\reg_sh_reg_n_0_[1] ),
        .I3(\reg_sh[2]_i_2_n_0 ),
        .I4(\reg_sh_reg_n_0_[0] ),
        .O(\reg_out[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h888B8B8BBB8B8B8B)) 
    \reg_out[0]_i_4 
       (.I0(\reg_out[0]_i_6_n_0 ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(mem_rdata_IBUF[0]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(\mem_wordsize_reg_n_0_[0] ),
        .I5(mem_rdata_IBUF[16]),
        .O(\reg_out[0]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[0]_i_5 
       (.I0(\count_instr_reg_n_0_[32] ),
        .I1(instr_rdinstrh),
        .I2(count_cycle[32]),
        .I3(instr_rdcycleh),
        .O(\reg_out[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00550F33FF550F33)) 
    \reg_out[0]_i_6 
       (.I0(mem_rdata_IBUF[8]),
        .I1(mem_rdata_IBUF[0]),
        .I2(mem_rdata_IBUF[16]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(pcpi_rs1_OBUF[0]),
        .I5(mem_rdata_IBUF[24]),
        .O(\reg_out[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \reg_out[10]_i_1 
       (.I0(\reg_out[10]_i_2_n_0 ),
        .I1(\reg_out[15]_i_3_n_0 ),
        .I2(pcpi_rs1_OBUF[10]),
        .I3(\reg_out_reg[12]_i_3_n_6 ),
        .I4(\cpu_state_reg_n_0_[3] ),
        .I5(\reg_out[10]_i_3_n_0 ),
        .O(reg_out[10]));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[10]_i_2 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[10]_i_4_n_0 ),
        .I2(\count_instr_reg_n_0_[10] ),
        .I3(instr_rdinstr),
        .I4(count_cycle[10]),
        .I5(instr_rdcycle),
        .O(\reg_out[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000088A0AAAAAAAA)) 
    \reg_out[10]_i_3 
       (.I0(\reg_out[31]_i_4_n_0 ),
        .I1(mem_rdata_IBUF[26]),
        .I2(mem_rdata_IBUF[10]),
        .I3(\reg_out[31]_i_7_n_0 ),
        .I4(\reg_out[14]_i_5_n_0 ),
        .I5(\reg_out[31]_i_6_n_0 ),
        .O(\reg_out[10]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[10]_i_4 
       (.I0(\count_instr_reg_n_0_[42] ),
        .I1(instr_rdinstrh),
        .I2(count_cycle[42]),
        .I3(instr_rdcycleh),
        .O(\reg_out[10]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \reg_out[11]_i_1 
       (.I0(\reg_out[11]_i_2_n_0 ),
        .I1(\reg_out[15]_i_3_n_0 ),
        .I2(pcpi_rs1_OBUF[11]),
        .I3(\reg_out_reg[12]_i_3_n_5 ),
        .I4(\cpu_state_reg_n_0_[3] ),
        .I5(\reg_out[11]_i_3_n_0 ),
        .O(reg_out[11]));
  LUT6 #(
    .INIT(64'h000088A0AAAAAAAA)) 
    \reg_out[11]_i_2 
       (.I0(\reg_out[31]_i_4_n_0 ),
        .I1(mem_rdata_IBUF[27]),
        .I2(mem_rdata_IBUF[11]),
        .I3(\reg_out[31]_i_7_n_0 ),
        .I4(\reg_out[14]_i_5_n_0 ),
        .I5(\reg_out[31]_i_6_n_0 ),
        .O(\reg_out[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[11]_i_3 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[11]_i_4_n_0 ),
        .I2(\count_instr_reg_n_0_[43] ),
        .I3(instr_rdinstrh),
        .I4(count_cycle[43]),
        .I5(instr_rdcycleh),
        .O(\reg_out[11]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[11]_i_4 
       (.I0(\count_instr_reg_n_0_[11] ),
        .I1(instr_rdinstr),
        .I2(count_cycle[11]),
        .I3(instr_rdcycle),
        .O(\reg_out[11]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \reg_out[12]_i_1 
       (.I0(\reg_out[12]_i_2_n_0 ),
        .I1(\reg_out[15]_i_3_n_0 ),
        .I2(pcpi_rs1_OBUF[12]),
        .I3(\reg_out_reg[12]_i_3_n_4 ),
        .I4(\cpu_state_reg_n_0_[3] ),
        .I5(\reg_out[12]_i_4_n_0 ),
        .O(reg_out[12]));
  LUT6 #(
    .INIT(64'h000088A0AAAAAAAA)) 
    \reg_out[12]_i_2 
       (.I0(\reg_out[31]_i_4_n_0 ),
        .I1(mem_rdata_IBUF[28]),
        .I2(mem_rdata_IBUF[12]),
        .I3(\reg_out[31]_i_7_n_0 ),
        .I4(\reg_out[14]_i_5_n_0 ),
        .I5(\reg_out[31]_i_6_n_0 ),
        .O(\reg_out[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[12]_i_4 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[12]_i_9_n_0 ),
        .I2(count_cycle[44]),
        .I3(instr_rdcycleh),
        .I4(count_cycle[12]),
        .I5(instr_rdcycle),
        .O(\reg_out[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[12]_i_5 
       (.I0(\reg_pc_reg_n_0_[12] ),
        .I1(decoded_imm[12]),
        .O(\reg_out[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[12]_i_6 
       (.I0(\reg_pc_reg_n_0_[11] ),
        .I1(decoded_imm[11]),
        .O(\reg_out[12]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[12]_i_7 
       (.I0(\reg_pc_reg_n_0_[10] ),
        .I1(decoded_imm[10]),
        .O(\reg_out[12]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[12]_i_8 
       (.I0(\reg_pc_reg_n_0_[9] ),
        .I1(decoded_imm[9]),
        .O(\reg_out[12]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[12]_i_9 
       (.I0(\count_instr_reg_n_0_[12] ),
        .I1(instr_rdinstr),
        .I2(\count_instr_reg_n_0_[44] ),
        .I3(instr_rdinstrh),
        .O(\reg_out[12]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \reg_out[13]_i_1 
       (.I0(\reg_out[13]_i_2_n_0 ),
        .I1(\reg_out[15]_i_3_n_0 ),
        .I2(pcpi_rs1_OBUF[13]),
        .I3(\reg_out_reg[15]_i_4_n_7 ),
        .I4(\cpu_state_reg_n_0_[3] ),
        .I5(\reg_out[13]_i_3_n_0 ),
        .O(reg_out[13]));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[13]_i_2 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[13]_i_4_n_0 ),
        .I2(\count_instr_reg_n_0_[45] ),
        .I3(instr_rdinstrh),
        .I4(count_cycle[45]),
        .I5(instr_rdcycleh),
        .O(\reg_out[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000088A0AAAAAAAA)) 
    \reg_out[13]_i_3 
       (.I0(\reg_out[31]_i_4_n_0 ),
        .I1(mem_rdata_IBUF[29]),
        .I2(mem_rdata_IBUF[13]),
        .I3(\reg_out[31]_i_7_n_0 ),
        .I4(\reg_out[14]_i_5_n_0 ),
        .I5(\reg_out[31]_i_6_n_0 ),
        .O(\reg_out[13]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[13]_i_4 
       (.I0(\count_instr_reg_n_0_[13] ),
        .I1(instr_rdinstr),
        .I2(count_cycle[13]),
        .I3(instr_rdcycle),
        .O(\reg_out[13]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \reg_out[14]_i_1 
       (.I0(\reg_out[14]_i_2_n_0 ),
        .I1(\reg_out[15]_i_3_n_0 ),
        .I2(pcpi_rs1_OBUF[14]),
        .I3(\reg_out_reg[15]_i_4_n_6 ),
        .I4(\cpu_state_reg_n_0_[3] ),
        .I5(\reg_out[14]_i_3_n_0 ),
        .O(reg_out[14]));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[14]_i_2 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[14]_i_4_n_0 ),
        .I2(\count_instr_reg_n_0_[14] ),
        .I3(instr_rdinstr),
        .I4(count_cycle[14]),
        .I5(instr_rdcycle),
        .O(\reg_out[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000088A0AAAAAAAA)) 
    \reg_out[14]_i_3 
       (.I0(\reg_out[31]_i_4_n_0 ),
        .I1(mem_rdata_IBUF[30]),
        .I2(mem_rdata_IBUF[14]),
        .I3(\reg_out[31]_i_7_n_0 ),
        .I4(\reg_out[14]_i_5_n_0 ),
        .I5(\reg_out[31]_i_6_n_0 ),
        .O(\reg_out[14]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[14]_i_4 
       (.I0(\count_instr_reg_n_0_[46] ),
        .I1(instr_rdinstrh),
        .I2(count_cycle[46]),
        .I3(instr_rdcycleh),
        .O(\reg_out[14]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hAB)) 
    \reg_out[14]_i_5 
       (.I0(\mem_wordsize_reg_n_0_[1] ),
        .I1(latched_is_lh_reg_n_0),
        .I2(latched_is_lu_reg_n_0),
        .O(\reg_out[14]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \reg_out[15]_i_1 
       (.I0(\reg_out[15]_i_2_n_0 ),
        .I1(\reg_out[15]_i_3_n_0 ),
        .I2(pcpi_rs1_OBUF[15]),
        .I3(\reg_out_reg[15]_i_4_n_5 ),
        .I4(\cpu_state_reg_n_0_[3] ),
        .I5(\reg_out[15]_i_5_n_0 ),
        .O(reg_out[15]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[15]_i_10 
       (.I0(\reg_pc_reg_n_0_[13] ),
        .I1(decoded_imm[13]),
        .O(\reg_out[15]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h0000EA2A)) 
    \reg_out[15]_i_11 
       (.I0(mem_rdata_IBUF[15]),
        .I1(\mem_wordsize_reg_n_0_[0] ),
        .I2(pcpi_rs1_OBUF[1]),
        .I3(mem_rdata_IBUF[31]),
        .I4(\mem_wordsize_reg_n_0_[1] ),
        .O(\reg_out[15]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[15]_i_2 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[15]_i_6_n_0 ),
        .I2(\count_instr_reg_n_0_[15] ),
        .I3(instr_rdinstr),
        .I4(count_cycle[15]),
        .I5(instr_rdcycle),
        .O(\reg_out[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \reg_out[15]_i_3 
       (.I0(\reg_sh_reg_n_0_[0] ),
        .I1(\reg_sh_reg_n_0_[3] ),
        .I2(\reg_sh_reg_n_0_[2] ),
        .I3(\reg_sh_reg_n_0_[4] ),
        .I4(\reg_sh_reg_n_0_[1] ),
        .I5(\cpu_state_reg_n_0_[2] ),
        .O(\reg_out[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h8880AAAA)) 
    \reg_out[15]_i_5 
       (.I0(\reg_out[31]_i_4_n_0 ),
        .I1(\reg_out[15]_i_11_n_0 ),
        .I2(latched_is_lh_reg_n_0),
        .I3(latched_is_lu_reg_n_0),
        .I4(\reg_out[31]_i_6_n_0 ),
        .O(\reg_out[15]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[15]_i_6 
       (.I0(\count_instr_reg_n_0_[47] ),
        .I1(instr_rdinstrh),
        .I2(count_cycle[47]),
        .I3(instr_rdcycleh),
        .O(\reg_out[15]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[15]_i_7 
       (.I0(\reg_pc_reg_n_0_[16] ),
        .I1(decoded_imm[16]),
        .O(\reg_out[15]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[15]_i_8 
       (.I0(\reg_pc_reg_n_0_[15] ),
        .I1(decoded_imm[15]),
        .O(\reg_out[15]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[15]_i_9 
       (.I0(\reg_pc_reg_n_0_[14] ),
        .I1(decoded_imm[14]),
        .O(\reg_out[15]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7500)) 
    \reg_out[16]_i_1 
       (.I0(\reg_out[31]_i_2_n_0 ),
        .I1(\reg_out[31]_i_3_n_0 ),
        .I2(mem_rdata_IBUF[16]),
        .I3(\reg_out[31]_i_4_n_0 ),
        .I4(\reg_out[16]_i_2_n_0 ),
        .O(reg_out[16]));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \reg_out[16]_i_2 
       (.I0(\reg_out[16]_i_3_n_0 ),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(\reg_out_reg[15]_i_4_n_4 ),
        .I3(pcpi_rs1_OBUF[16]),
        .I4(\reg_out[15]_i_3_n_0 ),
        .O(\reg_out[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[16]_i_3 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[16]_i_4_n_0 ),
        .I2(\count_instr_reg_n_0_[16] ),
        .I3(instr_rdinstr),
        .I4(count_cycle[16]),
        .I5(instr_rdcycle),
        .O(\reg_out[16]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[16]_i_4 
       (.I0(\count_instr_reg_n_0_[48] ),
        .I1(instr_rdinstrh),
        .I2(count_cycle[48]),
        .I3(instr_rdcycleh),
        .O(\reg_out[16]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7500)) 
    \reg_out[17]_i_1 
       (.I0(\reg_out[31]_i_2_n_0 ),
        .I1(\reg_out[31]_i_3_n_0 ),
        .I2(mem_rdata_IBUF[17]),
        .I3(\reg_out[31]_i_4_n_0 ),
        .I4(\reg_out[17]_i_2_n_0 ),
        .O(reg_out[17]));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \reg_out[17]_i_2 
       (.I0(\reg_out[17]_i_3_n_0 ),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(\reg_out_reg[20]_i_4_n_7 ),
        .I3(pcpi_rs1_OBUF[17]),
        .I4(\reg_out[15]_i_3_n_0 ),
        .O(\reg_out[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[17]_i_3 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[17]_i_4_n_0 ),
        .I2(count_cycle[49]),
        .I3(instr_rdcycleh),
        .I4(count_cycle[17]),
        .I5(instr_rdcycle),
        .O(\reg_out[17]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[17]_i_4 
       (.I0(\count_instr_reg_n_0_[17] ),
        .I1(instr_rdinstr),
        .I2(\count_instr_reg_n_0_[49] ),
        .I3(instr_rdinstrh),
        .O(\reg_out[17]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7500)) 
    \reg_out[18]_i_1 
       (.I0(\reg_out[31]_i_2_n_0 ),
        .I1(\reg_out[31]_i_3_n_0 ),
        .I2(mem_rdata_IBUF[18]),
        .I3(\reg_out[31]_i_4_n_0 ),
        .I4(\reg_out[18]_i_2_n_0 ),
        .O(reg_out[18]));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \reg_out[18]_i_2 
       (.I0(\reg_out[18]_i_3_n_0 ),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(\reg_out_reg[20]_i_4_n_6 ),
        .I3(pcpi_rs1_OBUF[18]),
        .I4(\reg_out[15]_i_3_n_0 ),
        .O(\reg_out[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[18]_i_3 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[18]_i_4_n_0 ),
        .I2(\count_instr_reg_n_0_[18] ),
        .I3(instr_rdinstr),
        .I4(count_cycle[18]),
        .I5(instr_rdcycle),
        .O(\reg_out[18]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[18]_i_4 
       (.I0(\count_instr_reg_n_0_[50] ),
        .I1(instr_rdinstrh),
        .I2(count_cycle[50]),
        .I3(instr_rdcycleh),
        .O(\reg_out[18]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7500)) 
    \reg_out[19]_i_1 
       (.I0(\reg_out[31]_i_2_n_0 ),
        .I1(\reg_out[31]_i_3_n_0 ),
        .I2(mem_rdata_IBUF[19]),
        .I3(\reg_out[31]_i_4_n_0 ),
        .I4(\reg_out[19]_i_2_n_0 ),
        .O(reg_out[19]));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \reg_out[19]_i_2 
       (.I0(\reg_out[19]_i_3_n_0 ),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(\reg_out_reg[20]_i_4_n_5 ),
        .I3(pcpi_rs1_OBUF[19]),
        .I4(\reg_out[15]_i_3_n_0 ),
        .O(\reg_out[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[19]_i_3 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[19]_i_4_n_0 ),
        .I2(\count_instr_reg_n_0_[51] ),
        .I3(instr_rdinstrh),
        .I4(count_cycle[51]),
        .I5(instr_rdcycleh),
        .O(\reg_out[19]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[19]_i_4 
       (.I0(\count_instr_reg_n_0_[19] ),
        .I1(instr_rdinstr),
        .I2(count_cycle[19]),
        .I3(instr_rdcycle),
        .O(\reg_out[19]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAFFEAFFFFFFEA)) 
    \reg_out[1]_i_1 
       (.I0(\reg_out[1]_i_2_n_0 ),
        .I1(\reg_out_reg[4]_i_3_n_7 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .I3(\reg_out[1]_i_3_n_0 ),
        .I4(\reg_out[6]_i_4_n_0 ),
        .I5(\reg_out[1]_i_4_n_0 ),
        .O(reg_out[1]));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[1]_i_2 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[1]_i_5_n_0 ),
        .I2(\count_instr_reg_n_0_[1] ),
        .I3(instr_rdinstr),
        .I4(count_cycle[1]),
        .I5(instr_rdcycle),
        .O(\reg_out[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \reg_out[1]_i_3 
       (.I0(pcpi_rs1_OBUF[1]),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\reg_sh_reg_n_0_[1] ),
        .I3(\reg_sh[2]_i_2_n_0 ),
        .I4(\reg_sh_reg_n_0_[0] ),
        .O(\reg_out[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h888B8B8BBB8B8B8B)) 
    \reg_out[1]_i_4 
       (.I0(\reg_out[1]_i_6_n_0 ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(mem_rdata_IBUF[1]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(\mem_wordsize_reg_n_0_[0] ),
        .I5(mem_rdata_IBUF[17]),
        .O(\reg_out[1]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[1]_i_5 
       (.I0(\count_instr_reg_n_0_[33] ),
        .I1(instr_rdinstrh),
        .I2(count_cycle[33]),
        .I3(instr_rdcycleh),
        .O(\reg_out[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00330F55FF330F55)) 
    \reg_out[1]_i_6 
       (.I0(mem_rdata_IBUF[1]),
        .I1(mem_rdata_IBUF[9]),
        .I2(mem_rdata_IBUF[17]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(pcpi_rs1_OBUF[0]),
        .I5(mem_rdata_IBUF[25]),
        .O(\reg_out[1]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7500)) 
    \reg_out[20]_i_1 
       (.I0(\reg_out[31]_i_2_n_0 ),
        .I1(\reg_out[31]_i_3_n_0 ),
        .I2(mem_rdata_IBUF[20]),
        .I3(\reg_out[31]_i_4_n_0 ),
        .I4(\reg_out[20]_i_2_n_0 ),
        .O(reg_out[20]));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \reg_out[20]_i_2 
       (.I0(\reg_out[20]_i_3_n_0 ),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(\reg_out_reg[20]_i_4_n_4 ),
        .I3(pcpi_rs1_OBUF[20]),
        .I4(\reg_out[15]_i_3_n_0 ),
        .O(\reg_out[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[20]_i_3 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[20]_i_5_n_0 ),
        .I2(\count_instr_reg_n_0_[20] ),
        .I3(instr_rdinstr),
        .I4(count_cycle[20]),
        .I5(instr_rdcycle),
        .O(\reg_out[20]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[20]_i_5 
       (.I0(\count_instr_reg_n_0_[52] ),
        .I1(instr_rdinstrh),
        .I2(count_cycle[52]),
        .I3(instr_rdcycleh),
        .O(\reg_out[20]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[20]_i_6 
       (.I0(\reg_pc_reg_n_0_[20] ),
        .I1(decoded_imm[20]),
        .O(\reg_out[20]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[20]_i_7 
       (.I0(\reg_pc_reg_n_0_[19] ),
        .I1(decoded_imm[19]),
        .O(\reg_out[20]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[20]_i_8 
       (.I0(\reg_pc_reg_n_0_[18] ),
        .I1(decoded_imm[18]),
        .O(\reg_out[20]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[20]_i_9 
       (.I0(\reg_pc_reg_n_0_[17] ),
        .I1(decoded_imm[17]),
        .O(\reg_out[20]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7500)) 
    \reg_out[21]_i_1 
       (.I0(\reg_out[31]_i_2_n_0 ),
        .I1(\reg_out[31]_i_3_n_0 ),
        .I2(mem_rdata_IBUF[21]),
        .I3(\reg_out[31]_i_4_n_0 ),
        .I4(\reg_out[21]_i_2_n_0 ),
        .O(reg_out[21]));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \reg_out[21]_i_2 
       (.I0(\reg_out[21]_i_3_n_0 ),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(\reg_out_reg[24]_i_4_n_7 ),
        .I3(pcpi_rs1_OBUF[21]),
        .I4(\reg_out[15]_i_3_n_0 ),
        .O(\reg_out[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[21]_i_3 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[21]_i_4_n_0 ),
        .I2(\count_instr_reg_n_0_[53] ),
        .I3(instr_rdinstrh),
        .I4(count_cycle[53]),
        .I5(instr_rdcycleh),
        .O(\reg_out[21]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[21]_i_4 
       (.I0(\count_instr_reg_n_0_[21] ),
        .I1(instr_rdinstr),
        .I2(count_cycle[21]),
        .I3(instr_rdcycle),
        .O(\reg_out[21]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7500)) 
    \reg_out[22]_i_1 
       (.I0(\reg_out[31]_i_2_n_0 ),
        .I1(\reg_out[31]_i_3_n_0 ),
        .I2(mem_rdata_IBUF[22]),
        .I3(\reg_out[31]_i_4_n_0 ),
        .I4(\reg_out[22]_i_2_n_0 ),
        .O(reg_out[22]));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \reg_out[22]_i_2 
       (.I0(\reg_out[22]_i_3_n_0 ),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(\reg_out_reg[24]_i_4_n_6 ),
        .I3(pcpi_rs1_OBUF[22]),
        .I4(\reg_out[15]_i_3_n_0 ),
        .O(\reg_out[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[22]_i_3 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[22]_i_4_n_0 ),
        .I2(count_cycle[54]),
        .I3(instr_rdcycleh),
        .I4(count_cycle[22]),
        .I5(instr_rdcycle),
        .O(\reg_out[22]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[22]_i_4 
       (.I0(\count_instr_reg_n_0_[22] ),
        .I1(instr_rdinstr),
        .I2(\count_instr_reg_n_0_[54] ),
        .I3(instr_rdinstrh),
        .O(\reg_out[22]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7500)) 
    \reg_out[23]_i_1 
       (.I0(\reg_out[31]_i_2_n_0 ),
        .I1(\reg_out[31]_i_3_n_0 ),
        .I2(mem_rdata_IBUF[23]),
        .I3(\reg_out[31]_i_4_n_0 ),
        .I4(\reg_out[23]_i_2_n_0 ),
        .O(reg_out[23]));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \reg_out[23]_i_2 
       (.I0(\reg_out[23]_i_3_n_0 ),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(\reg_out_reg[24]_i_4_n_5 ),
        .I3(pcpi_rs1_OBUF[23]),
        .I4(\reg_out[15]_i_3_n_0 ),
        .O(\reg_out[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[23]_i_3 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[23]_i_4_n_0 ),
        .I2(\count_instr_reg_n_0_[23] ),
        .I3(instr_rdinstr),
        .I4(count_cycle[23]),
        .I5(instr_rdcycle),
        .O(\reg_out[23]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[23]_i_4 
       (.I0(\count_instr_reg_n_0_[55] ),
        .I1(instr_rdinstrh),
        .I2(count_cycle[55]),
        .I3(instr_rdcycleh),
        .O(\reg_out[23]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7500)) 
    \reg_out[24]_i_1 
       (.I0(\reg_out[31]_i_2_n_0 ),
        .I1(\reg_out[31]_i_3_n_0 ),
        .I2(mem_rdata_IBUF[24]),
        .I3(\reg_out[31]_i_4_n_0 ),
        .I4(\reg_out[24]_i_2_n_0 ),
        .O(reg_out[24]));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \reg_out[24]_i_2 
       (.I0(\reg_out[24]_i_3_n_0 ),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(\reg_out_reg[24]_i_4_n_4 ),
        .I3(pcpi_rs1_OBUF[24]),
        .I4(\reg_out[15]_i_3_n_0 ),
        .O(\reg_out[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[24]_i_3 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[24]_i_5_n_0 ),
        .I2(\count_instr_reg_n_0_[24] ),
        .I3(instr_rdinstr),
        .I4(count_cycle[24]),
        .I5(instr_rdcycle),
        .O(\reg_out[24]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[24]_i_5 
       (.I0(\count_instr_reg_n_0_[56] ),
        .I1(instr_rdinstrh),
        .I2(count_cycle[56]),
        .I3(instr_rdcycleh),
        .O(\reg_out[24]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[24]_i_6 
       (.I0(\reg_pc_reg_n_0_[24] ),
        .I1(decoded_imm[24]),
        .O(\reg_out[24]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[24]_i_7 
       (.I0(\reg_pc_reg_n_0_[23] ),
        .I1(decoded_imm[23]),
        .O(\reg_out[24]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[24]_i_8 
       (.I0(\reg_pc_reg_n_0_[22] ),
        .I1(decoded_imm[22]),
        .O(\reg_out[24]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[24]_i_9 
       (.I0(\reg_pc_reg_n_0_[21] ),
        .I1(decoded_imm[21]),
        .O(\reg_out[24]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7500)) 
    \reg_out[25]_i_1 
       (.I0(\reg_out[31]_i_2_n_0 ),
        .I1(\reg_out[31]_i_3_n_0 ),
        .I2(mem_rdata_IBUF[25]),
        .I3(\reg_out[31]_i_4_n_0 ),
        .I4(\reg_out[25]_i_2_n_0 ),
        .O(reg_out[25]));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \reg_out[25]_i_2 
       (.I0(\reg_out[25]_i_3_n_0 ),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(\reg_out_reg[28]_i_4_n_7 ),
        .I3(pcpi_rs1_OBUF[25]),
        .I4(\reg_out[15]_i_3_n_0 ),
        .O(\reg_out[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[25]_i_3 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[25]_i_4_n_0 ),
        .I2(\count_instr_reg_n_0_[25] ),
        .I3(instr_rdinstr),
        .I4(count_cycle[25]),
        .I5(instr_rdcycle),
        .O(\reg_out[25]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[25]_i_4 
       (.I0(\count_instr_reg_n_0_[57] ),
        .I1(instr_rdinstrh),
        .I2(count_cycle[57]),
        .I3(instr_rdcycleh),
        .O(\reg_out[25]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7500)) 
    \reg_out[26]_i_1 
       (.I0(\reg_out[31]_i_2_n_0 ),
        .I1(\reg_out[31]_i_3_n_0 ),
        .I2(mem_rdata_IBUF[26]),
        .I3(\reg_out[31]_i_4_n_0 ),
        .I4(\reg_out[26]_i_2_n_0 ),
        .O(reg_out[26]));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \reg_out[26]_i_2 
       (.I0(\reg_out[26]_i_3_n_0 ),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(\reg_out_reg[28]_i_4_n_6 ),
        .I3(pcpi_rs1_OBUF[26]),
        .I4(\reg_out[15]_i_3_n_0 ),
        .O(\reg_out[26]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[26]_i_3 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[26]_i_4_n_0 ),
        .I2(\count_instr_reg_n_0_[58] ),
        .I3(instr_rdinstrh),
        .I4(count_cycle[58]),
        .I5(instr_rdcycleh),
        .O(\reg_out[26]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[26]_i_4 
       (.I0(\count_instr_reg_n_0_[26] ),
        .I1(instr_rdinstr),
        .I2(count_cycle[26]),
        .I3(instr_rdcycle),
        .O(\reg_out[26]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7500)) 
    \reg_out[27]_i_1 
       (.I0(\reg_out[31]_i_2_n_0 ),
        .I1(\reg_out[31]_i_3_n_0 ),
        .I2(mem_rdata_IBUF[27]),
        .I3(\reg_out[31]_i_4_n_0 ),
        .I4(\reg_out[27]_i_2_n_0 ),
        .O(reg_out[27]));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \reg_out[27]_i_2 
       (.I0(\reg_out[27]_i_3_n_0 ),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(\reg_out_reg[28]_i_4_n_5 ),
        .I3(pcpi_rs1_OBUF[27]),
        .I4(\reg_out[15]_i_3_n_0 ),
        .O(\reg_out[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[27]_i_3 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[27]_i_4_n_0 ),
        .I2(\count_instr_reg_n_0_[59] ),
        .I3(instr_rdinstrh),
        .I4(count_cycle[59]),
        .I5(instr_rdcycleh),
        .O(\reg_out[27]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[27]_i_4 
       (.I0(\count_instr_reg_n_0_[27] ),
        .I1(instr_rdinstr),
        .I2(count_cycle[27]),
        .I3(instr_rdcycle),
        .O(\reg_out[27]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7500)) 
    \reg_out[28]_i_1 
       (.I0(\reg_out[31]_i_2_n_0 ),
        .I1(\reg_out[31]_i_3_n_0 ),
        .I2(mem_rdata_IBUF[28]),
        .I3(\reg_out[31]_i_4_n_0 ),
        .I4(\reg_out[28]_i_2_n_0 ),
        .O(reg_out[28]));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \reg_out[28]_i_2 
       (.I0(\reg_out[28]_i_3_n_0 ),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(\reg_out_reg[28]_i_4_n_4 ),
        .I3(pcpi_rs1_OBUF[28]),
        .I4(\reg_out[15]_i_3_n_0 ),
        .O(\reg_out[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[28]_i_3 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[28]_i_5_n_0 ),
        .I2(\count_instr_reg_n_0_[60] ),
        .I3(instr_rdinstrh),
        .I4(count_cycle[60]),
        .I5(instr_rdcycleh),
        .O(\reg_out[28]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[28]_i_5 
       (.I0(\count_instr_reg_n_0_[28] ),
        .I1(instr_rdinstr),
        .I2(count_cycle[28]),
        .I3(instr_rdcycle),
        .O(\reg_out[28]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[28]_i_6 
       (.I0(\reg_pc_reg_n_0_[28] ),
        .I1(decoded_imm[28]),
        .O(\reg_out[28]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[28]_i_7 
       (.I0(\reg_pc_reg_n_0_[27] ),
        .I1(decoded_imm[27]),
        .O(\reg_out[28]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[28]_i_8 
       (.I0(\reg_pc_reg_n_0_[26] ),
        .I1(decoded_imm[26]),
        .O(\reg_out[28]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[28]_i_9 
       (.I0(\reg_pc_reg_n_0_[25] ),
        .I1(decoded_imm[25]),
        .O(\reg_out[28]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7500)) 
    \reg_out[29]_i_1 
       (.I0(\reg_out[31]_i_2_n_0 ),
        .I1(\reg_out[31]_i_3_n_0 ),
        .I2(mem_rdata_IBUF[29]),
        .I3(\reg_out[31]_i_4_n_0 ),
        .I4(\reg_out[29]_i_2_n_0 ),
        .O(reg_out[29]));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \reg_out[29]_i_2 
       (.I0(\reg_out[29]_i_3_n_0 ),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(\reg_out_reg[31]_i_9_n_7 ),
        .I3(pcpi_rs1_OBUF[29]),
        .I4(\reg_out[15]_i_3_n_0 ),
        .O(\reg_out[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[29]_i_3 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[29]_i_4_n_0 ),
        .I2(\count_instr_reg_n_0_[29] ),
        .I3(instr_rdinstr),
        .I4(count_cycle[29]),
        .I5(instr_rdcycle),
        .O(\reg_out[29]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[29]_i_4 
       (.I0(\count_instr_reg_n_0_[61] ),
        .I1(instr_rdinstrh),
        .I2(count_cycle[61]),
        .I3(instr_rdcycleh),
        .O(\reg_out[29]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAFFEAFFFFFFEA)) 
    \reg_out[2]_i_1 
       (.I0(\reg_out[2]_i_2_n_0 ),
        .I1(\reg_out_reg[4]_i_3_n_6 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .I3(\reg_out[2]_i_3_n_0 ),
        .I4(\reg_out[6]_i_4_n_0 ),
        .I5(\reg_out[2]_i_4_n_0 ),
        .O(reg_out[2]));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[2]_i_2 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[2]_i_5_n_0 ),
        .I2(\count_instr_reg_n_0_[34] ),
        .I3(instr_rdinstrh),
        .I4(count_cycle[34]),
        .I5(instr_rdcycleh),
        .O(\reg_out[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \reg_out[2]_i_3 
       (.I0(pcpi_rs1_OBUF[2]),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\reg_sh_reg_n_0_[1] ),
        .I3(\reg_sh[2]_i_2_n_0 ),
        .I4(\reg_sh_reg_n_0_[0] ),
        .O(\reg_out[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h888B8B8BBB8B8B8B)) 
    \reg_out[2]_i_4 
       (.I0(\reg_out[2]_i_6_n_0 ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(mem_rdata_IBUF[2]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(\mem_wordsize_reg_n_0_[0] ),
        .I5(mem_rdata_IBUF[18]),
        .O(\reg_out[2]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[2]_i_5 
       (.I0(\count_instr_reg_n_0_[2] ),
        .I1(instr_rdinstr),
        .I2(count_cycle[2]),
        .I3(instr_rdcycle),
        .O(\reg_out[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0F5500330F55FF33)) 
    \reg_out[2]_i_6 
       (.I0(mem_rdata_IBUF[10]),
        .I1(mem_rdata_IBUF[2]),
        .I2(mem_rdata_IBUF[26]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(pcpi_rs1_OBUF[0]),
        .I5(mem_rdata_IBUF[18]),
        .O(\reg_out[2]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7500)) 
    \reg_out[30]_i_1 
       (.I0(\reg_out[31]_i_2_n_0 ),
        .I1(\reg_out[31]_i_3_n_0 ),
        .I2(mem_rdata_IBUF[30]),
        .I3(\reg_out[31]_i_4_n_0 ),
        .I4(\reg_out[30]_i_2_n_0 ),
        .O(reg_out[30]));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \reg_out[30]_i_2 
       (.I0(\reg_out[30]_i_3_n_0 ),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(\reg_out_reg[31]_i_9_n_6 ),
        .I3(\reg_out[15]_i_3_n_0 ),
        .I4(pcpi_rs1_OBUF[30]),
        .O(\reg_out[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[30]_i_3 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[30]_i_4_n_0 ),
        .I2(\count_instr_reg_n_0_[30] ),
        .I3(instr_rdinstr),
        .I4(count_cycle[30]),
        .I5(instr_rdcycle),
        .O(\reg_out[30]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[30]_i_4 
       (.I0(\count_instr_reg_n_0_[62] ),
        .I1(instr_rdinstrh),
        .I2(count_cycle[62]),
        .I3(instr_rdcycleh),
        .O(\reg_out[30]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7500)) 
    \reg_out[31]_i_1 
       (.I0(\reg_out[31]_i_2_n_0 ),
        .I1(\reg_out[31]_i_3_n_0 ),
        .I2(mem_rdata_IBUF[31]),
        .I3(\reg_out[31]_i_4_n_0 ),
        .I4(\reg_out[31]_i_5_n_0 ),
        .O(reg_out[31]));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[31]_i_10 
       (.I0(\count_instr_reg_n_0_[31] ),
        .I1(instr_rdinstr),
        .I2(count_cycle[31]),
        .I3(instr_rdcycle),
        .O(\reg_out[31]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[31]_i_11 
       (.I0(decoded_imm[31]),
        .I1(\reg_pc_reg_n_0_[31] ),
        .O(\reg_out[31]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[31]_i_12 
       (.I0(\reg_pc_reg_n_0_[30] ),
        .I1(decoded_imm[30]),
        .O(\reg_out[31]_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[31]_i_13 
       (.I0(\reg_pc_reg_n_0_[29] ),
        .I1(decoded_imm[29]),
        .O(\reg_out[31]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A2AAAAAAAA)) 
    \reg_out[31]_i_2 
       (.I0(\reg_out[31]_i_6_n_0 ),
        .I1(mem_rdata_IBUF[15]),
        .I2(\reg_out[31]_i_7_n_0 ),
        .I3(mem_rdata_IBUF[31]),
        .I4(\mem_wordsize_reg_n_0_[1] ),
        .I5(latched_is_lh_reg_n_0),
        .O(\reg_out[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hFD)) 
    \reg_out[31]_i_3 
       (.I0(latched_is_lu_reg_n_0),
        .I1(\mem_wordsize_reg_n_0_[0] ),
        .I2(\mem_wordsize_reg_n_0_[1] ),
        .O(\reg_out[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \reg_out[31]_i_4 
       (.I0(\cpu_state_reg_n_0_[0] ),
        .I1(is_sb_sh_sw_i_3_n_0),
        .I2(resetn_IBUF),
        .I3(mem_do_prefetch_reg_n_0),
        .O(\reg_out[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \reg_out[31]_i_5 
       (.I0(\reg_out[31]_i_8_n_0 ),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(\reg_out_reg[31]_i_9_n_5 ),
        .I3(pcpi_rs1_OBUF[31]),
        .I4(\reg_out[15]_i_3_n_0 ),
        .O(\reg_out[31]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \reg_out[31]_i_6 
       (.I0(\reg_out[7]_i_5_n_0 ),
        .I1(latched_is_lb_reg_n_0),
        .O(\reg_out[31]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \reg_out[31]_i_7 
       (.I0(pcpi_rs1_OBUF[1]),
        .I1(\mem_wordsize_reg_n_0_[0] ),
        .O(\reg_out[31]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[31]_i_8 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[31]_i_10_n_0 ),
        .I2(\count_instr_reg_n_0_[63] ),
        .I3(instr_rdinstrh),
        .I4(count_cycle[63]),
        .I5(instr_rdcycleh),
        .O(\reg_out[31]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFF40FF40FFFFFF40)) 
    \reg_out[3]_i_1 
       (.I0(\reg_out[3]_i_2_n_0 ),
        .I1(\cpu_state[6]_i_2_n_0 ),
        .I2(\reg_out[3]_i_3_n_0 ),
        .I3(\reg_out[3]_i_4_n_0 ),
        .I4(\reg_out[6]_i_4_n_0 ),
        .I5(\reg_out[3]_i_5_n_0 ),
        .O(reg_out[3]));
  LUT6 #(
    .INIT(64'h0000077707770777)) 
    \reg_out[3]_i_2 
       (.I0(instr_rdcycle),
        .I1(count_cycle[3]),
        .I2(instr_rdcycleh),
        .I3(count_cycle[35]),
        .I4(\count_instr_reg_n_0_[35] ),
        .I5(instr_rdinstrh),
        .O(\reg_out[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAA8AAAA)) 
    \reg_out[3]_i_3 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\cpu_state[7]_i_13_n_0 ),
        .I2(\cpu_state[7]_i_12_n_0 ),
        .I3(\reg_out[3]_i_6_n_0 ),
        .I4(\cpu_state[7]_i_10_n_0 ),
        .I5(\cpu_state[7]_i_9_n_0 ),
        .O(\reg_out[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF80FF80FF80)) 
    \reg_out[3]_i_4 
       (.I0(instr_rdinstr),
        .I1(\count_instr_reg_n_0_[3] ),
        .I2(\reg_out[3]_i_3_n_0 ),
        .I3(\reg_out[3]_i_7_n_0 ),
        .I4(\cpu_state_reg_n_0_[3] ),
        .I5(\reg_out_reg[4]_i_3_n_5 ),
        .O(\reg_out[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h888B8B8BBB8B8B8B)) 
    \reg_out[3]_i_5 
       (.I0(\reg_out[3]_i_8_n_0 ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(mem_rdata_IBUF[3]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(\mem_wordsize_reg_n_0_[0] ),
        .I5(mem_rdata_IBUF[19]),
        .O(\reg_out[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEFF)) 
    \reg_out[3]_i_6 
       (.I0(is_lui_auipc_jal_jalr_addi_add_sub_i_2_n_0),
        .I1(instr_sltu),
        .I2(instr_slt),
        .I3(\reg_op1[31]_i_15_n_0 ),
        .I4(instr_rdcycle),
        .I5(instr_rdcycleh),
        .O(\reg_out[3]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \reg_out[3]_i_7 
       (.I0(pcpi_rs1_OBUF[3]),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\reg_sh_reg_n_0_[1] ),
        .I3(\reg_sh[2]_i_2_n_0 ),
        .I4(\reg_sh_reg_n_0_[0] ),
        .O(\reg_out[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h00330F55FF330F55)) 
    \reg_out[3]_i_8 
       (.I0(mem_rdata_IBUF[3]),
        .I1(mem_rdata_IBUF[11]),
        .I2(mem_rdata_IBUF[19]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(pcpi_rs1_OBUF[0]),
        .I5(mem_rdata_IBUF[27]),
        .O(\reg_out[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \reg_out[4]_i_1 
       (.I0(\reg_out[4]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(\reg_out_reg[4]_i_3_n_4 ),
        .I3(\reg_out[15]_i_3_n_0 ),
        .I4(pcpi_rs1_OBUF[4]),
        .I5(\reg_out[4]_i_4_n_0 ),
        .O(reg_out[4]));
  LUT6 #(
    .INIT(64'h888B8B8BBB8B8B8B)) 
    \reg_out[4]_i_10 
       (.I0(\reg_out[4]_i_11_n_0 ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(mem_rdata_IBUF[4]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(\mem_wordsize_reg_n_0_[0] ),
        .I5(mem_rdata_IBUF[20]),
        .O(\reg_out[4]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h00550F33FF550F33)) 
    \reg_out[4]_i_11 
       (.I0(mem_rdata_IBUF[12]),
        .I1(mem_rdata_IBUF[4]),
        .I2(mem_rdata_IBUF[20]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(pcpi_rs1_OBUF[0]),
        .I5(mem_rdata_IBUF[28]),
        .O(\reg_out[4]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[4]_i_2 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[4]_i_5_n_0 ),
        .I2(count_cycle[36]),
        .I3(instr_rdcycleh),
        .I4(count_cycle[4]),
        .I5(instr_rdcycle),
        .O(\reg_out[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h0000FE00)) 
    \reg_out[4]_i_4 
       (.I0(latched_is_lh_reg_n_0),
        .I1(latched_is_lu_reg_n_0),
        .I2(latched_is_lb_reg_n_0),
        .I3(\reg_out[31]_i_4_n_0 ),
        .I4(\reg_out[4]_i_10_n_0 ),
        .O(\reg_out[4]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[4]_i_5 
       (.I0(\count_instr_reg_n_0_[36] ),
        .I1(instr_rdinstrh),
        .I2(\count_instr_reg_n_0_[4] ),
        .I3(instr_rdinstr),
        .O(\reg_out[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[4]_i_6 
       (.I0(\reg_pc_reg_n_0_[4] ),
        .I1(decoded_imm[4]),
        .O(\reg_out[4]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[4]_i_7 
       (.I0(\reg_pc_reg_n_0_[3] ),
        .I1(decoded_imm[3]),
        .O(\reg_out[4]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[4]_i_8 
       (.I0(\reg_pc_reg_n_0_[2] ),
        .I1(decoded_imm[2]),
        .O(\reg_out[4]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[4]_i_9 
       (.I0(\reg_pc_reg_n_0_[1] ),
        .I1(decoded_imm[1]),
        .O(\reg_out[4]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAFFEAFFFFFFEA)) 
    \reg_out[5]_i_1 
       (.I0(\reg_out[5]_i_2_n_0 ),
        .I1(\reg_out_reg[8]_i_3_n_7 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .I3(\reg_out[5]_i_3_n_0 ),
        .I4(\reg_out[6]_i_4_n_0 ),
        .I5(\reg_out[5]_i_4_n_0 ),
        .O(reg_out[5]));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[5]_i_2 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[5]_i_5_n_0 ),
        .I2(\count_instr_reg_n_0_[5] ),
        .I3(instr_rdinstr),
        .I4(count_cycle[5]),
        .I5(instr_rdcycle),
        .O(\reg_out[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \reg_out[5]_i_3 
       (.I0(pcpi_rs1_OBUF[5]),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\reg_sh_reg_n_0_[1] ),
        .I3(\reg_sh[2]_i_2_n_0 ),
        .I4(\reg_sh_reg_n_0_[0] ),
        .O(\reg_out[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h888B8B8BBB8B8B8B)) 
    \reg_out[5]_i_4 
       (.I0(\reg_out[5]_i_6_n_0 ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(mem_rdata_IBUF[5]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(\mem_wordsize_reg_n_0_[0] ),
        .I5(mem_rdata_IBUF[21]),
        .O(\reg_out[5]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[5]_i_5 
       (.I0(\count_instr_reg_n_0_[37] ),
        .I1(instr_rdinstrh),
        .I2(count_cycle[37]),
        .I3(instr_rdcycleh),
        .O(\reg_out[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0F5500330F55FF33)) 
    \reg_out[5]_i_6 
       (.I0(mem_rdata_IBUF[13]),
        .I1(mem_rdata_IBUF[5]),
        .I2(mem_rdata_IBUF[29]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(pcpi_rs1_OBUF[0]),
        .I5(mem_rdata_IBUF[21]),
        .O(\reg_out[5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAFFEAFFFFFFEA)) 
    \reg_out[6]_i_1 
       (.I0(\reg_out[6]_i_2_n_0 ),
        .I1(\reg_out_reg[8]_i_3_n_6 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .I3(\reg_out[6]_i_3_n_0 ),
        .I4(\reg_out[6]_i_4_n_0 ),
        .I5(\reg_out[6]_i_5_n_0 ),
        .O(reg_out[6]));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[6]_i_2 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[6]_i_6_n_0 ),
        .I2(\count_instr_reg_n_0_[38] ),
        .I3(instr_rdinstrh),
        .I4(count_cycle[38]),
        .I5(instr_rdcycleh),
        .O(\reg_out[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \reg_out[6]_i_3 
       (.I0(pcpi_rs1_OBUF[6]),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\reg_sh_reg_n_0_[1] ),
        .I3(\reg_sh[2]_i_2_n_0 ),
        .I4(\reg_sh_reg_n_0_[0] ),
        .O(\reg_out[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \reg_out[6]_i_4 
       (.I0(\reg_out[31]_i_4_n_0 ),
        .I1(latched_is_lb_reg_n_0),
        .I2(latched_is_lu_reg_n_0),
        .I3(latched_is_lh_reg_n_0),
        .O(\reg_out[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h888B8B8BBB8B8B8B)) 
    \reg_out[6]_i_5 
       (.I0(\reg_out[6]_i_7_n_0 ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(mem_rdata_IBUF[6]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(\mem_wordsize_reg_n_0_[0] ),
        .I5(mem_rdata_IBUF[22]),
        .O(\reg_out[6]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[6]_i_6 
       (.I0(\count_instr_reg_n_0_[6] ),
        .I1(instr_rdinstr),
        .I2(count_cycle[6]),
        .I3(instr_rdcycle),
        .O(\reg_out[6]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h3300550F33FF550F)) 
    \reg_out[6]_i_7 
       (.I0(mem_rdata_IBUF[22]),
        .I1(mem_rdata_IBUF[30]),
        .I2(mem_rdata_IBUF[6]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(pcpi_rs1_OBUF[0]),
        .I5(mem_rdata_IBUF[14]),
        .O(\reg_out[6]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \reg_out[7]_i_1 
       (.I0(\reg_out[7]_i_2_n_0 ),
        .I1(\reg_out_reg[8]_i_3_n_5 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .I3(\reg_out[15]_i_3_n_0 ),
        .I4(pcpi_rs1_OBUF[7]),
        .I5(\reg_out[7]_i_3_n_0 ),
        .O(reg_out[7]));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[7]_i_2 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[7]_i_4_n_0 ),
        .I2(count_cycle[7]),
        .I3(instr_rdcycle),
        .I4(count_cycle[39]),
        .I5(instr_rdcycleh),
        .O(\reg_out[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h0000FE00)) 
    \reg_out[7]_i_3 
       (.I0(latched_is_lh_reg_n_0),
        .I1(latched_is_lu_reg_n_0),
        .I2(latched_is_lb_reg_n_0),
        .I3(\reg_out[31]_i_4_n_0 ),
        .I4(\reg_out[7]_i_5_n_0 ),
        .O(\reg_out[7]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[7]_i_4 
       (.I0(\count_instr_reg_n_0_[39] ),
        .I1(instr_rdinstrh),
        .I2(\count_instr_reg_n_0_[7] ),
        .I3(instr_rdinstr),
        .O(\reg_out[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h88BB8B8B8B8B8B8B)) 
    \reg_out[7]_i_5 
       (.I0(\reg_out[7]_i_6_n_0 ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(mem_rdata_IBUF[7]),
        .I3(mem_rdata_IBUF[23]),
        .I4(pcpi_rs1_OBUF[1]),
        .I5(\mem_wordsize_reg_n_0_[0] ),
        .O(\reg_out[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h3300550F33FF550F)) 
    \reg_out[7]_i_6 
       (.I0(mem_rdata_IBUF[23]),
        .I1(mem_rdata_IBUF[31]),
        .I2(mem_rdata_IBUF[7]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(pcpi_rs1_OBUF[0]),
        .I5(mem_rdata_IBUF[15]),
        .O(\reg_out[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \reg_out[8]_i_1 
       (.I0(\reg_out[8]_i_2_n_0 ),
        .I1(\reg_out[15]_i_3_n_0 ),
        .I2(pcpi_rs1_OBUF[8]),
        .I3(\reg_out_reg[8]_i_3_n_4 ),
        .I4(\cpu_state_reg_n_0_[3] ),
        .I5(\reg_out[8]_i_4_n_0 ),
        .O(reg_out[8]));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[8]_i_2 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[8]_i_5_n_0 ),
        .I2(\count_instr_reg_n_0_[8] ),
        .I3(instr_rdinstr),
        .I4(count_cycle[8]),
        .I5(instr_rdcycle),
        .O(\reg_out[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000088A0AAAAAAAA)) 
    \reg_out[8]_i_4 
       (.I0(\reg_out[31]_i_4_n_0 ),
        .I1(mem_rdata_IBUF[24]),
        .I2(mem_rdata_IBUF[8]),
        .I3(\reg_out[31]_i_7_n_0 ),
        .I4(\reg_out[14]_i_5_n_0 ),
        .I5(\reg_out[31]_i_6_n_0 ),
        .O(\reg_out[8]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[8]_i_5 
       (.I0(\count_instr_reg_n_0_[40] ),
        .I1(instr_rdinstrh),
        .I2(count_cycle[40]),
        .I3(instr_rdcycleh),
        .O(\reg_out[8]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[8]_i_6 
       (.I0(\reg_pc_reg_n_0_[8] ),
        .I1(decoded_imm[8]),
        .O(\reg_out[8]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[8]_i_7 
       (.I0(\reg_pc_reg_n_0_[7] ),
        .I1(decoded_imm[7]),
        .O(\reg_out[8]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[8]_i_8 
       (.I0(\reg_pc_reg_n_0_[6] ),
        .I1(decoded_imm[6]),
        .O(\reg_out[8]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[8]_i_9 
       (.I0(\reg_pc_reg_n_0_[5] ),
        .I1(decoded_imm[5]),
        .O(\reg_out[8]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \reg_out[9]_i_1 
       (.I0(\reg_out[9]_i_2_n_0 ),
        .I1(\reg_out[15]_i_3_n_0 ),
        .I2(pcpi_rs1_OBUF[9]),
        .I3(\reg_out_reg[12]_i_3_n_7 ),
        .I4(\cpu_state_reg_n_0_[3] ),
        .I5(\reg_out[9]_i_3_n_0 ),
        .O(reg_out[9]));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[9]_i_2 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[9]_i_4_n_0 ),
        .I2(\count_instr_reg_n_0_[9] ),
        .I3(instr_rdinstr),
        .I4(count_cycle[9]),
        .I5(instr_rdcycle),
        .O(\reg_out[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000088A0AAAAAAAA)) 
    \reg_out[9]_i_3 
       (.I0(\reg_out[31]_i_4_n_0 ),
        .I1(mem_rdata_IBUF[25]),
        .I2(mem_rdata_IBUF[9]),
        .I3(\reg_out[31]_i_7_n_0 ),
        .I4(\reg_out[14]_i_5_n_0 ),
        .I5(\reg_out[31]_i_6_n_0 ),
        .O(\reg_out[9]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[9]_i_4 
       (.I0(\count_instr_reg_n_0_[41] ),
        .I1(instr_rdinstrh),
        .I2(count_cycle[41]),
        .I3(instr_rdcycleh),
        .O(\reg_out[9]_i_4_n_0 ));
  FDRE \reg_out_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[0]),
        .Q(\reg_out_reg_n_0_[0] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[10]),
        .Q(\reg_out_reg_n_0_[10] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[11]),
        .Q(\reg_out_reg_n_0_[11] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[12]),
        .Q(\reg_out_reg_n_0_[12] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_out_reg[12]_i_3 
       (.CI(\reg_out_reg[8]_i_3_n_0 ),
        .CO({\reg_out_reg[12]_i_3_n_0 ,\NLW_reg_out_reg[12]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_pc_reg_n_0_[12] ,\reg_pc_reg_n_0_[11] ,\reg_pc_reg_n_0_[10] ,\reg_pc_reg_n_0_[9] }),
        .O({\reg_out_reg[12]_i_3_n_4 ,\reg_out_reg[12]_i_3_n_5 ,\reg_out_reg[12]_i_3_n_6 ,\reg_out_reg[12]_i_3_n_7 }),
        .S({\reg_out[12]_i_5_n_0 ,\reg_out[12]_i_6_n_0 ,\reg_out[12]_i_7_n_0 ,\reg_out[12]_i_8_n_0 }));
  FDRE \reg_out_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[13]),
        .Q(\reg_out_reg_n_0_[13] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[14]),
        .Q(\reg_out_reg_n_0_[14] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[15]),
        .Q(\reg_out_reg_n_0_[15] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_out_reg[15]_i_4 
       (.CI(\reg_out_reg[12]_i_3_n_0 ),
        .CO({\reg_out_reg[15]_i_4_n_0 ,\NLW_reg_out_reg[15]_i_4_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_pc_reg_n_0_[16] ,\reg_pc_reg_n_0_[15] ,\reg_pc_reg_n_0_[14] ,\reg_pc_reg_n_0_[13] }),
        .O({\reg_out_reg[15]_i_4_n_4 ,\reg_out_reg[15]_i_4_n_5 ,\reg_out_reg[15]_i_4_n_6 ,\reg_out_reg[15]_i_4_n_7 }),
        .S({\reg_out[15]_i_7_n_0 ,\reg_out[15]_i_8_n_0 ,\reg_out[15]_i_9_n_0 ,\reg_out[15]_i_10_n_0 }));
  FDRE \reg_out_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[16]),
        .Q(\reg_out_reg_n_0_[16] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[17]),
        .Q(\reg_out_reg_n_0_[17] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[18]),
        .Q(\reg_out_reg_n_0_[18] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[19]),
        .Q(\reg_out_reg_n_0_[19] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[1]),
        .Q(\reg_out_reg_n_0_[1] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[20]),
        .Q(\reg_out_reg_n_0_[20] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_out_reg[20]_i_4 
       (.CI(\reg_out_reg[15]_i_4_n_0 ),
        .CO({\reg_out_reg[20]_i_4_n_0 ,\NLW_reg_out_reg[20]_i_4_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_pc_reg_n_0_[20] ,\reg_pc_reg_n_0_[19] ,\reg_pc_reg_n_0_[18] ,\reg_pc_reg_n_0_[17] }),
        .O({\reg_out_reg[20]_i_4_n_4 ,\reg_out_reg[20]_i_4_n_5 ,\reg_out_reg[20]_i_4_n_6 ,\reg_out_reg[20]_i_4_n_7 }),
        .S({\reg_out[20]_i_6_n_0 ,\reg_out[20]_i_7_n_0 ,\reg_out[20]_i_8_n_0 ,\reg_out[20]_i_9_n_0 }));
  FDRE \reg_out_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[21]),
        .Q(\reg_out_reg_n_0_[21] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[22]),
        .Q(\reg_out_reg_n_0_[22] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[23]),
        .Q(\reg_out_reg_n_0_[23] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[24]),
        .Q(\reg_out_reg_n_0_[24] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_out_reg[24]_i_4 
       (.CI(\reg_out_reg[20]_i_4_n_0 ),
        .CO({\reg_out_reg[24]_i_4_n_0 ,\NLW_reg_out_reg[24]_i_4_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_pc_reg_n_0_[24] ,\reg_pc_reg_n_0_[23] ,\reg_pc_reg_n_0_[22] ,\reg_pc_reg_n_0_[21] }),
        .O({\reg_out_reg[24]_i_4_n_4 ,\reg_out_reg[24]_i_4_n_5 ,\reg_out_reg[24]_i_4_n_6 ,\reg_out_reg[24]_i_4_n_7 }),
        .S({\reg_out[24]_i_6_n_0 ,\reg_out[24]_i_7_n_0 ,\reg_out[24]_i_8_n_0 ,\reg_out[24]_i_9_n_0 }));
  FDRE \reg_out_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[25]),
        .Q(\reg_out_reg_n_0_[25] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[26]),
        .Q(\reg_out_reg_n_0_[26] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[27]),
        .Q(\reg_out_reg_n_0_[27] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[28]),
        .Q(\reg_out_reg_n_0_[28] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_out_reg[28]_i_4 
       (.CI(\reg_out_reg[24]_i_4_n_0 ),
        .CO({\reg_out_reg[28]_i_4_n_0 ,\NLW_reg_out_reg[28]_i_4_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_pc_reg_n_0_[28] ,\reg_pc_reg_n_0_[27] ,\reg_pc_reg_n_0_[26] ,\reg_pc_reg_n_0_[25] }),
        .O({\reg_out_reg[28]_i_4_n_4 ,\reg_out_reg[28]_i_4_n_5 ,\reg_out_reg[28]_i_4_n_6 ,\reg_out_reg[28]_i_4_n_7 }),
        .S({\reg_out[28]_i_6_n_0 ,\reg_out[28]_i_7_n_0 ,\reg_out[28]_i_8_n_0 ,\reg_out[28]_i_9_n_0 }));
  FDRE \reg_out_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[29]),
        .Q(\reg_out_reg_n_0_[29] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[2]),
        .Q(\reg_out_reg_n_0_[2] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[30]),
        .Q(\reg_out_reg_n_0_[30] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[31]),
        .Q(\reg_out_reg_n_0_[31] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_out_reg[31]_i_9 
       (.CI(\reg_out_reg[28]_i_4_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\reg_pc_reg_n_0_[30] ,\reg_pc_reg_n_0_[29] }),
        .O({\reg_out_reg[31]_i_9_n_5 ,\reg_out_reg[31]_i_9_n_6 ,\reg_out_reg[31]_i_9_n_7 }),
        .S({\<const0> ,\reg_out[31]_i_11_n_0 ,\reg_out[31]_i_12_n_0 ,\reg_out[31]_i_13_n_0 }));
  FDRE \reg_out_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[3]),
        .Q(\reg_out_reg_n_0_[3] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[4]),
        .Q(\reg_out_reg_n_0_[4] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_out_reg[4]_i_3 
       (.CI(\<const0> ),
        .CO({\reg_out_reg[4]_i_3_n_0 ,\NLW_reg_out_reg[4]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_pc_reg_n_0_[4] ,\reg_pc_reg_n_0_[3] ,\reg_pc_reg_n_0_[2] ,\reg_pc_reg_n_0_[1] }),
        .O({\reg_out_reg[4]_i_3_n_4 ,\reg_out_reg[4]_i_3_n_5 ,\reg_out_reg[4]_i_3_n_6 ,\reg_out_reg[4]_i_3_n_7 }),
        .S({\reg_out[4]_i_6_n_0 ,\reg_out[4]_i_7_n_0 ,\reg_out[4]_i_8_n_0 ,\reg_out[4]_i_9_n_0 }));
  FDRE \reg_out_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[5]),
        .Q(\reg_out_reg_n_0_[5] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[6]),
        .Q(\reg_out_reg_n_0_[6] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[7]),
        .Q(\reg_out_reg_n_0_[7] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_out_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[8]),
        .Q(\reg_out_reg_n_0_[8] ),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_out_reg[8]_i_3 
       (.CI(\reg_out_reg[4]_i_3_n_0 ),
        .CO({\reg_out_reg[8]_i_3_n_0 ,\NLW_reg_out_reg[8]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_pc_reg_n_0_[8] ,\reg_pc_reg_n_0_[7] ,\reg_pc_reg_n_0_[6] ,\reg_pc_reg_n_0_[5] }),
        .O({\reg_out_reg[8]_i_3_n_4 ,\reg_out_reg[8]_i_3_n_5 ,\reg_out_reg[8]_i_3_n_6 ,\reg_out_reg[8]_i_3_n_7 }),
        .S({\reg_out[8]_i_6_n_0 ,\reg_out[8]_i_7_n_0 ,\reg_out[8]_i_8_n_0 ,\reg_out[8]_i_9_n_0 }));
  FDRE \reg_out_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[9]),
        .Q(\reg_out_reg_n_0_[9] ),
        .R(instr_and_i_1_n_0));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[10]_i_1 
       (.I0(alu_out_q[10]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[10] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[10] ),
        .O(current_pc[10]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[11]_i_1 
       (.I0(alu_out_q[11]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[11] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[11] ),
        .O(current_pc[11]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[12]_i_1 
       (.I0(alu_out_q[12]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[12] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[12] ),
        .O(current_pc[12]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[13]_i_1 
       (.I0(alu_out_q[13]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[13] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[13] ),
        .O(current_pc[13]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[14]_i_1 
       (.I0(alu_out_q[14]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[14] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[14] ),
        .O(current_pc[14]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[15]_i_1 
       (.I0(alu_out_q[15]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[15] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[15] ),
        .O(current_pc[15]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[16]_i_1 
       (.I0(alu_out_q[16]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[16] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[16] ),
        .O(current_pc[16]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[17]_i_1 
       (.I0(alu_out_q[17]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[17] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[17] ),
        .O(current_pc[17]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[18]_i_1 
       (.I0(alu_out_q[18]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[18] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[18] ),
        .O(current_pc[18]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[19]_i_1 
       (.I0(alu_out_q[19]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[19] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[19] ),
        .O(current_pc[19]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[1]_i_1 
       (.I0(alu_out_q[1]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[1] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[1] ),
        .O(current_pc[1]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[20]_i_1 
       (.I0(alu_out_q[20]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[20] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[20] ),
        .O(current_pc[20]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[21]_i_1 
       (.I0(alu_out_q[21]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[21] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[21] ),
        .O(current_pc[21]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[22]_i_1 
       (.I0(alu_out_q[22]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[22] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[22] ),
        .O(current_pc[22]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[23]_i_1 
       (.I0(alu_out_q[23]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[23] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[23] ),
        .O(current_pc[23]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[24]_i_1 
       (.I0(alu_out_q[24]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[24] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[24] ),
        .O(current_pc[24]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[25]_i_1 
       (.I0(alu_out_q[25]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[25] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[25] ),
        .O(current_pc[25]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[26]_i_1 
       (.I0(alu_out_q[26]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[26] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[26] ),
        .O(current_pc[26]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[27]_i_1 
       (.I0(alu_out_q[27]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[27] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[27] ),
        .O(current_pc[27]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[28]_i_1 
       (.I0(alu_out_q[28]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[28] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[28] ),
        .O(current_pc[28]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[29]_i_1 
       (.I0(alu_out_q[29]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[29] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[29] ),
        .O(current_pc[29]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[2]_i_1 
       (.I0(alu_out_q[2]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[2] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[2] ),
        .O(current_pc[2]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[30]_i_1 
       (.I0(alu_out_q[30]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[30] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[30] ),
        .O(current_pc[30]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[31]_i_1 
       (.I0(alu_out_q[31]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[31] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[31] ),
        .O(current_pc[31]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[3]_i_1 
       (.I0(alu_out_q[3]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[3] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[3] ),
        .O(current_pc[3]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[4]_i_1 
       (.I0(alu_out_q[4]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[4] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[4] ),
        .O(current_pc[4]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[5]_i_1 
       (.I0(alu_out_q[5]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[5] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[5] ),
        .O(current_pc[5]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[6]_i_1 
       (.I0(alu_out_q[6]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[6] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[6] ),
        .O(current_pc[6]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[7]_i_1 
       (.I0(alu_out_q[7]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[7] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[7] ),
        .O(current_pc[7]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[8]_i_1 
       (.I0(alu_out_q[8]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[8] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[8] ),
        .O(current_pc[8]));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \reg_pc[9]_i_1 
       (.I0(alu_out_q[9]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[9] ),
        .I3(latched_branch_reg_n_0),
        .I4(latched_store_reg_n_0),
        .I5(\reg_next_pc_reg_n_0_[9] ),
        .O(current_pc[9]));
  FDRE \reg_pc_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[10]),
        .Q(\reg_pc_reg_n_0_[10] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[11]),
        .Q(\reg_pc_reg_n_0_[11] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[12]),
        .Q(\reg_pc_reg_n_0_[12] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[13]),
        .Q(\reg_pc_reg_n_0_[13] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[14]),
        .Q(\reg_pc_reg_n_0_[14] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[15]),
        .Q(\reg_pc_reg_n_0_[15] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[16]),
        .Q(\reg_pc_reg_n_0_[16] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[17]),
        .Q(\reg_pc_reg_n_0_[17] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[18]),
        .Q(\reg_pc_reg_n_0_[18] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[19]),
        .Q(\reg_pc_reg_n_0_[19] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[1]),
        .Q(\reg_pc_reg_n_0_[1] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[20]),
        .Q(\reg_pc_reg_n_0_[20] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[21]),
        .Q(\reg_pc_reg_n_0_[21] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[22]),
        .Q(\reg_pc_reg_n_0_[22] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[23]),
        .Q(\reg_pc_reg_n_0_[23] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[24]),
        .Q(\reg_pc_reg_n_0_[24] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[25]),
        .Q(\reg_pc_reg_n_0_[25] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[26]),
        .Q(\reg_pc_reg_n_0_[26] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[27]),
        .Q(\reg_pc_reg_n_0_[27] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[28]),
        .Q(\reg_pc_reg_n_0_[28] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[29]),
        .Q(\reg_pc_reg_n_0_[29] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[2]),
        .Q(\reg_pc_reg_n_0_[2] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[30]),
        .Q(\reg_pc_reg_n_0_[30] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[31]),
        .Q(\reg_pc_reg_n_0_[31] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[3]),
        .Q(\reg_pc_reg_n_0_[3] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[4]),
        .Q(\reg_pc_reg_n_0_[4] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[5]),
        .Q(\reg_pc_reg_n_0_[5] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[6]),
        .Q(\reg_pc_reg_n_0_[6] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[7]),
        .Q(\reg_pc_reg_n_0_[7] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[8]),
        .Q(\reg_pc_reg_n_0_[8] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_pc_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(current_pc[9]),
        .Q(\reg_pc_reg_n_0_[9] ),
        .R(instr_and_i_1_n_0));
  LUT6 #(
    .INIT(64'h44FFF44444444444)) 
    \reg_sh[0]_i_1 
       (.I0(\reg_sh[4]_i_2_n_0 ),
        .I1(\reg_sh[0]_i_2_n_0 ),
        .I2(\reg_sh_reg_n_0_[1] ),
        .I3(\reg_sh[2]_i_2_n_0 ),
        .I4(\reg_sh_reg_n_0_[0] ),
        .I5(\cpu_state_reg_n_0_[2] ),
        .O(reg_sh[0]));
  LUT6 #(
    .INIT(64'h5555001000000010)) 
    \reg_sh[0]_i_2 
       (.I0(\reg_sh[4]_i_4_n_0 ),
        .I1(\reg_op2[31]_i_5_n_0 ),
        .I2(cpuregs_reg_r1_0_31_0_5_n_1),
        .I3(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I4(is_slli_srli_srai),
        .I5(decoded_imm_j[11]),
        .O(\reg_sh[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8088FFFF80888088)) 
    \reg_sh[1]_i_1 
       (.I0(\reg_sh_reg_n_0_[1] ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\reg_sh_reg_n_0_[0] ),
        .I3(\reg_sh[2]_i_2_n_0 ),
        .I4(\reg_sh[4]_i_2_n_0 ),
        .I5(\reg_sh[1]_i_2_n_0 ),
        .O(reg_sh[1]));
  LUT6 #(
    .INIT(64'h5555001000000010)) 
    \reg_sh[1]_i_2 
       (.I0(\reg_sh[4]_i_4_n_0 ),
        .I1(\reg_op2[31]_i_5_n_0 ),
        .I2(cpuregs_reg_r1_0_31_0_5_n_0),
        .I3(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I4(is_slli_srli_srai),
        .I5(decoded_imm_j[1]),
        .O(\reg_sh[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h1111000011110F00)) 
    \reg_sh[2]_i_1 
       (.I0(\reg_sh[2]_i_2_n_0 ),
        .I1(\reg_sh_reg_n_0_[2] ),
        .I2(\reg_sh[4]_i_2_n_0 ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .I5(\reg_sh[2]_i_3_n_0 ),
        .O(reg_sh[2]));
  LUT3 #(
    .INIT(8'h01)) 
    \reg_sh[2]_i_2 
       (.I0(\reg_sh_reg_n_0_[4] ),
        .I1(\reg_sh_reg_n_0_[2] ),
        .I2(\reg_sh_reg_n_0_[3] ),
        .O(\reg_sh[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h77777477)) 
    \reg_sh[2]_i_3 
       (.I0(decoded_imm_j[2]),
        .I1(is_slli_srli_srai),
        .I2(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I3(cpuregs_reg_r1_0_31_0_5_n_3),
        .I4(\reg_op2[31]_i_5_n_0 ),
        .O(\reg_sh[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h9800FFFF98009800)) 
    \reg_sh[3]_i_1 
       (.I0(\reg_sh_reg_n_0_[3] ),
        .I1(\reg_sh_reg_n_0_[2] ),
        .I2(\reg_sh_reg_n_0_[4] ),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\reg_sh[4]_i_2_n_0 ),
        .I5(\reg_sh[3]_i_2_n_0 ),
        .O(reg_sh[3]));
  LUT6 #(
    .INIT(64'h5555001000000010)) 
    \reg_sh[3]_i_2 
       (.I0(\reg_sh[4]_i_4_n_0 ),
        .I1(\reg_op2[31]_i_5_n_0 ),
        .I2(cpuregs_reg_r1_0_31_0_5_n_2),
        .I3(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I4(is_slli_srli_srai),
        .I5(decoded_imm_j[3]),
        .O(\reg_sh[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8880FFFF88808880)) 
    \reg_sh[4]_i_1 
       (.I0(\reg_sh_reg_n_0_[4] ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\reg_sh_reg_n_0_[3] ),
        .I3(\reg_sh_reg_n_0_[2] ),
        .I4(\reg_sh[4]_i_2_n_0 ),
        .I5(\reg_sh[4]_i_3_n_0 ),
        .O(reg_sh[4]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \reg_sh[4]_i_2 
       (.I0(\cpu_state[7]_i_7_n_0 ),
        .I1(is_lui_auipc_jal),
        .I2(\cpu_state[6]_i_2_n_0 ),
        .I3(is_lb_lh_lw_lbu_lhu),
        .O(\reg_sh[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h5555001000000010)) 
    \reg_sh[4]_i_3 
       (.I0(\reg_sh[4]_i_4_n_0 ),
        .I1(\reg_op2[31]_i_5_n_0 ),
        .I2(cpuregs_reg_r1_0_31_0_5_n_5),
        .I3(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I4(is_slli_srli_srai),
        .I5(decoded_imm_j[4]),
        .O(\reg_sh[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \reg_sh[4]_i_4 
       (.I0(\cpu_state_reg_n_0_[2] ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .O(\reg_sh[4]_i_4_n_0 ));
  FDRE \reg_sh_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_sh[0]),
        .Q(\reg_sh_reg_n_0_[0] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_sh_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_sh[1]),
        .Q(\reg_sh_reg_n_0_[1] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_sh_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_sh[2]),
        .Q(\reg_sh_reg_n_0_[2] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_sh_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_sh[3]),
        .Q(\reg_sh_reg_n_0_[3] ),
        .R(instr_and_i_1_n_0));
  FDRE \reg_sh_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_sh[4]),
        .Q(\reg_sh_reg_n_0_[4] ),
        .R(instr_and_i_1_n_0));
  IBUF resetn_IBUF_inst
       (.I(resetn),
        .O(resetn_IBUF));
  OBUF \trace_data_OBUF[0]_inst 
       (.I(\<const0> ),
        .O(trace_data[0]));
  OBUF \trace_data_OBUF[10]_inst 
       (.I(\<const0> ),
        .O(trace_data[10]));
  OBUF \trace_data_OBUF[11]_inst 
       (.I(\<const0> ),
        .O(trace_data[11]));
  OBUF \trace_data_OBUF[12]_inst 
       (.I(\<const0> ),
        .O(trace_data[12]));
  OBUF \trace_data_OBUF[13]_inst 
       (.I(\<const0> ),
        .O(trace_data[13]));
  OBUF \trace_data_OBUF[14]_inst 
       (.I(\<const0> ),
        .O(trace_data[14]));
  OBUF \trace_data_OBUF[15]_inst 
       (.I(\<const0> ),
        .O(trace_data[15]));
  OBUF \trace_data_OBUF[16]_inst 
       (.I(\<const0> ),
        .O(trace_data[16]));
  OBUF \trace_data_OBUF[17]_inst 
       (.I(\<const0> ),
        .O(trace_data[17]));
  OBUF \trace_data_OBUF[18]_inst 
       (.I(\<const0> ),
        .O(trace_data[18]));
  OBUF \trace_data_OBUF[19]_inst 
       (.I(\<const0> ),
        .O(trace_data[19]));
  OBUF \trace_data_OBUF[1]_inst 
       (.I(\<const0> ),
        .O(trace_data[1]));
  OBUF \trace_data_OBUF[20]_inst 
       (.I(\<const0> ),
        .O(trace_data[20]));
  OBUF \trace_data_OBUF[21]_inst 
       (.I(\<const0> ),
        .O(trace_data[21]));
  OBUF \trace_data_OBUF[22]_inst 
       (.I(\<const0> ),
        .O(trace_data[22]));
  OBUF \trace_data_OBUF[23]_inst 
       (.I(\<const0> ),
        .O(trace_data[23]));
  OBUF \trace_data_OBUF[24]_inst 
       (.I(\<const0> ),
        .O(trace_data[24]));
  OBUF \trace_data_OBUF[25]_inst 
       (.I(\<const0> ),
        .O(trace_data[25]));
  OBUF \trace_data_OBUF[26]_inst 
       (.I(\<const0> ),
        .O(trace_data[26]));
  OBUF \trace_data_OBUF[27]_inst 
       (.I(\<const0> ),
        .O(trace_data[27]));
  OBUF \trace_data_OBUF[28]_inst 
       (.I(\<const0> ),
        .O(trace_data[28]));
  OBUF \trace_data_OBUF[29]_inst 
       (.I(\<const0> ),
        .O(trace_data[29]));
  OBUF \trace_data_OBUF[2]_inst 
       (.I(\<const0> ),
        .O(trace_data[2]));
  OBUF \trace_data_OBUF[30]_inst 
       (.I(\<const0> ),
        .O(trace_data[30]));
  OBUF \trace_data_OBUF[31]_inst 
       (.I(\<const0> ),
        .O(trace_data[31]));
  OBUF \trace_data_OBUF[32]_inst 
       (.I(\<const0> ),
        .O(trace_data[32]));
  OBUF \trace_data_OBUF[33]_inst 
       (.I(\<const0> ),
        .O(trace_data[33]));
  OBUF \trace_data_OBUF[34]_inst 
       (.I(\<const0> ),
        .O(trace_data[34]));
  OBUF \trace_data_OBUF[35]_inst 
       (.I(\<const0> ),
        .O(trace_data[35]));
  OBUF \trace_data_OBUF[3]_inst 
       (.I(\<const0> ),
        .O(trace_data[3]));
  OBUF \trace_data_OBUF[4]_inst 
       (.I(\<const0> ),
        .O(trace_data[4]));
  OBUF \trace_data_OBUF[5]_inst 
       (.I(\<const0> ),
        .O(trace_data[5]));
  OBUF \trace_data_OBUF[6]_inst 
       (.I(\<const0> ),
        .O(trace_data[6]));
  OBUF \trace_data_OBUF[7]_inst 
       (.I(\<const0> ),
        .O(trace_data[7]));
  OBUF \trace_data_OBUF[8]_inst 
       (.I(\<const0> ),
        .O(trace_data[8]));
  OBUF \trace_data_OBUF[9]_inst 
       (.I(\<const0> ),
        .O(trace_data[9]));
  OBUF trace_valid_OBUF_inst
       (.I(\<const0> ),
        .O(trace_valid));
  OBUF trap_OBUF_inst
       (.I(trap_OBUF),
        .O(trap));
  FDRE trap_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\cpu_state_reg_n_0_[7] ),
        .Q(trap_OBUF),
        .R(instr_and_i_1_n_0));
endmodule
