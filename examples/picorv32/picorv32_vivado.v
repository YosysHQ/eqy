// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Tue Oct 25 01:59:40 2022
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
  wire alu_out_0;
  wire [31:0]alu_out_q;
  wire alu_out_q23_out;
  wire alu_out_q24_out;
  wire \alu_out_q[0]_i_1_n_0 ;
  wire \alu_out_q[0]_i_2_n_0 ;
  wire \alu_out_q[10]_i_1_n_0 ;
  wire \alu_out_q[10]_i_2_n_0 ;
  wire \alu_out_q[11]_i_1_n_0 ;
  wire \alu_out_q[11]_i_3_n_0 ;
  wire \alu_out_q[11]_i_4_n_0 ;
  wire \alu_out_q[11]_i_5_n_0 ;
  wire \alu_out_q[11]_i_6_n_0 ;
  wire \alu_out_q[11]_i_7_n_0 ;
  wire \alu_out_q[12]_i_1_n_0 ;
  wire \alu_out_q[12]_i_2_n_0 ;
  wire \alu_out_q[13]_i_1_n_0 ;
  wire \alu_out_q[13]_i_2_n_0 ;
  wire \alu_out_q[14]_i_1_n_0 ;
  wire \alu_out_q[14]_i_2_n_0 ;
  wire \alu_out_q[15]_i_1_n_0 ;
  wire \alu_out_q[15]_i_3_n_0 ;
  wire \alu_out_q[15]_i_4_n_0 ;
  wire \alu_out_q[15]_i_5_n_0 ;
  wire \alu_out_q[15]_i_6_n_0 ;
  wire \alu_out_q[15]_i_7_n_0 ;
  wire \alu_out_q[16]_i_1_n_0 ;
  wire \alu_out_q[16]_i_2_n_0 ;
  wire \alu_out_q[17]_i_1_n_0 ;
  wire \alu_out_q[17]_i_2_n_0 ;
  wire \alu_out_q[18]_i_1_n_0 ;
  wire \alu_out_q[18]_i_2_n_0 ;
  wire \alu_out_q[19]_i_1_n_0 ;
  wire \alu_out_q[19]_i_3_n_0 ;
  wire \alu_out_q[19]_i_4_n_0 ;
  wire \alu_out_q[19]_i_5_n_0 ;
  wire \alu_out_q[19]_i_6_n_0 ;
  wire \alu_out_q[19]_i_7_n_0 ;
  wire \alu_out_q[1]_i_1_n_0 ;
  wire \alu_out_q[1]_i_2_n_0 ;
  wire \alu_out_q[20]_i_1_n_0 ;
  wire \alu_out_q[20]_i_2_n_0 ;
  wire \alu_out_q[21]_i_1_n_0 ;
  wire \alu_out_q[21]_i_2_n_0 ;
  wire \alu_out_q[22]_i_1_n_0 ;
  wire \alu_out_q[22]_i_2_n_0 ;
  wire \alu_out_q[23]_i_1_n_0 ;
  wire \alu_out_q[23]_i_3_n_0 ;
  wire \alu_out_q[23]_i_4_n_0 ;
  wire \alu_out_q[23]_i_5_n_0 ;
  wire \alu_out_q[23]_i_6_n_0 ;
  wire \alu_out_q[23]_i_7_n_0 ;
  wire \alu_out_q[24]_i_1_n_0 ;
  wire \alu_out_q[24]_i_2_n_0 ;
  wire \alu_out_q[25]_i_1_n_0 ;
  wire \alu_out_q[25]_i_2_n_0 ;
  wire \alu_out_q[26]_i_1_n_0 ;
  wire \alu_out_q[26]_i_2_n_0 ;
  wire \alu_out_q[27]_i_1_n_0 ;
  wire \alu_out_q[27]_i_3_n_0 ;
  wire \alu_out_q[27]_i_4_n_0 ;
  wire \alu_out_q[27]_i_5_n_0 ;
  wire \alu_out_q[27]_i_6_n_0 ;
  wire \alu_out_q[27]_i_7_n_0 ;
  wire \alu_out_q[28]_i_1_n_0 ;
  wire \alu_out_q[28]_i_2_n_0 ;
  wire \alu_out_q[29]_i_1_n_0 ;
  wire \alu_out_q[29]_i_2_n_0 ;
  wire \alu_out_q[2]_i_1_n_0 ;
  wire \alu_out_q[2]_i_2_n_0 ;
  wire \alu_out_q[30]_i_1_n_0 ;
  wire \alu_out_q[30]_i_2_n_0 ;
  wire \alu_out_q[31]_i_1_n_0 ;
  wire \alu_out_q[31]_i_3_n_0 ;
  wire \alu_out_q[31]_i_4_n_0 ;
  wire \alu_out_q[31]_i_5_n_0 ;
  wire \alu_out_q[31]_i_6_n_0 ;
  wire \alu_out_q[31]_i_7_n_0 ;
  wire \alu_out_q[31]_i_8_n_0 ;
  wire \alu_out_q[3]_i_1_n_0 ;
  wire \alu_out_q[3]_i_3_n_0 ;
  wire \alu_out_q[3]_i_4_n_0 ;
  wire \alu_out_q[3]_i_5_n_0 ;
  wire \alu_out_q[3]_i_6_n_0 ;
  wire \alu_out_q[4]_i_1_n_0 ;
  wire \alu_out_q[4]_i_2_n_0 ;
  wire \alu_out_q[5]_i_1_n_0 ;
  wire \alu_out_q[5]_i_2_n_0 ;
  wire \alu_out_q[6]_i_1_n_0 ;
  wire \alu_out_q[6]_i_2_n_0 ;
  wire \alu_out_q[7]_i_1_n_0 ;
  wire \alu_out_q[7]_i_3_n_0 ;
  wire \alu_out_q[7]_i_4_n_0 ;
  wire \alu_out_q[7]_i_5_n_0 ;
  wire \alu_out_q[7]_i_6_n_0 ;
  wire \alu_out_q[7]_i_7_n_0 ;
  wire \alu_out_q[8]_i_1_n_0 ;
  wire \alu_out_q[8]_i_2_n_0 ;
  wire \alu_out_q[9]_i_1_n_0 ;
  wire \alu_out_q[9]_i_2_n_0 ;
  wire \alu_out_q_reg[11]_i_2_n_0 ;
  wire \alu_out_q_reg[11]_i_2_n_4 ;
  wire \alu_out_q_reg[11]_i_2_n_5 ;
  wire \alu_out_q_reg[11]_i_2_n_6 ;
  wire \alu_out_q_reg[11]_i_2_n_7 ;
  wire \alu_out_q_reg[15]_i_2_n_0 ;
  wire \alu_out_q_reg[15]_i_2_n_4 ;
  wire \alu_out_q_reg[15]_i_2_n_5 ;
  wire \alu_out_q_reg[15]_i_2_n_6 ;
  wire \alu_out_q_reg[15]_i_2_n_7 ;
  wire \alu_out_q_reg[19]_i_2_n_0 ;
  wire \alu_out_q_reg[19]_i_2_n_4 ;
  wire \alu_out_q_reg[19]_i_2_n_5 ;
  wire \alu_out_q_reg[19]_i_2_n_6 ;
  wire \alu_out_q_reg[19]_i_2_n_7 ;
  wire \alu_out_q_reg[23]_i_2_n_0 ;
  wire \alu_out_q_reg[23]_i_2_n_4 ;
  wire \alu_out_q_reg[23]_i_2_n_5 ;
  wire \alu_out_q_reg[23]_i_2_n_6 ;
  wire \alu_out_q_reg[23]_i_2_n_7 ;
  wire \alu_out_q_reg[27]_i_2_n_0 ;
  wire \alu_out_q_reg[27]_i_2_n_4 ;
  wire \alu_out_q_reg[27]_i_2_n_5 ;
  wire \alu_out_q_reg[27]_i_2_n_6 ;
  wire \alu_out_q_reg[27]_i_2_n_7 ;
  wire \alu_out_q_reg[31]_i_2_n_4 ;
  wire \alu_out_q_reg[31]_i_2_n_5 ;
  wire \alu_out_q_reg[31]_i_2_n_6 ;
  wire \alu_out_q_reg[31]_i_2_n_7 ;
  wire \alu_out_q_reg[3]_i_2_n_0 ;
  wire \alu_out_q_reg[3]_i_2_n_4 ;
  wire \alu_out_q_reg[3]_i_2_n_5 ;
  wire \alu_out_q_reg[3]_i_2_n_6 ;
  wire \alu_out_q_reg[3]_i_2_n_7 ;
  wire \alu_out_q_reg[7]_i_2_n_0 ;
  wire \alu_out_q_reg[7]_i_2_n_4 ;
  wire \alu_out_q_reg[7]_i_2_n_5 ;
  wire \alu_out_q_reg[7]_i_2_n_6 ;
  wire \alu_out_q_reg[7]_i_2_n_7 ;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire \count_cycle[0]_i_2_n_0 ;
  wire [63:0]count_cycle_reg;
  wire \count_cycle_reg[0]_i_1_n_0 ;
  wire \count_cycle_reg[0]_i_1_n_4 ;
  wire \count_cycle_reg[0]_i_1_n_5 ;
  wire \count_cycle_reg[0]_i_1_n_6 ;
  wire \count_cycle_reg[0]_i_1_n_7 ;
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
  wire \count_cycle_reg[60]_i_1_n_4 ;
  wire \count_cycle_reg[60]_i_1_n_5 ;
  wire \count_cycle_reg[60]_i_1_n_6 ;
  wire \count_cycle_reg[60]_i_1_n_7 ;
  wire \count_cycle_reg[8]_i_1_n_0 ;
  wire \count_cycle_reg[8]_i_1_n_4 ;
  wire \count_cycle_reg[8]_i_1_n_5 ;
  wire \count_cycle_reg[8]_i_1_n_6 ;
  wire \count_cycle_reg[8]_i_1_n_7 ;
  wire count_instr;
  wire \count_instr[0]_i_3_n_0 ;
  wire [63:0]count_instr_reg;
  wire \count_instr_reg[0]_i_2_n_0 ;
  wire \count_instr_reg[0]_i_2_n_4 ;
  wire \count_instr_reg[0]_i_2_n_5 ;
  wire \count_instr_reg[0]_i_2_n_6 ;
  wire \count_instr_reg[0]_i_2_n_7 ;
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
  wire \count_instr_reg[60]_i_1_n_4 ;
  wire \count_instr_reg[60]_i_1_n_5 ;
  wire \count_instr_reg[60]_i_1_n_6 ;
  wire \count_instr_reg[60]_i_1_n_7 ;
  wire \count_instr_reg[8]_i_1_n_0 ;
  wire \count_instr_reg[8]_i_1_n_4 ;
  wire \count_instr_reg[8]_i_1_n_5 ;
  wire \count_instr_reg[8]_i_1_n_6 ;
  wire \count_instr_reg[8]_i_1_n_7 ;
  wire [7:0]cpu_state0_out;
  wire \cpu_state[1]_i_2_n_0 ;
  wire \cpu_state[2]_i_2_n_0 ;
  wire \cpu_state[3]_i_2_n_0 ;
  wire \cpu_state[6]_i_2_n_0 ;
  wire \cpu_state[6]_i_3_n_0 ;
  wire \cpu_state[7]_i_10_n_0 ;
  wire \cpu_state[7]_i_11_n_0 ;
  wire \cpu_state[7]_i_12_n_0 ;
  wire \cpu_state[7]_i_13_n_0 ;
  wire \cpu_state[7]_i_14_n_0 ;
  wire \cpu_state[7]_i_15_n_0 ;
  wire \cpu_state[7]_i_16_n_0 ;
  wire \cpu_state[7]_i_17_n_0 ;
  wire \cpu_state[7]_i_1_n_0 ;
  wire \cpu_state[7]_i_2_n_0 ;
  wire \cpu_state[7]_i_4_n_0 ;
  wire \cpu_state[7]_i_5_n_0 ;
  wire \cpu_state[7]_i_6_n_0 ;
  wire \cpu_state[7]_i_8_n_0 ;
  wire \cpu_state_reg_n_0_[0] ;
  wire \cpu_state_reg_n_0_[1] ;
  wire \cpu_state_reg_n_0_[2] ;
  wire \cpu_state_reg_n_0_[3] ;
  wire \cpu_state_reg_n_0_[5] ;
  wire \cpu_state_reg_n_0_[7] ;
  wire cpuregs_reg_r1_0_31_0_5_i_10_n_0;
  wire cpuregs_reg_r1_0_31_0_5_i_10_n_4;
  wire cpuregs_reg_r1_0_31_0_5_i_10_n_5;
  wire cpuregs_reg_r1_0_31_0_5_i_10_n_6;
  wire cpuregs_reg_r1_0_31_0_5_i_11_n_0;
  wire cpuregs_reg_r1_0_31_0_5_i_11_n_4;
  wire cpuregs_reg_r1_0_31_0_5_i_11_n_5;
  wire cpuregs_reg_r1_0_31_0_5_i_11_n_6;
  wire cpuregs_reg_r1_0_31_0_5_i_11_n_7;
  wire cpuregs_reg_r1_0_31_0_5_i_12_n_0;
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
  wire decoded_imm1;
  wire \decoded_imm[0]_i_1_n_0 ;
  wire \decoded_imm[10]_i_1_n_0 ;
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
  wire \decoded_imm[30]_i_2_n_0 ;
  wire \decoded_imm[31]_i_1_n_0 ;
  wire \decoded_imm[31]_i_2_n_0 ;
  wire \decoded_imm[31]_i_3_n_0 ;
  wire \decoded_imm[3]_i_1_n_0 ;
  wire \decoded_imm[4]_i_1_n_0 ;
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
  wire decoder_pseudo_trigger_i_2_n_0;
  wire decoder_pseudo_trigger_reg_n_0;
  wire decoder_trigger1;
  wire decoder_trigger_i_10_n_0;
  wire decoder_trigger_i_11_n_0;
  wire decoder_trigger_i_12_n_0;
  wire decoder_trigger_i_13_n_0;
  wire decoder_trigger_i_14_n_0;
  wire decoder_trigger_i_15_n_0;
  wire decoder_trigger_i_16_n_0;
  wire decoder_trigger_i_17_n_0;
  wire decoder_trigger_i_19_n_0;
  wire decoder_trigger_i_1_n_0;
  wire decoder_trigger_i_20_n_0;
  wire decoder_trigger_i_21_n_0;
  wire decoder_trigger_i_23_n_0;
  wire decoder_trigger_i_32_n_0;
  wire decoder_trigger_i_33_n_0;
  wire decoder_trigger_i_34_n_0;
  wire decoder_trigger_i_35_n_0;
  wire decoder_trigger_i_36_n_0;
  wire decoder_trigger_i_37_n_0;
  wire decoder_trigger_i_38_n_0;
  wire decoder_trigger_i_39_n_0;
  wire decoder_trigger_i_3_n_0;
  wire decoder_trigger_i_41_n_0;
  wire decoder_trigger_i_42_n_0;
  wire decoder_trigger_i_43_n_0;
  wire decoder_trigger_i_44_n_0;
  wire decoder_trigger_i_4_n_0;
  wire decoder_trigger_i_55_n_0;
  wire decoder_trigger_i_56_n_0;
  wire decoder_trigger_i_57_n_0;
  wire decoder_trigger_i_58_n_0;
  wire decoder_trigger_i_59_n_0;
  wire decoder_trigger_i_60_n_0;
  wire decoder_trigger_i_61_n_0;
  wire decoder_trigger_i_62_n_0;
  wire decoder_trigger_i_63_n_0;
  wire decoder_trigger_i_64_n_0;
  wire decoder_trigger_i_65_n_0;
  wire decoder_trigger_i_66_n_0;
  wire decoder_trigger_i_6_n_0;
  wire decoder_trigger_i_76_n_0;
  wire decoder_trigger_i_77_n_0;
  wire decoder_trigger_i_78_n_0;
  wire decoder_trigger_i_79_n_0;
  wire decoder_trigger_i_80_n_0;
  wire decoder_trigger_i_81_n_0;
  wire decoder_trigger_i_82_n_0;
  wire decoder_trigger_i_83_n_0;
  wire decoder_trigger_reg_i_18_n_0;
  wire decoder_trigger_reg_i_22_n_0;
  wire decoder_trigger_reg_i_31_n_0;
  wire decoder_trigger_reg_i_40_n_0;
  wire decoder_trigger_reg_i_45_n_0;
  wire decoder_trigger_reg_i_54_n_0;
  wire decoder_trigger_reg_i_67_n_0;
  wire decoder_trigger_reg_i_9_n_0;
  wire decoder_trigger_reg_n_0;
  wire [31:0]eoi;
  wire \i_1/O_n ;
  wire \i_1/O_n_1 ;
  wire \i_1/O_n_10 ;
  wire \i_1/O_n_11 ;
  wire \i_1/O_n_12 ;
  wire \i_1/O_n_13 ;
  wire \i_1/O_n_14 ;
  wire \i_1/O_n_15 ;
  wire \i_1/O_n_16 ;
  wire \i_1/O_n_17 ;
  wire \i_1/O_n_18 ;
  wire \i_1/O_n_19 ;
  wire \i_1/O_n_2 ;
  wire \i_1/O_n_20 ;
  wire \i_1/O_n_21 ;
  wire \i_1/O_n_22 ;
  wire \i_1/O_n_23 ;
  wire \i_1/O_n_24 ;
  wire \i_1/O_n_25 ;
  wire \i_1/O_n_3 ;
  wire \i_1/O_n_4 ;
  wire \i_1/O_n_5 ;
  wire \i_1/O_n_6 ;
  wire \i_1/O_n_7 ;
  wire \i_1/O_n_8 ;
  wire \i_1/O_n_9 ;
  wire \i_2/O_n ;
  wire \i_2/O_n_1 ;
  wire \i_2/O_n_10 ;
  wire \i_2/O_n_11 ;
  wire \i_2/O_n_12 ;
  wire \i_2/O_n_13 ;
  wire \i_2/O_n_14 ;
  wire \i_2/O_n_15 ;
  wire \i_2/O_n_16 ;
  wire \i_2/O_n_17 ;
  wire \i_2/O_n_18 ;
  wire \i_2/O_n_19 ;
  wire \i_2/O_n_2 ;
  wire \i_2/O_n_20 ;
  wire \i_2/O_n_21 ;
  wire \i_2/O_n_22 ;
  wire \i_2/O_n_23 ;
  wire \i_2/O_n_24 ;
  wire \i_2/O_n_3 ;
  wire \i_2/O_n_4 ;
  wire \i_2/O_n_5 ;
  wire \i_2/O_n_6 ;
  wire \i_2/O_n_7 ;
  wire \i_2/O_n_8 ;
  wire \i_2/O_n_9 ;
  wire \i_3/O_n ;
  wire \i_3/O_n_1 ;
  wire \i_3/O_n_10 ;
  wire \i_3/O_n_11 ;
  wire \i_3/O_n_12 ;
  wire \i_3/O_n_13 ;
  wire \i_3/O_n_2 ;
  wire \i_3/O_n_3 ;
  wire \i_3/O_n_4 ;
  wire \i_3/O_n_5 ;
  wire \i_3/O_n_6 ;
  wire \i_3/O_n_7 ;
  wire \i_3/O_n_8 ;
  wire \i_3/O_n_9 ;
  wire \i_4/O_n ;
  wire \i_4/O_n_1 ;
  wire \i_4/O_n_10 ;
  wire \i_4/O_n_2 ;
  wire \i_4/O_n_3 ;
  wire \i_4/O_n_4 ;
  wire \i_4/O_n_5 ;
  wire \i_4/O_n_6 ;
  wire \i_4/O_n_7 ;
  wire \i_4/O_n_8 ;
  wire \i_4/O_n_9 ;
  wire \i_5/O_n ;
  wire \i_6/O_n ;
  wire \i_7/O_n ;
  wire \i_8/O_n ;
  wire \i_9/O_n ;
  wire instr_add;
  wire instr_add0;
  wire instr_addi;
  wire instr_addi0;
  wire instr_and;
  wire instr_and0;
  wire instr_and_i_1_n_0;
  wire instr_andi;
  wire instr_andi0;
  wire instr_auipc;
  wire instr_auipc_i_1_n_0;
  wire instr_auipc_i_2_n_0;
  wire instr_auipc_i_3_n_0;
  wire instr_beq;
  wire instr_beq0;
  wire instr_beq1;
  wire instr_bge;
  wire instr_bge0;
  wire instr_bge1;
  wire instr_bgeu;
  wire instr_bgeu0;
  wire instr_blt;
  wire instr_blt0;
  wire instr_blt1;
  wire instr_bltu;
  wire instr_bltu0;
  wire instr_bne;
  wire instr_bne0;
  wire instr_bne1;
  wire instr_jal;
  wire instr_jal_i_1_n_0;
  wire instr_jal_i_2_n_0;
  wire instr_jalr;
  wire instr_jalr0;
  wire instr_jalr_i_2_n_0;
  wire instr_jalr_i_3_n_0;
  wire instr_lb;
  wire instr_lbu;
  wire instr_lh;
  wire instr_lhu;
  wire instr_lhu_i_1_n_0;
  wire instr_lui;
  wire instr_lui0;
  wire instr_lui_i_1_n_0;
  wire instr_lui_i_2_n_0;
  wire instr_lw;
  wire instr_lw1;
  wire instr_or;
  wire instr_or0;
  wire instr_ori;
  wire instr_ori0;
  wire instr_rdcycle;
  wire instr_rdcycle0;
  wire instr_rdcycle_i_4_n_0;
  wire instr_rdcycle_i_5_n_0;
  wire instr_rdcycleh;
  wire instr_rdcycleh0;
  wire instr_rdcycleh_i_2_n_0;
  wire instr_rdcycleh_i_3_n_0;
  wire instr_rdcycleh_i_4_n_0;
  wire instr_rdcycleh_i_5_n_0;
  wire instr_rdinstr;
  wire instr_rdinstr0;
  wire instr_rdinstr_i_2_n_0;
  wire instr_rdinstr_i_3_n_0;
  wire instr_rdinstr_i_4_n_0;
  wire instr_rdinstrh;
  wire instr_rdinstrh0;
  wire instr_rdinstrh_i_2_n_0;
  wire instr_rdinstrh_i_3_n_0;
  wire instr_rdinstrh_i_4_n_0;
  wire instr_rdinstrh_i_5_n_0;
  wire instr_rdinstrh_i_6_n_0;
  wire instr_rdinstrh_i_7_n_0;
  wire instr_sb;
  wire instr_sb0;
  wire instr_sh;
  wire instr_sh0;
  wire instr_sll;
  wire instr_sll0;
  wire instr_slli;
  wire instr_slli0;
  wire instr_slli1;
  wire instr_slt;
  wire instr_slt0;
  wire instr_slti;
  wire instr_slti0;
  wire instr_sltiu;
  wire instr_sltiu0;
  wire instr_sltu;
  wire instr_sltu0;
  wire instr_sra;
  wire instr_sra0;
  wire instr_srai;
  wire instr_srai0;
  wire instr_srai1;
  wire instr_srl;
  wire instr_srl0;
  wire instr_srli;
  wire instr_srli0;
  wire instr_sub;
  wire instr_sub0;
  wire instr_sw;
  wire instr_sw0;
  wire instr_trap;
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
  wire is_rdcycle_rdcycleh_rdinstr_rdinstrh;
  wire is_sb_sh_sw;
  wire is_sb_sh_sw_i_2_n_0;
  wire is_sb_sh_sw_i_4_n_0;
  wire is_sb_sh_sw_i_5_n_0;
  wire is_sb_sh_sw_i_6_n_0;
  wire is_sll_srl_sra;
  wire is_sll_srl_sra0;
  wire is_sll_srl_sra_i_5_n_0;
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
  wire latched_store;
  wire latched_store_i_1_n_0;
  wire latched_store_reg_n_0;
  wire [31:0]mem_addr;
  wire \mem_addr[31]_i_1_n_0 ;
  wire [31:2]mem_addr_OBUF;
  wire mem_do_prefetch;
  wire mem_do_prefetch_i_1_n_0;
  wire mem_do_prefetch_i_2_n_0;
  wire mem_do_prefetch_reg_n_0;
  wire mem_do_rdata;
  wire mem_do_rdata_i_1_n_0;
  wire mem_do_rdata_i_2_n_0;
  wire mem_do_rdata_i_4_n_0;
  wire mem_do_rinst_i_12_n_0;
  wire mem_do_rinst_i_13_n_0;
  wire mem_do_rinst_i_1_n_0;
  wire mem_do_rinst_i_4_n_0;
  wire mem_do_rinst_i_6_n_0;
  wire mem_do_rinst_i_8_n_0;
  wire mem_do_rinst_i_9_n_0;
  wire mem_do_rinst_reg_n_0;
  wire mem_do_wdata;
  wire mem_do_wdata_i_1_n_0;
  wire mem_done;
  wire mem_instr;
  wire mem_instr3_out;
  wire mem_instr_OBUF;
  wire mem_instr_i_2_n_0;
  wire [31:0]mem_la_addr;
  wire [31:2]mem_la_addr_OBUF;
  wire mem_la_read;
  wire mem_la_read1;
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
  wire [7:7]mem_rdata_word;
  wire mem_ready;
  wire mem_ready_IBUF;
  wire mem_state;
  wire mem_state0;
  wire mem_state1;
  wire \mem_state[0]_i_1_n_0 ;
  wire \mem_state[0]_i_2_n_0 ;
  wire \mem_state[1]_i_1_n_0 ;
  wire \mem_state[1]_i_3_n_0 ;
  wire \mem_state[1]_i_4_n_0 ;
  wire \mem_state_reg_n_0_[0] ;
  wire \mem_state_reg_n_0_[1] ;
  wire mem_valid;
  wire mem_valid_OBUF;
  wire mem_valid_i_1_n_0;
  wire mem_valid_i_2_n_0;
  wire mem_valid_i_3_n_0;
  wire [31:0]mem_wdata;
  wire \mem_wdata[31]_i_1_n_0 ;
  wire [31:0]mem_wdata_OBUF;
  wire [1:0]mem_wordsize;
  wire \mem_wordsize[0]_i_1_n_0 ;
  wire \mem_wordsize[1]_i_1_n_0 ;
  wire \mem_wordsize[1]_i_4_n_0 ;
  wire \mem_wordsize_reg_n_0_[0] ;
  wire \mem_wordsize_reg_n_0_[1] ;
  wire [3:0]mem_wstrb;
  wire \mem_wstrb[0]_i_1_n_0 ;
  wire \mem_wstrb[1]_i_1_n_0 ;
  wire \mem_wstrb[2]_i_1_n_0 ;
  wire \mem_wstrb[3]_i_1_n_0 ;
  wire \mem_wstrb[3]_i_2_n_0 ;
  wire \mem_wstrb[3]_i_3_n_0 ;
  wire [3:0]mem_wstrb_OBUF;
  wire mem_xfer;
  wire [2:0]p_0_in;
  wire p_0_in0;
  wire [4:0]p_1_in;
  wire p_8_in;
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
  wire \reg_next_pc[12]_i_6_n_0 ;
  wire \reg_next_pc[12]_i_7_n_0 ;
  wire \reg_next_pc[12]_i_8_n_0 ;
  wire \reg_next_pc[12]_i_9_n_0 ;
  wire \reg_next_pc[16]_i_2_n_0 ;
  wire \reg_next_pc[16]_i_3_n_0 ;
  wire \reg_next_pc[16]_i_4_n_0 ;
  wire \reg_next_pc[16]_i_5_n_0 ;
  wire \reg_next_pc[16]_i_6_n_0 ;
  wire \reg_next_pc[16]_i_7_n_0 ;
  wire \reg_next_pc[16]_i_8_n_0 ;
  wire \reg_next_pc[16]_i_9_n_0 ;
  wire \reg_next_pc[20]_i_2_n_0 ;
  wire \reg_next_pc[20]_i_3_n_0 ;
  wire \reg_next_pc[20]_i_4_n_0 ;
  wire \reg_next_pc[20]_i_5_n_0 ;
  wire \reg_next_pc[20]_i_6_n_0 ;
  wire \reg_next_pc[20]_i_7_n_0 ;
  wire \reg_next_pc[20]_i_8_n_0 ;
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
  wire \reg_next_pc[31]_i_6_n_0 ;
  wire \reg_next_pc[4]_i_2_n_0 ;
  wire \reg_next_pc[4]_i_3_n_0 ;
  wire \reg_next_pc[4]_i_4_n_0 ;
  wire \reg_next_pc[4]_i_5_n_0 ;
  wire \reg_next_pc[4]_i_6_n_0 ;
  wire \reg_next_pc[4]_i_7_n_0 ;
  wire \reg_next_pc[4]_i_8_n_0 ;
  wire \reg_next_pc[4]_i_9_n_0 ;
  wire \reg_next_pc[8]_i_2_n_0 ;
  wire \reg_next_pc[8]_i_3_n_0 ;
  wire \reg_next_pc[8]_i_4_n_0 ;
  wire \reg_next_pc[8]_i_5_n_0 ;
  wire \reg_next_pc[8]_i_6_n_0 ;
  wire \reg_next_pc[8]_i_7_n_0 ;
  wire \reg_next_pc[8]_i_8_n_0 ;
  wire \reg_next_pc[8]_i_9_n_0 ;
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
  wire \reg_op1[10]_i_2_n_0 ;
  wire \reg_op1[10]_i_3_n_0 ;
  wire \reg_op1[10]_i_4_n_0 ;
  wire \reg_op1[11]_i_2_n_0 ;
  wire \reg_op1[11]_i_3_n_0 ;
  wire \reg_op1[11]_i_4_n_0 ;
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
  wire \reg_op1[15]_i_3_n_0 ;
  wire \reg_op1[15]_i_4_n_0 ;
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
  wire \reg_op1[19]_i_3_n_0 ;
  wire \reg_op1[19]_i_4_n_0 ;
  wire \reg_op1[19]_i_6_n_0 ;
  wire \reg_op1[19]_i_7_n_0 ;
  wire \reg_op1[19]_i_8_n_0 ;
  wire \reg_op1[19]_i_9_n_0 ;
  wire \reg_op1[20]_i_4_n_0 ;
  wire \reg_op1[21]_i_4_n_0 ;
  wire \reg_op1[22]_i_4_n_0 ;
  wire \reg_op1[23]_i_4_n_0 ;
  wire \reg_op1[23]_i_6_n_0 ;
  wire \reg_op1[23]_i_7_n_0 ;
  wire \reg_op1[23]_i_8_n_0 ;
  wire \reg_op1[23]_i_9_n_0 ;
  wire \reg_op1[24]_i_4_n_0 ;
  wire \reg_op1[25]_i_4_n_0 ;
  wire \reg_op1[26]_i_4_n_0 ;
  wire \reg_op1[27]_i_4_n_0 ;
  wire \reg_op1[27]_i_6_n_0 ;
  wire \reg_op1[27]_i_7_n_0 ;
  wire \reg_op1[27]_i_8_n_0 ;
  wire \reg_op1[27]_i_9_n_0 ;
  wire \reg_op1[31]_i_10_n_0 ;
  wire \reg_op1[31]_i_12_n_0 ;
  wire \reg_op1[31]_i_13_n_0 ;
  wire \reg_op1[31]_i_14_n_0 ;
  wire \reg_op1[31]_i_15_n_0 ;
  wire \reg_op1[31]_i_16_n_0 ;
  wire \reg_op1[31]_i_17_n_0 ;
  wire \reg_op1[31]_i_1_n_0 ;
  wire \reg_op1[31]_i_4_n_0 ;
  wire \reg_op1[31]_i_6_n_0 ;
  wire \reg_op1[31]_i_7_n_0 ;
  wire \reg_op1[31]_i_8_n_0 ;
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
  wire \reg_op1[7]_i_3_n_0 ;
  wire \reg_op1[7]_i_4_n_0 ;
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
  wire \reg_op1_reg[11]_i_5_n_0 ;
  wire \reg_op1_reg[11]_i_5_n_4 ;
  wire \reg_op1_reg[11]_i_5_n_5 ;
  wire \reg_op1_reg[11]_i_5_n_6 ;
  wire \reg_op1_reg[11]_i_5_n_7 ;
  wire \reg_op1_reg[15]_i_5_n_0 ;
  wire \reg_op1_reg[15]_i_5_n_4 ;
  wire \reg_op1_reg[15]_i_5_n_5 ;
  wire \reg_op1_reg[15]_i_5_n_6 ;
  wire \reg_op1_reg[15]_i_5_n_7 ;
  wire \reg_op1_reg[19]_i_5_n_0 ;
  wire \reg_op1_reg[19]_i_5_n_4 ;
  wire \reg_op1_reg[19]_i_5_n_5 ;
  wire \reg_op1_reg[19]_i_5_n_6 ;
  wire \reg_op1_reg[19]_i_5_n_7 ;
  wire \reg_op1_reg[23]_i_5_n_0 ;
  wire \reg_op1_reg[23]_i_5_n_4 ;
  wire \reg_op1_reg[23]_i_5_n_5 ;
  wire \reg_op1_reg[23]_i_5_n_6 ;
  wire \reg_op1_reg[23]_i_5_n_7 ;
  wire \reg_op1_reg[27]_i_5_n_0 ;
  wire \reg_op1_reg[27]_i_5_n_4 ;
  wire \reg_op1_reg[27]_i_5_n_5 ;
  wire \reg_op1_reg[27]_i_5_n_6 ;
  wire \reg_op1_reg[27]_i_5_n_7 ;
  wire \reg_op1_reg[31]_i_11_n_4 ;
  wire \reg_op1_reg[31]_i_11_n_5 ;
  wire \reg_op1_reg[31]_i_11_n_6 ;
  wire \reg_op1_reg[31]_i_11_n_7 ;
  wire \reg_op1_reg[3]_i_4_n_0 ;
  wire \reg_op1_reg[3]_i_4_n_4 ;
  wire \reg_op1_reg[3]_i_4_n_5 ;
  wire \reg_op1_reg[3]_i_4_n_6 ;
  wire \reg_op1_reg[3]_i_4_n_7 ;
  wire \reg_op1_reg[7]_i_5_n_0 ;
  wire \reg_op1_reg[7]_i_5_n_4 ;
  wire \reg_op1_reg[7]_i_5_n_5 ;
  wire \reg_op1_reg[7]_i_5_n_6 ;
  wire \reg_op1_reg[7]_i_5_n_7 ;
  wire \reg_op2[0]_i_1_n_0 ;
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
  wire \reg_op2[30]_i_1_n_0 ;
  wire \reg_op2[31]_i_1_n_0 ;
  wire \reg_op2[31]_i_2_n_0 ;
  wire \reg_op2[31]_i_3_n_0 ;
  wire \reg_op2[31]_i_4_n_0 ;
  wire \reg_op2[31]_i_5_n_0 ;
  wire \reg_op2[3]_i_1_n_0 ;
  wire \reg_op2[4]_i_1_n_0 ;
  wire \reg_op2[4]_i_2_n_0 ;
  wire \reg_op2[4]_i_3_n_0 ;
  wire \reg_op2[4]_i_4_n_0 ;
  wire \reg_op2[4]_i_5_n_0 ;
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
  wire \reg_out[12]_i_5_n_0 ;
  wire \reg_out[12]_i_6_n_0 ;
  wire \reg_out[12]_i_7_n_0 ;
  wire \reg_out[12]_i_8_n_0 ;
  wire \reg_out[14]_i_10_n_0 ;
  wire \reg_out[14]_i_5_n_0 ;
  wire \reg_out[14]_i_6_n_0 ;
  wire \reg_out[14]_i_7_n_0 ;
  wire \reg_out[14]_i_8_n_0 ;
  wire \reg_out[15]_i_2_n_0 ;
  wire \reg_out[15]_i_3_n_0 ;
  wire \reg_out[15]_i_4_n_0 ;
  wire \reg_out[15]_i_5_n_0 ;
  wire \reg_out[16]_i_2_n_0 ;
  wire \reg_out[16]_i_3_n_0 ;
  wire \reg_out[16]_i_4_n_0 ;
  wire \reg_out[16]_i_5_n_0 ;
  wire \reg_out[17]_i_2_n_0 ;
  wire \reg_out[17]_i_3_n_0 ;
  wire \reg_out[17]_i_4_n_0 ;
  wire \reg_out[17]_i_5_n_0 ;
  wire \reg_out[18]_i_2_n_0 ;
  wire \reg_out[18]_i_3_n_0 ;
  wire \reg_out[18]_i_4_n_0 ;
  wire \reg_out[18]_i_5_n_0 ;
  wire \reg_out[19]_i_2_n_0 ;
  wire \reg_out[19]_i_3_n_0 ;
  wire \reg_out[19]_i_4_n_0 ;
  wire \reg_out[19]_i_5_n_0 ;
  wire \reg_out[1]_i_2_n_0 ;
  wire \reg_out[1]_i_3_n_0 ;
  wire \reg_out[1]_i_4_n_0 ;
  wire \reg_out[1]_i_5_n_0 ;
  wire \reg_out[20]_i_10_n_0 ;
  wire \reg_out[20]_i_2_n_0 ;
  wire \reg_out[20]_i_3_n_0 ;
  wire \reg_out[20]_i_4_n_0 ;
  wire \reg_out[20]_i_6_n_0 ;
  wire \reg_out[20]_i_7_n_0 ;
  wire \reg_out[20]_i_8_n_0 ;
  wire \reg_out[20]_i_9_n_0 ;
  wire \reg_out[21]_i_2_n_0 ;
  wire \reg_out[21]_i_3_n_0 ;
  wire \reg_out[21]_i_4_n_0 ;
  wire \reg_out[21]_i_5_n_0 ;
  wire \reg_out[22]_i_2_n_0 ;
  wire \reg_out[22]_i_3_n_0 ;
  wire \reg_out[22]_i_4_n_0 ;
  wire \reg_out[22]_i_5_n_0 ;
  wire \reg_out[23]_i_2_n_0 ;
  wire \reg_out[23]_i_3_n_0 ;
  wire \reg_out[23]_i_4_n_0 ;
  wire \reg_out[23]_i_5_n_0 ;
  wire \reg_out[24]_i_10_n_0 ;
  wire \reg_out[24]_i_2_n_0 ;
  wire \reg_out[24]_i_3_n_0 ;
  wire \reg_out[24]_i_4_n_0 ;
  wire \reg_out[24]_i_6_n_0 ;
  wire \reg_out[24]_i_7_n_0 ;
  wire \reg_out[24]_i_8_n_0 ;
  wire \reg_out[24]_i_9_n_0 ;
  wire \reg_out[25]_i_2_n_0 ;
  wire \reg_out[25]_i_3_n_0 ;
  wire \reg_out[25]_i_4_n_0 ;
  wire \reg_out[25]_i_5_n_0 ;
  wire \reg_out[26]_i_2_n_0 ;
  wire \reg_out[26]_i_3_n_0 ;
  wire \reg_out[26]_i_4_n_0 ;
  wire \reg_out[26]_i_5_n_0 ;
  wire \reg_out[27]_i_2_n_0 ;
  wire \reg_out[27]_i_3_n_0 ;
  wire \reg_out[27]_i_4_n_0 ;
  wire \reg_out[27]_i_5_n_0 ;
  wire \reg_out[28]_i_10_n_0 ;
  wire \reg_out[28]_i_2_n_0 ;
  wire \reg_out[28]_i_3_n_0 ;
  wire \reg_out[28]_i_4_n_0 ;
  wire \reg_out[28]_i_6_n_0 ;
  wire \reg_out[28]_i_7_n_0 ;
  wire \reg_out[28]_i_8_n_0 ;
  wire \reg_out[28]_i_9_n_0 ;
  wire \reg_out[29]_i_2_n_0 ;
  wire \reg_out[29]_i_3_n_0 ;
  wire \reg_out[29]_i_4_n_0 ;
  wire \reg_out[29]_i_5_n_0 ;
  wire \reg_out[2]_i_2_n_0 ;
  wire \reg_out[2]_i_3_n_0 ;
  wire \reg_out[2]_i_4_n_0 ;
  wire \reg_out[2]_i_5_n_0 ;
  wire \reg_out[30]_i_2_n_0 ;
  wire \reg_out[30]_i_3_n_0 ;
  wire \reg_out[30]_i_4_n_0 ;
  wire \reg_out[30]_i_5_n_0 ;
  wire \reg_out[31]_i_10_n_0 ;
  wire \reg_out[31]_i_11_n_0 ;
  wire \reg_out[31]_i_12_n_0 ;
  wire \reg_out[31]_i_2_n_0 ;
  wire \reg_out[31]_i_3_n_0 ;
  wire \reg_out[31]_i_4_n_0 ;
  wire \reg_out[31]_i_5_n_0 ;
  wire \reg_out[31]_i_7_n_0 ;
  wire \reg_out[31]_i_8_n_0 ;
  wire \reg_out[31]_i_9_n_0 ;
  wire \reg_out[3]_i_2_n_0 ;
  wire \reg_out[3]_i_3_n_0 ;
  wire \reg_out[3]_i_4_n_0 ;
  wire \reg_out[3]_i_5_n_0 ;
  wire \reg_out[4]_i_10_n_0 ;
  wire \reg_out[4]_i_2_n_0 ;
  wire \reg_out[4]_i_3_n_0 ;
  wire \reg_out[4]_i_5_n_0 ;
  wire \reg_out[4]_i_6_n_0 ;
  wire \reg_out[4]_i_7_n_0 ;
  wire \reg_out[4]_i_8_n_0 ;
  wire \reg_out[4]_i_9_n_0 ;
  wire \reg_out[5]_i_2_n_0 ;
  wire \reg_out[5]_i_3_n_0 ;
  wire \reg_out[5]_i_4_n_0 ;
  wire \reg_out[5]_i_5_n_0 ;
  wire \reg_out[6]_i_2_n_0 ;
  wire \reg_out[6]_i_3_n_0 ;
  wire \reg_out[6]_i_4_n_0 ;
  wire \reg_out[6]_i_5_n_0 ;
  wire \reg_out[6]_i_6_n_0 ;
  wire \reg_out[7]_i_2_n_0 ;
  wire \reg_out[7]_i_5_n_0 ;
  wire \reg_out[8]_i_5_n_0 ;
  wire \reg_out[8]_i_6_n_0 ;
  wire \reg_out[8]_i_7_n_0 ;
  wire \reg_out[8]_i_8_n_0 ;
  wire \reg_out_reg[12]_i_2_n_0 ;
  wire \reg_out_reg[12]_i_2_n_4 ;
  wire \reg_out_reg[12]_i_2_n_5 ;
  wire \reg_out_reg[12]_i_2_n_6 ;
  wire \reg_out_reg[12]_i_2_n_7 ;
  wire \reg_out_reg[14]_i_2_n_0 ;
  wire \reg_out_reg[14]_i_2_n_4 ;
  wire \reg_out_reg[14]_i_2_n_5 ;
  wire \reg_out_reg[14]_i_2_n_6 ;
  wire \reg_out_reg[14]_i_2_n_7 ;
  wire \reg_out_reg[20]_i_5_n_0 ;
  wire \reg_out_reg[20]_i_5_n_4 ;
  wire \reg_out_reg[20]_i_5_n_5 ;
  wire \reg_out_reg[20]_i_5_n_6 ;
  wire \reg_out_reg[20]_i_5_n_7 ;
  wire \reg_out_reg[24]_i_5_n_0 ;
  wire \reg_out_reg[24]_i_5_n_4 ;
  wire \reg_out_reg[24]_i_5_n_5 ;
  wire \reg_out_reg[24]_i_5_n_6 ;
  wire \reg_out_reg[24]_i_5_n_7 ;
  wire \reg_out_reg[28]_i_5_n_0 ;
  wire \reg_out_reg[28]_i_5_n_4 ;
  wire \reg_out_reg[28]_i_5_n_5 ;
  wire \reg_out_reg[28]_i_5_n_6 ;
  wire \reg_out_reg[28]_i_5_n_7 ;
  wire \reg_out_reg[31]_i_6_n_5 ;
  wire \reg_out_reg[31]_i_6_n_6 ;
  wire \reg_out_reg[31]_i_6_n_7 ;
  wire \reg_out_reg[4]_i_4_n_0 ;
  wire \reg_out_reg[4]_i_4_n_4 ;
  wire \reg_out_reg[4]_i_4_n_5 ;
  wire \reg_out_reg[4]_i_4_n_6 ;
  wire \reg_out_reg[4]_i_4_n_7 ;
  wire \reg_out_reg[8]_i_2_n_0 ;
  wire \reg_out_reg[8]_i_2_n_4 ;
  wire \reg_out_reg[8]_i_2_n_5 ;
  wire \reg_out_reg[8]_i_2_n_6 ;
  wire \reg_out_reg[8]_i_2_n_7 ;
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
  wire \reg_sh[0]_i_3_n_0 ;
  wire \reg_sh[0]_i_4_n_0 ;
  wire \reg_sh[1]_i_3_n_0 ;
  wire \reg_sh[2]_i_2_n_0 ;
  wire \reg_sh[2]_i_3_n_0 ;
  wire \reg_sh[2]_i_4_n_0 ;
  wire \reg_sh[3]_i_2_n_0 ;
  wire \reg_sh[3]_i_3_n_0 ;
  wire \reg_sh[3]_i_4_n_0 ;
  wire \reg_sh[4]_i_2_n_0 ;
  wire \reg_sh[4]_i_3_n_0 ;
  wire \reg_sh[4]_i_4_n_0 ;
  wire \reg_sh[4]_i_5_n_0 ;
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
  wire [3:0]\NLW_alu_out_q_reg[15]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_alu_out_q_reg[19]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_alu_out_q_reg[23]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_alu_out_q_reg[27]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_alu_out_q_reg[3]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_alu_out_q_reg[7]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_cycle_reg[0]_i_1_CO_UNCONNECTED ;
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
  wire [3:0]\NLW_count_cycle_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_instr_reg[0]_i_2_CO_UNCONNECTED ;
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
  wire [3:0]\NLW_count_instr_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_cpuregs_reg_r1_0_31_0_5_i_10_CO_UNCONNECTED;
  wire [3:0]NLW_cpuregs_reg_r1_0_31_0_5_i_10_O_UNCONNECTED;
  wire [3:0]NLW_cpuregs_reg_r1_0_31_0_5_i_11_CO_UNCONNECTED;
  wire [3:0]NLW_cpuregs_reg_r1_0_31_12_17_i_7_CO_UNCONNECTED;
  wire [3:0]NLW_cpuregs_reg_r1_0_31_12_17_i_8_CO_UNCONNECTED;
  wire [3:0]NLW_cpuregs_reg_r1_0_31_18_23_i_7_CO_UNCONNECTED;
  wire [3:0]NLW_cpuregs_reg_r1_0_31_24_29_i_7_CO_UNCONNECTED;
  wire [3:0]NLW_cpuregs_reg_r1_0_31_6_11_i_7_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_18_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_22_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_31_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_40_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_45_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_5_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_54_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_67_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_7_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_8_CO_UNCONNECTED;
  wire [3:0]NLW_decoder_trigger_reg_i_9_CO_UNCONNECTED;
  wire [3:0]\NLW_reg_next_pc_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_next_pc_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_next_pc_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_next_pc_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_next_pc_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_next_pc_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_next_pc_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_op1_reg[11]_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_op1_reg[15]_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_op1_reg[19]_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_op1_reg[23]_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_op1_reg[27]_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_op1_reg[3]_i_4_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_op1_reg[7]_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_out_reg[12]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_out_reg[14]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_out_reg[20]_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_out_reg[24]_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_out_reg[28]_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_out_reg[4]_i_4_CO_UNCONNECTED ;
  wire [3:0]\NLW_reg_out_reg[8]_i_2_CO_UNCONNECTED ;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT6 #(
    .INIT(64'hFF88FF88F8F88888)) 
    \alu_out_q[0]_i_1 
       (.I0(\alu_out_q[31]_i_4_n_0 ),
        .I1(\alu_out_q[0]_i_2_n_0 ),
        .I2(alu_out_0),
        .I3(\alu_out_q_reg[3]_i_2_n_7 ),
        .I4(is_compare),
        .I5(is_lui_auipc_jal_jalr_addi_add_sub),
        .O(\alu_out_q[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[0]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[0]),
        .I5(pcpi_rs1_OBUF[0]),
        .O(\alu_out_q[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[10]_i_1 
       (.I0(\alu_out_q_reg[11]_i_2_n_5 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[10]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[10]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[10]),
        .I5(pcpi_rs1_OBUF[10]),
        .O(\alu_out_q[10]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[11]_i_1 
       (.I0(\alu_out_q_reg[11]_i_2_n_4 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[11]_i_3_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[11]_i_3 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[11]),
        .I5(pcpi_rs1_OBUF[11]),
        .O(\alu_out_q[11]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[11]_i_4 
       (.I0(pcpi_rs2_OBUF[11]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[11]),
        .O(\alu_out_q[11]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[11]_i_5 
       (.I0(pcpi_rs2_OBUF[10]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[10]),
        .O(\alu_out_q[11]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[11]_i_6 
       (.I0(pcpi_rs2_OBUF[9]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[9]),
        .O(\alu_out_q[11]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[11]_i_7 
       (.I0(pcpi_rs2_OBUF[8]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[8]),
        .O(\alu_out_q[11]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[12]_i_1 
       (.I0(\alu_out_q_reg[15]_i_2_n_7 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[12]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[12]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[12]),
        .I5(pcpi_rs1_OBUF[12]),
        .O(\alu_out_q[12]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[13]_i_1 
       (.I0(\alu_out_q_reg[15]_i_2_n_6 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[13]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[13]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[13]),
        .I5(pcpi_rs1_OBUF[13]),
        .O(\alu_out_q[13]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[14]_i_1 
       (.I0(\alu_out_q_reg[15]_i_2_n_5 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[14]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[14]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[14]),
        .I5(pcpi_rs1_OBUF[14]),
        .O(\alu_out_q[14]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[15]_i_1 
       (.I0(\alu_out_q_reg[15]_i_2_n_4 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[15]_i_3_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[15]_i_3 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[15]),
        .I5(pcpi_rs1_OBUF[15]),
        .O(\alu_out_q[15]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[15]_i_4 
       (.I0(pcpi_rs2_OBUF[15]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[15]),
        .O(\alu_out_q[15]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[15]_i_5 
       (.I0(pcpi_rs2_OBUF[14]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[14]),
        .O(\alu_out_q[15]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[15]_i_6 
       (.I0(pcpi_rs2_OBUF[13]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[13]),
        .O(\alu_out_q[15]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[15]_i_7 
       (.I0(pcpi_rs2_OBUF[12]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[12]),
        .O(\alu_out_q[15]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[16]_i_1 
       (.I0(\alu_out_q_reg[19]_i_2_n_7 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[16]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[16]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[16]),
        .I5(pcpi_rs1_OBUF[16]),
        .O(\alu_out_q[16]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[17]_i_1 
       (.I0(\alu_out_q_reg[19]_i_2_n_6 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[17]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[17]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[17]),
        .I5(pcpi_rs1_OBUF[17]),
        .O(\alu_out_q[17]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[18]_i_1 
       (.I0(\alu_out_q_reg[19]_i_2_n_5 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[18]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[18]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[18]),
        .I5(pcpi_rs1_OBUF[18]),
        .O(\alu_out_q[18]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[19]_i_1 
       (.I0(\alu_out_q_reg[19]_i_2_n_4 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[19]_i_3_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[19]_i_3 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[19]),
        .I5(pcpi_rs1_OBUF[19]),
        .O(\alu_out_q[19]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[19]_i_4 
       (.I0(pcpi_rs2_OBUF[19]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[19]),
        .O(\alu_out_q[19]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[19]_i_5 
       (.I0(pcpi_rs2_OBUF[18]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[18]),
        .O(\alu_out_q[19]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[19]_i_6 
       (.I0(pcpi_rs2_OBUF[17]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[17]),
        .O(\alu_out_q[19]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[19]_i_7 
       (.I0(pcpi_rs2_OBUF[16]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[16]),
        .O(\alu_out_q[19]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[1]_i_1 
       (.I0(\alu_out_q_reg[3]_i_2_n_6 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[1]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[1]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[1]),
        .I5(pcpi_rs1_OBUF[1]),
        .O(\alu_out_q[1]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[20]_i_1 
       (.I0(\alu_out_q_reg[23]_i_2_n_7 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[20]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[20]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[20]),
        .I5(pcpi_rs1_OBUF[20]),
        .O(\alu_out_q[20]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[21]_i_1 
       (.I0(\alu_out_q_reg[23]_i_2_n_6 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[21]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[21]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[21]),
        .I5(pcpi_rs1_OBUF[21]),
        .O(\alu_out_q[21]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[22]_i_1 
       (.I0(\alu_out_q_reg[23]_i_2_n_5 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[22]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[22]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[22]),
        .I5(pcpi_rs1_OBUF[22]),
        .O(\alu_out_q[22]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[23]_i_1 
       (.I0(\alu_out_q_reg[23]_i_2_n_4 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[23]_i_3_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[23]_i_3 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[23]),
        .I5(pcpi_rs1_OBUF[23]),
        .O(\alu_out_q[23]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[23]_i_4 
       (.I0(pcpi_rs2_OBUF[23]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[23]),
        .O(\alu_out_q[23]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[23]_i_5 
       (.I0(pcpi_rs2_OBUF[22]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[22]),
        .O(\alu_out_q[23]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[23]_i_6 
       (.I0(pcpi_rs2_OBUF[21]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[21]),
        .O(\alu_out_q[23]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[23]_i_7 
       (.I0(pcpi_rs2_OBUF[20]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[20]),
        .O(\alu_out_q[23]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[24]_i_1 
       (.I0(\alu_out_q_reg[27]_i_2_n_7 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[24]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[24]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[24]),
        .I5(pcpi_rs1_OBUF[24]),
        .O(\alu_out_q[24]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[25]_i_1 
       (.I0(\alu_out_q_reg[27]_i_2_n_6 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[25]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[25]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[25]),
        .I5(pcpi_rs1_OBUF[25]),
        .O(\alu_out_q[25]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[26]_i_1 
       (.I0(\alu_out_q_reg[27]_i_2_n_5 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[26]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[26]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[26]),
        .I5(pcpi_rs1_OBUF[26]),
        .O(\alu_out_q[26]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[27]_i_1 
       (.I0(\alu_out_q_reg[27]_i_2_n_4 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[27]_i_3_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[27]_i_3 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[27]),
        .I5(pcpi_rs1_OBUF[27]),
        .O(\alu_out_q[27]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[27]_i_4 
       (.I0(pcpi_rs2_OBUF[27]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[27]),
        .O(\alu_out_q[27]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[27]_i_5 
       (.I0(pcpi_rs2_OBUF[26]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[26]),
        .O(\alu_out_q[27]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[27]_i_6 
       (.I0(pcpi_rs2_OBUF[25]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[25]),
        .O(\alu_out_q[27]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[27]_i_7 
       (.I0(pcpi_rs2_OBUF[24]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[24]),
        .O(\alu_out_q[27]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[28]_i_1 
       (.I0(\alu_out_q_reg[31]_i_2_n_7 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[28]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[28]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[28]),
        .I5(pcpi_rs1_OBUF[28]),
        .O(\alu_out_q[28]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[29]_i_1 
       (.I0(\alu_out_q_reg[31]_i_2_n_6 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[29]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[29]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[29]),
        .I5(pcpi_rs1_OBUF[29]),
        .O(\alu_out_q[29]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[2]_i_1 
       (.I0(\alu_out_q_reg[3]_i_2_n_5 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[2]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[2]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[2]),
        .I5(pcpi_rs1_OBUF[2]),
        .O(\alu_out_q[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[30]_i_1 
       (.I0(\alu_out_q_reg[31]_i_2_n_5 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[30]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[30]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[30]),
        .I5(pcpi_rs1_OBUF[30]),
        .O(\alu_out_q[30]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[31]_i_1 
       (.I0(\alu_out_q_reg[31]_i_2_n_4 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[31]_i_3_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[31]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \alu_out_q[31]_i_10 
       (.I0(instr_xori),
        .I1(instr_xor),
        .O(alu_out_q24_out));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[31]_i_3 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[31]),
        .I5(pcpi_rs1_OBUF[31]),
        .O(\alu_out_q[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000FFFE)) 
    \alu_out_q[31]_i_4 
       (.I0(instr_andi),
        .I1(instr_and),
        .I2(alu_out_q24_out),
        .I3(alu_out_q23_out),
        .I4(is_lui_auipc_jal_jalr_addi_add_sub),
        .I5(is_compare),
        .O(\alu_out_q[31]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[31]_i_5 
       (.I0(pcpi_rs2_OBUF[31]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[31]),
        .O(\alu_out_q[31]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[31]_i_6 
       (.I0(pcpi_rs2_OBUF[30]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[30]),
        .O(\alu_out_q[31]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[31]_i_7 
       (.I0(pcpi_rs2_OBUF[29]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[29]),
        .O(\alu_out_q[31]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[31]_i_8 
       (.I0(pcpi_rs2_OBUF[28]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[28]),
        .O(\alu_out_q[31]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \alu_out_q[31]_i_9 
       (.I0(instr_ori),
        .I1(instr_or),
        .O(alu_out_q23_out));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[3]_i_1 
       (.I0(\alu_out_q_reg[3]_i_2_n_4 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[3]_i_3_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[3]_i_3 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[3]),
        .I5(pcpi_rs1_OBUF[3]),
        .O(\alu_out_q[3]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[3]_i_4 
       (.I0(pcpi_rs2_OBUF[3]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[3]),
        .O(\alu_out_q[3]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[3]_i_5 
       (.I0(pcpi_rs2_OBUF[2]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[2]),
        .O(\alu_out_q[3]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[3]_i_6 
       (.I0(pcpi_rs2_OBUF[1]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[1]),
        .O(\alu_out_q[3]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[4]_i_1 
       (.I0(\alu_out_q_reg[7]_i_2_n_7 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[4]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[4]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[4]),
        .I5(pcpi_rs1_OBUF[4]),
        .O(\alu_out_q[4]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[5]_i_1 
       (.I0(\alu_out_q_reg[7]_i_2_n_6 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[5]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[5]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[5]),
        .I5(pcpi_rs1_OBUF[5]),
        .O(\alu_out_q[5]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[6]_i_1 
       (.I0(\alu_out_q_reg[7]_i_2_n_5 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[6]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[6]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[6]),
        .I5(pcpi_rs1_OBUF[6]),
        .O(\alu_out_q[6]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[7]_i_1 
       (.I0(\alu_out_q_reg[7]_i_2_n_4 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[7]_i_3_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[7]_i_3 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[7]),
        .I5(pcpi_rs1_OBUF[7]),
        .O(\alu_out_q[7]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[7]_i_4 
       (.I0(pcpi_rs2_OBUF[7]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[7]),
        .O(\alu_out_q[7]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[7]_i_5 
       (.I0(pcpi_rs2_OBUF[6]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[6]),
        .O(\alu_out_q[7]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[7]_i_6 
       (.I0(pcpi_rs2_OBUF[5]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[5]),
        .O(\alu_out_q[7]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \alu_out_q[7]_i_7 
       (.I0(pcpi_rs2_OBUF[4]),
        .I1(instr_sub),
        .I2(pcpi_rs1_OBUF[4]),
        .O(\alu_out_q[7]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[8]_i_1 
       (.I0(\alu_out_q_reg[11]_i_2_n_7 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[8]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[8]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[8]),
        .I5(pcpi_rs1_OBUF[8]),
        .O(\alu_out_q[8]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \alu_out_q[9]_i_1 
       (.I0(\alu_out_q_reg[11]_i_2_n_6 ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub),
        .I2(\alu_out_q[9]_i_2_n_0 ),
        .I3(\alu_out_q[31]_i_4_n_0 ),
        .O(\alu_out_q[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FEFFF0FFF00000)) 
    \alu_out_q[9]_i_2 
       (.I0(instr_and),
        .I1(instr_andi),
        .I2(alu_out_q23_out),
        .I3(alu_out_q24_out),
        .I4(pcpi_rs2_OBUF[9]),
        .I5(pcpi_rs1_OBUF[9]),
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[11]_i_2 
       (.CI(\alu_out_q_reg[7]_i_2_n_0 ),
        .CO({\alu_out_q_reg[11]_i_2_n_0 ,\NLW_alu_out_q_reg[11]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[11:8]),
        .O({\alu_out_q_reg[11]_i_2_n_4 ,\alu_out_q_reg[11]_i_2_n_5 ,\alu_out_q_reg[11]_i_2_n_6 ,\alu_out_q_reg[11]_i_2_n_7 }),
        .S({\alu_out_q[11]_i_4_n_0 ,\alu_out_q[11]_i_5_n_0 ,\alu_out_q[11]_i_6_n_0 ,\alu_out_q[11]_i_7_n_0 }));
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[15]_i_2 
       (.CI(\alu_out_q_reg[11]_i_2_n_0 ),
        .CO({\alu_out_q_reg[15]_i_2_n_0 ,\NLW_alu_out_q_reg[15]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[15:12]),
        .O({\alu_out_q_reg[15]_i_2_n_4 ,\alu_out_q_reg[15]_i_2_n_5 ,\alu_out_q_reg[15]_i_2_n_6 ,\alu_out_q_reg[15]_i_2_n_7 }),
        .S({\alu_out_q[15]_i_4_n_0 ,\alu_out_q[15]_i_5_n_0 ,\alu_out_q[15]_i_6_n_0 ,\alu_out_q[15]_i_7_n_0 }));
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[19]_i_2 
       (.CI(\alu_out_q_reg[15]_i_2_n_0 ),
        .CO({\alu_out_q_reg[19]_i_2_n_0 ,\NLW_alu_out_q_reg[19]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[19:16]),
        .O({\alu_out_q_reg[19]_i_2_n_4 ,\alu_out_q_reg[19]_i_2_n_5 ,\alu_out_q_reg[19]_i_2_n_6 ,\alu_out_q_reg[19]_i_2_n_7 }),
        .S({\alu_out_q[19]_i_4_n_0 ,\alu_out_q[19]_i_5_n_0 ,\alu_out_q[19]_i_6_n_0 ,\alu_out_q[19]_i_7_n_0 }));
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[23]_i_2 
       (.CI(\alu_out_q_reg[19]_i_2_n_0 ),
        .CO({\alu_out_q_reg[23]_i_2_n_0 ,\NLW_alu_out_q_reg[23]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[23:20]),
        .O({\alu_out_q_reg[23]_i_2_n_4 ,\alu_out_q_reg[23]_i_2_n_5 ,\alu_out_q_reg[23]_i_2_n_6 ,\alu_out_q_reg[23]_i_2_n_7 }),
        .S({\alu_out_q[23]_i_4_n_0 ,\alu_out_q[23]_i_5_n_0 ,\alu_out_q[23]_i_6_n_0 ,\alu_out_q[23]_i_7_n_0 }));
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[27]_i_2 
       (.CI(\alu_out_q_reg[23]_i_2_n_0 ),
        .CO({\alu_out_q_reg[27]_i_2_n_0 ,\NLW_alu_out_q_reg[27]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[27:24]),
        .O({\alu_out_q_reg[27]_i_2_n_4 ,\alu_out_q_reg[27]_i_2_n_5 ,\alu_out_q_reg[27]_i_2_n_6 ,\alu_out_q_reg[27]_i_2_n_7 }),
        .S({\alu_out_q[27]_i_4_n_0 ,\alu_out_q[27]_i_5_n_0 ,\alu_out_q[27]_i_6_n_0 ,\alu_out_q[27]_i_7_n_0 }));
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[31]_i_2 
       (.CI(\alu_out_q_reg[27]_i_2_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,pcpi_rs1_OBUF[30:28]}),
        .O({\alu_out_q_reg[31]_i_2_n_4 ,\alu_out_q_reg[31]_i_2_n_5 ,\alu_out_q_reg[31]_i_2_n_6 ,\alu_out_q_reg[31]_i_2_n_7 }),
        .S({\alu_out_q[31]_i_5_n_0 ,\alu_out_q[31]_i_6_n_0 ,\alu_out_q[31]_i_7_n_0 ,\alu_out_q[31]_i_8_n_0 }));
  FDRE \alu_out_q_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\alu_out_q[3]_i_1_n_0 ),
        .Q(alu_out_q[3]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "PROPCONST POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[3]_i_2 
       (.CI(\<const0> ),
        .CO({\alu_out_q_reg[3]_i_2_n_0 ,\NLW_alu_out_q_reg[3]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(pcpi_rs1_OBUF[0]),
        .DI({pcpi_rs1_OBUF[3:1],instr_sub}),
        .O({\alu_out_q_reg[3]_i_2_n_4 ,\alu_out_q_reg[3]_i_2_n_5 ,\alu_out_q_reg[3]_i_2_n_6 ,\alu_out_q_reg[3]_i_2_n_7 }),
        .S({\alu_out_q[3]_i_4_n_0 ,\alu_out_q[3]_i_5_n_0 ,\alu_out_q[3]_i_6_n_0 ,pcpi_rs2_OBUF[0]}));
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \alu_out_q_reg[7]_i_2 
       (.CI(\alu_out_q_reg[3]_i_2_n_0 ),
        .CO({\alu_out_q_reg[7]_i_2_n_0 ,\NLW_alu_out_q_reg[7]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[7:4]),
        .O({\alu_out_q_reg[7]_i_2_n_4 ,\alu_out_q_reg[7]_i_2_n_5 ,\alu_out_q_reg[7]_i_2_n_6 ,\alu_out_q_reg[7]_i_2_n_7 }),
        .S({\alu_out_q[7]_i_4_n_0 ,\alu_out_q[7]_i_5_n_0 ,\alu_out_q[7]_i_6_n_0 ,\alu_out_q[7]_i_7_n_0 }));
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
    \count_cycle[0]_i_2 
       (.I0(count_cycle_reg[0]),
        .O(\count_cycle[0]_i_2_n_0 ));
  FDRE \count_cycle_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[0]_i_1_n_7 ),
        .Q(count_cycle_reg[0]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[0]_i_1 
       (.CI(\<const0> ),
        .CO({\count_cycle_reg[0]_i_1_n_0 ,\NLW_count_cycle_reg[0]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const1> }),
        .O({\count_cycle_reg[0]_i_1_n_4 ,\count_cycle_reg[0]_i_1_n_5 ,\count_cycle_reg[0]_i_1_n_6 ,\count_cycle_reg[0]_i_1_n_7 }),
        .S({count_cycle_reg[3:1],\count_cycle[0]_i_2_n_0 }));
  FDRE \count_cycle_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[8]_i_1_n_5 ),
        .Q(count_cycle_reg[10]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[8]_i_1_n_4 ),
        .Q(count_cycle_reg[11]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[12]_i_1_n_7 ),
        .Q(count_cycle_reg[12]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[12]_i_1 
       (.CI(\count_cycle_reg[8]_i_1_n_0 ),
        .CO({\count_cycle_reg[12]_i_1_n_0 ,\NLW_count_cycle_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[12]_i_1_n_4 ,\count_cycle_reg[12]_i_1_n_5 ,\count_cycle_reg[12]_i_1_n_6 ,\count_cycle_reg[12]_i_1_n_7 }),
        .S(count_cycle_reg[15:12]));
  FDRE \count_cycle_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[12]_i_1_n_6 ),
        .Q(count_cycle_reg[13]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[12]_i_1_n_5 ),
        .Q(count_cycle_reg[14]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[12]_i_1_n_4 ),
        .Q(count_cycle_reg[15]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[16]_i_1_n_7 ),
        .Q(count_cycle_reg[16]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[16]_i_1 
       (.CI(\count_cycle_reg[12]_i_1_n_0 ),
        .CO({\count_cycle_reg[16]_i_1_n_0 ,\NLW_count_cycle_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[16]_i_1_n_4 ,\count_cycle_reg[16]_i_1_n_5 ,\count_cycle_reg[16]_i_1_n_6 ,\count_cycle_reg[16]_i_1_n_7 }),
        .S(count_cycle_reg[19:16]));
  FDRE \count_cycle_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[16]_i_1_n_6 ),
        .Q(count_cycle_reg[17]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[16]_i_1_n_5 ),
        .Q(count_cycle_reg[18]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[16]_i_1_n_4 ),
        .Q(count_cycle_reg[19]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[0]_i_1_n_6 ),
        .Q(count_cycle_reg[1]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[20]_i_1_n_7 ),
        .Q(count_cycle_reg[20]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[20]_i_1 
       (.CI(\count_cycle_reg[16]_i_1_n_0 ),
        .CO({\count_cycle_reg[20]_i_1_n_0 ,\NLW_count_cycle_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[20]_i_1_n_4 ,\count_cycle_reg[20]_i_1_n_5 ,\count_cycle_reg[20]_i_1_n_6 ,\count_cycle_reg[20]_i_1_n_7 }),
        .S(count_cycle_reg[23:20]));
  FDRE \count_cycle_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[20]_i_1_n_6 ),
        .Q(count_cycle_reg[21]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[20]_i_1_n_5 ),
        .Q(count_cycle_reg[22]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[20]_i_1_n_4 ),
        .Q(count_cycle_reg[23]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[24]_i_1_n_7 ),
        .Q(count_cycle_reg[24]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[24]_i_1 
       (.CI(\count_cycle_reg[20]_i_1_n_0 ),
        .CO({\count_cycle_reg[24]_i_1_n_0 ,\NLW_count_cycle_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[24]_i_1_n_4 ,\count_cycle_reg[24]_i_1_n_5 ,\count_cycle_reg[24]_i_1_n_6 ,\count_cycle_reg[24]_i_1_n_7 }),
        .S(count_cycle_reg[27:24]));
  FDRE \count_cycle_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[24]_i_1_n_6 ),
        .Q(count_cycle_reg[25]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[24]_i_1_n_5 ),
        .Q(count_cycle_reg[26]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[24]_i_1_n_4 ),
        .Q(count_cycle_reg[27]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[28]_i_1_n_7 ),
        .Q(count_cycle_reg[28]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[28]_i_1 
       (.CI(\count_cycle_reg[24]_i_1_n_0 ),
        .CO({\count_cycle_reg[28]_i_1_n_0 ,\NLW_count_cycle_reg[28]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[28]_i_1_n_4 ,\count_cycle_reg[28]_i_1_n_5 ,\count_cycle_reg[28]_i_1_n_6 ,\count_cycle_reg[28]_i_1_n_7 }),
        .S(count_cycle_reg[31:28]));
  FDRE \count_cycle_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[28]_i_1_n_6 ),
        .Q(count_cycle_reg[29]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[0]_i_1_n_5 ),
        .Q(count_cycle_reg[2]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[28]_i_1_n_5 ),
        .Q(count_cycle_reg[30]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[28]_i_1_n_4 ),
        .Q(count_cycle_reg[31]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[32] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[32]_i_1_n_7 ),
        .Q(count_cycle_reg[32]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[32]_i_1 
       (.CI(\count_cycle_reg[28]_i_1_n_0 ),
        .CO({\count_cycle_reg[32]_i_1_n_0 ,\NLW_count_cycle_reg[32]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[32]_i_1_n_4 ,\count_cycle_reg[32]_i_1_n_5 ,\count_cycle_reg[32]_i_1_n_6 ,\count_cycle_reg[32]_i_1_n_7 }),
        .S(count_cycle_reg[35:32]));
  FDRE \count_cycle_reg[33] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[32]_i_1_n_6 ),
        .Q(count_cycle_reg[33]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[34] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[32]_i_1_n_5 ),
        .Q(count_cycle_reg[34]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[35] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[32]_i_1_n_4 ),
        .Q(count_cycle_reg[35]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[36] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[36]_i_1_n_7 ),
        .Q(count_cycle_reg[36]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[36]_i_1 
       (.CI(\count_cycle_reg[32]_i_1_n_0 ),
        .CO({\count_cycle_reg[36]_i_1_n_0 ,\NLW_count_cycle_reg[36]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[36]_i_1_n_4 ,\count_cycle_reg[36]_i_1_n_5 ,\count_cycle_reg[36]_i_1_n_6 ,\count_cycle_reg[36]_i_1_n_7 }),
        .S(count_cycle_reg[39:36]));
  FDRE \count_cycle_reg[37] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[36]_i_1_n_6 ),
        .Q(count_cycle_reg[37]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[38] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[36]_i_1_n_5 ),
        .Q(count_cycle_reg[38]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[39] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[36]_i_1_n_4 ),
        .Q(count_cycle_reg[39]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[0]_i_1_n_4 ),
        .Q(count_cycle_reg[3]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[40] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[40]_i_1_n_7 ),
        .Q(count_cycle_reg[40]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[40]_i_1 
       (.CI(\count_cycle_reg[36]_i_1_n_0 ),
        .CO({\count_cycle_reg[40]_i_1_n_0 ,\NLW_count_cycle_reg[40]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[40]_i_1_n_4 ,\count_cycle_reg[40]_i_1_n_5 ,\count_cycle_reg[40]_i_1_n_6 ,\count_cycle_reg[40]_i_1_n_7 }),
        .S(count_cycle_reg[43:40]));
  FDRE \count_cycle_reg[41] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[40]_i_1_n_6 ),
        .Q(count_cycle_reg[41]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[42] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[40]_i_1_n_5 ),
        .Q(count_cycle_reg[42]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[43] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[40]_i_1_n_4 ),
        .Q(count_cycle_reg[43]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[44] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[44]_i_1_n_7 ),
        .Q(count_cycle_reg[44]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[44]_i_1 
       (.CI(\count_cycle_reg[40]_i_1_n_0 ),
        .CO({\count_cycle_reg[44]_i_1_n_0 ,\NLW_count_cycle_reg[44]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[44]_i_1_n_4 ,\count_cycle_reg[44]_i_1_n_5 ,\count_cycle_reg[44]_i_1_n_6 ,\count_cycle_reg[44]_i_1_n_7 }),
        .S(count_cycle_reg[47:44]));
  FDRE \count_cycle_reg[45] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[44]_i_1_n_6 ),
        .Q(count_cycle_reg[45]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[46] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[44]_i_1_n_5 ),
        .Q(count_cycle_reg[46]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[47] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[44]_i_1_n_4 ),
        .Q(count_cycle_reg[47]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[48] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[48]_i_1_n_7 ),
        .Q(count_cycle_reg[48]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[48]_i_1 
       (.CI(\count_cycle_reg[44]_i_1_n_0 ),
        .CO({\count_cycle_reg[48]_i_1_n_0 ,\NLW_count_cycle_reg[48]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[48]_i_1_n_4 ,\count_cycle_reg[48]_i_1_n_5 ,\count_cycle_reg[48]_i_1_n_6 ,\count_cycle_reg[48]_i_1_n_7 }),
        .S(count_cycle_reg[51:48]));
  FDRE \count_cycle_reg[49] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[48]_i_1_n_6 ),
        .Q(count_cycle_reg[49]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[4]_i_1_n_7 ),
        .Q(count_cycle_reg[4]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[4]_i_1 
       (.CI(\count_cycle_reg[0]_i_1_n_0 ),
        .CO({\count_cycle_reg[4]_i_1_n_0 ,\NLW_count_cycle_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[4]_i_1_n_4 ,\count_cycle_reg[4]_i_1_n_5 ,\count_cycle_reg[4]_i_1_n_6 ,\count_cycle_reg[4]_i_1_n_7 }),
        .S(count_cycle_reg[7:4]));
  FDRE \count_cycle_reg[50] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[48]_i_1_n_5 ),
        .Q(count_cycle_reg[50]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[51] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[48]_i_1_n_4 ),
        .Q(count_cycle_reg[51]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[52] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[52]_i_1_n_7 ),
        .Q(count_cycle_reg[52]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[52]_i_1 
       (.CI(\count_cycle_reg[48]_i_1_n_0 ),
        .CO({\count_cycle_reg[52]_i_1_n_0 ,\NLW_count_cycle_reg[52]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[52]_i_1_n_4 ,\count_cycle_reg[52]_i_1_n_5 ,\count_cycle_reg[52]_i_1_n_6 ,\count_cycle_reg[52]_i_1_n_7 }),
        .S(count_cycle_reg[55:52]));
  FDRE \count_cycle_reg[53] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[52]_i_1_n_6 ),
        .Q(count_cycle_reg[53]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[54] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[52]_i_1_n_5 ),
        .Q(count_cycle_reg[54]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[55] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[52]_i_1_n_4 ),
        .Q(count_cycle_reg[55]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[56] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[56]_i_1_n_7 ),
        .Q(count_cycle_reg[56]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[56]_i_1 
       (.CI(\count_cycle_reg[52]_i_1_n_0 ),
        .CO({\count_cycle_reg[56]_i_1_n_0 ,\NLW_count_cycle_reg[56]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[56]_i_1_n_4 ,\count_cycle_reg[56]_i_1_n_5 ,\count_cycle_reg[56]_i_1_n_6 ,\count_cycle_reg[56]_i_1_n_7 }),
        .S(count_cycle_reg[59:56]));
  FDRE \count_cycle_reg[57] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[56]_i_1_n_6 ),
        .Q(count_cycle_reg[57]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[58] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[56]_i_1_n_5 ),
        .Q(count_cycle_reg[58]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[59] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[56]_i_1_n_4 ),
        .Q(count_cycle_reg[59]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[4]_i_1_n_6 ),
        .Q(count_cycle_reg[5]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[60] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[60]_i_1_n_7 ),
        .Q(count_cycle_reg[60]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[60]_i_1 
       (.CI(\count_cycle_reg[56]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[60]_i_1_n_4 ,\count_cycle_reg[60]_i_1_n_5 ,\count_cycle_reg[60]_i_1_n_6 ,\count_cycle_reg[60]_i_1_n_7 }),
        .S(count_cycle_reg[63:60]));
  FDRE \count_cycle_reg[61] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[60]_i_1_n_6 ),
        .Q(count_cycle_reg[61]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[62] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[60]_i_1_n_5 ),
        .Q(count_cycle_reg[62]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[63] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[60]_i_1_n_4 ),
        .Q(count_cycle_reg[63]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[4]_i_1_n_5 ),
        .Q(count_cycle_reg[6]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[4]_i_1_n_4 ),
        .Q(count_cycle_reg[7]),
        .R(instr_and_i_1_n_0));
  FDRE \count_cycle_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[8]_i_1_n_7 ),
        .Q(count_cycle_reg[8]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_cycle_reg[8]_i_1 
       (.CI(\count_cycle_reg[4]_i_1_n_0 ),
        .CO({\count_cycle_reg[8]_i_1_n_0 ,\NLW_count_cycle_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_cycle_reg[8]_i_1_n_4 ,\count_cycle_reg[8]_i_1_n_5 ,\count_cycle_reg[8]_i_1_n_6 ,\count_cycle_reg[8]_i_1_n_7 }),
        .S(count_cycle_reg[11:8]));
  FDRE \count_cycle_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\count_cycle_reg[8]_i_1_n_6 ),
        .Q(count_cycle_reg[9]),
        .R(instr_and_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    \count_instr[0]_i_1 
       (.I0(reg_next_pc),
        .I1(decoder_trigger_reg_n_0),
        .O(count_instr));
  LUT1 #(
    .INIT(2'h1)) 
    \count_instr[0]_i_3 
       (.I0(count_instr_reg[0]),
        .O(\count_instr[0]_i_3_n_0 ));
  FDRE \count_instr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[0]_i_2_n_7 ),
        .Q(count_instr_reg[0]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[0]_i_2 
       (.CI(\<const0> ),
        .CO({\count_instr_reg[0]_i_2_n_0 ,\NLW_count_instr_reg[0]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const1> }),
        .O({\count_instr_reg[0]_i_2_n_4 ,\count_instr_reg[0]_i_2_n_5 ,\count_instr_reg[0]_i_2_n_6 ,\count_instr_reg[0]_i_2_n_7 }),
        .S({count_instr_reg[3:1],\count_instr[0]_i_3_n_0 }));
  FDRE \count_instr_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[8]_i_1_n_5 ),
        .Q(count_instr_reg[10]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[8]_i_1_n_4 ),
        .Q(count_instr_reg[11]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[12]_i_1_n_7 ),
        .Q(count_instr_reg[12]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[12]_i_1 
       (.CI(\count_instr_reg[8]_i_1_n_0 ),
        .CO({\count_instr_reg[12]_i_1_n_0 ,\NLW_count_instr_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[12]_i_1_n_4 ,\count_instr_reg[12]_i_1_n_5 ,\count_instr_reg[12]_i_1_n_6 ,\count_instr_reg[12]_i_1_n_7 }),
        .S(count_instr_reg[15:12]));
  FDRE \count_instr_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[12]_i_1_n_6 ),
        .Q(count_instr_reg[13]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[12]_i_1_n_5 ),
        .Q(count_instr_reg[14]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[12]_i_1_n_4 ),
        .Q(count_instr_reg[15]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[16]_i_1_n_7 ),
        .Q(count_instr_reg[16]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[16]_i_1 
       (.CI(\count_instr_reg[12]_i_1_n_0 ),
        .CO({\count_instr_reg[16]_i_1_n_0 ,\NLW_count_instr_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[16]_i_1_n_4 ,\count_instr_reg[16]_i_1_n_5 ,\count_instr_reg[16]_i_1_n_6 ,\count_instr_reg[16]_i_1_n_7 }),
        .S(count_instr_reg[19:16]));
  FDRE \count_instr_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[16]_i_1_n_6 ),
        .Q(count_instr_reg[17]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[16]_i_1_n_5 ),
        .Q(count_instr_reg[18]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[16]_i_1_n_4 ),
        .Q(count_instr_reg[19]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[0]_i_2_n_6 ),
        .Q(count_instr_reg[1]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[20]_i_1_n_7 ),
        .Q(count_instr_reg[20]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[20]_i_1 
       (.CI(\count_instr_reg[16]_i_1_n_0 ),
        .CO({\count_instr_reg[20]_i_1_n_0 ,\NLW_count_instr_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[20]_i_1_n_4 ,\count_instr_reg[20]_i_1_n_5 ,\count_instr_reg[20]_i_1_n_6 ,\count_instr_reg[20]_i_1_n_7 }),
        .S(count_instr_reg[23:20]));
  FDRE \count_instr_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[20]_i_1_n_6 ),
        .Q(count_instr_reg[21]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[20]_i_1_n_5 ),
        .Q(count_instr_reg[22]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[20]_i_1_n_4 ),
        .Q(count_instr_reg[23]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[24]_i_1_n_7 ),
        .Q(count_instr_reg[24]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[24]_i_1 
       (.CI(\count_instr_reg[20]_i_1_n_0 ),
        .CO({\count_instr_reg[24]_i_1_n_0 ,\NLW_count_instr_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[24]_i_1_n_4 ,\count_instr_reg[24]_i_1_n_5 ,\count_instr_reg[24]_i_1_n_6 ,\count_instr_reg[24]_i_1_n_7 }),
        .S(count_instr_reg[27:24]));
  FDRE \count_instr_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[24]_i_1_n_6 ),
        .Q(count_instr_reg[25]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[24]_i_1_n_5 ),
        .Q(count_instr_reg[26]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[24]_i_1_n_4 ),
        .Q(count_instr_reg[27]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[28]_i_1_n_7 ),
        .Q(count_instr_reg[28]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[28]_i_1 
       (.CI(\count_instr_reg[24]_i_1_n_0 ),
        .CO({\count_instr_reg[28]_i_1_n_0 ,\NLW_count_instr_reg[28]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[28]_i_1_n_4 ,\count_instr_reg[28]_i_1_n_5 ,\count_instr_reg[28]_i_1_n_6 ,\count_instr_reg[28]_i_1_n_7 }),
        .S(count_instr_reg[31:28]));
  FDRE \count_instr_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[28]_i_1_n_6 ),
        .Q(count_instr_reg[29]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[0]_i_2_n_5 ),
        .Q(count_instr_reg[2]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[28]_i_1_n_5 ),
        .Q(count_instr_reg[30]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[28]_i_1_n_4 ),
        .Q(count_instr_reg[31]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[32] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[32]_i_1_n_7 ),
        .Q(count_instr_reg[32]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[32]_i_1 
       (.CI(\count_instr_reg[28]_i_1_n_0 ),
        .CO({\count_instr_reg[32]_i_1_n_0 ,\NLW_count_instr_reg[32]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[32]_i_1_n_4 ,\count_instr_reg[32]_i_1_n_5 ,\count_instr_reg[32]_i_1_n_6 ,\count_instr_reg[32]_i_1_n_7 }),
        .S(count_instr_reg[35:32]));
  FDRE \count_instr_reg[33] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[32]_i_1_n_6 ),
        .Q(count_instr_reg[33]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[34] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[32]_i_1_n_5 ),
        .Q(count_instr_reg[34]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[35] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[32]_i_1_n_4 ),
        .Q(count_instr_reg[35]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[36] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[36]_i_1_n_7 ),
        .Q(count_instr_reg[36]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[36]_i_1 
       (.CI(\count_instr_reg[32]_i_1_n_0 ),
        .CO({\count_instr_reg[36]_i_1_n_0 ,\NLW_count_instr_reg[36]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[36]_i_1_n_4 ,\count_instr_reg[36]_i_1_n_5 ,\count_instr_reg[36]_i_1_n_6 ,\count_instr_reg[36]_i_1_n_7 }),
        .S(count_instr_reg[39:36]));
  FDRE \count_instr_reg[37] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[36]_i_1_n_6 ),
        .Q(count_instr_reg[37]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[38] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[36]_i_1_n_5 ),
        .Q(count_instr_reg[38]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[39] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[36]_i_1_n_4 ),
        .Q(count_instr_reg[39]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[0]_i_2_n_4 ),
        .Q(count_instr_reg[3]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[40] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[40]_i_1_n_7 ),
        .Q(count_instr_reg[40]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[40]_i_1 
       (.CI(\count_instr_reg[36]_i_1_n_0 ),
        .CO({\count_instr_reg[40]_i_1_n_0 ,\NLW_count_instr_reg[40]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[40]_i_1_n_4 ,\count_instr_reg[40]_i_1_n_5 ,\count_instr_reg[40]_i_1_n_6 ,\count_instr_reg[40]_i_1_n_7 }),
        .S(count_instr_reg[43:40]));
  FDRE \count_instr_reg[41] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[40]_i_1_n_6 ),
        .Q(count_instr_reg[41]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[42] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[40]_i_1_n_5 ),
        .Q(count_instr_reg[42]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[43] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[40]_i_1_n_4 ),
        .Q(count_instr_reg[43]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[44] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[44]_i_1_n_7 ),
        .Q(count_instr_reg[44]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[44]_i_1 
       (.CI(\count_instr_reg[40]_i_1_n_0 ),
        .CO({\count_instr_reg[44]_i_1_n_0 ,\NLW_count_instr_reg[44]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[44]_i_1_n_4 ,\count_instr_reg[44]_i_1_n_5 ,\count_instr_reg[44]_i_1_n_6 ,\count_instr_reg[44]_i_1_n_7 }),
        .S(count_instr_reg[47:44]));
  FDRE \count_instr_reg[45] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[44]_i_1_n_6 ),
        .Q(count_instr_reg[45]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[46] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[44]_i_1_n_5 ),
        .Q(count_instr_reg[46]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[47] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[44]_i_1_n_4 ),
        .Q(count_instr_reg[47]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[48] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[48]_i_1_n_7 ),
        .Q(count_instr_reg[48]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[48]_i_1 
       (.CI(\count_instr_reg[44]_i_1_n_0 ),
        .CO({\count_instr_reg[48]_i_1_n_0 ,\NLW_count_instr_reg[48]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[48]_i_1_n_4 ,\count_instr_reg[48]_i_1_n_5 ,\count_instr_reg[48]_i_1_n_6 ,\count_instr_reg[48]_i_1_n_7 }),
        .S(count_instr_reg[51:48]));
  FDRE \count_instr_reg[49] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[48]_i_1_n_6 ),
        .Q(count_instr_reg[49]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[4]_i_1_n_7 ),
        .Q(count_instr_reg[4]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[4]_i_1 
       (.CI(\count_instr_reg[0]_i_2_n_0 ),
        .CO({\count_instr_reg[4]_i_1_n_0 ,\NLW_count_instr_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[4]_i_1_n_4 ,\count_instr_reg[4]_i_1_n_5 ,\count_instr_reg[4]_i_1_n_6 ,\count_instr_reg[4]_i_1_n_7 }),
        .S(count_instr_reg[7:4]));
  FDRE \count_instr_reg[50] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[48]_i_1_n_5 ),
        .Q(count_instr_reg[50]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[51] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[48]_i_1_n_4 ),
        .Q(count_instr_reg[51]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[52] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[52]_i_1_n_7 ),
        .Q(count_instr_reg[52]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[52]_i_1 
       (.CI(\count_instr_reg[48]_i_1_n_0 ),
        .CO({\count_instr_reg[52]_i_1_n_0 ,\NLW_count_instr_reg[52]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[52]_i_1_n_4 ,\count_instr_reg[52]_i_1_n_5 ,\count_instr_reg[52]_i_1_n_6 ,\count_instr_reg[52]_i_1_n_7 }),
        .S(count_instr_reg[55:52]));
  FDRE \count_instr_reg[53] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[52]_i_1_n_6 ),
        .Q(count_instr_reg[53]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[54] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[52]_i_1_n_5 ),
        .Q(count_instr_reg[54]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[55] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[52]_i_1_n_4 ),
        .Q(count_instr_reg[55]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[56] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[56]_i_1_n_7 ),
        .Q(count_instr_reg[56]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[56]_i_1 
       (.CI(\count_instr_reg[52]_i_1_n_0 ),
        .CO({\count_instr_reg[56]_i_1_n_0 ,\NLW_count_instr_reg[56]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[56]_i_1_n_4 ,\count_instr_reg[56]_i_1_n_5 ,\count_instr_reg[56]_i_1_n_6 ,\count_instr_reg[56]_i_1_n_7 }),
        .S(count_instr_reg[59:56]));
  FDRE \count_instr_reg[57] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[56]_i_1_n_6 ),
        .Q(count_instr_reg[57]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[58] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[56]_i_1_n_5 ),
        .Q(count_instr_reg[58]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[59] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[56]_i_1_n_4 ),
        .Q(count_instr_reg[59]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[4]_i_1_n_6 ),
        .Q(count_instr_reg[5]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[60] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[60]_i_1_n_7 ),
        .Q(count_instr_reg[60]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[60]_i_1 
       (.CI(\count_instr_reg[56]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[60]_i_1_n_4 ,\count_instr_reg[60]_i_1_n_5 ,\count_instr_reg[60]_i_1_n_6 ,\count_instr_reg[60]_i_1_n_7 }),
        .S(count_instr_reg[63:60]));
  FDRE \count_instr_reg[61] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[60]_i_1_n_6 ),
        .Q(count_instr_reg[61]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[62] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[60]_i_1_n_5 ),
        .Q(count_instr_reg[62]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[63] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[60]_i_1_n_4 ),
        .Q(count_instr_reg[63]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[4]_i_1_n_5 ),
        .Q(count_instr_reg[6]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[4]_i_1_n_4 ),
        .Q(count_instr_reg[7]),
        .R(instr_and_i_1_n_0));
  FDRE \count_instr_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[8]_i_1_n_7 ),
        .Q(count_instr_reg[8]),
        .R(instr_and_i_1_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \count_instr_reg[8]_i_1 
       (.CI(\count_instr_reg[4]_i_1_n_0 ),
        .CO({\count_instr_reg[8]_i_1_n_0 ,\NLW_count_instr_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_instr_reg[8]_i_1_n_4 ,\count_instr_reg[8]_i_1_n_5 ,\count_instr_reg[8]_i_1_n_6 ,\count_instr_reg[8]_i_1_n_7 }),
        .S(count_instr_reg[11:8]));
  FDRE \count_instr_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(count_instr),
        .D(\count_instr_reg[8]_i_1_n_6 ),
        .Q(count_instr_reg[9]),
        .R(instr_and_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000080)) 
    \cpu_state[0]_i_1 
       (.I0(is_lb_lh_lw_lbu_lhu),
        .I1(resetn_IBUF),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(is_lui_auipc_jal),
        .I4(instr_trap),
        .I5(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .O(cpu_state0_out[0]));
  LUT5 #(
    .INIT(32'h00000004)) 
    \cpu_state[1]_i_1 
       (.I0(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .I1(\cpu_state[1]_i_2_n_0 ),
        .I2(is_lb_lh_lw_lbu_lhu),
        .I3(instr_trap),
        .I4(is_lui_auipc_jal),
        .O(cpu_state0_out[1]));
  LUT5 #(
    .INIT(32'h00000080)) 
    \cpu_state[1]_i_2 
       (.I0(is_sb_sh_sw),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(resetn_IBUF),
        .I3(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I4(is_slli_srli_srai),
        .O(\cpu_state[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h00000004)) 
    \cpu_state[2]_i_1 
       (.I0(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .I1(\cpu_state[2]_i_2_n_0 ),
        .I2(is_lb_lh_lw_lbu_lhu),
        .I3(instr_trap),
        .I4(is_lui_auipc_jal),
        .O(cpu_state0_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hAE000000)) 
    \cpu_state[2]_i_2 
       (.I0(is_slli_srli_srai),
        .I1(is_sll_srl_sra),
        .I2(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I3(resetn_IBUF),
        .I4(\cpu_state_reg_n_0_[5] ),
        .O(\cpu_state[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000202000002220)) 
    \cpu_state[3]_i_1 
       (.I0(\reg_op2[31]_i_1_n_0 ),
        .I1(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .I2(is_lui_auipc_jal),
        .I3(\cpu_state[3]_i_2_n_0 ),
        .I4(instr_trap),
        .I5(is_lb_lh_lw_lbu_lhu),
        .O(cpu_state0_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT4 #(
    .INIT(16'h00AB)) 
    \cpu_state[3]_i_2 
       (.I0(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I1(is_sb_sh_sw),
        .I2(is_sll_srl_sra),
        .I3(is_slli_srli_srai),
        .O(\cpu_state[3]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \cpu_state[5]_i_1 
       (.I0(resetn_IBUF),
        .I1(reg_next_pc),
        .O(cpu_state0_out[5]));
  LUT6 #(
    .INIT(64'hFDFDFDFDFDFFFDFD)) 
    \cpu_state[6]_i_1 
       (.I0(resetn_IBUF),
        .I1(\cpu_state[6]_i_2_n_0 ),
        .I2(\cpu_state[6]_i_3_n_0 ),
        .I3(instr_trap),
        .I4(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .I5(reg_next_pc),
        .O(cpu_state0_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \cpu_state[6]_i_2 
       (.I0(\cpu_state_reg_n_0_[0] ),
        .I1(\cpu_state_reg_n_0_[1] ),
        .O(\cpu_state[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \cpu_state[6]_i_3 
       (.I0(\cpu_state_reg_n_0_[3] ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .O(\cpu_state[6]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cpu_state[6]_i_4 
       (.I0(instr_rdcycle),
        .I1(instr_rdcycleh),
        .I2(instr_rdinstr),
        .I3(instr_rdinstrh),
        .O(is_rdcycle_rdcycleh_rdinstr_rdinstrh));
  LUT6 #(
    .INIT(64'hF8F8F88800000000)) 
    \cpu_state[7]_i_1 
       (.I0(\reg_pc_reg_n_0_[1] ),
        .I1(mem_do_rinst_reg_n_0),
        .I2(\cpu_state[7]_i_4_n_0 ),
        .I3(mem_do_rdata),
        .I4(mem_do_wdata),
        .I5(resetn_IBUF),
        .O(\cpu_state[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \cpu_state[7]_i_10 
       (.I0(\cpu_state[7]_i_14_n_0 ),
        .I1(instr_rdcycle),
        .I2(instr_and),
        .I3(instr_or),
        .I4(instr_sra),
        .O(\cpu_state[7]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \cpu_state[7]_i_11 
       (.I0(instr_bgeu),
        .I1(instr_bltu),
        .I2(instr_sb),
        .I3(instr_lw),
        .I4(is_lui_auipc_jal_jalr_addi_add_sub_i_2_n_0),
        .O(\cpu_state[7]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \cpu_state[7]_i_12 
       (.I0(instr_lh),
        .I1(instr_lhu),
        .I2(instr_lb),
        .I3(instr_lbu),
        .I4(\cpu_state[7]_i_15_n_0 ),
        .O(\cpu_state[7]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \cpu_state[7]_i_13 
       (.I0(\cpu_state[7]_i_16_n_0 ),
        .I1(instr_xori),
        .I2(instr_addi),
        .I3(instr_ori),
        .I4(instr_andi),
        .I5(\cpu_state[7]_i_17_n_0 ),
        .O(\cpu_state[7]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \cpu_state[7]_i_14 
       (.I0(instr_rdinstrh),
        .I1(instr_rdinstr),
        .I2(instr_rdcycleh),
        .I3(instr_xor),
        .I4(instr_srl),
        .O(\cpu_state[7]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \cpu_state[7]_i_15 
       (.I0(instr_beq),
        .I1(instr_bne),
        .I2(instr_blt),
        .I3(instr_bge),
        .O(\cpu_state[7]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \cpu_state[7]_i_16 
       (.I0(instr_sub),
        .I1(instr_sll),
        .I2(instr_slti),
        .I3(instr_slt),
        .I4(instr_sltiu),
        .I5(instr_sltu),
        .O(\cpu_state[7]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \cpu_state[7]_i_17 
       (.I0(instr_add),
        .I1(instr_srai),
        .I2(instr_srli),
        .I3(instr_slli),
        .I4(instr_sh),
        .I5(instr_sw),
        .O(\cpu_state[7]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hFEAAFEAAFFFFFEAA)) 
    \cpu_state[7]_i_2 
       (.I0(\cpu_state[7]_i_5_n_0 ),
        .I1(\cpu_state_reg_n_0_[1] ),
        .I2(\cpu_state_reg_n_0_[0] ),
        .I3(\cpu_state[7]_i_6_n_0 ),
        .I4(\cpu_state_reg_n_0_[3] ),
        .I5(is_beq_bne_blt_bge_bltu_bgeu),
        .O(\cpu_state[7]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \cpu_state[7]_i_3 
       (.I0(resetn_IBUF),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(instr_trap),
        .O(cpu_state0_out[7]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT4 #(
    .INIT(16'h00CE)) 
    \cpu_state[7]_i_4 
       (.I0(pcpi_rs1_OBUF[1]),
        .I1(pcpi_rs1_OBUF[0]),
        .I2(\mem_wordsize_reg_n_0_[0] ),
        .I3(\mem_wordsize_reg_n_0_[1] ),
        .O(\cpu_state[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF8FFFF)) 
    \cpu_state[7]_i_5 
       (.I0(\cpu_state_reg_n_0_[3] ),
        .I1(mem_done),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(\cpu_state[7]_i_8_n_0 ),
        .I4(resetn_IBUF),
        .I5(mem_do_prefetch),
        .O(\cpu_state[7]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \cpu_state[7]_i_6 
       (.I0(mem_do_prefetch_reg_n_0),
        .I1(mem_done),
        .O(\cpu_state[7]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h0040)) 
    \cpu_state[7]_i_7 
       (.I0(\cpu_state[7]_i_10_n_0 ),
        .I1(\cpu_state[7]_i_11_n_0 ),
        .I2(\cpu_state[7]_i_12_n_0 ),
        .I3(\cpu_state[7]_i_13_n_0 ),
        .O(instr_trap));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \cpu_state[7]_i_8 
       (.I0(\reg_sh_reg_n_0_[4] ),
        .I1(\reg_sh_reg_n_0_[3] ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\reg_sh_reg_n_0_[2] ),
        .I4(\reg_sh_reg_n_0_[0] ),
        .I5(\reg_sh_reg_n_0_[1] ),
        .O(\cpu_state[7]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \cpu_state[7]_i_9 
       (.I0(reg_next_pc),
        .I1(decoder_trigger_reg_n_0),
        .I2(instr_jal),
        .O(mem_do_prefetch));
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
        .D(cpu_state0_out[7]),
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
    .INIT(64'h000E000000000000)) 
    cpuregs_reg_r1_0_31_0_5_i_1
       (.I0(latched_store_reg_n_0),
        .I1(latched_branch_reg_n_0),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\cpu_state_reg_n_0_[3] ),
        .I4(cpuregs_reg_r1_0_31_0_5_i_8_n_0),
        .I5(cpuregs_reg_r1_0_31_0_5_i_9_n_0),
        .O(cpuregs_reg_r1_0_31_0_5_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "PROPCONST POST_PROCESS_NETLIST" *) 
  CARRY4 cpuregs_reg_r1_0_31_0_5_i_10
       (.CI(\<const0> ),
        .CO({cpuregs_reg_r1_0_31_0_5_i_10_n_0,NLW_cpuregs_reg_r1_0_31_0_5_i_10_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\reg_pc_reg_n_0_[2] ,\reg_pc_reg_n_0_[1] ,\<const0> }),
        .O({cpuregs_reg_r1_0_31_0_5_i_10_n_4,cpuregs_reg_r1_0_31_0_5_i_10_n_5,cpuregs_reg_r1_0_31_0_5_i_10_n_6,NLW_cpuregs_reg_r1_0_31_0_5_i_10_O_UNCONNECTED[0]}),
        .S({\reg_pc_reg_n_0_[3] ,cpuregs_reg_r1_0_31_0_5_i_12_n_0,\reg_pc_reg_n_0_[1] ,\<const0> }));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 cpuregs_reg_r1_0_31_0_5_i_11
       (.CI(cpuregs_reg_r1_0_31_0_5_i_10_n_0),
        .CO({cpuregs_reg_r1_0_31_0_5_i_11_n_0,NLW_cpuregs_reg_r1_0_31_0_5_i_11_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({cpuregs_reg_r1_0_31_0_5_i_11_n_4,cpuregs_reg_r1_0_31_0_5_i_11_n_5,cpuregs_reg_r1_0_31_0_5_i_11_n_6,cpuregs_reg_r1_0_31_0_5_i_11_n_7}),
        .S({\reg_pc_reg_n_0_[7] ,\reg_pc_reg_n_0_[6] ,\reg_pc_reg_n_0_[5] ,\reg_pc_reg_n_0_[4] }));
  LUT1 #(
    .INIT(2'h1)) 
    cpuregs_reg_r1_0_31_0_5_i_12
       (.I0(\reg_pc_reg_n_0_[2] ),
        .O(cpuregs_reg_r1_0_31_0_5_i_12_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_0_5_i_2
       (.I0(cpuregs_reg_r1_0_31_0_5_i_10_n_6),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[1]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[1] ),
        .O(cpuregs_wrdata[1]));
  LUT4 #(
    .INIT(16'h00B8)) 
    cpuregs_reg_r1_0_31_0_5_i_3
       (.I0(alu_out_q[0]),
        .I1(latched_stalu_reg_n_0),
        .I2(\reg_out_reg_n_0_[0] ),
        .I3(latched_branch_reg_n_0),
        .O(cpuregs_wrdata[0]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_0_5_i_4
       (.I0(cpuregs_reg_r1_0_31_0_5_i_10_n_4),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[3]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[3] ),
        .O(cpuregs_wrdata[3]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_0_5_i_5
       (.I0(cpuregs_reg_r1_0_31_0_5_i_10_n_5),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[2]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[2] ),
        .O(cpuregs_wrdata[2]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_0_5_i_6
       (.I0(cpuregs_reg_r1_0_31_0_5_i_11_n_6),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[5]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[5] ),
        .O(cpuregs_wrdata[5]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_0_5_i_7
       (.I0(cpuregs_reg_r1_0_31_0_5_i_11_n_7),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[4]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[4] ),
        .O(cpuregs_wrdata[4]));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    cpuregs_reg_r1_0_31_0_5_i_8
       (.I0(resetn_IBUF),
        .I1(\cpu_state_reg_n_0_[7] ),
        .I2(reg_next_pc),
        .I3(\cpu_state_reg_n_0_[5] ),
        .I4(\cpu_state_reg_n_0_[1] ),
        .I5(\cpu_state_reg_n_0_[0] ),
        .O(cpuregs_reg_r1_0_31_0_5_i_8_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    cpuregs_reg_r1_0_31_0_5_i_9
       (.I0(latched_rd[0]),
        .I1(latched_rd[1]),
        .I2(latched_rd[2]),
        .I3(latched_rd[4]),
        .I4(latched_rd[3]),
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
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[13]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[13] ),
        .O(cpuregs_wrdata[13]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_12_17_i_2
       (.I0(cpuregs_reg_r1_0_31_12_17_i_7_n_7),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[12]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[12] ),
        .O(cpuregs_wrdata[12]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_12_17_i_3
       (.I0(cpuregs_reg_r1_0_31_12_17_i_7_n_4),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[15]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[15] ),
        .O(cpuregs_wrdata[15]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_12_17_i_4
       (.I0(cpuregs_reg_r1_0_31_12_17_i_7_n_5),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[14]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[14] ),
        .O(cpuregs_wrdata[14]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_12_17_i_5
       (.I0(cpuregs_reg_r1_0_31_12_17_i_8_n_6),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[17]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[17] ),
        .O(cpuregs_wrdata[17]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_12_17_i_6
       (.I0(cpuregs_reg_r1_0_31_12_17_i_8_n_7),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[16]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[16] ),
        .O(cpuregs_wrdata[16]));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 cpuregs_reg_r1_0_31_12_17_i_7
       (.CI(cpuregs_reg_r1_0_31_6_11_i_7_n_0),
        .CO({cpuregs_reg_r1_0_31_12_17_i_7_n_0,NLW_cpuregs_reg_r1_0_31_12_17_i_7_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({cpuregs_reg_r1_0_31_12_17_i_7_n_4,cpuregs_reg_r1_0_31_12_17_i_7_n_5,cpuregs_reg_r1_0_31_12_17_i_7_n_6,cpuregs_reg_r1_0_31_12_17_i_7_n_7}),
        .S({\reg_pc_reg_n_0_[15] ,\reg_pc_reg_n_0_[14] ,\reg_pc_reg_n_0_[13] ,\reg_pc_reg_n_0_[12] }));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
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
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[19]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[19] ),
        .O(cpuregs_wrdata[19]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_18_23_i_2
       (.I0(cpuregs_reg_r1_0_31_12_17_i_8_n_5),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[18]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[18] ),
        .O(cpuregs_wrdata[18]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_18_23_i_3
       (.I0(cpuregs_reg_r1_0_31_18_23_i_7_n_6),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[21]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[21] ),
        .O(cpuregs_wrdata[21]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_18_23_i_4
       (.I0(cpuregs_reg_r1_0_31_18_23_i_7_n_7),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[20]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[20] ),
        .O(cpuregs_wrdata[20]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_18_23_i_5
       (.I0(cpuregs_reg_r1_0_31_18_23_i_7_n_4),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[23]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[23] ),
        .O(cpuregs_wrdata[23]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_18_23_i_6
       (.I0(cpuregs_reg_r1_0_31_18_23_i_7_n_5),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[22]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[22] ),
        .O(cpuregs_wrdata[22]));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
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
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[25]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[25] ),
        .O(cpuregs_wrdata[25]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_24_29_i_2
       (.I0(cpuregs_reg_r1_0_31_24_29_i_7_n_7),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[24]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[24] ),
        .O(cpuregs_wrdata[24]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_24_29_i_3
       (.I0(cpuregs_reg_r1_0_31_24_29_i_7_n_4),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[27]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[27] ),
        .O(cpuregs_wrdata[27]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_24_29_i_4
       (.I0(cpuregs_reg_r1_0_31_24_29_i_7_n_5),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[26]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[26] ),
        .O(cpuregs_wrdata[26]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_24_29_i_5
       (.I0(cpuregs_reg_r1_0_31_24_29_i_8_n_6),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[29]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[29] ),
        .O(cpuregs_wrdata[29]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_24_29_i_6
       (.I0(cpuregs_reg_r1_0_31_24_29_i_8_n_7),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[28]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[28] ),
        .O(cpuregs_wrdata[28]));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 cpuregs_reg_r1_0_31_24_29_i_7
       (.CI(cpuregs_reg_r1_0_31_18_23_i_7_n_0),
        .CO({cpuregs_reg_r1_0_31_24_29_i_7_n_0,NLW_cpuregs_reg_r1_0_31_24_29_i_7_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({cpuregs_reg_r1_0_31_24_29_i_7_n_4,cpuregs_reg_r1_0_31_24_29_i_7_n_5,cpuregs_reg_r1_0_31_24_29_i_7_n_6,cpuregs_reg_r1_0_31_24_29_i_7_n_7}),
        .S({\reg_pc_reg_n_0_[27] ,\reg_pc_reg_n_0_[26] ,\reg_pc_reg_n_0_[25] ,\reg_pc_reg_n_0_[24] }));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
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
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[31]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[31] ),
        .O(cpuregs_wrdata[31]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_30_31_i_1
       (.I0(cpuregs_reg_r1_0_31_24_29_i_8_n_5),
        .I1(latched_branch_reg_n_0),
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
       (.I0(cpuregs_reg_r1_0_31_0_5_i_11_n_4),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[7]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[7] ),
        .O(cpuregs_wrdata[7]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_6_11_i_2
       (.I0(cpuregs_reg_r1_0_31_0_5_i_11_n_5),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[6]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[6] ),
        .O(cpuregs_wrdata[6]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_6_11_i_3
       (.I0(cpuregs_reg_r1_0_31_6_11_i_7_n_6),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[9]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[9] ),
        .O(cpuregs_wrdata[9]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_6_11_i_4
       (.I0(cpuregs_reg_r1_0_31_6_11_i_7_n_7),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[8]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[8] ),
        .O(cpuregs_wrdata[8]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_6_11_i_5
       (.I0(cpuregs_reg_r1_0_31_6_11_i_7_n_4),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[11]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[11] ),
        .O(cpuregs_wrdata[11]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    cpuregs_reg_r1_0_31_6_11_i_6
       (.I0(cpuregs_reg_r1_0_31_6_11_i_7_n_5),
        .I1(latched_branch_reg_n_0),
        .I2(alu_out_q[10]),
        .I3(latched_stalu_reg_n_0),
        .I4(\reg_out_reg_n_0_[10] ),
        .O(cpuregs_wrdata[10]));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 cpuregs_reg_r1_0_31_6_11_i_7
       (.CI(cpuregs_reg_r1_0_31_0_5_i_11_n_0),
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
    .INIT(64'hF8F8F8F8F8F8F888)) 
    \decoded_imm[0]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[7] ),
        .I1(is_sb_sh_sw),
        .I2(\mem_rdata_q_reg_n_0_[20] ),
        .I3(instr_jalr),
        .I4(is_lb_lh_lw_lbu_lhu),
        .I5(is_alu_reg_imm),
        .O(\decoded_imm[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFF888888888)) 
    \decoded_imm[10]_i_1 
       (.I0(decoded_imm_j[10]),
        .I1(instr_jal),
        .I2(decoded_imm1),
        .I3(is_sb_sh_sw),
        .I4(is_beq_bne_blt_bge_bltu_bgeu),
        .I5(\mem_rdata_q_reg_n_0_[30] ),
        .O(\decoded_imm[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFC0EAC0EAC0EAC0)) 
    \decoded_imm[11]_i_1 
       (.I0(\mem_rdata_q_reg_n_0_[31] ),
        .I1(instr_jal),
        .I2(decoded_imm_j[11]),
        .I3(\decoded_imm[11]_i_2_n_0 ),
        .I4(\mem_rdata_q_reg_n_0_[7] ),
        .I5(is_beq_bne_blt_bge_bltu_bgeu),
        .O(\decoded_imm[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEA)) 
    \decoded_imm[11]_i_2 
       (.I0(is_sb_sh_sw),
        .I1(is_beq_bne_blt_bge_bltu_bgeu),
        .I2(\mem_rdata_q_reg_n_0_[7] ),
        .I3(is_alu_reg_imm),
        .I4(is_lb_lh_lw_lbu_lhu),
        .I5(instr_jalr),
        .O(\decoded_imm[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFEAAFEAAFEAA)) 
    \decoded_imm[12]_i_1 
       (.I0(\decoded_imm[19]_i_2_n_0 ),
        .I1(instr_lui),
        .I2(instr_auipc),
        .I3(p_0_in[0]),
        .I4(decoded_imm_j[12]),
        .I5(instr_jal),
        .O(\decoded_imm[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFEAAFEAAFEAA)) 
    \decoded_imm[13]_i_1 
       (.I0(\decoded_imm[19]_i_2_n_0 ),
        .I1(instr_lui),
        .I2(instr_auipc),
        .I3(p_0_in[1]),
        .I4(decoded_imm_j[13]),
        .I5(instr_jal),
        .O(\decoded_imm[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFEAAFEAAFEAA)) 
    \decoded_imm[14]_i_1 
       (.I0(\decoded_imm[19]_i_2_n_0 ),
        .I1(instr_lui),
        .I2(instr_auipc),
        .I3(p_0_in[2]),
        .I4(decoded_imm_j[14]),
        .I5(instr_jal),
        .O(\decoded_imm[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFEAAFEAAFEAA)) 
    \decoded_imm[15]_i_1 
       (.I0(\decoded_imm[19]_i_2_n_0 ),
        .I1(instr_lui),
        .I2(instr_auipc),
        .I3(\mem_rdata_q_reg_n_0_[15] ),
        .I4(decoded_rs1[0]),
        .I5(instr_jal),
        .O(\decoded_imm[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFEAAFEAAFEAA)) 
    \decoded_imm[16]_i_1 
       (.I0(\decoded_imm[19]_i_2_n_0 ),
        .I1(instr_lui),
        .I2(instr_auipc),
        .I3(\mem_rdata_q_reg_n_0_[16] ),
        .I4(decoded_rs1[1]),
        .I5(instr_jal),
        .O(\decoded_imm[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFEAAFEAAFEAA)) 
    \decoded_imm[17]_i_1 
       (.I0(\decoded_imm[19]_i_2_n_0 ),
        .I1(instr_lui),
        .I2(instr_auipc),
        .I3(\mem_rdata_q_reg_n_0_[17] ),
        .I4(decoded_rs1[2]),
        .I5(instr_jal),
        .O(\decoded_imm[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFEAAFEAAFEAA)) 
    \decoded_imm[18]_i_1 
       (.I0(\decoded_imm[19]_i_2_n_0 ),
        .I1(instr_lui),
        .I2(instr_auipc),
        .I3(\mem_rdata_q_reg_n_0_[18] ),
        .I4(decoded_rs1[3]),
        .I5(instr_jal),
        .O(\decoded_imm[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFEAAFEAAFEAA)) 
    \decoded_imm[19]_i_1 
       (.I0(\decoded_imm[19]_i_2_n_0 ),
        .I1(instr_lui),
        .I2(instr_auipc),
        .I3(\mem_rdata_q_reg_n_0_[19] ),
        .I4(decoded_rs1[4]),
        .I5(instr_jal),
        .O(\decoded_imm[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \decoded_imm[19]_i_2 
       (.I0(\mem_rdata_q_reg_n_0_[31] ),
        .I1(is_beq_bne_blt_bge_bltu_bgeu),
        .I2(is_sb_sh_sw),
        .I3(is_alu_reg_imm),
        .I4(is_lb_lh_lw_lbu_lhu),
        .I5(instr_jalr),
        .O(\decoded_imm[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \decoded_imm[1]_i_1 
       (.I0(decoded_imm1),
        .I1(\mem_rdata_q_reg_n_0_[21] ),
        .I2(\mem_rdata_q_reg_n_0_[8] ),
        .I3(\decoded_imm[31]_i_3_n_0 ),
        .I4(decoded_imm_j[1]),
        .I5(instr_jal),
        .O(\decoded_imm[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \decoded_imm[20]_i_1 
       (.I0(instr_lui),
        .I1(instr_auipc),
        .I2(\mem_rdata_q_reg_n_0_[20] ),
        .O(\decoded_imm[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \decoded_imm[21]_i_1 
       (.I0(instr_lui),
        .I1(instr_auipc),
        .I2(\mem_rdata_q_reg_n_0_[21] ),
        .O(\decoded_imm[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \decoded_imm[22]_i_1 
       (.I0(instr_lui),
        .I1(instr_auipc),
        .I2(\mem_rdata_q_reg_n_0_[22] ),
        .O(\decoded_imm[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \decoded_imm[23]_i_1 
       (.I0(instr_lui),
        .I1(instr_auipc),
        .I2(\mem_rdata_q_reg_n_0_[23] ),
        .O(\decoded_imm[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \decoded_imm[24]_i_1 
       (.I0(instr_lui),
        .I1(instr_auipc),
        .I2(\mem_rdata_q_reg_n_0_[24] ),
        .O(\decoded_imm[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \decoded_imm[25]_i_1 
       (.I0(instr_lui),
        .I1(instr_auipc),
        .I2(\mem_rdata_q_reg_n_0_[25] ),
        .O(\decoded_imm[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \decoded_imm[26]_i_1 
       (.I0(instr_lui),
        .I1(instr_auipc),
        .I2(\mem_rdata_q_reg_n_0_[26] ),
        .O(\decoded_imm[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \decoded_imm[27]_i_1 
       (.I0(instr_lui),
        .I1(instr_auipc),
        .I2(\mem_rdata_q_reg_n_0_[27] ),
        .O(\decoded_imm[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \decoded_imm[28]_i_1 
       (.I0(instr_lui),
        .I1(instr_auipc),
        .I2(\mem_rdata_q_reg_n_0_[28] ),
        .O(\decoded_imm[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \decoded_imm[29]_i_1 
       (.I0(instr_lui),
        .I1(instr_auipc),
        .I2(\mem_rdata_q_reg_n_0_[29] ),
        .O(\decoded_imm[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \decoded_imm[2]_i_1 
       (.I0(decoded_imm1),
        .I1(\mem_rdata_q_reg_n_0_[22] ),
        .I2(instr_jal),
        .I3(decoded_imm_j[2]),
        .I4(\decoded_imm[31]_i_3_n_0 ),
        .I5(\mem_rdata_q_reg_n_0_[9] ),
        .O(\decoded_imm[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00EA0000)) 
    \decoded_imm[30]_i_1 
       (.I0(\decoded_imm[19]_i_2_n_0 ),
        .I1(instr_jal),
        .I2(decoded_imm_j[30]),
        .I3(decoder_pseudo_trigger_reg_n_0),
        .I4(decoder_trigger_reg_n_0),
        .O(\decoded_imm[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \decoded_imm[30]_i_2 
       (.I0(instr_lui),
        .I1(instr_auipc),
        .I2(\mem_rdata_q_reg_n_0_[30] ),
        .O(\decoded_imm[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFE00FE00FE00)) 
    \decoded_imm[31]_i_1 
       (.I0(\decoded_imm[31]_i_2_n_0 ),
        .I1(\decoded_imm[31]_i_3_n_0 ),
        .I2(decoded_imm1),
        .I3(\mem_rdata_q_reg_n_0_[31] ),
        .I4(decoded_imm_j[30]),
        .I5(instr_jal),
        .O(\decoded_imm[31]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \decoded_imm[31]_i_2 
       (.I0(instr_auipc),
        .I1(instr_lui),
        .O(\decoded_imm[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \decoded_imm[31]_i_3 
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(is_sb_sh_sw),
        .O(\decoded_imm[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \decoded_imm[31]_i_4 
       (.I0(instr_jalr),
        .I1(is_lb_lh_lw_lbu_lhu),
        .I2(is_alu_reg_imm),
        .O(decoded_imm1));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \decoded_imm[3]_i_1 
       (.I0(decoded_imm1),
        .I1(\mem_rdata_q_reg_n_0_[23] ),
        .I2(\mem_rdata_q_reg_n_0_[10] ),
        .I3(\decoded_imm[31]_i_3_n_0 ),
        .I4(decoded_imm_j[3]),
        .I5(instr_jal),
        .O(\decoded_imm[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \decoded_imm[4]_i_1 
       (.I0(decoded_imm1),
        .I1(\mem_rdata_q_reg_n_0_[24] ),
        .I2(\mem_rdata_q_reg_n_0_[11] ),
        .I3(\decoded_imm[31]_i_3_n_0 ),
        .I4(decoded_imm_j[4]),
        .I5(instr_jal),
        .O(\decoded_imm[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFF888888888)) 
    \decoded_imm[5]_i_1 
       (.I0(decoded_imm_j[5]),
        .I1(instr_jal),
        .I2(decoded_imm1),
        .I3(is_sb_sh_sw),
        .I4(is_beq_bne_blt_bge_bltu_bgeu),
        .I5(\mem_rdata_q_reg_n_0_[25] ),
        .O(\decoded_imm[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFF888888888)) 
    \decoded_imm[6]_i_1 
       (.I0(decoded_imm_j[6]),
        .I1(instr_jal),
        .I2(decoded_imm1),
        .I3(is_sb_sh_sw),
        .I4(is_beq_bne_blt_bge_bltu_bgeu),
        .I5(\mem_rdata_q_reg_n_0_[26] ),
        .O(\decoded_imm[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFF888888888)) 
    \decoded_imm[7]_i_1 
       (.I0(decoded_imm_j[7]),
        .I1(instr_jal),
        .I2(decoded_imm1),
        .I3(is_sb_sh_sw),
        .I4(is_beq_bne_blt_bge_bltu_bgeu),
        .I5(\mem_rdata_q_reg_n_0_[27] ),
        .O(\decoded_imm[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFF888888888)) 
    \decoded_imm[8]_i_1 
       (.I0(decoded_imm_j[8]),
        .I1(instr_jal),
        .I2(decoded_imm1),
        .I3(is_sb_sh_sw),
        .I4(is_beq_bne_blt_bge_bltu_bgeu),
        .I5(\mem_rdata_q_reg_n_0_[28] ),
        .O(\decoded_imm[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFF888888888)) 
    \decoded_imm[9]_i_1 
       (.I0(decoded_imm_j[9]),
        .I1(instr_jal),
        .I2(decoded_imm1),
        .I3(is_sb_sh_sw),
        .I4(is_beq_bne_blt_bge_bltu_bgeu),
        .I5(\mem_rdata_q_reg_n_0_[29] ),
        .O(\decoded_imm[9]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \decoded_imm_j[10]_i_1 
       (.I0(mem_rdata_IBUF[30]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[30] ),
        .O(\decoded_imm_j[10]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \decoded_imm_j[30]_i_1 
       (.I0(mem_rdata_IBUF[31]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[31] ),
        .O(p_0_in0));
  LUT4 #(
    .INIT(16'hBF80)) 
    \decoded_imm_j[5]_i_1 
       (.I0(mem_rdata_IBUF[25]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[25] ),
        .O(\decoded_imm_j[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \decoded_imm_j[6]_i_1 
       (.I0(mem_rdata_IBUF[26]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[26] ),
        .O(\decoded_imm_j[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \decoded_imm_j[7]_i_1 
       (.I0(mem_rdata_IBUF[27]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[27] ),
        .O(\decoded_imm_j[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \decoded_imm_j[8]_i_1 
       (.I0(mem_rdata_IBUF[28]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[28] ),
        .O(\decoded_imm_j[8]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \decoded_imm_j[9]_i_1 
       (.I0(mem_rdata_IBUF[29]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[29] ),
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
  FDRE \decoded_imm_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[12]_i_1_n_0 ),
        .Q(decoded_imm[12]),
        .R(\<const0> ));
  FDRE \decoded_imm_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[13]_i_1_n_0 ),
        .Q(decoded_imm[13]),
        .R(\<const0> ));
  FDRE \decoded_imm_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[14]_i_1_n_0 ),
        .Q(decoded_imm[14]),
        .R(\<const0> ));
  FDRE \decoded_imm_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[15]_i_1_n_0 ),
        .Q(decoded_imm[15]),
        .R(\<const0> ));
  FDRE \decoded_imm_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[16]_i_1_n_0 ),
        .Q(decoded_imm[16]),
        .R(\<const0> ));
  FDRE \decoded_imm_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[17]_i_1_n_0 ),
        .Q(decoded_imm[17]),
        .R(\<const0> ));
  FDRE \decoded_imm_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[18]_i_1_n_0 ),
        .Q(decoded_imm[18]),
        .R(\<const0> ));
  FDRE \decoded_imm_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[19]_i_1_n_0 ),
        .Q(decoded_imm[19]),
        .R(\<const0> ));
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
        .S(\decoded_imm[30]_i_1_n_0 ));
  FDSE \decoded_imm_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[21]_i_1_n_0 ),
        .Q(decoded_imm[21]),
        .S(\decoded_imm[30]_i_1_n_0 ));
  FDSE \decoded_imm_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[22]_i_1_n_0 ),
        .Q(decoded_imm[22]),
        .S(\decoded_imm[30]_i_1_n_0 ));
  FDSE \decoded_imm_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[23]_i_1_n_0 ),
        .Q(decoded_imm[23]),
        .S(\decoded_imm[30]_i_1_n_0 ));
  FDSE \decoded_imm_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[24]_i_1_n_0 ),
        .Q(decoded_imm[24]),
        .S(\decoded_imm[30]_i_1_n_0 ));
  FDSE \decoded_imm_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[25]_i_1_n_0 ),
        .Q(decoded_imm[25]),
        .S(\decoded_imm[30]_i_1_n_0 ));
  FDSE \decoded_imm_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[26]_i_1_n_0 ),
        .Q(decoded_imm[26]),
        .S(\decoded_imm[30]_i_1_n_0 ));
  FDSE \decoded_imm_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[27]_i_1_n_0 ),
        .Q(decoded_imm[27]),
        .S(\decoded_imm[30]_i_1_n_0 ));
  FDSE \decoded_imm_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[28]_i_1_n_0 ),
        .Q(decoded_imm[28]),
        .S(\decoded_imm[30]_i_1_n_0 ));
  FDSE \decoded_imm_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[29]_i_1_n_0 ),
        .Q(decoded_imm[29]),
        .S(\decoded_imm[30]_i_1_n_0 ));
  FDRE \decoded_imm_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[2]_i_1_n_0 ),
        .Q(decoded_imm[2]),
        .R(\<const0> ));
  FDSE \decoded_imm_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[30]_i_2_n_0 ),
        .Q(decoded_imm[30]),
        .S(\decoded_imm[30]_i_1_n_0 ));
  FDRE \decoded_imm_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(\decoded_imm[31]_i_1_n_0 ),
        .Q(decoded_imm[31]),
        .R(\<const0> ));
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
    .INIT(16'hBF80)) 
    \decoded_rd[0]_i_1 
       (.I0(mem_rdata_IBUF[7]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[7] ),
        .O(\decoded_rd[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \decoded_rd[1]_i_1 
       (.I0(mem_rdata_IBUF[8]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[8] ),
        .O(\decoded_rd[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \decoded_rd[2]_i_1 
       (.I0(mem_rdata_IBUF[9]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[9] ),
        .O(\decoded_rd[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \decoded_rd[3]_i_1 
       (.I0(mem_rdata_IBUF[10]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[10] ),
        .O(\decoded_rd[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \decoded_rd[4]_i_1 
       (.I0(mem_rdata_IBUF[11]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[11] ),
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
    .INIT(16'hBF80)) 
    \decoded_rs1_rep[0]_i_1 
       (.I0(mem_rdata_IBUF[15]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[15] ),
        .O(\decoded_rs1_rep[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \decoded_rs1_rep[1]_i_1 
       (.I0(mem_rdata_IBUF[16]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[16] ),
        .O(\decoded_rs1_rep[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \decoded_rs1_rep[2]_i_1 
       (.I0(mem_rdata_IBUF[17]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[17] ),
        .O(\decoded_rs1_rep[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \decoded_rs1_rep[3]_i_1 
       (.I0(mem_rdata_IBUF[18]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[18] ),
        .O(\decoded_rs1_rep[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \decoded_rs1_rep[4]_i_1 
       (.I0(mem_rdata_IBUF[19]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[19] ),
        .O(\decoded_rs1_rep[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \decoded_rs2_rep[0]_i_1 
       (.I0(mem_rdata_IBUF[20]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[20] ),
        .O(p_1_in[0]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \decoded_rs2_rep[1]_i_1 
       (.I0(mem_rdata_IBUF[21]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[21] ),
        .O(p_1_in[1]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \decoded_rs2_rep[2]_i_1 
       (.I0(mem_rdata_IBUF[22]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[22] ),
        .O(p_1_in[2]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \decoded_rs2_rep[3]_i_1 
       (.I0(mem_rdata_IBUF[23]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[23] ),
        .O(p_1_in[3]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \decoded_rs2_rep[4]_i_1 
       (.I0(mem_rdata_IBUF[24]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[24] ),
        .O(p_1_in[4]));
  LUT6 #(
    .INIT(64'h0000000000100000)) 
    decoder_pseudo_trigger_i_1
       (.I0(\cpu_state_reg_n_0_[3] ),
        .I1(reg_next_pc),
        .I2(decoder_pseudo_trigger_i_2_n_0),
        .I3(\cpu_state_reg_n_0_[7] ),
        .I4(mem_done),
        .I5(mem_do_prefetch_reg_n_0),
        .O(decoder_pseudo_trigger));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h1)) 
    decoder_pseudo_trigger_i_2
       (.I0(\cpu_state_reg_n_0_[2] ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .O(decoder_pseudo_trigger_i_2_n_0));
  FDRE decoder_pseudo_trigger_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(decoder_pseudo_trigger),
        .Q(decoder_pseudo_trigger_reg_n_0),
        .R(instr_and_i_1_n_0));
  LUT6 #(
    .INIT(64'hA8CCECCCECCCECCC)) 
    decoder_trigger_i_1
       (.I0(\cpu_state[6]_i_2_n_0 ),
        .I1(instr_lui0),
        .I2(\cpu_state[7]_i_6_n_0 ),
        .I3(resetn_IBUF),
        .I4(alu_out_0),
        .I5(decoder_trigger_i_3_n_0),
        .O(decoder_trigger_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    decoder_trigger_i_10
       (.I0(pcpi_rs2_OBUF[30]),
        .I1(pcpi_rs1_OBUF[30]),
        .I2(pcpi_rs1_OBUF[31]),
        .I3(pcpi_rs2_OBUF[31]),
        .O(decoder_trigger_i_10_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    decoder_trigger_i_11_lopt_merged
       (.I0(pcpi_rs2_OBUF[28]),
        .I1(pcpi_rs1_OBUF[28]),
        .I2(pcpi_rs1_OBUF[29]),
        .I3(pcpi_rs2_OBUF[29]),
        .O(decoder_trigger_i_11_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    decoder_trigger_i_12_lopt_merged
       (.I0(pcpi_rs2_OBUF[26]),
        .I1(pcpi_rs1_OBUF[26]),
        .I2(pcpi_rs1_OBUF[27]),
        .I3(pcpi_rs2_OBUF[27]),
        .O(decoder_trigger_i_12_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    decoder_trigger_i_13_lopt_merged
       (.I0(pcpi_rs2_OBUF[24]),
        .I1(pcpi_rs1_OBUF[24]),
        .I2(pcpi_rs1_OBUF[25]),
        .I3(pcpi_rs2_OBUF[25]),
        .O(decoder_trigger_i_13_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_14_lopt_merged
       (.I0(pcpi_rs1_OBUF[30]),
        .I1(pcpi_rs2_OBUF[30]),
        .I2(pcpi_rs2_OBUF[31]),
        .I3(pcpi_rs1_OBUF[31]),
        .O(decoder_trigger_i_14_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_15_lopt_merged
       (.I0(pcpi_rs2_OBUF[28]),
        .I1(pcpi_rs1_OBUF[28]),
        .I2(pcpi_rs2_OBUF[29]),
        .I3(pcpi_rs1_OBUF[29]),
        .O(decoder_trigger_i_15_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_16_lopt_merged
       (.I0(pcpi_rs2_OBUF[26]),
        .I1(pcpi_rs1_OBUF[26]),
        .I2(pcpi_rs2_OBUF[27]),
        .I3(pcpi_rs1_OBUF[27]),
        .O(decoder_trigger_i_16_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_17_lopt_merged
       (.I0(pcpi_rs2_OBUF[24]),
        .I1(pcpi_rs1_OBUF[24]),
        .I2(pcpi_rs2_OBUF[25]),
        .I3(pcpi_rs1_OBUF[25]),
        .O(decoder_trigger_i_17_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_19
       (.I0(pcpi_rs2_OBUF[31]),
        .I1(pcpi_rs1_OBUF[31]),
        .I2(pcpi_rs1_OBUF[30]),
        .I3(pcpi_rs2_OBUF[30]),
        .O(decoder_trigger_i_19_n_0));
  LUT5 #(
    .INIT(32'hFFFFEFEA)) 
    decoder_trigger_i_2
       (.I0(decoder_trigger_i_4_n_0),
        .I1(is_sltiu_bltu_sltu),
        .I2(alu_ltu),
        .I3(instr_bgeu),
        .I4(decoder_trigger_i_6_n_0),
        .O(alu_out_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    decoder_trigger_i_20
       (.I0(pcpi_rs1_OBUF[29]),
        .I1(pcpi_rs2_OBUF[29]),
        .I2(pcpi_rs1_OBUF[28]),
        .I3(pcpi_rs2_OBUF[28]),
        .I4(pcpi_rs2_OBUF[27]),
        .I5(pcpi_rs1_OBUF[27]),
        .O(decoder_trigger_i_20_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    decoder_trigger_i_21
       (.I0(pcpi_rs1_OBUF[26]),
        .I1(pcpi_rs2_OBUF[26]),
        .I2(pcpi_rs1_OBUF[25]),
        .I3(pcpi_rs2_OBUF[25]),
        .I4(pcpi_rs2_OBUF[24]),
        .I5(pcpi_rs1_OBUF[24]),
        .O(decoder_trigger_i_21_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    decoder_trigger_i_23
       (.I0(pcpi_rs2_OBUF[30]),
        .I1(pcpi_rs1_OBUF[30]),
        .I2(pcpi_rs2_OBUF[31]),
        .I3(pcpi_rs1_OBUF[31]),
        .O(decoder_trigger_i_23_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    decoder_trigger_i_3
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(\cpu_state_reg_n_0_[3] ),
        .O(decoder_trigger_i_3_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    decoder_trigger_i_32_lopt_merged
       (.I0(pcpi_rs2_OBUF[22]),
        .I1(pcpi_rs1_OBUF[22]),
        .I2(pcpi_rs1_OBUF[23]),
        .I3(pcpi_rs2_OBUF[23]),
        .O(decoder_trigger_i_32_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    decoder_trigger_i_33_lopt_merged
       (.I0(pcpi_rs2_OBUF[20]),
        .I1(pcpi_rs1_OBUF[20]),
        .I2(pcpi_rs1_OBUF[21]),
        .I3(pcpi_rs2_OBUF[21]),
        .O(decoder_trigger_i_33_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    decoder_trigger_i_34_lopt_merged
       (.I0(pcpi_rs2_OBUF[18]),
        .I1(pcpi_rs1_OBUF[18]),
        .I2(pcpi_rs1_OBUF[19]),
        .I3(pcpi_rs2_OBUF[19]),
        .O(decoder_trigger_i_34_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    decoder_trigger_i_35_lopt_merged
       (.I0(pcpi_rs2_OBUF[16]),
        .I1(pcpi_rs1_OBUF[16]),
        .I2(pcpi_rs1_OBUF[17]),
        .I3(pcpi_rs2_OBUF[17]),
        .O(decoder_trigger_i_35_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_36_lopt_merged
       (.I0(pcpi_rs2_OBUF[22]),
        .I1(pcpi_rs1_OBUF[22]),
        .I2(pcpi_rs2_OBUF[23]),
        .I3(pcpi_rs1_OBUF[23]),
        .O(decoder_trigger_i_36_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_37_lopt_merged
       (.I0(pcpi_rs2_OBUF[20]),
        .I1(pcpi_rs1_OBUF[20]),
        .I2(pcpi_rs2_OBUF[21]),
        .I3(pcpi_rs1_OBUF[21]),
        .O(decoder_trigger_i_37_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_38_lopt_merged
       (.I0(pcpi_rs2_OBUF[18]),
        .I1(pcpi_rs1_OBUF[18]),
        .I2(pcpi_rs2_OBUF[19]),
        .I3(pcpi_rs1_OBUF[19]),
        .O(decoder_trigger_i_38_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_39_lopt_merged
       (.I0(pcpi_rs2_OBUF[16]),
        .I1(pcpi_rs1_OBUF[16]),
        .I2(pcpi_rs2_OBUF[17]),
        .I3(pcpi_rs1_OBUF[17]),
        .O(decoder_trigger_i_39_n_0));
  LUT4 #(
    .INIT(16'h4F44)) 
    decoder_trigger_i_4
       (.I0(alu_eq),
        .I1(instr_bne),
        .I2(alu_lts),
        .I3(instr_bge),
        .O(decoder_trigger_i_4_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    decoder_trigger_i_41
       (.I0(pcpi_rs1_OBUF[23]),
        .I1(pcpi_rs2_OBUF[23]),
        .I2(pcpi_rs1_OBUF[22]),
        .I3(pcpi_rs2_OBUF[22]),
        .I4(pcpi_rs2_OBUF[21]),
        .I5(pcpi_rs1_OBUF[21]),
        .O(decoder_trigger_i_41_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    decoder_trigger_i_42
       (.I0(pcpi_rs1_OBUF[20]),
        .I1(pcpi_rs2_OBUF[20]),
        .I2(pcpi_rs1_OBUF[19]),
        .I3(pcpi_rs2_OBUF[19]),
        .I4(pcpi_rs2_OBUF[18]),
        .I5(pcpi_rs1_OBUF[18]),
        .O(decoder_trigger_i_42_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    decoder_trigger_i_43
       (.I0(pcpi_rs1_OBUF[17]),
        .I1(pcpi_rs2_OBUF[17]),
        .I2(pcpi_rs1_OBUF[16]),
        .I3(pcpi_rs2_OBUF[16]),
        .I4(pcpi_rs2_OBUF[15]),
        .I5(pcpi_rs1_OBUF[15]),
        .O(decoder_trigger_i_43_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    decoder_trigger_i_44
       (.I0(pcpi_rs1_OBUF[14]),
        .I1(pcpi_rs2_OBUF[14]),
        .I2(pcpi_rs1_OBUF[13]),
        .I3(pcpi_rs2_OBUF[13]),
        .I4(pcpi_rs2_OBUF[12]),
        .I5(pcpi_rs1_OBUF[12]),
        .O(decoder_trigger_i_44_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    decoder_trigger_i_55_lopt_merged
       (.I0(pcpi_rs2_OBUF[14]),
        .I1(pcpi_rs1_OBUF[14]),
        .I2(pcpi_rs1_OBUF[15]),
        .I3(pcpi_rs2_OBUF[15]),
        .O(decoder_trigger_i_55_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    decoder_trigger_i_56_lopt_merged
       (.I0(pcpi_rs2_OBUF[12]),
        .I1(pcpi_rs1_OBUF[12]),
        .I2(pcpi_rs1_OBUF[13]),
        .I3(pcpi_rs2_OBUF[13]),
        .O(decoder_trigger_i_56_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    decoder_trigger_i_57_lopt_merged
       (.I0(pcpi_rs2_OBUF[10]),
        .I1(pcpi_rs1_OBUF[10]),
        .I2(pcpi_rs1_OBUF[11]),
        .I3(pcpi_rs2_OBUF[11]),
        .O(decoder_trigger_i_57_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    decoder_trigger_i_58_lopt_merged
       (.I0(pcpi_rs2_OBUF[8]),
        .I1(pcpi_rs1_OBUF[8]),
        .I2(pcpi_rs1_OBUF[9]),
        .I3(pcpi_rs2_OBUF[9]),
        .O(decoder_trigger_i_58_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_59_lopt_merged
       (.I0(pcpi_rs2_OBUF[14]),
        .I1(pcpi_rs1_OBUF[14]),
        .I2(pcpi_rs2_OBUF[15]),
        .I3(pcpi_rs1_OBUF[15]),
        .O(decoder_trigger_i_59_n_0));
  LUT4 #(
    .INIT(16'hF888)) 
    decoder_trigger_i_6
       (.I0(alu_lts),
        .I1(is_slti_blt_slt),
        .I2(instr_beq),
        .I3(alu_eq),
        .O(decoder_trigger_i_6_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_60_lopt_merged
       (.I0(pcpi_rs2_OBUF[12]),
        .I1(pcpi_rs1_OBUF[12]),
        .I2(pcpi_rs2_OBUF[13]),
        .I3(pcpi_rs1_OBUF[13]),
        .O(decoder_trigger_i_60_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_61_lopt_merged
       (.I0(pcpi_rs2_OBUF[10]),
        .I1(pcpi_rs1_OBUF[10]),
        .I2(pcpi_rs2_OBUF[11]),
        .I3(pcpi_rs1_OBUF[11]),
        .O(decoder_trigger_i_61_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_62_lopt_merged
       (.I0(pcpi_rs2_OBUF[8]),
        .I1(pcpi_rs1_OBUF[8]),
        .I2(pcpi_rs2_OBUF[9]),
        .I3(pcpi_rs1_OBUF[9]),
        .O(decoder_trigger_i_62_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    decoder_trigger_i_63
       (.I0(pcpi_rs1_OBUF[11]),
        .I1(pcpi_rs2_OBUF[11]),
        .I2(pcpi_rs1_OBUF[10]),
        .I3(pcpi_rs2_OBUF[10]),
        .I4(pcpi_rs2_OBUF[9]),
        .I5(pcpi_rs1_OBUF[9]),
        .O(decoder_trigger_i_63_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    decoder_trigger_i_64
       (.I0(pcpi_rs1_OBUF[8]),
        .I1(pcpi_rs2_OBUF[8]),
        .I2(pcpi_rs1_OBUF[7]),
        .I3(pcpi_rs2_OBUF[7]),
        .I4(pcpi_rs2_OBUF[6]),
        .I5(pcpi_rs1_OBUF[6]),
        .O(decoder_trigger_i_64_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    decoder_trigger_i_65
       (.I0(pcpi_rs1_OBUF[5]),
        .I1(pcpi_rs2_OBUF[5]),
        .I2(pcpi_rs1_OBUF[4]),
        .I3(pcpi_rs2_OBUF[4]),
        .I4(pcpi_rs2_OBUF[3]),
        .I5(pcpi_rs1_OBUF[3]),
        .O(decoder_trigger_i_65_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    decoder_trigger_i_66
       (.I0(pcpi_rs1_OBUF[2]),
        .I1(pcpi_rs2_OBUF[2]),
        .I2(pcpi_rs2_OBUF[1]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(pcpi_rs1_OBUF[0]),
        .I5(pcpi_rs2_OBUF[0]),
        .O(decoder_trigger_i_66_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    decoder_trigger_i_76_lopt_merged
       (.I0(pcpi_rs2_OBUF[6]),
        .I1(pcpi_rs1_OBUF[6]),
        .I2(pcpi_rs1_OBUF[7]),
        .I3(pcpi_rs2_OBUF[7]),
        .O(decoder_trigger_i_76_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    decoder_trigger_i_77_lopt_merged
       (.I0(pcpi_rs2_OBUF[4]),
        .I1(pcpi_rs1_OBUF[4]),
        .I2(pcpi_rs1_OBUF[5]),
        .I3(pcpi_rs2_OBUF[5]),
        .O(decoder_trigger_i_77_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    decoder_trigger_i_78_lopt_merged
       (.I0(pcpi_rs2_OBUF[2]),
        .I1(pcpi_rs1_OBUF[2]),
        .I2(pcpi_rs1_OBUF[3]),
        .I3(pcpi_rs2_OBUF[3]),
        .O(decoder_trigger_i_78_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    decoder_trigger_i_79_lopt_merged
       (.I0(pcpi_rs2_OBUF[0]),
        .I1(pcpi_rs1_OBUF[0]),
        .I2(pcpi_rs1_OBUF[1]),
        .I3(pcpi_rs2_OBUF[1]),
        .O(decoder_trigger_i_79_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_80_lopt_merged
       (.I0(pcpi_rs2_OBUF[6]),
        .I1(pcpi_rs1_OBUF[6]),
        .I2(pcpi_rs2_OBUF[7]),
        .I3(pcpi_rs1_OBUF[7]),
        .O(decoder_trigger_i_80_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_81_lopt_merged
       (.I0(pcpi_rs2_OBUF[4]),
        .I1(pcpi_rs1_OBUF[4]),
        .I2(pcpi_rs2_OBUF[5]),
        .I3(pcpi_rs1_OBUF[5]),
        .O(decoder_trigger_i_81_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_82_lopt_merged
       (.I0(pcpi_rs2_OBUF[2]),
        .I1(pcpi_rs1_OBUF[2]),
        .I2(pcpi_rs2_OBUF[3]),
        .I3(pcpi_rs1_OBUF[3]),
        .O(decoder_trigger_i_82_n_0));
  (* LOPT_MERGED *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    decoder_trigger_i_83_lopt_merged
       (.I0(pcpi_rs1_OBUF[0]),
        .I1(pcpi_rs2_OBUF[0]),
        .I2(pcpi_rs1_OBUF[1]),
        .I3(pcpi_rs2_OBUF[1]),
        .O(decoder_trigger_i_83_n_0));
  FDRE decoder_trigger_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(decoder_trigger_i_1_n_0),
        .Q(decoder_trigger_reg_n_0),
        .R(\<const0> ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_18
       (.CI(decoder_trigger_reg_i_40_n_0),
        .CO({decoder_trigger_reg_i_18_n_0,NLW_decoder_trigger_reg_i_18_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({decoder_trigger_i_41_n_0,decoder_trigger_i_42_n_0,decoder_trigger_i_43_n_0,decoder_trigger_i_44_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_22
       (.CI(decoder_trigger_reg_i_45_n_0),
        .CO({decoder_trigger_reg_i_22_n_0,NLW_decoder_trigger_reg_i_22_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({decoder_trigger_i_32_n_0,decoder_trigger_i_33_n_0,decoder_trigger_i_34_n_0,decoder_trigger_i_35_n_0}),
        .S({decoder_trigger_i_36_n_0,decoder_trigger_i_37_n_0,decoder_trigger_i_38_n_0,decoder_trigger_i_39_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_31
       (.CI(decoder_trigger_reg_i_54_n_0),
        .CO({decoder_trigger_reg_i_31_n_0,NLW_decoder_trigger_reg_i_31_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({decoder_trigger_i_55_n_0,decoder_trigger_i_56_n_0,decoder_trigger_i_57_n_0,decoder_trigger_i_58_n_0}),
        .S({decoder_trigger_i_59_n_0,decoder_trigger_i_60_n_0,decoder_trigger_i_61_n_0,decoder_trigger_i_62_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_40
       (.CI(\<const0> ),
        .CO({decoder_trigger_reg_i_40_n_0,NLW_decoder_trigger_reg_i_40_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const1> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({decoder_trigger_i_63_n_0,decoder_trigger_i_64_n_0,decoder_trigger_i_65_n_0,decoder_trigger_i_66_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_45
       (.CI(decoder_trigger_reg_i_67_n_0),
        .CO({decoder_trigger_reg_i_45_n_0,NLW_decoder_trigger_reg_i_45_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({decoder_trigger_i_55_n_0,decoder_trigger_i_56_n_0,decoder_trigger_i_57_n_0,decoder_trigger_i_58_n_0}),
        .S({decoder_trigger_i_59_n_0,decoder_trigger_i_60_n_0,decoder_trigger_i_61_n_0,decoder_trigger_i_62_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_5
       (.CI(decoder_trigger_reg_i_9_n_0),
        .CO({alu_ltu,NLW_decoder_trigger_reg_i_5_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({decoder_trigger_i_10_n_0,decoder_trigger_i_11_n_0,decoder_trigger_i_12_n_0,decoder_trigger_i_13_n_0}),
        .S({decoder_trigger_i_14_n_0,decoder_trigger_i_15_n_0,decoder_trigger_i_16_n_0,decoder_trigger_i_17_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_54
       (.CI(\<const0> ),
        .CO({decoder_trigger_reg_i_54_n_0,NLW_decoder_trigger_reg_i_54_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({decoder_trigger_i_76_n_0,decoder_trigger_i_77_n_0,decoder_trigger_i_78_n_0,decoder_trigger_i_79_n_0}),
        .S({decoder_trigger_i_80_n_0,decoder_trigger_i_81_n_0,decoder_trigger_i_82_n_0,decoder_trigger_i_83_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_67
       (.CI(\<const0> ),
        .CO({decoder_trigger_reg_i_67_n_0,NLW_decoder_trigger_reg_i_67_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({decoder_trigger_i_76_n_0,decoder_trigger_i_77_n_0,decoder_trigger_i_78_n_0,decoder_trigger_i_79_n_0}),
        .S({decoder_trigger_i_80_n_0,decoder_trigger_i_81_n_0,decoder_trigger_i_82_n_0,decoder_trigger_i_83_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_7
       (.CI(decoder_trigger_reg_i_18_n_0),
        .CO({alu_eq,NLW_decoder_trigger_reg_i_7_CO_UNCONNECTED[1:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({\<const0> ,decoder_trigger_i_19_n_0,decoder_trigger_i_20_n_0,decoder_trigger_i_21_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "MERGE_EQUIVALENT_DRIVERS POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_8
       (.CI(decoder_trigger_reg_i_22_n_0),
        .CO({alu_lts,NLW_decoder_trigger_reg_i_8_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({decoder_trigger_i_23_n_0,decoder_trigger_i_11_n_0,decoder_trigger_i_12_n_0,decoder_trigger_i_13_n_0}),
        .S({decoder_trigger_i_14_n_0,decoder_trigger_i_15_n_0,decoder_trigger_i_16_n_0,decoder_trigger_i_17_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 decoder_trigger_reg_i_9
       (.CI(decoder_trigger_reg_i_31_n_0),
        .CO({decoder_trigger_reg_i_9_n_0,NLW_decoder_trigger_reg_i_9_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({decoder_trigger_i_32_n_0,decoder_trigger_i_33_n_0,decoder_trigger_i_34_n_0,decoder_trigger_i_35_n_0}),
        .S({decoder_trigger_i_36_n_0,decoder_trigger_i_37_n_0,decoder_trigger_i_38_n_0,decoder_trigger_i_39_n_0}));
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
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hAA020202)) 
    i_0_LOPT_REMAP
       (.I0(\i_3/O_n ),
        .I1(instr_rdcycle_i_5_n_0),
        .I2(instr_rdinstr_i_4_n_0),
        .I3(\i_2/O_n ),
        .I4(\i_1/O_n ),
        .O(instr_rdcycle0));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFFFFFFEEEEEEE)) 
    i_0_LOPT_REMAP_1
       (.I0(\i_3/O_n_1 ),
        .I1(\i_1/O_n_1 ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(instr_rdinstr),
        .I4(count_instr_reg[7]),
        .I5(\i_2/O_n_1 ),
        .O(\reg_out[7]_i_2_n_0 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    i_0_LOPT_REMAP_10
       (.I0(\i_3/O_n_6 ),
        .I1(\i_4/O_n_4 ),
        .I2(\i_1/O_n_10 ),
        .I3(\i_2/O_n_9 ),
        .O(reg_out[12]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    i_0_LOPT_REMAP_11
       (.I0(\i_3/O_n_7 ),
        .I1(\i_4/O_n_5 ),
        .I2(\i_1/O_n_11 ),
        .I3(\i_2/O_n_10 ),
        .O(reg_out[11]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    i_0_LOPT_REMAP_12
       (.I0(\i_3/O_n_8 ),
        .I1(\i_4/O_n_6 ),
        .I2(\i_1/O_n_12 ),
        .I3(\i_2/O_n_11 ),
        .O(reg_out[10]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hF0FEF0FEF0FFF0F0)) 
    i_0_LOPT_REMAP_13
       (.I0(mem_do_rinst_i_4_n_0),
        .I1(\i_7/O_n ),
        .I2(\i_1/O_n_13 ),
        .I3(mem_do_rdata_i_2_n_0),
        .I4(mem_do_rinst_reg_n_0),
        .I5(\i_2/O_n_12 ),
        .O(mem_do_rinst_i_1_n_0));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFFFFFEA404040)) 
    i_0_LOPT_REMAP_14
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\i_2/O_n_13 ),
        .I3(reg_op12[23]),
        .I4(\reg_op1[31]_i_7_n_0 ),
        .I5(\i_1/O_n_14 ),
        .O(reg_op1[23]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFFFFFEA404040)) 
    i_0_LOPT_REMAP_15
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\i_2/O_n_14 ),
        .I3(reg_op12[22]),
        .I4(\reg_op1[31]_i_7_n_0 ),
        .I5(\i_1/O_n_15 ),
        .O(reg_op1[22]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFFFFFEA404040)) 
    i_0_LOPT_REMAP_16
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\i_2/O_n_15 ),
        .I3(reg_op12[21]),
        .I4(\reg_op1[31]_i_7_n_0 ),
        .I5(\i_1/O_n_16 ),
        .O(reg_op1[21]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFFFFFEA404040)) 
    i_0_LOPT_REMAP_17
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\i_2/O_n_16 ),
        .I3(reg_op12[20]),
        .I4(\reg_op1[31]_i_7_n_0 ),
        .I5(\i_1/O_n_17 ),
        .O(reg_op1[20]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFFFFFEA404040)) 
    i_0_LOPT_REMAP_18
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\i_2/O_n_17 ),
        .I3(reg_op12[27]),
        .I4(\reg_op1[31]_i_7_n_0 ),
        .I5(\i_1/O_n_18 ),
        .O(reg_op1[27]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFFFFFEA404040)) 
    i_0_LOPT_REMAP_19
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\i_2/O_n_18 ),
        .I3(reg_op12[26]),
        .I4(\reg_op1[31]_i_7_n_0 ),
        .I5(\i_1/O_n_19 ),
        .O(reg_op1[26]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hFFFFC888)) 
    i_0_LOPT_REMAP_2
       (.I0(\reg_sh[1]_i_3_n_0 ),
        .I1(\reg_sh[4]_i_3_n_0 ),
        .I2(is_slli_srli_srai),
        .I3(decoded_imm_j[1]),
        .I4(\i_1/O_n_2 ),
        .O(reg_sh[1]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFFFFFEA404040)) 
    i_0_LOPT_REMAP_20
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\i_2/O_n_19 ),
        .I3(reg_op12[25]),
        .I4(\reg_op1[31]_i_7_n_0 ),
        .I5(\i_1/O_n_20 ),
        .O(reg_op1[25]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFFFFFEA404040)) 
    i_0_LOPT_REMAP_21
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\i_2/O_n_20 ),
        .I3(reg_op12[24]),
        .I4(\reg_op1[31]_i_7_n_0 ),
        .I5(\i_1/O_n_21 ),
        .O(reg_op1[24]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFFFFFFE0E0E0E)) 
    i_0_LOPT_REMAP_22
       (.I0(\i_2/O_n_21 ),
        .I1(\i_3/O_n_10 ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(\reg_pc_reg_n_0_[31] ),
        .I4(\reg_op1[31]_i_6_n_0 ),
        .I5(\i_1/O_n_22 ),
        .O(reg_op1[31]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF4440)) 
    i_0_LOPT_REMAP_23
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\i_2/O_n_22 ),
        .I3(\i_3/O_n_11 ),
        .I4(\i_4/O_n_8 ),
        .I5(\i_1/O_n_23 ),
        .O(reg_op1[30]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF4440)) 
    i_0_LOPT_REMAP_24
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\i_2/O_n_23 ),
        .I3(\i_3/O_n_12 ),
        .I4(\i_4/O_n_9 ),
        .I5(\i_1/O_n_24 ),
        .O(reg_op1[29]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF4440)) 
    i_0_LOPT_REMAP_25
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\i_2/O_n_24 ),
        .I3(\i_3/O_n_13 ),
        .I4(\i_4/O_n_10 ),
        .I5(\i_1/O_n_25 ),
        .O(reg_op1[28]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFFFFFEA404040)) 
    i_0_LOPT_REMAP_3
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\i_2/O_n_2 ),
        .I3(reg_op12[1]),
        .I4(\reg_op1[31]_i_7_n_0 ),
        .I5(\i_1/O_n_3 ),
        .O(reg_op1[1]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFFFFFEA404040)) 
    i_0_LOPT_REMAP_4
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\i_2/O_n_3 ),
        .I3(reg_op12[3]),
        .I4(\reg_op1[31]_i_7_n_0 ),
        .I5(\i_1/O_n_4 ),
        .O(reg_op1[3]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFFFFFEA404040)) 
    i_0_LOPT_REMAP_5
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\i_2/O_n_4 ),
        .I3(reg_op12[2]),
        .I4(\reg_op1[31]_i_7_n_0 ),
        .I5(\i_1/O_n_5 ),
        .O(reg_op1[2]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    i_0_LOPT_REMAP_6
       (.I0(\i_3/O_n_2 ),
        .I1(\i_4/O_n ),
        .I2(\i_1/O_n_6 ),
        .I3(\i_2/O_n_5 ),
        .O(reg_out[9]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    i_0_LOPT_REMAP_7
       (.I0(\i_3/O_n_3 ),
        .I1(\i_4/O_n_1 ),
        .I2(\i_1/O_n_7 ),
        .I3(\i_2/O_n_6 ),
        .O(reg_out[8]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    i_0_LOPT_REMAP_8
       (.I0(\i_3/O_n_4 ),
        .I1(\i_4/O_n_2 ),
        .I2(\i_1/O_n_8 ),
        .I3(\i_2/O_n_7 ),
        .O(reg_out[14]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    i_0_LOPT_REMAP_9
       (.I0(\i_3/O_n_5 ),
        .I1(\i_4/O_n_3 ),
        .I2(\i_1/O_n_9 ),
        .I3(\i_2/O_n_8 ),
        .O(reg_out[13]));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    i_1_LOPT_REMAP
       (.I0(\mem_rdata_q_reg_n_0_[16] ),
        .I1(\mem_rdata_q_reg_n_0_[17] ),
        .I2(\mem_rdata_q_reg_n_0_[18] ),
        .I3(\mem_rdata_q_reg_n_0_[19] ),
        .O(\i_1/O_n ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT3 #(
    .INIT(8'h80)) 
    i_1_LOPT_REMAP_1
       (.I0(count_cycle_reg[7]),
        .I1(instr_rdcycle),
        .I2(\cpu_state_reg_n_0_[5] ),
        .O(\i_1/O_n_1 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    i_1_LOPT_REMAP_10
       (.I0(\cpu_state_reg_n_0_[3] ),
        .I1(\reg_out_reg[12]_i_2_n_4 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(pcpi_rs1_OBUF[12]),
        .O(\i_1/O_n_10 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    i_1_LOPT_REMAP_11
       (.I0(\cpu_state_reg_n_0_[3] ),
        .I1(\reg_out_reg[12]_i_2_n_5 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(pcpi_rs1_OBUF[11]),
        .O(\i_1/O_n_11 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    i_1_LOPT_REMAP_12
       (.I0(\cpu_state_reg_n_0_[3] ),
        .I1(\reg_out_reg[12]_i_2_n_6 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(pcpi_rs1_OBUF[10]),
        .O(\i_1/O_n_12 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFF0000FFE40000)) 
    i_1_LOPT_REMAP_13
       (.I0(alu_ltu),
        .I1(instr_bgeu),
        .I2(is_sltiu_bltu_sltu),
        .I3(decoder_trigger_i_6_n_0),
        .I4(mem_do_rinst_i_6_n_0),
        .I5(decoder_trigger_i_4_n_0),
        .O(\i_1/O_n_13 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'h80808F80)) 
    i_1_LOPT_REMAP_14
       (.I0(\reg_op1[31]_i_6_n_0 ),
        .I1(\reg_pc_reg_n_0_[23] ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(\reg_op1_reg[23]_i_5_n_4 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .O(\i_1/O_n_14 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'h80808F80)) 
    i_1_LOPT_REMAP_15
       (.I0(\reg_op1[31]_i_6_n_0 ),
        .I1(\reg_pc_reg_n_0_[22] ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(\reg_op1_reg[23]_i_5_n_5 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .O(\i_1/O_n_15 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'h80808F80)) 
    i_1_LOPT_REMAP_16
       (.I0(\reg_op1[31]_i_6_n_0 ),
        .I1(\reg_pc_reg_n_0_[21] ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(\reg_op1_reg[23]_i_5_n_6 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .O(\i_1/O_n_16 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'h80808F80)) 
    i_1_LOPT_REMAP_17
       (.I0(\reg_op1[31]_i_6_n_0 ),
        .I1(\reg_pc_reg_n_0_[20] ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(\reg_op1_reg[23]_i_5_n_7 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .O(\i_1/O_n_17 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'h80808F80)) 
    i_1_LOPT_REMAP_18
       (.I0(\reg_op1[31]_i_6_n_0 ),
        .I1(\reg_pc_reg_n_0_[27] ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(\reg_op1_reg[27]_i_5_n_4 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .O(\i_1/O_n_18 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'h80808F80)) 
    i_1_LOPT_REMAP_19
       (.I0(\reg_op1[31]_i_6_n_0 ),
        .I1(\reg_pc_reg_n_0_[26] ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(\reg_op1_reg[27]_i_5_n_5 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .O(\i_1/O_n_19 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hC0C0C0C0C0C0C090)) 
    i_1_LOPT_REMAP_2
       (.I0(\reg_sh_reg_n_0_[3] ),
        .I1(\reg_sh_reg_n_0_[1] ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\reg_sh_reg_n_0_[0] ),
        .I4(\reg_sh_reg_n_0_[2] ),
        .I5(\reg_sh_reg_n_0_[4] ),
        .O(\i_1/O_n_2 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'h80808F80)) 
    i_1_LOPT_REMAP_20
       (.I0(\reg_op1[31]_i_6_n_0 ),
        .I1(\reg_pc_reg_n_0_[25] ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(\reg_op1_reg[27]_i_5_n_6 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .O(\i_1/O_n_20 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'h80808F80)) 
    i_1_LOPT_REMAP_21
       (.I0(\reg_op1[31]_i_6_n_0 ),
        .I1(\reg_pc_reg_n_0_[24] ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(\reg_op1_reg[27]_i_5_n_7 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .O(\i_1/O_n_21 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT3 #(
    .INIT(8'h80)) 
    i_1_LOPT_REMAP_22
       (.I0(reg_op12[31]),
        .I1(\reg_op1[31]_i_7_n_0 ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .O(\i_1/O_n_22 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'h80808F80)) 
    i_1_LOPT_REMAP_23
       (.I0(\reg_op1[31]_i_6_n_0 ),
        .I1(\reg_pc_reg_n_0_[30] ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(\reg_op1_reg[31]_i_11_n_5 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .O(\i_1/O_n_23 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'h80808F80)) 
    i_1_LOPT_REMAP_24
       (.I0(\reg_op1[31]_i_6_n_0 ),
        .I1(\reg_pc_reg_n_0_[29] ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(\reg_op1_reg[31]_i_11_n_6 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .O(\i_1/O_n_24 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'h80808F80)) 
    i_1_LOPT_REMAP_25
       (.I0(\reg_op1[31]_i_6_n_0 ),
        .I1(\reg_pc_reg_n_0_[28] ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(\reg_op1_reg[31]_i_11_n_7 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .O(\i_1/O_n_25 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'h80808F80)) 
    i_1_LOPT_REMAP_3
       (.I0(\reg_op1[31]_i_6_n_0 ),
        .I1(\reg_pc_reg_n_0_[1] ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(\reg_op1_reg[3]_i_4_n_6 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .O(\i_1/O_n_3 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'h80808F80)) 
    i_1_LOPT_REMAP_4
       (.I0(\reg_op1[31]_i_6_n_0 ),
        .I1(\reg_pc_reg_n_0_[3] ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(\reg_op1_reg[3]_i_4_n_4 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .O(\i_1/O_n_4 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'h80808F80)) 
    i_1_LOPT_REMAP_5
       (.I0(\reg_op1[31]_i_6_n_0 ),
        .I1(\reg_pc_reg_n_0_[2] ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(\reg_op1_reg[3]_i_4_n_5 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .O(\i_1/O_n_5 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    i_1_LOPT_REMAP_6
       (.I0(\cpu_state_reg_n_0_[3] ),
        .I1(\reg_out_reg[12]_i_2_n_7 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(pcpi_rs1_OBUF[9]),
        .O(\i_1/O_n_6 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    i_1_LOPT_REMAP_7
       (.I0(\cpu_state_reg_n_0_[3] ),
        .I1(\reg_out_reg[8]_i_2_n_4 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(pcpi_rs1_OBUF[8]),
        .O(\i_1/O_n_7 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    i_1_LOPT_REMAP_8
       (.I0(\cpu_state_reg_n_0_[3] ),
        .I1(\reg_out_reg[14]_i_2_n_6 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(pcpi_rs1_OBUF[14]),
        .O(\i_1/O_n_8 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    i_1_LOPT_REMAP_9
       (.I0(\cpu_state_reg_n_0_[3] ),
        .I1(\reg_out_reg[14]_i_2_n_7 ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(pcpi_rs1_OBUF[13]),
        .O(\i_1/O_n_9 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    i_2_LOPT_REMAP
       (.I0(\mem_rdata_q_reg_n_0_[21] ),
        .I1(\mem_rdata_q_reg_n_0_[20] ),
        .I2(\mem_rdata_q_reg_n_0_[22] ),
        .I3(\mem_rdata_q_reg_n_0_[23] ),
        .O(\i_2/O_n ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hF0808080)) 
    i_2_LOPT_REMAP_1
       (.I0(instr_rdinstrh),
        .I1(count_instr_reg[39]),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(instr_rdcycleh),
        .I4(count_cycle_reg[39]),
        .O(\i_2/O_n_1 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFF0000B8000000)) 
    i_2_LOPT_REMAP_10
       (.I0(mem_rdata_IBUF[11]),
        .I1(\reg_out[31]_i_7_n_0 ),
        .I2(mem_rdata_IBUF[27]),
        .I3(\reg_out[14]_i_10_n_0 ),
        .I4(\cpu_state_reg_n_0_[0] ),
        .I5(\reg_out[31]_i_8_n_0 ),
        .O(\i_2/O_n_10 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFF0000B8000000)) 
    i_2_LOPT_REMAP_11
       (.I0(mem_rdata_IBUF[10]),
        .I1(\reg_out[31]_i_7_n_0 ),
        .I2(mem_rdata_IBUF[26]),
        .I3(\reg_out[14]_i_10_n_0 ),
        .I4(\cpu_state_reg_n_0_[0] ),
        .I5(\reg_out[31]_i_8_n_0 ),
        .O(\i_2/O_n_11 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFE0E0FFE0E0E0)) 
    i_2_LOPT_REMAP_12
       (.I0(reg_next_pc),
        .I1(\i_5/O_n ),
        .I2(resetn_IBUF),
        .I3(\i_6/O_n ),
        .I4(\i_3/O_n_9 ),
        .I5(\i_4/O_n_7 ),
        .O(\i_2/O_n_12 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    i_2_LOPT_REMAP_13
       (.I0(\reg_op1[23]_i_4_n_0 ),
        .I1(\reg_op1[31]_i_10_n_0 ),
        .I2(pcpi_rs1_OBUF[19]),
        .I3(\reg_op1[0]_i_4_n_0 ),
        .I4(pcpi_rs1_OBUF[27]),
        .O(\i_2/O_n_13 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    i_2_LOPT_REMAP_14
       (.I0(\reg_op1[22]_i_4_n_0 ),
        .I1(\reg_op1[31]_i_10_n_0 ),
        .I2(pcpi_rs1_OBUF[18]),
        .I3(\reg_op1[0]_i_4_n_0 ),
        .I4(pcpi_rs1_OBUF[26]),
        .O(\i_2/O_n_14 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    i_2_LOPT_REMAP_15
       (.I0(\reg_op1[21]_i_4_n_0 ),
        .I1(\reg_op1[31]_i_10_n_0 ),
        .I2(pcpi_rs1_OBUF[17]),
        .I3(\reg_op1[0]_i_4_n_0 ),
        .I4(pcpi_rs1_OBUF[25]),
        .O(\i_2/O_n_15 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    i_2_LOPT_REMAP_16
       (.I0(\reg_op1[20]_i_4_n_0 ),
        .I1(\reg_op1[31]_i_10_n_0 ),
        .I2(pcpi_rs1_OBUF[16]),
        .I3(\reg_op1[0]_i_4_n_0 ),
        .I4(pcpi_rs1_OBUF[24]),
        .O(\i_2/O_n_16 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    i_2_LOPT_REMAP_17
       (.I0(\reg_op1[27]_i_4_n_0 ),
        .I1(\reg_op1[31]_i_10_n_0 ),
        .I2(pcpi_rs1_OBUF[23]),
        .I3(\reg_op1[0]_i_4_n_0 ),
        .I4(pcpi_rs1_OBUF[31]),
        .O(\i_2/O_n_17 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    i_2_LOPT_REMAP_18
       (.I0(\reg_op1[26]_i_4_n_0 ),
        .I1(\reg_op1[31]_i_10_n_0 ),
        .I2(pcpi_rs1_OBUF[22]),
        .I3(\reg_op1[0]_i_4_n_0 ),
        .I4(pcpi_rs1_OBUF[30]),
        .O(\i_2/O_n_18 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    i_2_LOPT_REMAP_19
       (.I0(\reg_op1[25]_i_4_n_0 ),
        .I1(\reg_op1[31]_i_10_n_0 ),
        .I2(pcpi_rs1_OBUF[21]),
        .I3(\reg_op1[0]_i_4_n_0 ),
        .I4(pcpi_rs1_OBUF[29]),
        .O(\i_2/O_n_19 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    i_2_LOPT_REMAP_2
       (.I0(pcpi_rs1_OBUF[0]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[2]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .I4(pcpi_rs1_OBUF[5]),
        .I5(\reg_op1[0]_i_4_n_0 ),
        .O(\i_2/O_n_2 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    i_2_LOPT_REMAP_20
       (.I0(\reg_op1[24]_i_4_n_0 ),
        .I1(\reg_op1[31]_i_10_n_0 ),
        .I2(pcpi_rs1_OBUF[20]),
        .I3(\reg_op1[0]_i_4_n_0 ),
        .I4(pcpi_rs1_OBUF[28]),
        .O(\i_2/O_n_20 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    i_2_LOPT_REMAP_21
       (.I0(\reg_op1[31]_i_13_n_0 ),
        .I1(pcpi_rs1_OBUF[30]),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\reg_op1_reg[31]_i_11_n_4 ),
        .O(\i_2/O_n_21 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    i_2_LOPT_REMAP_22
       (.I0(pcpi_rs1_OBUF[26]),
        .I1(\reg_op1[31]_i_10_n_0 ),
        .I2(\reg_op1[31]_i_13_n_0 ),
        .I3(pcpi_rs1_OBUF[29]),
        .O(\i_2/O_n_22 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    i_2_LOPT_REMAP_23
       (.I0(pcpi_rs1_OBUF[25]),
        .I1(\reg_op1[31]_i_10_n_0 ),
        .I2(\reg_op1[31]_i_13_n_0 ),
        .I3(pcpi_rs1_OBUF[28]),
        .O(\i_2/O_n_23 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    i_2_LOPT_REMAP_24
       (.I0(pcpi_rs1_OBUF[24]),
        .I1(\reg_op1[31]_i_10_n_0 ),
        .I2(\reg_op1[0]_i_3_n_0 ),
        .I3(pcpi_rs1_OBUF[29]),
        .O(\i_2/O_n_24 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    i_2_LOPT_REMAP_3
       (.I0(pcpi_rs1_OBUF[2]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[4]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .I4(pcpi_rs1_OBUF[7]),
        .I5(\reg_op1[0]_i_4_n_0 ),
        .O(\i_2/O_n_3 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    i_2_LOPT_REMAP_4
       (.I0(pcpi_rs1_OBUF[1]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[3]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .I4(pcpi_rs1_OBUF[6]),
        .I5(\reg_op1[0]_i_4_n_0 ),
        .O(\i_2/O_n_4 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFF0000B8000000)) 
    i_2_LOPT_REMAP_5
       (.I0(mem_rdata_IBUF[9]),
        .I1(\reg_out[31]_i_7_n_0 ),
        .I2(mem_rdata_IBUF[25]),
        .I3(\reg_out[14]_i_10_n_0 ),
        .I4(\cpu_state_reg_n_0_[0] ),
        .I5(\reg_out[31]_i_8_n_0 ),
        .O(\i_2/O_n_5 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFF0000B8000000)) 
    i_2_LOPT_REMAP_6
       (.I0(mem_rdata_IBUF[8]),
        .I1(\reg_out[31]_i_7_n_0 ),
        .I2(mem_rdata_IBUF[24]),
        .I3(\reg_out[14]_i_10_n_0 ),
        .I4(\cpu_state_reg_n_0_[0] ),
        .I5(\reg_out[31]_i_8_n_0 ),
        .O(\i_2/O_n_6 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFF0000B8000000)) 
    i_2_LOPT_REMAP_7
       (.I0(mem_rdata_IBUF[14]),
        .I1(\reg_out[31]_i_7_n_0 ),
        .I2(mem_rdata_IBUF[30]),
        .I3(\reg_out[14]_i_10_n_0 ),
        .I4(\cpu_state_reg_n_0_[0] ),
        .I5(\reg_out[31]_i_8_n_0 ),
        .O(\i_2/O_n_7 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFF0000B8000000)) 
    i_2_LOPT_REMAP_8
       (.I0(mem_rdata_IBUF[13]),
        .I1(\reg_out[31]_i_7_n_0 ),
        .I2(mem_rdata_IBUF[29]),
        .I3(\reg_out[14]_i_10_n_0 ),
        .I4(\cpu_state_reg_n_0_[0] ),
        .I5(\reg_out[31]_i_8_n_0 ),
        .O(\i_2/O_n_8 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFF0000B8000000)) 
    i_2_LOPT_REMAP_9
       (.I0(mem_rdata_IBUF[12]),
        .I1(\reg_out[31]_i_7_n_0 ),
        .I2(mem_rdata_IBUF[28]),
        .I3(\reg_out[14]_i_10_n_0 ),
        .I4(\cpu_state_reg_n_0_[0] ),
        .I5(\reg_out[31]_i_8_n_0 ),
        .O(\i_2/O_n_9 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    i_3_LOPT_REMAP
       (.I0(instr_rdinstrh_i_5_n_0),
        .I1(\mem_rdata_q_reg_n_0_[30] ),
        .I2(p_0_in[2]),
        .I3(instr_rdcycle_i_4_n_0),
        .I4(instr_rdcycleh_i_4_n_0),
        .I5(\mem_rdata_q_reg_n_0_[15] ),
        .O(\i_3/O_n ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'h88888880)) 
    i_3_LOPT_REMAP_1
       (.I0(mem_rdata_word),
        .I1(\cpu_state_reg_n_0_[0] ),
        .I2(latched_is_lb_reg_n_0),
        .I3(latched_is_lh_reg_n_0),
        .I4(latched_is_lu_reg_n_0),
        .O(\i_3/O_n_1 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFF00E000E000E000)) 
    i_3_LOPT_REMAP_10
       (.I0(instr_sra),
        .I1(instr_srai),
        .I2(pcpi_rs1_OBUF[31]),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\reg_op1[31]_i_10_n_0 ),
        .I5(pcpi_rs1_OBUF[27]),
        .O(\i_3/O_n_10 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hFF00E000)) 
    i_3_LOPT_REMAP_11
       (.I0(instr_srai),
        .I1(instr_sra),
        .I2(\reg_op1[0]_i_5_n_0 ),
        .I3(pcpi_rs1_OBUF[31]),
        .I4(\reg_op1[0]_i_3_n_0 ),
        .O(\i_3/O_n_11 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFE000E000E000)) 
    i_3_LOPT_REMAP_12
       (.I0(instr_srai),
        .I1(instr_sra),
        .I2(pcpi_rs1_OBUF[31]),
        .I3(\reg_op1[0]_i_5_n_0 ),
        .I4(\reg_op1[0]_i_3_n_0 ),
        .I5(pcpi_rs1_OBUF[30]),
        .O(\i_3/O_n_12 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFFE000E000E000)) 
    i_3_LOPT_REMAP_13
       (.I0(instr_srai),
        .I1(instr_sra),
        .I2(pcpi_rs1_OBUF[31]),
        .I3(\reg_op1[0]_i_5_n_0 ),
        .I4(\reg_op1[31]_i_13_n_0 ),
        .I5(pcpi_rs1_OBUF[27]),
        .O(\i_3/O_n_13 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hF0808080)) 
    i_3_LOPT_REMAP_2
       (.I0(instr_rdinstr),
        .I1(count_instr_reg[9]),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[9]),
        .O(\i_3/O_n_2 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hF0808080)) 
    i_3_LOPT_REMAP_3
       (.I0(instr_rdinstr),
        .I1(count_instr_reg[8]),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[8]),
        .O(\i_3/O_n_3 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hF0808080)) 
    i_3_LOPT_REMAP_4
       (.I0(instr_rdinstr),
        .I1(count_instr_reg[14]),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[14]),
        .O(\i_3/O_n_4 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hF0808080)) 
    i_3_LOPT_REMAP_5
       (.I0(instr_rdinstr),
        .I1(count_instr_reg[13]),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[13]),
        .O(\i_3/O_n_5 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hF0808080)) 
    i_3_LOPT_REMAP_6
       (.I0(instr_rdinstr),
        .I1(count_instr_reg[12]),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[12]),
        .O(\i_3/O_n_6 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hF0808080)) 
    i_3_LOPT_REMAP_7
       (.I0(instr_rdinstr),
        .I1(count_instr_reg[11]),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[11]),
        .O(\i_3/O_n_7 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hF0808080)) 
    i_3_LOPT_REMAP_8
       (.I0(instr_rdinstr),
        .I1(count_instr_reg[10]),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[10]),
        .O(\i_3/O_n_8 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'h00FD00FF)) 
    i_3_LOPT_REMAP_9
       (.I0(\cpu_state[7]_i_11_n_0 ),
        .I1(\cpu_state[7]_i_10_n_0 ),
        .I2(\cpu_state[7]_i_13_n_0 ),
        .I3(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .I4(\cpu_state[7]_i_12_n_0 ),
        .O(\i_3/O_n_9 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hF0808080)) 
    i_4_LOPT_REMAP
       (.I0(instr_rdcycleh),
        .I1(count_cycle_reg[41]),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(instr_rdinstrh),
        .I4(count_instr_reg[41]),
        .O(\i_4/O_n ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hF0808080)) 
    i_4_LOPT_REMAP_1
       (.I0(instr_rdcycleh),
        .I1(count_cycle_reg[40]),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(instr_rdinstrh),
        .I4(count_instr_reg[40]),
        .O(\i_4/O_n_1 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT3 #(
    .INIT(8'h80)) 
    i_4_LOPT_REMAP_10
       (.I0(reg_op12[28]),
        .I1(\reg_op1[31]_i_7_n_0 ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .O(\i_4/O_n_10 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hF0808080)) 
    i_4_LOPT_REMAP_2
       (.I0(instr_rdcycleh),
        .I1(count_cycle_reg[46]),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(instr_rdinstrh),
        .I4(count_instr_reg[46]),
        .O(\i_4/O_n_2 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hF0808080)) 
    i_4_LOPT_REMAP_3
       (.I0(instr_rdcycleh),
        .I1(count_cycle_reg[45]),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(instr_rdinstrh),
        .I4(count_instr_reg[45]),
        .O(\i_4/O_n_3 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hF0808080)) 
    i_4_LOPT_REMAP_4
       (.I0(instr_rdcycleh),
        .I1(count_cycle_reg[44]),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(instr_rdinstrh),
        .I4(count_instr_reg[44]),
        .O(\i_4/O_n_4 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hF0808080)) 
    i_4_LOPT_REMAP_5
       (.I0(instr_rdcycleh),
        .I1(count_cycle_reg[43]),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(instr_rdinstrh),
        .I4(count_instr_reg[43]),
        .O(\i_4/O_n_5 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hF0808080)) 
    i_4_LOPT_REMAP_6
       (.I0(instr_rdcycleh),
        .I1(count_cycle_reg[42]),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(instr_rdinstrh),
        .I4(count_instr_reg[42]),
        .O(\i_4/O_n_6 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT3 #(
    .INIT(8'h80)) 
    i_4_LOPT_REMAP_7
       (.I0(mem_do_rinst_i_9_n_0),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(resetn_IBUF),
        .O(\i_4/O_n_7 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT3 #(
    .INIT(8'h80)) 
    i_4_LOPT_REMAP_8
       (.I0(reg_op12[30]),
        .I1(\reg_op1[31]_i_7_n_0 ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .O(\i_4/O_n_8 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT3 #(
    .INIT(8'h80)) 
    i_4_LOPT_REMAP_9
       (.I0(reg_op12[29]),
        .I1(\reg_op1[31]_i_7_n_0 ),
        .I2(\cpu_state_reg_n_0_[5] ),
        .O(\i_4/O_n_9 ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    i_5_LOPT_REMAP
       (.I0(\reg_sh_reg_n_0_[0] ),
        .I1(\reg_sh_reg_n_0_[1] ),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\reg_sh_reg_n_0_[2] ),
        .I4(\reg_sh_reg_n_0_[4] ),
        .I5(\reg_sh_reg_n_0_[3] ),
        .O(\i_5/O_n ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT3 #(
    .INIT(8'h80)) 
    i_6_LOPT_REMAP
       (.I0(mem_do_rinst_i_8_n_0),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(resetn_IBUF),
        .O(\i_6/O_n ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT6 #(
    .INIT(64'hFFFF000040440000)) 
    i_7_LOPT_REMAP
       (.I0(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .I1(mem_do_rinst_i_8_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(is_lui_auipc_jal),
        .I4(\i_8/O_n ),
        .I5(\i_9/O_n ),
        .O(\i_7/O_n ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT5 #(
    .INIT(32'hFD00FF00)) 
    i_8_LOPT_REMAP
       (.I0(\cpu_state[7]_i_11_n_0 ),
        .I1(\cpu_state[7]_i_10_n_0 ),
        .I2(\cpu_state[7]_i_13_n_0 ),
        .I3(\cpu_state_reg_n_0_[5] ),
        .I4(\cpu_state[7]_i_12_n_0 ),
        .O(\i_8/O_n ));
  (* OPT_MODIFIED = "REMAP" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    i_9_LOPT_REMAP
       (.I0(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .I1(mem_do_rinst_i_8_n_0),
        .I2(mem_do_rinst_i_12_n_0),
        .I3(mem_do_rinst_i_13_n_0),
        .O(\i_9/O_n ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00020000)) 
    instr_add_i_1
       (.I0(is_alu_reg_reg),
        .I1(p_0_in[2]),
        .I2(p_0_in[1]),
        .I3(p_0_in[0]),
        .I4(instr_slli1),
        .O(instr_add0));
  FDRE instr_add_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_add0),
        .Q(instr_add),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    instr_addi_i_1
       (.I0(is_alu_reg_imm),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .I3(p_0_in[2]),
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
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    instr_and_i_2
       (.I0(instr_slli1),
        .I1(is_alu_reg_reg),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .I4(p_0_in[2]),
        .O(instr_and0));
  FDRE instr_and_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_and0),
        .Q(instr_and),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    instr_andi_i_1
       (.I0(is_alu_reg_imm),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .I3(p_0_in[2]),
        .O(instr_andi0));
  FDRE instr_andi_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_andi0),
        .Q(instr_andi),
        .R(instr_and_i_1_n_0));
  LUT6 #(
    .INIT(64'h000000008AAA8000)) 
    instr_auipc_i_1
       (.I0(instr_auipc_i_2_n_0),
        .I1(mem_rdata_IBUF[2]),
        .I2(mem_ready_IBUF),
        .I3(mem_valid_OBUF),
        .I4(\mem_rdata_q_reg_n_0_[2] ),
        .I5(instr_auipc_i_3_n_0),
        .O(instr_auipc_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000440347)) 
    instr_auipc_i_2
       (.I0(mem_rdata_IBUF[6]),
        .I1(mem_xfer),
        .I2(\mem_rdata_q_reg_n_0_[6] ),
        .I3(mem_rdata_IBUF[5]),
        .I4(\mem_rdata_q_reg_n_0_[5] ),
        .I5(\mem_rdata_q[3]_i_1_n_0 ),
        .O(instr_auipc_i_2_n_0));
  LUT6 #(
    .INIT(64'h47CF77FFFFFFFFFF)) 
    instr_auipc_i_3
       (.I0(mem_rdata_IBUF[1]),
        .I1(mem_xfer),
        .I2(\mem_rdata_q_reg_n_0_[1] ),
        .I3(mem_rdata_IBUF[0]),
        .I4(\mem_rdata_q_reg_n_0_[0] ),
        .I5(\mem_rdata_q[4]_i_1_n_0 ),
        .O(instr_auipc_i_3_n_0));
  FDRE instr_auipc_reg
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(instr_auipc_i_1_n_0),
        .Q(instr_auipc),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    instr_beq_i_1
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .I3(p_0_in[2]),
        .O(instr_beq0));
  FDRE instr_beq_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_beq0),
        .Q(instr_beq),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    instr_bge_i_1
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(p_0_in[0]),
        .I2(p_0_in[2]),
        .I3(p_0_in[1]),
        .O(instr_bge0));
  FDRE instr_bge_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_bge0),
        .Q(instr_bge),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    instr_bgeu_i_1
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .I3(p_0_in[2]),
        .O(instr_bgeu0));
  FDRE instr_bgeu_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_bgeu0),
        .Q(instr_bgeu),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    instr_bltu_i_1
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .I3(p_0_in[2]),
        .O(instr_bltu0));
  FDRE instr_bltu_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_bltu0),
        .Q(instr_bltu),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    instr_bne_i_1
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .I3(p_0_in[2]),
        .O(instr_bne0));
  FDRE instr_bne_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_bne0),
        .Q(instr_bne),
        .R(instr_and_i_1_n_0));
  LUT6 #(
    .INIT(64'hA808000000000000)) 
    instr_jal_i_1
       (.I0(instr_jal_i_2_n_0),
        .I1(\mem_rdata_q_reg_n_0_[2] ),
        .I2(mem_xfer),
        .I3(mem_rdata_IBUF[2]),
        .I4(\mem_rdata_q[3]_i_1_n_0 ),
        .I5(is_sb_sh_sw_i_5_n_0),
        .O(instr_jal_i_1_n_0));
  LUT6 #(
    .INIT(64'hCCA0A0A000A0A0A0)) 
    instr_jal_i_2
       (.I0(\mem_rdata_q_reg_n_0_[5] ),
        .I1(mem_rdata_IBUF[5]),
        .I2(\mem_rdata_q_reg_n_0_[6] ),
        .I3(mem_valid_OBUF),
        .I4(mem_ready_IBUF),
        .I5(mem_rdata_IBUF[6]),
        .O(instr_jal_i_2_n_0));
  FDRE instr_jal_reg
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(instr_jal_i_1_n_0),
        .Q(instr_jal),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h0000000000100000)) 
    instr_jalr_i_1
       (.I0(\mem_rdata_q[13]_i_1_n_0 ),
        .I1(\mem_rdata_q[14]_i_1_n_0 ),
        .I2(instr_jalr_i_2_n_0),
        .I3(instr_jalr_i_3_n_0),
        .I4(\mem_rdata_q[2]_i_1_n_0 ),
        .I5(\mem_rdata_q[3]_i_1_n_0 ),
        .O(instr_jalr0));
  LUT6 #(
    .INIT(64'h0000470000000000)) 
    instr_jalr_i_2
       (.I0(mem_rdata_IBUF[12]),
        .I1(mem_xfer),
        .I2(p_0_in[0]),
        .I3(\mem_rdata_q[6]_i_1_n_0 ),
        .I4(\mem_rdata_q[4]_i_1_n_0 ),
        .I5(\mem_rdata_q[5]_i_1_n_0 ),
        .O(instr_jalr_i_2_n_0));
  LUT6 #(
    .INIT(64'h335F5F5FFF5F5F5F)) 
    instr_jalr_i_3
       (.I0(\mem_rdata_q_reg_n_0_[0] ),
        .I1(mem_rdata_IBUF[0]),
        .I2(\mem_rdata_q_reg_n_0_[1] ),
        .I3(mem_valid_OBUF),
        .I4(mem_ready_IBUF),
        .I5(mem_rdata_IBUF[1]),
        .O(instr_jalr_i_3_n_0));
  FDRE instr_jalr_reg
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(instr_jalr0),
        .Q(instr_jalr),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'h01)) 
    instr_lb_i_1
       (.I0(p_0_in[2]),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .O(instr_beq1));
  FDRE instr_lb_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_beq1),
        .Q(instr_lb),
        .R(instr_lhu_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'h04)) 
    instr_lbu_i_1
       (.I0(p_0_in[1]),
        .I1(p_0_in[2]),
        .I2(p_0_in[0]),
        .O(instr_blt1));
  FDRE instr_lbu_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_blt1),
        .Q(instr_lbu),
        .R(instr_lhu_i_1_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    instr_lh_i_1
       (.I0(p_0_in[2]),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .O(instr_bne1));
  FDRE instr_lh_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_bne1),
        .Q(instr_lh),
        .R(instr_lhu_i_1_n_0));
  LUT3 #(
    .INIT(8'h04)) 
    instr_lhu_i_1
       (.I0(decoder_pseudo_trigger_reg_n_0),
        .I1(decoder_trigger_reg_n_0),
        .I2(is_lb_lh_lw_lbu_lhu),
        .O(instr_lhu_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'h40)) 
    instr_lhu_i_2
       (.I0(p_0_in[1]),
        .I1(p_0_in[2]),
        .I2(p_0_in[0]),
        .O(instr_bge1));
  FDRE instr_lhu_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_bge1),
        .Q(instr_lhu),
        .R(instr_lhu_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000047000000)) 
    instr_lui_i_1
       (.I0(mem_rdata_IBUF[3]),
        .I1(mem_xfer),
        .I2(\mem_rdata_q_reg_n_0_[3] ),
        .I3(instr_lui_i_2_n_0),
        .I4(\mem_rdata_q[2]_i_1_n_0 ),
        .I5(instr_auipc_i_3_n_0),
        .O(instr_lui_i_1_n_0));
  LUT6 #(
    .INIT(64'h000A0A0ACC0A0A0A)) 
    instr_lui_i_2
       (.I0(\mem_rdata_q_reg_n_0_[5] ),
        .I1(mem_rdata_IBUF[5]),
        .I2(\mem_rdata_q_reg_n_0_[6] ),
        .I3(mem_valid_OBUF),
        .I4(mem_ready_IBUF),
        .I5(mem_rdata_IBUF[6]),
        .O(instr_lui_i_2_n_0));
  FDRE instr_lui_reg
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(instr_lui_i_1_n_0),
        .Q(instr_lui),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'h04)) 
    instr_lw_i_1
       (.I0(p_0_in[2]),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .O(instr_lw1));
  FDRE instr_lw_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_lw1),
        .Q(instr_lw),
        .R(instr_lhu_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h08000000)) 
    instr_or_i_1
       (.I0(instr_slli1),
        .I1(is_alu_reg_reg),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .I4(p_0_in[2]),
        .O(instr_or0));
  FDRE instr_or_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_or0),
        .Q(instr_or),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    instr_ori_i_1
       (.I0(is_alu_reg_imm),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .I3(p_0_in[2]),
        .O(instr_ori0));
  FDRE instr_ori_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_ori0),
        .Q(instr_ori),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    instr_rdcycle_i_4
       (.I0(\mem_rdata_q_reg_n_0_[27] ),
        .I1(\mem_rdata_q_reg_n_0_[25] ),
        .I2(\mem_rdata_q_reg_n_0_[26] ),
        .I3(\mem_rdata_q_reg_n_0_[24] ),
        .O(instr_rdcycle_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    instr_rdcycle_i_5
       (.I0(\mem_rdata_q_reg_n_0_[20] ),
        .I1(\mem_rdata_q_reg_n_0_[23] ),
        .I2(\mem_rdata_q_reg_n_0_[22] ),
        .I3(\mem_rdata_q_reg_n_0_[21] ),
        .O(instr_rdcycle_i_5_n_0));
  FDRE instr_rdcycle_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_rdcycle0),
        .Q(instr_rdcycle),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h0008000800AA0008)) 
    instr_rdcycleh_i_1
       (.I0(instr_rdcycleh_i_2_n_0),
        .I1(instr_rdcycleh_i_3_n_0),
        .I2(\mem_rdata_q_reg_n_0_[15] ),
        .I3(instr_rdcycleh_i_4_n_0),
        .I4(instr_rdcycleh_i_5_n_0),
        .I5(\mem_rdata_q_reg_n_0_[16] ),
        .O(instr_rdcycleh0));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    instr_rdcycleh_i_2
       (.I0(\mem_rdata_q_reg_n_0_[27] ),
        .I1(instr_rdinstrh_i_5_n_0),
        .I2(\mem_rdata_q_reg_n_0_[24] ),
        .I3(p_0_in[2]),
        .I4(\mem_rdata_q_reg_n_0_[26] ),
        .I5(\mem_rdata_q_reg_n_0_[25] ),
        .O(instr_rdcycleh_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    instr_rdcycleh_i_3
       (.I0(instr_rdinstr_i_4_n_0),
        .I1(\mem_rdata_q_reg_n_0_[30] ),
        .I2(\mem_rdata_q_reg_n_0_[21] ),
        .I3(\mem_rdata_q_reg_n_0_[22] ),
        .I4(\mem_rdata_q_reg_n_0_[23] ),
        .I5(\mem_rdata_q_reg_n_0_[20] ),
        .O(instr_rdcycleh_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    instr_rdcycleh_i_4
       (.I0(\mem_rdata_q_reg_n_0_[29] ),
        .I1(\mem_rdata_q_reg_n_0_[28] ),
        .I2(p_0_in[0]),
        .O(instr_rdcycleh_i_4_n_0));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    instr_rdcycleh_i_5
       (.I0(\mem_rdata_q_reg_n_0_[23] ),
        .I1(\mem_rdata_q_reg_n_0_[22] ),
        .I2(\mem_rdata_q_reg_n_0_[21] ),
        .I3(\mem_rdata_q_reg_n_0_[20] ),
        .I4(\mem_rdata_q_reg_n_0_[15] ),
        .I5(instr_rdinstrh_i_6_n_0),
        .O(instr_rdcycleh_i_5_n_0));
  FDRE instr_rdcycleh_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_rdcycleh0),
        .Q(instr_rdcycleh),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    instr_rdinstr_i_1
       (.I0(\mem_rdata_q_reg_n_0_[27] ),
        .I1(\mem_rdata_q_reg_n_0_[25] ),
        .I2(\mem_rdata_q_reg_n_0_[26] ),
        .I3(\mem_rdata_q_reg_n_0_[24] ),
        .I4(instr_rdinstr_i_2_n_0),
        .I5(instr_rdinstr_i_3_n_0),
        .O(instr_rdinstr0));
  LUT6 #(
    .INIT(64'h0000000010000000)) 
    instr_rdinstr_i_2
       (.I0(instr_rdinstrh_i_4_n_0),
        .I1(instr_rdinstr_i_4_n_0),
        .I2(instr_rdinstrh_i_5_n_0),
        .I3(\mem_rdata_q_reg_n_0_[30] ),
        .I4(\mem_rdata_q_reg_n_0_[21] ),
        .I5(p_0_in[2]),
        .O(instr_rdinstr_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    instr_rdinstr_i_3
       (.I0(p_0_in[0]),
        .I1(\mem_rdata_q_reg_n_0_[28] ),
        .I2(\mem_rdata_q_reg_n_0_[29] ),
        .I3(\mem_rdata_q_reg_n_0_[15] ),
        .O(instr_rdinstr_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    instr_rdinstr_i_4
       (.I0(\mem_rdata_q_reg_n_0_[18] ),
        .I1(\mem_rdata_q_reg_n_0_[19] ),
        .I2(\mem_rdata_q_reg_n_0_[16] ),
        .I3(\mem_rdata_q_reg_n_0_[17] ),
        .O(instr_rdinstr_i_4_n_0));
  FDRE instr_rdinstr_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_rdinstr0),
        .Q(instr_rdinstr),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    instr_rdinstrh_i_1
       (.I0(\mem_rdata_q_reg_n_0_[25] ),
        .I1(\mem_rdata_q_reg_n_0_[26] ),
        .I2(p_0_in[2]),
        .I3(\mem_rdata_q_reg_n_0_[24] ),
        .I4(instr_rdinstrh_i_2_n_0),
        .I5(instr_rdinstrh_i_3_n_0),
        .O(instr_rdinstrh0));
  LUT6 #(
    .INIT(64'h0000000004000000)) 
    instr_rdinstrh_i_2
       (.I0(instr_rdinstrh_i_4_n_0),
        .I1(instr_rdinstrh_i_5_n_0),
        .I2(instr_rdinstrh_i_6_n_0),
        .I3(\mem_rdata_q_reg_n_0_[27] ),
        .I4(\mem_rdata_q_reg_n_0_[21] ),
        .I5(\mem_rdata_q_reg_n_0_[15] ),
        .O(instr_rdinstrh_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    instr_rdinstrh_i_3
       (.I0(p_0_in[0]),
        .I1(\mem_rdata_q_reg_n_0_[28] ),
        .I2(\mem_rdata_q_reg_n_0_[29] ),
        .I3(\mem_rdata_q_reg_n_0_[16] ),
        .O(instr_rdinstrh_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    instr_rdinstrh_i_4
       (.I0(\mem_rdata_q_reg_n_0_[22] ),
        .I1(\mem_rdata_q_reg_n_0_[23] ),
        .I2(\mem_rdata_q_reg_n_0_[20] ),
        .O(instr_rdinstrh_i_4_n_0));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    instr_rdinstrh_i_5
       (.I0(\mem_rdata_q_reg_n_0_[2] ),
        .I1(\mem_rdata_q_reg_n_0_[1] ),
        .I2(\mem_rdata_q_reg_n_0_[0] ),
        .I3(instr_rdinstrh_i_7_n_0),
        .I4(\mem_rdata_q_reg_n_0_[31] ),
        .I5(p_0_in[1]),
        .O(instr_rdinstrh_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT4 #(
    .INIT(16'hFFFD)) 
    instr_rdinstrh_i_6
       (.I0(\mem_rdata_q_reg_n_0_[30] ),
        .I1(\mem_rdata_q_reg_n_0_[17] ),
        .I2(\mem_rdata_q_reg_n_0_[18] ),
        .I3(\mem_rdata_q_reg_n_0_[19] ),
        .O(instr_rdinstrh_i_6_n_0));
  LUT4 #(
    .INIT(16'h0800)) 
    instr_rdinstrh_i_7
       (.I0(\mem_rdata_q_reg_n_0_[6] ),
        .I1(\mem_rdata_q_reg_n_0_[5] ),
        .I2(\mem_rdata_q_reg_n_0_[3] ),
        .I3(\mem_rdata_q_reg_n_0_[4] ),
        .O(instr_rdinstrh_i_7_n_0));
  FDRE instr_rdinstrh_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_rdinstrh0),
        .Q(instr_rdinstrh),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    instr_sb_i_1
       (.I0(p_0_in[0]),
        .I1(p_0_in[1]),
        .I2(p_0_in[2]),
        .I3(is_sb_sh_sw),
        .O(instr_sb0));
  FDRE instr_sb_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_sb0),
        .Q(instr_sb),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    instr_sh_i_1
       (.I0(p_0_in[0]),
        .I1(p_0_in[1]),
        .I2(p_0_in[2]),
        .I3(is_sb_sh_sw),
        .O(instr_sh0));
  FDRE instr_sh_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_sh0),
        .Q(instr_sh),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h02000000)) 
    instr_sll_i_1
       (.I0(instr_slli1),
        .I1(p_0_in[2]),
        .I2(p_0_in[1]),
        .I3(p_0_in[0]),
        .I4(is_alu_reg_reg),
        .O(instr_sll0));
  FDRE instr_sll_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_sll0),
        .Q(instr_sll),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h02000000)) 
    instr_slli_i_1
       (.I0(instr_slli1),
        .I1(p_0_in[2]),
        .I2(p_0_in[1]),
        .I3(p_0_in[0]),
        .I4(is_alu_reg_imm),
        .O(instr_slli0));
  FDRE instr_slli_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_slli0),
        .Q(instr_slli),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h00000800)) 
    instr_slt_i_1
       (.I0(instr_slli1),
        .I1(is_alu_reg_reg),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .I4(p_0_in[2]),
        .O(instr_slt0));
  FDRE instr_slt_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_slt0),
        .Q(instr_slt),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    instr_slti_i_1
       (.I0(is_alu_reg_imm),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .I3(p_0_in[2]),
        .O(instr_slti0));
  FDRE instr_slti_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_slti0),
        .Q(instr_slti),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    instr_sltiu_i_1
       (.I0(is_alu_reg_imm),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .I3(p_0_in[2]),
        .O(instr_sltiu0));
  FDRE instr_sltiu_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_sltiu0),
        .Q(instr_sltiu),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00008000)) 
    instr_sltu_i_1
       (.I0(instr_slli1),
        .I1(is_alu_reg_reg),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .I4(p_0_in[2]),
        .O(instr_sltu0));
  FDRE instr_sltu_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_sltu0),
        .Q(instr_sltu),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    instr_sra_i_1
       (.I0(is_alu_reg_reg),
        .I1(p_0_in[1]),
        .I2(p_0_in[2]),
        .I3(p_0_in[0]),
        .I4(instr_srai1),
        .O(instr_sra0));
  FDRE instr_sra_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_sra0),
        .Q(instr_sra),
        .R(instr_and_i_1_n_0));
  LUT5 #(
    .INIT(32'h20000000)) 
    instr_srai_i_1
       (.I0(is_alu_reg_imm),
        .I1(p_0_in[1]),
        .I2(p_0_in[2]),
        .I3(p_0_in[0]),
        .I4(instr_srai1),
        .O(instr_srai0));
  FDRE instr_srai_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_srai0),
        .Q(instr_srai),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    instr_srl_i_1
       (.I0(is_alu_reg_reg),
        .I1(p_0_in[1]),
        .I2(p_0_in[2]),
        .I3(p_0_in[0]),
        .I4(instr_slli1),
        .O(instr_srl0));
  FDRE instr_srl_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_srl0),
        .Q(instr_srl),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    instr_srli_i_1
       (.I0(is_alu_reg_imm),
        .I1(p_0_in[1]),
        .I2(p_0_in[2]),
        .I3(p_0_in[0]),
        .I4(instr_slli1),
        .O(instr_srli0));
  FDRE instr_srli_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_srli0),
        .Q(instr_srli),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00020000)) 
    instr_sub_i_1
       (.I0(is_alu_reg_reg),
        .I1(p_0_in[2]),
        .I2(p_0_in[1]),
        .I3(p_0_in[0]),
        .I4(instr_srai1),
        .O(instr_sub0));
  FDRE instr_sub_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_sub0),
        .Q(instr_sub),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    instr_sw_i_1
       (.I0(p_0_in[0]),
        .I1(p_0_in[1]),
        .I2(p_0_in[2]),
        .I3(is_sb_sh_sw),
        .O(instr_sw0));
  FDRE instr_sw_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_sw0),
        .Q(instr_sw),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h00000800)) 
    instr_xor_i_1
       (.I0(instr_slli1),
        .I1(is_alu_reg_reg),
        .I2(p_0_in[0]),
        .I3(p_0_in[2]),
        .I4(p_0_in[1]),
        .O(instr_xor0));
  FDRE instr_xor_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(instr_xor0),
        .Q(instr_xor),
        .R(instr_and_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
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
    .INIT(64'h0000407F00000000)) 
    is_alu_reg_imm_i_1
       (.I0(mem_rdata_IBUF[2]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[2] ),
        .I4(instr_auipc_i_3_n_0),
        .I5(instr_auipc_i_2_n_0),
        .O(is_alu_reg_imm_i_1_n_0));
  FDRE is_alu_reg_imm_reg
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(is_alu_reg_imm_i_1_n_0),
        .Q(is_alu_reg_imm),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h000000000000A808)) 
    is_alu_reg_reg_i_1
       (.I0(is_sb_sh_sw_i_4_n_0),
        .I1(\mem_rdata_q_reg_n_0_[5] ),
        .I2(mem_xfer),
        .I3(mem_rdata_IBUF[5]),
        .I4(\mem_rdata_q[6]_i_1_n_0 ),
        .I5(instr_auipc_i_3_n_0),
        .O(is_alu_reg_reg_i_1_n_0));
  FDRE is_alu_reg_reg_reg
       (.C(clk_IBUF_BUFG),
        .CE(instr_lui0),
        .D(is_alu_reg_reg_i_1_n_0),
        .Q(is_alu_reg_reg),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h8000FFFF80000000)) 
    is_beq_bne_blt_bge_bltu_bgeu_i_1
       (.I0(is_sb_sh_sw_i_4_n_0),
        .I1(\mem_rdata_q[5]_i_1_n_0 ),
        .I2(\mem_rdata_q[6]_i_1_n_0 ),
        .I3(is_sb_sh_sw_i_5_n_0),
        .I4(instr_lui0),
        .I5(is_beq_bne_blt_bge_bltu_bgeu),
        .O(is_beq_bne_blt_bge_bltu_bgeu_i_1_n_0));
  FDRE is_beq_bne_blt_bge_bltu_bgeu_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(is_beq_bne_blt_bge_bltu_bgeu_i_1_n_0),
        .Q(is_beq_bne_blt_bge_bltu_bgeu),
        .R(instr_and_i_1_n_0));
  LUT5 #(
    .INIT(32'hE0E000E0)) 
    is_compare_i_1
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(is_compare_i_2_n_0),
        .I2(resetn_IBUF),
        .I3(decoder_trigger_reg_n_0),
        .I4(decoder_pseudo_trigger_reg_n_0),
        .O(is_compare_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    is_compare_i_2
       (.I0(instr_sltu),
        .I1(instr_sltiu),
        .I2(instr_slt),
        .I3(instr_slti),
        .O(is_compare_i_2_n_0));
  FDRE is_compare_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(is_compare_i_1_n_0),
        .Q(is_compare),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT4 #(
    .INIT(16'hFF8A)) 
    is_jalr_addi_slti_sltiu_xori_ori_andi_i_1
       (.I0(is_alu_reg_imm),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(instr_jalr),
        .O(is_jalr_addi_slti_sltiu_xori_ori_andi0));
  FDRE is_jalr_addi_slti_sltiu_xori_ori_andi_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(is_jalr_addi_slti_sltiu_xori_ori_andi0),
        .Q(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h000002A200000000)) 
    is_lb_lh_lw_lbu_lhu_i_1
       (.I0(is_sb_sh_sw_i_4_n_0),
        .I1(\mem_rdata_q_reg_n_0_[5] ),
        .I2(mem_xfer),
        .I3(mem_rdata_IBUF[5]),
        .I4(\mem_rdata_q[6]_i_1_n_0 ),
        .I5(is_sb_sh_sw_i_5_n_0),
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
       (.I0(instr_lbu),
        .I1(instr_lhu),
        .I2(instr_lw),
        .O(is_lbu_lhu_lw_i_1_n_0));
  FDRE is_lbu_lhu_lw_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(is_lbu_lhu_lw_i_1_n_0),
        .Q(is_lbu_lhu_lw),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    is_lui_auipc_jal_i_1
       (.I0(instr_jal),
        .I1(instr_lui),
        .I2(instr_auipc),
        .O(is_lui_auipc_jal_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFE0000FFFEFFFE)) 
    is_lui_auipc_jal_jalr_addi_add_sub_i_1
       (.I0(is_lui_auipc_jal_jalr_addi_add_sub_i_2_n_0),
        .I1(instr_addi),
        .I2(instr_add),
        .I3(instr_sub),
        .I4(decoder_pseudo_trigger_reg_n_0),
        .I5(decoder_trigger_reg_n_0),
        .O(is_lui_auipc_jal_jalr_addi_add_sub_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    is_lui_auipc_jal_jalr_addi_add_sub_i_2
       (.I0(instr_jal),
        .I1(instr_jalr),
        .I2(instr_lui),
        .I3(instr_auipc),
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
  LUT2 #(
    .INIT(4'h8)) 
    is_sb_sh_sw_i_1
       (.I0(mem_do_rinst_reg_n_0),
        .I1(mem_done),
        .O(instr_lui0));
  LUT6 #(
    .INIT(64'h00E2000000000000)) 
    is_sb_sh_sw_i_2
       (.I0(\mem_rdata_q_reg_n_0_[5] ),
        .I1(mem_xfer),
        .I2(mem_rdata_IBUF[5]),
        .I3(\mem_rdata_q[6]_i_1_n_0 ),
        .I4(is_sb_sh_sw_i_4_n_0),
        .I5(is_sb_sh_sw_i_5_n_0),
        .O(is_sb_sh_sw_i_2_n_0));
  LUT6 #(
    .INIT(64'hF880000088800000)) 
    is_sb_sh_sw_i_3
       (.I0(is_sb_sh_sw_i_6_n_0),
        .I1(mem_xfer),
        .I2(\mem_state_reg_n_0_[0] ),
        .I3(\mem_state_reg_n_0_[1] ),
        .I4(resetn_IBUF),
        .I5(mem_do_rinst_reg_n_0),
        .O(mem_done));
  LUT6 #(
    .INIT(64'h0005050533050505)) 
    is_sb_sh_sw_i_4
       (.I0(\mem_rdata_q_reg_n_0_[2] ),
        .I1(mem_rdata_IBUF[2]),
        .I2(\mem_rdata_q_reg_n_0_[3] ),
        .I3(mem_valid_OBUF),
        .I4(mem_ready_IBUF),
        .I5(mem_rdata_IBUF[3]),
        .O(is_sb_sh_sw_i_4_n_0));
  LUT6 #(
    .INIT(64'h00000000B8308800)) 
    is_sb_sh_sw_i_5
       (.I0(mem_rdata_IBUF[1]),
        .I1(mem_xfer),
        .I2(\mem_rdata_q_reg_n_0_[1] ),
        .I3(mem_rdata_IBUF[0]),
        .I4(\mem_rdata_q_reg_n_0_[0] ),
        .I5(\mem_rdata_q[4]_i_1_n_0 ),
        .O(is_sb_sh_sw_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    is_sb_sh_sw_i_6
       (.I0(mem_do_rdata),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_wdata),
        .O(is_sb_sh_sw_i_6_n_0));
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
  LUT6 #(
    .INIT(64'h00C8008800000000)) 
    is_sll_srl_sra_i_2
       (.I0(instr_slli1),
        .I1(p_0_in[0]),
        .I2(p_0_in[2]),
        .I3(p_0_in[1]),
        .I4(instr_srai1),
        .I5(is_alu_reg_reg),
        .O(is_sll_srl_sra0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    is_sll_srl_sra_i_3
       (.I0(\mem_rdata_q_reg_n_0_[28] ),
        .I1(\mem_rdata_q_reg_n_0_[29] ),
        .I2(\mem_rdata_q_reg_n_0_[30] ),
        .I3(\mem_rdata_q_reg_n_0_[31] ),
        .I4(is_sll_srl_sra_i_5_n_0),
        .O(instr_slli1));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    is_sll_srl_sra_i_4
       (.I0(\mem_rdata_q_reg_n_0_[28] ),
        .I1(\mem_rdata_q_reg_n_0_[29] ),
        .I2(\mem_rdata_q_reg_n_0_[30] ),
        .I3(\mem_rdata_q_reg_n_0_[31] ),
        .I4(is_sll_srl_sra_i_5_n_0),
        .O(instr_srai1));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    is_sll_srl_sra_i_5
       (.I0(\mem_rdata_q_reg_n_0_[26] ),
        .I1(\mem_rdata_q_reg_n_0_[25] ),
        .I2(\mem_rdata_q_reg_n_0_[27] ),
        .O(is_sll_srl_sra_i_5_n_0));
  FDRE is_sll_srl_sra_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0),
        .D(is_sll_srl_sra0),
        .Q(is_sll_srl_sra),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h00C8008800000000)) 
    is_slli_srli_srai_i_1
       (.I0(instr_slli1),
        .I1(p_0_in[0]),
        .I2(p_0_in[2]),
        .I3(p_0_in[1]),
        .I4(instr_srai1),
        .I5(is_alu_reg_imm),
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
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
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
  LUT6 #(
    .INIT(64'hEAAAEAFFEAAAEA00)) 
    latched_branch_i_1
       (.I0(latched_branch_i_2_n_0),
        .I1(alu_out_0),
        .I2(is_beq_bne_blt_bge_bltu_bgeu),
        .I3(\cpu_state_reg_n_0_[3] ),
        .I4(reg_next_pc),
        .I5(latched_branch_reg_n_0),
        .O(latched_branch_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'h2F202020)) 
    latched_branch_i_2
       (.I0(instr_jalr),
        .I1(is_beq_bne_blt_bge_bltu_bgeu),
        .I2(\cpu_state_reg_n_0_[3] ),
        .I3(instr_jal),
        .I4(decoder_trigger_reg_n_0),
        .O(latched_branch_i_2_n_0));
  FDRE latched_branch_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(latched_branch_i_1_n_0),
        .Q(latched_branch_reg_n_0),
        .R(instr_and_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000FFBF00000080)) 
    latched_is_lb_i_1
       (.I0(instr_lb),
        .I1(decoder_trigger1),
        .I2(\cpu_state_reg_n_0_[0] ),
        .I3(mem_do_rdata),
        .I4(reg_next_pc),
        .I5(latched_is_lb_reg_n_0),
        .O(latched_is_lb_i_1_n_0));
  FDRE latched_is_lb_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(latched_is_lb_i_1_n_0),
        .Q(latched_is_lb_reg_n_0),
        .R(instr_and_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000FFBF00000080)) 
    latched_is_lh_i_1
       (.I0(instr_lh),
        .I1(decoder_trigger1),
        .I2(\cpu_state_reg_n_0_[0] ),
        .I3(mem_do_rdata),
        .I4(reg_next_pc),
        .I5(latched_is_lh_reg_n_0),
        .O(latched_is_lh_i_1_n_0));
  FDRE latched_is_lh_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(latched_is_lh_i_1_n_0),
        .Q(latched_is_lh_reg_n_0),
        .R(instr_and_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000FFBF00000080)) 
    latched_is_lu_i_1
       (.I0(is_lbu_lhu_lw),
        .I1(decoder_trigger1),
        .I2(\cpu_state_reg_n_0_[0] ),
        .I3(mem_do_rdata),
        .I4(reg_next_pc),
        .I5(latched_is_lu_reg_n_0),
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
       (.I0(resetn_IBUF),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(is_beq_bne_blt_bge_bltu_bgeu),
        .I3(reg_next_pc),
        .O(\latched_rd[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF080)) 
    \latched_rd[4]_i_2 
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(resetn_IBUF),
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
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT4 #(
    .INIT(16'h0F04)) 
    latched_stalu_i_1
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(\cpu_state_reg_n_0_[3] ),
        .I2(reg_next_pc),
        .I3(latched_stalu_reg_n_0),
        .O(latched_stalu_i_1_n_0));
  FDRE latched_stalu_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(latched_stalu_i_1_n_0),
        .Q(latched_stalu_reg_n_0),
        .R(instr_and_i_1_n_0));
  LUT6 #(
    .INIT(64'hFF0DFFFFFF0D0000)) 
    latched_store_i_1
       (.I0(decoder_trigger_i_3_n_0),
        .I1(alu_out_0),
        .I2(reg_next_pc),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(latched_store),
        .I5(latched_store_reg_n_0),
        .O(latched_store_i_1_n_0));
  LUT6 #(
    .INIT(64'h5555555500001055)) 
    latched_store_i_2
       (.I0(\cpu_state_reg_n_0_[1] ),
        .I1(instr_trap),
        .I2(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .I3(\cpu_state_reg_n_0_[5] ),
        .I4(\cpu_state_reg_n_0_[7] ),
        .I5(\cpu_state[6]_i_3_n_0 ),
        .O(latched_store));
  FDRE latched_store_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(latched_store_i_1_n_0),
        .Q(latched_store_reg_n_0),
        .R(instr_and_i_1_n_0));
  LUT6 #(
    .INIT(64'h00000000CCC80000)) 
    \mem_addr[31]_i_1 
       (.I0(mem_do_wdata),
        .I1(mem_la_read1),
        .I2(mem_do_rdata),
        .I3(p_8_in),
        .I4(resetn_IBUF),
        .I5(trap_OBUF),
        .O(\mem_addr[31]_i_1_n_0 ));
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
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[10]),
        .Q(mem_addr_OBUF[10]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[11]),
        .Q(mem_addr_OBUF[11]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[12]),
        .Q(mem_addr_OBUF[12]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[13]),
        .Q(mem_addr_OBUF[13]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[14]),
        .Q(mem_addr_OBUF[14]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[15]),
        .Q(mem_addr_OBUF[15]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[16]),
        .Q(mem_addr_OBUF[16]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[17]),
        .Q(mem_addr_OBUF[17]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[18]),
        .Q(mem_addr_OBUF[18]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[19]),
        .Q(mem_addr_OBUF[19]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[20]),
        .Q(mem_addr_OBUF[20]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[21]),
        .Q(mem_addr_OBUF[21]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[22]),
        .Q(mem_addr_OBUF[22]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[23]),
        .Q(mem_addr_OBUF[23]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[24]),
        .Q(mem_addr_OBUF[24]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[25]),
        .Q(mem_addr_OBUF[25]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[26]),
        .Q(mem_addr_OBUF[26]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[27]),
        .Q(mem_addr_OBUF[27]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[28]),
        .Q(mem_addr_OBUF[28]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[29]),
        .Q(mem_addr_OBUF[29]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[2]),
        .Q(mem_addr_OBUF[2]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[30]),
        .Q(mem_addr_OBUF[30]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[31]),
        .Q(mem_addr_OBUF[31]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[3]),
        .Q(mem_addr_OBUF[3]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[4]),
        .Q(mem_addr_OBUF[4]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[5]),
        .Q(mem_addr_OBUF[5]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[6]),
        .Q(mem_addr_OBUF[6]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[7]),
        .Q(mem_addr_OBUF[7]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[8]),
        .Q(mem_addr_OBUF[8]),
        .R(\<const0> ));
  FDRE \mem_addr_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_addr[31]_i_1_n_0 ),
        .D(mem_la_addr_OBUF[9]),
        .Q(mem_addr_OBUF[9]),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h00000000A2AAAEAA)) 
    mem_do_prefetch_i_1
       (.I0(mem_do_prefetch_reg_n_0),
        .I1(reg_next_pc),
        .I2(mem_do_prefetch_i_2_n_0),
        .I3(resetn_IBUF),
        .I4(instr_jalr),
        .I5(mem_do_rdata_i_2_n_0),
        .O(mem_do_prefetch_i_1_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    mem_do_prefetch_i_2
       (.I0(instr_jal),
        .I1(decoder_trigger_reg_n_0),
        .O(mem_do_prefetch_i_2_n_0));
  FDRE mem_do_prefetch_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(mem_do_prefetch_i_1_n_0),
        .Q(mem_do_prefetch_reg_n_0),
        .R(\<const0> ));
  LUT3 #(
    .INIT(8'hDC)) 
    mem_do_rdata_i_1
       (.I0(mem_do_rdata_i_2_n_0),
        .I1(set_mem_do_rdata4_out),
        .I2(mem_do_rdata),
        .O(mem_do_rdata_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'hB)) 
    mem_do_rdata_i_2
       (.I0(mem_done),
        .I1(resetn_IBUF),
        .O(mem_do_rdata_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000100000000000)) 
    mem_do_rdata_i_3
       (.I0(\cpu_state_reg_n_0_[7] ),
        .I1(\cpu_state_reg_n_0_[1] ),
        .I2(mem_do_rdata_i_4_n_0),
        .I3(decoder_pseudo_trigger_i_2_n_0),
        .I4(latched_branch),
        .I5(decoder_trigger1),
        .O(set_mem_do_rdata4_out));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h2)) 
    mem_do_rdata_i_4
       (.I0(resetn_IBUF),
        .I1(mem_do_rdata),
        .O(mem_do_rdata_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT2 #(
    .INIT(4'hE)) 
    mem_do_rdata_i_5
       (.I0(\cpu_state_reg_n_0_[3] ),
        .I1(reg_next_pc),
        .O(latched_branch));
  FDRE mem_do_rdata_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(mem_do_rdata_i_1_n_0),
        .Q(mem_do_rdata),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'h0B)) 
    mem_do_rinst_i_12
       (.I0(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I1(is_sb_sh_sw),
        .I2(mem_do_prefetch_reg_n_0),
        .O(mem_do_rinst_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT4 #(
    .INIT(16'hFF01)) 
    mem_do_rinst_i_13
       (.I0(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I1(is_sb_sh_sw),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(is_slli_srli_srai),
        .O(mem_do_rinst_i_13_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'hFF8A8A8A)) 
    mem_do_rinst_i_4
       (.I0(reg_next_pc),
        .I1(instr_jal),
        .I2(decoder_trigger_reg_n_0),
        .I3(mem_do_prefetch_reg_n_0),
        .I4(\cpu_state_reg_n_0_[2] ),
        .O(mem_do_rinst_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'h80)) 
    mem_do_rinst_i_6
       (.I0(\cpu_state_reg_n_0_[3] ),
        .I1(is_beq_bne_blt_bge_bltu_bgeu),
        .I2(resetn_IBUF),
        .O(mem_do_rinst_i_6_n_0));
  LUT6 #(
    .INIT(64'hFFFFEFFFAAAAAAAA)) 
    mem_do_rinst_i_8
       (.I0(is_lui_auipc_jal),
        .I1(\cpu_state[7]_i_10_n_0 ),
        .I2(\cpu_state[7]_i_11_n_0 ),
        .I3(\cpu_state[7]_i_12_n_0 ),
        .I4(\cpu_state[7]_i_13_n_0 ),
        .I5(is_lb_lh_lw_lbu_lhu),
        .O(mem_do_rinst_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT4 #(
    .INIT(16'h5551)) 
    mem_do_rinst_i_9
       (.I0(is_slli_srli_srai),
        .I1(is_sll_srl_sra),
        .I2(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I3(is_sb_sh_sw),
        .O(mem_do_rinst_i_9_n_0));
  FDRE mem_do_rinst_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(mem_do_rinst_i_1_n_0),
        .Q(mem_do_rinst_reg_n_0),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h5B005000)) 
    mem_do_wdata_i_1
       (.I0(mem_done),
        .I1(mem_do_prefetch_reg_n_0),
        .I2(mem_do_wdata),
        .I3(resetn_IBUF),
        .I4(\cpu_state_reg_n_0_[1] ),
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
    .INIT(64'h00000000FE000000)) 
    mem_instr_i_1
       (.I0(mem_do_rdata),
        .I1(p_8_in),
        .I2(mem_do_wdata),
        .I3(mem_la_read1),
        .I4(resetn_IBUF),
        .I5(trap_OBUF),
        .O(mem_instr3_out));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'h0E)) 
    mem_instr_i_2
       (.I0(mem_do_prefetch_reg_n_0),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_wdata),
        .O(mem_instr_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h1)) 
    mem_instr_i_3
       (.I0(\mem_state_reg_n_0_[0] ),
        .I1(\mem_state_reg_n_0_[1] ),
        .O(mem_la_read1));
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
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[10]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[10]),
        .I1(\reg_next_pc_reg_n_0_[10] ),
        .I2(\reg_out_reg_n_0_[10] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[10]));
  OBUF \mem_la_addr_OBUF[11]_inst 
       (.I(mem_la_addr_OBUF[11]),
        .O(mem_la_addr[11]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[11]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[11]),
        .I1(\reg_next_pc_reg_n_0_[11] ),
        .I2(\reg_out_reg_n_0_[11] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[11]));
  OBUF \mem_la_addr_OBUF[12]_inst 
       (.I(mem_la_addr_OBUF[12]),
        .O(mem_la_addr[12]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[12]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[12]),
        .I1(\reg_next_pc_reg_n_0_[12] ),
        .I2(\reg_out_reg_n_0_[12] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[12]));
  OBUF \mem_la_addr_OBUF[13]_inst 
       (.I(mem_la_addr_OBUF[13]),
        .O(mem_la_addr[13]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[13]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[13]),
        .I1(\reg_next_pc_reg_n_0_[13] ),
        .I2(\reg_out_reg_n_0_[13] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[13]));
  OBUF \mem_la_addr_OBUF[14]_inst 
       (.I(mem_la_addr_OBUF[14]),
        .O(mem_la_addr[14]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[14]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[14]),
        .I1(\reg_next_pc_reg_n_0_[14] ),
        .I2(\reg_out_reg_n_0_[14] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[14]));
  OBUF \mem_la_addr_OBUF[15]_inst 
       (.I(mem_la_addr_OBUF[15]),
        .O(mem_la_addr[15]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[15]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[15]),
        .I1(\reg_next_pc_reg_n_0_[15] ),
        .I2(\reg_out_reg_n_0_[15] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[15]));
  OBUF \mem_la_addr_OBUF[16]_inst 
       (.I(mem_la_addr_OBUF[16]),
        .O(mem_la_addr[16]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[16]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[16]),
        .I1(\reg_next_pc_reg_n_0_[16] ),
        .I2(\reg_out_reg_n_0_[16] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[16]));
  OBUF \mem_la_addr_OBUF[17]_inst 
       (.I(mem_la_addr_OBUF[17]),
        .O(mem_la_addr[17]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[17]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[17]),
        .I1(\reg_next_pc_reg_n_0_[17] ),
        .I2(\reg_out_reg_n_0_[17] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[17]));
  OBUF \mem_la_addr_OBUF[18]_inst 
       (.I(mem_la_addr_OBUF[18]),
        .O(mem_la_addr[18]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[18]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[18]),
        .I1(\reg_next_pc_reg_n_0_[18] ),
        .I2(\reg_out_reg_n_0_[18] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[18]));
  OBUF \mem_la_addr_OBUF[19]_inst 
       (.I(mem_la_addr_OBUF[19]),
        .O(mem_la_addr[19]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[19]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[19]),
        .I1(\reg_next_pc_reg_n_0_[19] ),
        .I2(\reg_out_reg_n_0_[19] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[19]));
  OBUF \mem_la_addr_OBUF[1]_inst 
       (.I(\<const0> ),
        .O(mem_la_addr[1]));
  OBUF \mem_la_addr_OBUF[20]_inst 
       (.I(mem_la_addr_OBUF[20]),
        .O(mem_la_addr[20]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[20]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[20]),
        .I1(\reg_next_pc_reg_n_0_[20] ),
        .I2(\reg_out_reg_n_0_[20] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[20]));
  OBUF \mem_la_addr_OBUF[21]_inst 
       (.I(mem_la_addr_OBUF[21]),
        .O(mem_la_addr[21]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[21]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[21]),
        .I1(\reg_next_pc_reg_n_0_[21] ),
        .I2(\reg_out_reg_n_0_[21] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[21]));
  OBUF \mem_la_addr_OBUF[22]_inst 
       (.I(mem_la_addr_OBUF[22]),
        .O(mem_la_addr[22]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[22]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[22]),
        .I1(\reg_next_pc_reg_n_0_[22] ),
        .I2(\reg_out_reg_n_0_[22] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[22]));
  OBUF \mem_la_addr_OBUF[23]_inst 
       (.I(mem_la_addr_OBUF[23]),
        .O(mem_la_addr[23]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[23]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[23]),
        .I1(\reg_next_pc_reg_n_0_[23] ),
        .I2(\reg_out_reg_n_0_[23] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[23]));
  OBUF \mem_la_addr_OBUF[24]_inst 
       (.I(mem_la_addr_OBUF[24]),
        .O(mem_la_addr[24]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[24]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[24]),
        .I1(\reg_next_pc_reg_n_0_[24] ),
        .I2(\reg_out_reg_n_0_[24] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[24]));
  OBUF \mem_la_addr_OBUF[25]_inst 
       (.I(mem_la_addr_OBUF[25]),
        .O(mem_la_addr[25]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[25]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[25]),
        .I1(\reg_next_pc_reg_n_0_[25] ),
        .I2(\reg_out_reg_n_0_[25] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[25]));
  OBUF \mem_la_addr_OBUF[26]_inst 
       (.I(mem_la_addr_OBUF[26]),
        .O(mem_la_addr[26]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[26]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[26]),
        .I1(\reg_next_pc_reg_n_0_[26] ),
        .I2(\reg_out_reg_n_0_[26] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[26]));
  OBUF \mem_la_addr_OBUF[27]_inst 
       (.I(mem_la_addr_OBUF[27]),
        .O(mem_la_addr[27]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[27]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[27]),
        .I1(\reg_next_pc_reg_n_0_[27] ),
        .I2(\reg_out_reg_n_0_[27] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[27]));
  OBUF \mem_la_addr_OBUF[28]_inst 
       (.I(mem_la_addr_OBUF[28]),
        .O(mem_la_addr[28]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[28]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[28]),
        .I1(\reg_next_pc_reg_n_0_[28] ),
        .I2(\reg_out_reg_n_0_[28] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[28]));
  OBUF \mem_la_addr_OBUF[29]_inst 
       (.I(mem_la_addr_OBUF[29]),
        .O(mem_la_addr[29]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[29]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[29]),
        .I1(\reg_next_pc_reg_n_0_[29] ),
        .I2(\reg_out_reg_n_0_[29] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[29]));
  OBUF \mem_la_addr_OBUF[2]_inst 
       (.I(mem_la_addr_OBUF[2]),
        .O(mem_la_addr[2]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[2]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[2]),
        .I1(\reg_next_pc_reg_n_0_[2] ),
        .I2(\reg_out_reg_n_0_[2] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[2]));
  OBUF \mem_la_addr_OBUF[30]_inst 
       (.I(mem_la_addr_OBUF[30]),
        .O(mem_la_addr[30]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[30]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[30]),
        .I1(\reg_next_pc_reg_n_0_[30] ),
        .I2(\reg_out_reg_n_0_[30] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[30]));
  OBUF \mem_la_addr_OBUF[31]_inst 
       (.I(mem_la_addr_OBUF[31]),
        .O(mem_la_addr[31]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[31]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[31]),
        .I1(\reg_next_pc_reg_n_0_[31] ),
        .I2(\reg_out_reg_n_0_[31] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[31]));
  LUT2 #(
    .INIT(4'hE)) 
    \mem_la_addr_OBUF[31]_inst_i_2 
       (.I0(mem_do_rinst_reg_n_0),
        .I1(mem_do_prefetch_reg_n_0),
        .O(p_8_in));
  OBUF \mem_la_addr_OBUF[3]_inst 
       (.I(mem_la_addr_OBUF[3]),
        .O(mem_la_addr[3]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[3]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[3]),
        .I1(\reg_next_pc_reg_n_0_[3] ),
        .I2(\reg_out_reg_n_0_[3] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[3]));
  OBUF \mem_la_addr_OBUF[4]_inst 
       (.I(mem_la_addr_OBUF[4]),
        .O(mem_la_addr[4]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[4]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[4]),
        .I1(\reg_next_pc_reg_n_0_[4] ),
        .I2(\reg_out_reg_n_0_[4] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[4]));
  OBUF \mem_la_addr_OBUF[5]_inst 
       (.I(mem_la_addr_OBUF[5]),
        .O(mem_la_addr[5]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[5]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[5]),
        .I1(\reg_next_pc_reg_n_0_[5] ),
        .I2(\reg_out_reg_n_0_[5] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[5]));
  OBUF \mem_la_addr_OBUF[6]_inst 
       (.I(mem_la_addr_OBUF[6]),
        .O(mem_la_addr[6]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[6]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[6]),
        .I1(\reg_next_pc_reg_n_0_[6] ),
        .I2(\reg_out_reg_n_0_[6] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[6]));
  OBUF \mem_la_addr_OBUF[7]_inst 
       (.I(mem_la_addr_OBUF[7]),
        .O(mem_la_addr[7]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[7]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[7]),
        .I1(\reg_next_pc_reg_n_0_[7] ),
        .I2(\reg_out_reg_n_0_[7] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[7]));
  OBUF \mem_la_addr_OBUF[8]_inst 
       (.I(mem_la_addr_OBUF[8]),
        .O(mem_la_addr[8]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[8]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[8]),
        .I1(\reg_next_pc_reg_n_0_[8] ),
        .I2(\reg_out_reg_n_0_[8] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[8]));
  OBUF \mem_la_addr_OBUF[9]_inst 
       (.I(mem_la_addr_OBUF[9]),
        .O(mem_la_addr[9]));
  LUT6 #(
    .INIT(64'hF0AACCAACCAACCAA)) 
    \mem_la_addr_OBUF[9]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[9]),
        .I1(\reg_next_pc_reg_n_0_[9] ),
        .I2(\reg_out_reg_n_0_[9] ),
        .I3(p_8_in),
        .I4(latched_store_reg_n_0),
        .I5(latched_branch_reg_n_0),
        .O(mem_la_addr_OBUF[9]));
  OBUF mem_la_read_OBUF_inst
       (.I(mem_la_read_OBUF),
        .O(mem_la_read));
  LUT6 #(
    .INIT(64'h0202020202020200)) 
    mem_la_read_OBUF_inst_i_1
       (.I0(resetn_IBUF),
        .I1(\mem_state_reg_n_0_[0] ),
        .I2(\mem_state_reg_n_0_[1] ),
        .I3(mem_do_rdata),
        .I4(mem_do_rinst_reg_n_0),
        .I5(mem_do_prefetch_reg_n_0),
        .O(mem_la_read_OBUF));
  OBUF \mem_la_wdata_OBUF[0]_inst 
       (.I(pcpi_rs2_OBUF[0]),
        .O(mem_la_wdata[0]));
  OBUF \mem_la_wdata_OBUF[10]_inst 
       (.I(mem_la_wdata_OBUF[10]),
        .O(mem_la_wdata[10]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \mem_la_wdata_OBUF[10]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[10]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[2]),
        .O(mem_la_wdata_OBUF[10]));
  OBUF \mem_la_wdata_OBUF[11]_inst 
       (.I(mem_la_wdata_OBUF[11]),
        .O(mem_la_wdata[11]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \mem_la_wdata_OBUF[11]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[11]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[3]),
        .O(mem_la_wdata_OBUF[11]));
  OBUF \mem_la_wdata_OBUF[12]_inst 
       (.I(mem_la_wdata_OBUF[12]),
        .O(mem_la_wdata[12]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \mem_la_wdata_OBUF[12]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[12]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[4]),
        .O(mem_la_wdata_OBUF[12]));
  OBUF \mem_la_wdata_OBUF[13]_inst 
       (.I(mem_la_wdata_OBUF[13]),
        .O(mem_la_wdata[13]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \mem_la_wdata_OBUF[13]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[13]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[5]),
        .O(mem_la_wdata_OBUF[13]));
  OBUF \mem_la_wdata_OBUF[14]_inst 
       (.I(mem_la_wdata_OBUF[14]),
        .O(mem_la_wdata[14]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \mem_la_wdata_OBUF[14]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[14]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[6]),
        .O(mem_la_wdata_OBUF[14]));
  OBUF \mem_la_wdata_OBUF[15]_inst 
       (.I(mem_la_wdata_OBUF[15]),
        .O(mem_la_wdata[15]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \mem_la_wdata_OBUF[15]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[15]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[7]),
        .O(mem_la_wdata_OBUF[15]));
  OBUF \mem_la_wdata_OBUF[16]_inst 
       (.I(mem_la_wdata_OBUF[16]),
        .O(mem_la_wdata[16]));
  LUT4 #(
    .INIT(16'hCCCA)) 
    \mem_la_wdata_OBUF[16]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[16]),
        .I1(pcpi_rs2_OBUF[0]),
        .I2(\mem_wordsize_reg_n_0_[0] ),
        .I3(\mem_wordsize_reg_n_0_[1] ),
        .O(mem_la_wdata_OBUF[16]));
  OBUF \mem_la_wdata_OBUF[17]_inst 
       (.I(mem_la_wdata_OBUF[17]),
        .O(mem_la_wdata[17]));
  LUT4 #(
    .INIT(16'hCCCA)) 
    \mem_la_wdata_OBUF[17]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[17]),
        .I1(pcpi_rs2_OBUF[1]),
        .I2(\mem_wordsize_reg_n_0_[0] ),
        .I3(\mem_wordsize_reg_n_0_[1] ),
        .O(mem_la_wdata_OBUF[17]));
  OBUF \mem_la_wdata_OBUF[18]_inst 
       (.I(mem_la_wdata_OBUF[18]),
        .O(mem_la_wdata[18]));
  LUT4 #(
    .INIT(16'hCCCA)) 
    \mem_la_wdata_OBUF[18]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[18]),
        .I1(pcpi_rs2_OBUF[2]),
        .I2(\mem_wordsize_reg_n_0_[0] ),
        .I3(\mem_wordsize_reg_n_0_[1] ),
        .O(mem_la_wdata_OBUF[18]));
  OBUF \mem_la_wdata_OBUF[19]_inst 
       (.I(mem_la_wdata_OBUF[19]),
        .O(mem_la_wdata[19]));
  LUT4 #(
    .INIT(16'hCCCA)) 
    \mem_la_wdata_OBUF[19]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[19]),
        .I1(pcpi_rs2_OBUF[3]),
        .I2(\mem_wordsize_reg_n_0_[0] ),
        .I3(\mem_wordsize_reg_n_0_[1] ),
        .O(mem_la_wdata_OBUF[19]));
  OBUF \mem_la_wdata_OBUF[1]_inst 
       (.I(pcpi_rs2_OBUF[1]),
        .O(mem_la_wdata[1]));
  OBUF \mem_la_wdata_OBUF[20]_inst 
       (.I(mem_la_wdata_OBUF[20]),
        .O(mem_la_wdata[20]));
  LUT4 #(
    .INIT(16'hCCCA)) 
    \mem_la_wdata_OBUF[20]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[20]),
        .I1(pcpi_rs2_OBUF[4]),
        .I2(\mem_wordsize_reg_n_0_[0] ),
        .I3(\mem_wordsize_reg_n_0_[1] ),
        .O(mem_la_wdata_OBUF[20]));
  OBUF \mem_la_wdata_OBUF[21]_inst 
       (.I(mem_la_wdata_OBUF[21]),
        .O(mem_la_wdata[21]));
  LUT4 #(
    .INIT(16'hCCCA)) 
    \mem_la_wdata_OBUF[21]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[21]),
        .I1(pcpi_rs2_OBUF[5]),
        .I2(\mem_wordsize_reg_n_0_[0] ),
        .I3(\mem_wordsize_reg_n_0_[1] ),
        .O(mem_la_wdata_OBUF[21]));
  OBUF \mem_la_wdata_OBUF[22]_inst 
       (.I(mem_la_wdata_OBUF[22]),
        .O(mem_la_wdata[22]));
  LUT4 #(
    .INIT(16'hCCCA)) 
    \mem_la_wdata_OBUF[22]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[22]),
        .I1(pcpi_rs2_OBUF[6]),
        .I2(\mem_wordsize_reg_n_0_[0] ),
        .I3(\mem_wordsize_reg_n_0_[1] ),
        .O(mem_la_wdata_OBUF[22]));
  OBUF \mem_la_wdata_OBUF[23]_inst 
       (.I(mem_la_wdata_OBUF[23]),
        .O(mem_la_wdata[23]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT4 #(
    .INIT(16'hCCCA)) 
    \mem_la_wdata_OBUF[23]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[23]),
        .I1(pcpi_rs2_OBUF[7]),
        .I2(\mem_wordsize_reg_n_0_[0] ),
        .I3(\mem_wordsize_reg_n_0_[1] ),
        .O(mem_la_wdata_OBUF[23]));
  OBUF \mem_la_wdata_OBUF[24]_inst 
       (.I(mem_la_wdata_OBUF[24]),
        .O(mem_la_wdata[24]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'hAAAAF0CC)) 
    \mem_la_wdata_OBUF[24]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[0]),
        .I1(pcpi_rs2_OBUF[24]),
        .I2(pcpi_rs2_OBUF[8]),
        .I3(\mem_wordsize_reg_n_0_[0] ),
        .I4(\mem_wordsize_reg_n_0_[1] ),
        .O(mem_la_wdata_OBUF[24]));
  OBUF \mem_la_wdata_OBUF[25]_inst 
       (.I(mem_la_wdata_OBUF[25]),
        .O(mem_la_wdata[25]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'hAAAAF0CC)) 
    \mem_la_wdata_OBUF[25]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[1]),
        .I1(pcpi_rs2_OBUF[25]),
        .I2(pcpi_rs2_OBUF[9]),
        .I3(\mem_wordsize_reg_n_0_[0] ),
        .I4(\mem_wordsize_reg_n_0_[1] ),
        .O(mem_la_wdata_OBUF[25]));
  OBUF \mem_la_wdata_OBUF[26]_inst 
       (.I(mem_la_wdata_OBUF[26]),
        .O(mem_la_wdata[26]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'hAAAAF0CC)) 
    \mem_la_wdata_OBUF[26]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[2]),
        .I1(pcpi_rs2_OBUF[26]),
        .I2(pcpi_rs2_OBUF[10]),
        .I3(\mem_wordsize_reg_n_0_[0] ),
        .I4(\mem_wordsize_reg_n_0_[1] ),
        .O(mem_la_wdata_OBUF[26]));
  OBUF \mem_la_wdata_OBUF[27]_inst 
       (.I(mem_la_wdata_OBUF[27]),
        .O(mem_la_wdata[27]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'hAAAAF0CC)) 
    \mem_la_wdata_OBUF[27]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[3]),
        .I1(pcpi_rs2_OBUF[27]),
        .I2(pcpi_rs2_OBUF[11]),
        .I3(\mem_wordsize_reg_n_0_[0] ),
        .I4(\mem_wordsize_reg_n_0_[1] ),
        .O(mem_la_wdata_OBUF[27]));
  OBUF \mem_la_wdata_OBUF[28]_inst 
       (.I(mem_la_wdata_OBUF[28]),
        .O(mem_la_wdata[28]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'hAAAAF0CC)) 
    \mem_la_wdata_OBUF[28]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[4]),
        .I1(pcpi_rs2_OBUF[28]),
        .I2(pcpi_rs2_OBUF[12]),
        .I3(\mem_wordsize_reg_n_0_[0] ),
        .I4(\mem_wordsize_reg_n_0_[1] ),
        .O(mem_la_wdata_OBUF[28]));
  OBUF \mem_la_wdata_OBUF[29]_inst 
       (.I(mem_la_wdata_OBUF[29]),
        .O(mem_la_wdata[29]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'hAAAAF0CC)) 
    \mem_la_wdata_OBUF[29]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[5]),
        .I1(pcpi_rs2_OBUF[29]),
        .I2(pcpi_rs2_OBUF[13]),
        .I3(\mem_wordsize_reg_n_0_[0] ),
        .I4(\mem_wordsize_reg_n_0_[1] ),
        .O(mem_la_wdata_OBUF[29]));
  OBUF \mem_la_wdata_OBUF[2]_inst 
       (.I(pcpi_rs2_OBUF[2]),
        .O(mem_la_wdata[2]));
  OBUF \mem_la_wdata_OBUF[30]_inst 
       (.I(mem_la_wdata_OBUF[30]),
        .O(mem_la_wdata[30]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'hAAAAF0CC)) 
    \mem_la_wdata_OBUF[30]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[6]),
        .I1(pcpi_rs2_OBUF[30]),
        .I2(pcpi_rs2_OBUF[14]),
        .I3(\mem_wordsize_reg_n_0_[0] ),
        .I4(\mem_wordsize_reg_n_0_[1] ),
        .O(mem_la_wdata_OBUF[30]));
  OBUF \mem_la_wdata_OBUF[31]_inst 
       (.I(mem_la_wdata_OBUF[31]),
        .O(mem_la_wdata[31]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'hAAAAF0CC)) 
    \mem_la_wdata_OBUF[31]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[7]),
        .I1(pcpi_rs2_OBUF[31]),
        .I2(pcpi_rs2_OBUF[15]),
        .I3(\mem_wordsize_reg_n_0_[0] ),
        .I4(\mem_wordsize_reg_n_0_[1] ),
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
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \mem_la_wdata_OBUF[8]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[8]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[0]),
        .O(mem_la_wdata_OBUF[8]));
  OBUF \mem_la_wdata_OBUF[9]_inst 
       (.I(mem_la_wdata_OBUF[9]),
        .O(mem_la_wdata[9]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \mem_la_wdata_OBUF[9]_inst_i_1 
       (.I0(pcpi_rs2_OBUF[9]),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs2_OBUF[1]),
        .O(mem_la_wdata_OBUF[9]));
  OBUF mem_la_write_OBUF_inst
       (.I(mem_la_write_OBUF),
        .O(mem_la_write));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    mem_la_write_OBUF_inst_i_1
       (.I0(resetn_IBUF),
        .I1(mem_do_wdata),
        .I2(\mem_state_reg_n_0_[1] ),
        .I3(\mem_state_reg_n_0_[0] ),
        .O(mem_la_write_OBUF));
  OBUF \mem_la_wstrb_OBUF[0]_inst 
       (.I(mem_la_wstrb_OBUF[0]),
        .O(mem_la_wstrb[0]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT4 #(
    .INIT(16'h515F)) 
    \mem_la_wstrb_OBUF[0]_inst_i_1 
       (.I0(pcpi_rs1_OBUF[1]),
        .I1(pcpi_rs1_OBUF[0]),
        .I2(\mem_wordsize_reg_n_0_[0] ),
        .I3(\mem_wordsize_reg_n_0_[1] ),
        .O(mem_la_wstrb_OBUF[0]));
  OBUF \mem_la_wstrb_OBUF[1]_inst 
       (.I(mem_la_wstrb_OBUF[1]),
        .O(mem_la_wstrb[1]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT4 #(
    .INIT(16'h11FB)) 
    \mem_la_wstrb_OBUF[1]_inst_i_1 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(pcpi_rs1_OBUF[0]),
        .I3(pcpi_rs1_OBUF[1]),
        .O(mem_la_wstrb_OBUF[1]));
  OBUF \mem_la_wstrb_OBUF[2]_inst 
       (.I(mem_la_wstrb_OBUF[2]),
        .O(mem_la_wstrb[2]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
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
  LUT4 #(
    .INIT(16'hBF80)) 
    \mem_rdata_q[0]_i_1 
       (.I0(mem_rdata_IBUF[0]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[0] ),
        .O(\mem_rdata_q[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \mem_rdata_q[12]_i_1 
       (.I0(mem_rdata_IBUF[12]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(p_0_in[0]),
        .O(\mem_rdata_q[12]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \mem_rdata_q[13]_i_1 
       (.I0(mem_rdata_IBUF[13]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(p_0_in[1]),
        .O(\mem_rdata_q[13]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \mem_rdata_q[14]_i_1 
       (.I0(mem_rdata_IBUF[14]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(p_0_in[2]),
        .O(\mem_rdata_q[14]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \mem_rdata_q[1]_i_1 
       (.I0(mem_rdata_IBUF[1]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[1] ),
        .O(\mem_rdata_q[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \mem_rdata_q[2]_i_1 
       (.I0(mem_rdata_IBUF[2]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[2] ),
        .O(\mem_rdata_q[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \mem_rdata_q[31]_i_1 
       (.I0(mem_ready_IBUF),
        .I1(mem_valid_OBUF),
        .O(mem_xfer));
  LUT4 #(
    .INIT(16'hBF80)) 
    \mem_rdata_q[3]_i_1 
       (.I0(mem_rdata_IBUF[3]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[3] ),
        .O(\mem_rdata_q[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \mem_rdata_q[4]_i_1 
       (.I0(mem_rdata_IBUF[4]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[4] ),
        .O(\mem_rdata_q[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \mem_rdata_q[5]_i_1 
       (.I0(mem_rdata_IBUF[5]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[5] ),
        .O(\mem_rdata_q[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBF80)) 
    \mem_rdata_q[6]_i_1 
       (.I0(mem_rdata_IBUF[6]),
        .I1(mem_ready_IBUF),
        .I2(mem_valid_OBUF),
        .I3(\mem_rdata_q_reg_n_0_[6] ),
        .O(\mem_rdata_q[6]_i_1_n_0 ));
  FDRE \mem_rdata_q_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\mem_rdata_q[0]_i_1_n_0 ),
        .Q(\mem_rdata_q_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_xfer),
        .D(mem_rdata_IBUF[10]),
        .Q(\mem_rdata_q_reg_n_0_[10] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_xfer),
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
        .CE(mem_xfer),
        .D(mem_rdata_IBUF[15]),
        .Q(\mem_rdata_q_reg_n_0_[15] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_xfer),
        .D(mem_rdata_IBUF[16]),
        .Q(\mem_rdata_q_reg_n_0_[16] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_xfer),
        .D(mem_rdata_IBUF[17]),
        .Q(\mem_rdata_q_reg_n_0_[17] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_xfer),
        .D(mem_rdata_IBUF[18]),
        .Q(\mem_rdata_q_reg_n_0_[18] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_xfer),
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
        .CE(mem_xfer),
        .D(mem_rdata_IBUF[20]),
        .Q(\mem_rdata_q_reg_n_0_[20] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_xfer),
        .D(mem_rdata_IBUF[21]),
        .Q(\mem_rdata_q_reg_n_0_[21] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_xfer),
        .D(mem_rdata_IBUF[22]),
        .Q(\mem_rdata_q_reg_n_0_[22] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_xfer),
        .D(mem_rdata_IBUF[23]),
        .Q(\mem_rdata_q_reg_n_0_[23] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_xfer),
        .D(mem_rdata_IBUF[24]),
        .Q(\mem_rdata_q_reg_n_0_[24] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_xfer),
        .D(mem_rdata_IBUF[25]),
        .Q(\mem_rdata_q_reg_n_0_[25] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_xfer),
        .D(mem_rdata_IBUF[26]),
        .Q(\mem_rdata_q_reg_n_0_[26] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_xfer),
        .D(mem_rdata_IBUF[27]),
        .Q(\mem_rdata_q_reg_n_0_[27] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_xfer),
        .D(mem_rdata_IBUF[28]),
        .Q(\mem_rdata_q_reg_n_0_[28] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_xfer),
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
        .CE(mem_xfer),
        .D(mem_rdata_IBUF[30]),
        .Q(\mem_rdata_q_reg_n_0_[30] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_xfer),
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
        .CE(mem_xfer),
        .D(mem_rdata_IBUF[7]),
        .Q(\mem_rdata_q_reg_n_0_[7] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_xfer),
        .D(mem_rdata_IBUF[8]),
        .Q(\mem_rdata_q_reg_n_0_[8] ),
        .R(\<const0> ));
  FDRE \mem_rdata_q_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(mem_xfer),
        .D(mem_rdata_IBUF[9]),
        .Q(\mem_rdata_q_reg_n_0_[9] ),
        .R(\<const0> ));
  IBUF mem_ready_IBUF_inst
       (.I(mem_ready),
        .O(mem_ready_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'hE200)) 
    \mem_state[0]_i_1 
       (.I0(\mem_state_reg_n_0_[0] ),
        .I1(mem_state),
        .I2(\mem_state[0]_i_2_n_0 ),
        .I3(resetn_IBUF),
        .O(\mem_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0000110F)) 
    \mem_state[0]_i_2 
       (.I0(mem_do_rinst_reg_n_0),
        .I1(mem_do_rdata),
        .I2(mem_do_wdata),
        .I3(\mem_state_reg_n_0_[0] ),
        .I4(\mem_state_reg_n_0_[1] ),
        .O(\mem_state[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'hE200)) 
    \mem_state[1]_i_1 
       (.I0(\mem_state_reg_n_0_[1] ),
        .I1(mem_state),
        .I2(\mem_state[1]_i_3_n_0 ),
        .I3(resetn_IBUF),
        .O(\mem_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000F791E680)) 
    \mem_state[1]_i_2 
       (.I0(\mem_state_reg_n_0_[1] ),
        .I1(\mem_state_reg_n_0_[0] ),
        .I2(mem_do_rinst_reg_n_0),
        .I3(mem_xfer),
        .I4(\mem_state[1]_i_4_n_0 ),
        .I5(mem_state1),
        .O(mem_state));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h000011F0)) 
    \mem_state[1]_i_3 
       (.I0(mem_do_rinst_reg_n_0),
        .I1(mem_do_rdata),
        .I2(mem_do_wdata),
        .I3(\mem_state_reg_n_0_[0] ),
        .I4(\mem_state_reg_n_0_[1] ),
        .O(\mem_state[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \mem_state[1]_i_4 
       (.I0(mem_do_rdata),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_prefetch_reg_n_0),
        .I3(mem_do_wdata),
        .O(\mem_state[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \mem_state[1]_i_5 
       (.I0(trap_OBUF),
        .I1(resetn_IBUF),
        .O(mem_state1));
  FDRE \mem_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\mem_state[0]_i_1_n_0 ),
        .Q(\mem_state_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE \mem_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\mem_state[1]_i_1_n_0 ),
        .Q(\mem_state_reg_n_0_[1] ),
        .R(\<const0> ));
  OBUF mem_valid_OBUF_inst
       (.I(mem_valid_OBUF),
        .O(mem_valid));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h7000)) 
    mem_valid_i_1
       (.I0(mem_ready_IBUF),
        .I1(trap_OBUF),
        .I2(resetn_IBUF),
        .I3(mem_valid_i_2_n_0),
        .O(mem_valid_i_1_n_0));
  LUT6 #(
    .INIT(64'hF0F0F0F0FFFF90F0)) 
    mem_valid_i_2
       (.I0(\mem_state_reg_n_0_[0] ),
        .I1(\mem_state_reg_n_0_[1] ),
        .I2(mem_valid_OBUF),
        .I3(mem_ready_IBUF),
        .I4(mem_valid_i_3_n_0),
        .I5(mem_state1),
        .O(mem_valid_i_2_n_0));
  LUT6 #(
    .INIT(64'h1111111111111110)) 
    mem_valid_i_3
       (.I0(\mem_state_reg_n_0_[1] ),
        .I1(\mem_state_reg_n_0_[0] ),
        .I2(mem_do_wdata),
        .I3(mem_do_prefetch_reg_n_0),
        .I4(mem_do_rinst_reg_n_0),
        .I5(mem_do_rdata),
        .O(mem_valid_i_3_n_0));
  FDRE mem_valid_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(mem_valid_i_1_n_0),
        .Q(mem_valid_OBUF),
        .R(\<const0> ));
  LUT5 #(
    .INIT(32'h00001000)) 
    \mem_wdata[31]_i_1 
       (.I0(\mem_state_reg_n_0_[0] ),
        .I1(\mem_state_reg_n_0_[1] ),
        .I2(mem_do_wdata),
        .I3(resetn_IBUF),
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
    .INIT(32'hBBBF8880)) 
    \mem_wordsize[0]_i_1 
       (.I0(mem_wordsize[0]),
        .I1(resetn_IBUF),
        .I2(latched_is_lu),
        .I3(\mem_wordsize[1]_i_4_n_0 ),
        .I4(\mem_wordsize_reg_n_0_[0] ),
        .O(\mem_wordsize[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0E0EFE0)) 
    \mem_wordsize[0]_i_2 
       (.I0(instr_lh),
        .I1(instr_lhu),
        .I2(\cpu_state_reg_n_0_[0] ),
        .I3(instr_sh),
        .I4(reg_next_pc),
        .O(mem_wordsize[0]));
  LUT5 #(
    .INIT(32'hBBBF8880)) 
    \mem_wordsize[1]_i_1 
       (.I0(mem_wordsize[1]),
        .I1(resetn_IBUF),
        .I2(latched_is_lu),
        .I3(\mem_wordsize[1]_i_4_n_0 ),
        .I4(\mem_wordsize_reg_n_0_[1] ),
        .O(\mem_wordsize[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0E0EFE0)) 
    \mem_wordsize[1]_i_2 
       (.I0(instr_lb),
        .I1(instr_lbu),
        .I2(\cpu_state_reg_n_0_[0] ),
        .I3(instr_sb),
        .I4(reg_next_pc),
        .O(mem_wordsize[1]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'hFF08)) 
    \mem_wordsize[1]_i_3 
       (.I0(decoder_trigger1),
        .I1(\cpu_state_reg_n_0_[0] ),
        .I2(mem_do_rdata),
        .I3(reg_next_pc),
        .O(latched_is_lu));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \mem_wordsize[1]_i_4 
       (.I0(mem_do_wdata),
        .I1(\cpu_state_reg_n_0_[1] ),
        .I2(decoder_trigger1),
        .O(\mem_wordsize[1]_i_4_n_0 ));
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
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h27370000)) 
    \mem_wstrb[0]_i_1 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(pcpi_rs1_OBUF[1]),
        .I2(\mem_wordsize_reg_n_0_[1] ),
        .I3(pcpi_rs1_OBUF[0]),
        .I4(mem_la_write_OBUF),
        .O(\mem_wstrb[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h554F0000)) 
    \mem_wstrb[1]_i_1 
       (.I0(pcpi_rs1_OBUF[1]),
        .I1(pcpi_rs1_OBUF[0]),
        .I2(\mem_wordsize_reg_n_0_[1] ),
        .I3(\mem_wordsize_reg_n_0_[0] ),
        .I4(mem_la_write_OBUF),
        .O(\mem_wstrb[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h8ABB0000)) 
    \mem_wstrb[2]_i_1 
       (.I0(pcpi_rs1_OBUF[1]),
        .I1(\mem_wordsize_reg_n_0_[0] ),
        .I2(pcpi_rs1_OBUF[0]),
        .I3(\mem_wordsize_reg_n_0_[1] ),
        .I4(mem_la_write_OBUF),
        .O(\mem_wstrb[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    \mem_wstrb[3]_i_1 
       (.I0(trap_OBUF),
        .I1(resetn_IBUF),
        .I2(\mem_state_reg_n_0_[1] ),
        .I3(\mem_state_reg_n_0_[0] ),
        .I4(mem_state0),
        .O(\mem_wstrb[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000011100000)) 
    \mem_wstrb[3]_i_2 
       (.I0(\mem_state_reg_n_0_[0] ),
        .I1(\mem_state_reg_n_0_[1] ),
        .I2(mem_state0),
        .I3(mem_do_wdata),
        .I4(resetn_IBUF),
        .I5(trap_OBUF),
        .O(\mem_wstrb[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hA8BB0000)) 
    \mem_wstrb[3]_i_3 
       (.I0(pcpi_rs1_OBUF[1]),
        .I1(\mem_wordsize_reg_n_0_[0] ),
        .I2(pcpi_rs1_OBUF[0]),
        .I3(\mem_wordsize_reg_n_0_[1] ),
        .I4(mem_la_write_OBUF),
        .O(\mem_wstrb[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \mem_wstrb[3]_i_4 
       (.I0(mem_do_prefetch_reg_n_0),
        .I1(mem_do_rinst_reg_n_0),
        .I2(mem_do_rdata),
        .O(mem_state0));
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
        .CE(\mem_wstrb[3]_i_2_n_0 ),
        .D(\mem_wstrb[0]_i_1_n_0 ),
        .Q(mem_wstrb_OBUF[0]),
        .R(\mem_wstrb[3]_i_1_n_0 ));
  FDRE \mem_wstrb_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wstrb[3]_i_2_n_0 ),
        .D(\mem_wstrb[1]_i_1_n_0 ),
        .Q(mem_wstrb_OBUF[1]),
        .R(\mem_wstrb[3]_i_1_n_0 ));
  FDRE \mem_wstrb_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wstrb[3]_i_2_n_0 ),
        .D(\mem_wstrb[2]_i_1_n_0 ),
        .Q(mem_wstrb_OBUF[2]),
        .R(\mem_wstrb[3]_i_1_n_0 ));
  FDRE \mem_wstrb_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\mem_wstrb[3]_i_2_n_0 ),
        .D(\mem_wstrb[3]_i_3_n_0 ),
        .Q(mem_wstrb_OBUF[3]),
        .R(\mem_wstrb[3]_i_1_n_0 ));
  OBUFT \pcpi_insn_OBUF[0]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[0]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[10]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[10]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[11]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[11]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[12]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[12]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[13]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[13]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[14]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[14]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[15]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[15]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[16]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[16]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[17]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[17]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[18]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[18]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[19]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[19]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[1]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[1]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[20]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[20]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[21]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[21]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[22]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[22]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[23]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[23]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[24]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[24]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[25]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[25]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[26]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[26]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[27]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[27]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[28]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[28]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[29]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[29]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[2]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[2]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[30]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[30]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[31]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[31]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[3]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[3]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[4]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[4]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[5]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[5]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[6]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[6]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[7]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[7]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[8]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[8]),
        .T(\<const1> ));
  OBUFT \pcpi_insn_OBUF[9]_inst 
       (.I(\<const0> ),
        .O(pcpi_insn[9]),
        .T(\<const1> ));
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
  LUT3 #(
    .INIT(8'h80)) 
    \reg_next_pc[12]_i_2 
       (.I0(decoder_trigger_reg_n_0),
        .I1(instr_jal),
        .I2(decoded_imm_j[12]),
        .O(\reg_next_pc[12]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \reg_next_pc[12]_i_3 
       (.I0(decoder_trigger_reg_n_0),
        .I1(instr_jal),
        .I2(decoded_imm_j[11]),
        .O(\reg_next_pc[12]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \reg_next_pc[12]_i_4 
       (.I0(decoder_trigger_reg_n_0),
        .I1(instr_jal),
        .I2(decoded_imm_j[10]),
        .O(\reg_next_pc[12]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \reg_next_pc[12]_i_5 
       (.I0(decoder_trigger_reg_n_0),
        .I1(instr_jal),
        .I2(decoded_imm_j[9]),
        .O(\reg_next_pc[12]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \reg_next_pc[12]_i_6 
       (.I0(decoded_imm_j[12]),
        .I1(instr_jal),
        .I2(decoder_trigger_reg_n_0),
        .I3(current_pc[12]),
        .O(\reg_next_pc[12]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \reg_next_pc[12]_i_7 
       (.I0(decoded_imm_j[11]),
        .I1(instr_jal),
        .I2(decoder_trigger_reg_n_0),
        .I3(current_pc[11]),
        .O(\reg_next_pc[12]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \reg_next_pc[12]_i_8 
       (.I0(decoded_imm_j[10]),
        .I1(instr_jal),
        .I2(decoder_trigger_reg_n_0),
        .I3(current_pc[10]),
        .O(\reg_next_pc[12]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \reg_next_pc[12]_i_9 
       (.I0(decoded_imm_j[9]),
        .I1(instr_jal),
        .I2(decoder_trigger_reg_n_0),
        .I3(current_pc[9]),
        .O(\reg_next_pc[12]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \reg_next_pc[16]_i_2 
       (.I0(decoder_trigger_reg_n_0),
        .I1(instr_jal),
        .I2(decoded_rs1[1]),
        .O(\reg_next_pc[16]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \reg_next_pc[16]_i_3 
       (.I0(decoder_trigger_reg_n_0),
        .I1(instr_jal),
        .I2(decoded_rs1[0]),
        .O(\reg_next_pc[16]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \reg_next_pc[16]_i_4 
       (.I0(decoder_trigger_reg_n_0),
        .I1(instr_jal),
        .I2(decoded_imm_j[14]),
        .O(\reg_next_pc[16]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \reg_next_pc[16]_i_5 
       (.I0(decoder_trigger_reg_n_0),
        .I1(instr_jal),
        .I2(decoded_imm_j[13]),
        .O(\reg_next_pc[16]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \reg_next_pc[16]_i_6 
       (.I0(decoded_rs1[1]),
        .I1(instr_jal),
        .I2(decoder_trigger_reg_n_0),
        .I3(current_pc[16]),
        .O(\reg_next_pc[16]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \reg_next_pc[16]_i_7 
       (.I0(decoded_rs1[0]),
        .I1(instr_jal),
        .I2(decoder_trigger_reg_n_0),
        .I3(current_pc[15]),
        .O(\reg_next_pc[16]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \reg_next_pc[16]_i_8 
       (.I0(decoded_imm_j[14]),
        .I1(instr_jal),
        .I2(decoder_trigger_reg_n_0),
        .I3(current_pc[14]),
        .O(\reg_next_pc[16]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \reg_next_pc[16]_i_9 
       (.I0(decoded_imm_j[13]),
        .I1(instr_jal),
        .I2(decoder_trigger_reg_n_0),
        .I3(current_pc[13]),
        .O(\reg_next_pc[16]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \reg_next_pc[20]_i_2 
       (.I0(decoder_trigger_reg_n_0),
        .I1(instr_jal),
        .I2(decoded_rs1[4]),
        .O(\reg_next_pc[20]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \reg_next_pc[20]_i_3 
       (.I0(decoder_trigger_reg_n_0),
        .I1(instr_jal),
        .I2(decoded_rs1[3]),
        .O(\reg_next_pc[20]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \reg_next_pc[20]_i_4 
       (.I0(decoder_trigger_reg_n_0),
        .I1(instr_jal),
        .I2(decoded_rs1[2]),
        .O(\reg_next_pc[20]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h555556A6AAAA56A6)) 
    \reg_next_pc[20]_i_5 
       (.I0(\reg_next_pc[31]_i_2_n_0 ),
        .I1(\reg_out_reg_n_0_[20] ),
        .I2(latched_stalu_reg_n_0),
        .I3(alu_out_q[20]),
        .I4(\reg_next_pc[31]_i_6_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[20] ),
        .O(\reg_next_pc[20]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \reg_next_pc[20]_i_6 
       (.I0(decoded_rs1[4]),
        .I1(instr_jal),
        .I2(decoder_trigger_reg_n_0),
        .I3(current_pc[19]),
        .O(\reg_next_pc[20]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \reg_next_pc[20]_i_7 
       (.I0(decoded_rs1[3]),
        .I1(instr_jal),
        .I2(decoder_trigger_reg_n_0),
        .I3(current_pc[18]),
        .O(\reg_next_pc[20]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \reg_next_pc[20]_i_8 
       (.I0(decoded_rs1[2]),
        .I1(instr_jal),
        .I2(decoder_trigger_reg_n_0),
        .I3(current_pc[17]),
        .O(\reg_next_pc[20]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h555556A6AAAA56A6)) 
    \reg_next_pc[24]_i_2 
       (.I0(\reg_next_pc[31]_i_2_n_0 ),
        .I1(\reg_out_reg_n_0_[24] ),
        .I2(latched_stalu_reg_n_0),
        .I3(alu_out_q[24]),
        .I4(\reg_next_pc[31]_i_6_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[24] ),
        .O(\reg_next_pc[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h555556A6AAAA56A6)) 
    \reg_next_pc[24]_i_3 
       (.I0(\reg_next_pc[31]_i_2_n_0 ),
        .I1(\reg_out_reg_n_0_[23] ),
        .I2(latched_stalu_reg_n_0),
        .I3(alu_out_q[23]),
        .I4(\reg_next_pc[31]_i_6_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[23] ),
        .O(\reg_next_pc[24]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h555556A6AAAA56A6)) 
    \reg_next_pc[24]_i_4 
       (.I0(\reg_next_pc[31]_i_2_n_0 ),
        .I1(\reg_out_reg_n_0_[22] ),
        .I2(latched_stalu_reg_n_0),
        .I3(alu_out_q[22]),
        .I4(\reg_next_pc[31]_i_6_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[22] ),
        .O(\reg_next_pc[24]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h555556A6AAAA56A6)) 
    \reg_next_pc[24]_i_5 
       (.I0(\reg_next_pc[31]_i_2_n_0 ),
        .I1(\reg_out_reg_n_0_[21] ),
        .I2(latched_stalu_reg_n_0),
        .I3(alu_out_q[21]),
        .I4(\reg_next_pc[31]_i_6_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[21] ),
        .O(\reg_next_pc[24]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h555556A6AAAA56A6)) 
    \reg_next_pc[28]_i_2 
       (.I0(\reg_next_pc[31]_i_2_n_0 ),
        .I1(\reg_out_reg_n_0_[28] ),
        .I2(latched_stalu_reg_n_0),
        .I3(alu_out_q[28]),
        .I4(\reg_next_pc[31]_i_6_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[28] ),
        .O(\reg_next_pc[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h555556A6AAAA56A6)) 
    \reg_next_pc[28]_i_3 
       (.I0(\reg_next_pc[31]_i_2_n_0 ),
        .I1(\reg_out_reg_n_0_[27] ),
        .I2(latched_stalu_reg_n_0),
        .I3(alu_out_q[27]),
        .I4(\reg_next_pc[31]_i_6_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[27] ),
        .O(\reg_next_pc[28]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h555556A6AAAA56A6)) 
    \reg_next_pc[28]_i_4 
       (.I0(\reg_next_pc[31]_i_2_n_0 ),
        .I1(\reg_out_reg_n_0_[26] ),
        .I2(latched_stalu_reg_n_0),
        .I3(alu_out_q[26]),
        .I4(\reg_next_pc[31]_i_6_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[26] ),
        .O(\reg_next_pc[28]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h555556A6AAAA56A6)) 
    \reg_next_pc[28]_i_5 
       (.I0(\reg_next_pc[31]_i_2_n_0 ),
        .I1(\reg_out_reg_n_0_[25] ),
        .I2(latched_stalu_reg_n_0),
        .I3(alu_out_q[25]),
        .I4(\reg_next_pc[31]_i_6_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[25] ),
        .O(\reg_next_pc[28]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \reg_next_pc[31]_i_2 
       (.I0(decoder_trigger_reg_n_0),
        .I1(decoded_imm_j[30]),
        .I2(instr_jal),
        .O(\reg_next_pc[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h555556A6AAAA56A6)) 
    \reg_next_pc[31]_i_3 
       (.I0(\reg_next_pc[31]_i_2_n_0 ),
        .I1(\reg_out_reg_n_0_[31] ),
        .I2(latched_stalu_reg_n_0),
        .I3(alu_out_q[31]),
        .I4(\reg_next_pc[31]_i_6_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[31] ),
        .O(\reg_next_pc[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h555556A6AAAA56A6)) 
    \reg_next_pc[31]_i_4 
       (.I0(\reg_next_pc[31]_i_2_n_0 ),
        .I1(\reg_out_reg_n_0_[30] ),
        .I2(latched_stalu_reg_n_0),
        .I3(alu_out_q[30]),
        .I4(\reg_next_pc[31]_i_6_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[30] ),
        .O(\reg_next_pc[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h555556A6AAAA56A6)) 
    \reg_next_pc[31]_i_5 
       (.I0(\reg_next_pc[31]_i_2_n_0 ),
        .I1(\reg_out_reg_n_0_[29] ),
        .I2(latched_stalu_reg_n_0),
        .I3(alu_out_q[29]),
        .I4(\reg_next_pc[31]_i_6_n_0 ),
        .I5(\reg_next_pc_reg_n_0_[29] ),
        .O(\reg_next_pc[31]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \reg_next_pc[31]_i_6 
       (.I0(latched_branch_reg_n_0),
        .I1(latched_store_reg_n_0),
        .O(\reg_next_pc[31]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \reg_next_pc[4]_i_2 
       (.I0(decoder_trigger_reg_n_0),
        .I1(instr_jal),
        .I2(decoded_imm_j[4]),
        .O(\reg_next_pc[4]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \reg_next_pc[4]_i_3 
       (.I0(decoder_trigger_reg_n_0),
        .I1(instr_jal),
        .I2(decoded_imm_j[3]),
        .O(\reg_next_pc[4]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h8C)) 
    \reg_next_pc[4]_i_4 
       (.I0(decoded_imm_j[2]),
        .I1(decoder_trigger_reg_n_0),
        .I2(instr_jal),
        .O(\reg_next_pc[4]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \reg_next_pc[4]_i_5 
       (.I0(decoder_trigger_reg_n_0),
        .I1(instr_jal),
        .I2(decoded_imm_j[1]),
        .O(\reg_next_pc[4]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \reg_next_pc[4]_i_6 
       (.I0(decoded_imm_j[4]),
        .I1(instr_jal),
        .I2(decoder_trigger_reg_n_0),
        .I3(current_pc[4]),
        .O(\reg_next_pc[4]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \reg_next_pc[4]_i_7 
       (.I0(decoded_imm_j[3]),
        .I1(instr_jal),
        .I2(decoder_trigger_reg_n_0),
        .I3(current_pc[3]),
        .O(\reg_next_pc[4]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h3BC4)) 
    \reg_next_pc[4]_i_8 
       (.I0(instr_jal),
        .I1(decoder_trigger_reg_n_0),
        .I2(decoded_imm_j[2]),
        .I3(current_pc[2]),
        .O(\reg_next_pc[4]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \reg_next_pc[4]_i_9 
       (.I0(decoded_imm_j[1]),
        .I1(instr_jal),
        .I2(decoder_trigger_reg_n_0),
        .I3(current_pc[1]),
        .O(\reg_next_pc[4]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \reg_next_pc[8]_i_2 
       (.I0(decoder_trigger_reg_n_0),
        .I1(instr_jal),
        .I2(decoded_imm_j[8]),
        .O(\reg_next_pc[8]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \reg_next_pc[8]_i_3 
       (.I0(decoder_trigger_reg_n_0),
        .I1(instr_jal),
        .I2(decoded_imm_j[7]),
        .O(\reg_next_pc[8]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \reg_next_pc[8]_i_4 
       (.I0(decoder_trigger_reg_n_0),
        .I1(instr_jal),
        .I2(decoded_imm_j[6]),
        .O(\reg_next_pc[8]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \reg_next_pc[8]_i_5 
       (.I0(decoder_trigger_reg_n_0),
        .I1(instr_jal),
        .I2(decoded_imm_j[5]),
        .O(\reg_next_pc[8]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \reg_next_pc[8]_i_6 
       (.I0(decoded_imm_j[8]),
        .I1(instr_jal),
        .I2(decoder_trigger_reg_n_0),
        .I3(current_pc[8]),
        .O(\reg_next_pc[8]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \reg_next_pc[8]_i_7 
       (.I0(decoded_imm_j[7]),
        .I1(instr_jal),
        .I2(decoder_trigger_reg_n_0),
        .I3(current_pc[7]),
        .O(\reg_next_pc[8]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \reg_next_pc[8]_i_8 
       (.I0(decoded_imm_j[6]),
        .I1(instr_jal),
        .I2(decoder_trigger_reg_n_0),
        .I3(current_pc[6]),
        .O(\reg_next_pc[8]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \reg_next_pc[8]_i_9 
       (.I0(decoded_imm_j[5]),
        .I1(instr_jal),
        .I2(decoder_trigger_reg_n_0),
        .I3(current_pc[5]),
        .O(\reg_next_pc[8]_i_9_n_0 ));
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_next_pc_reg[12]_i_1 
       (.CI(\reg_next_pc_reg[8]_i_1_n_0 ),
        .CO({\reg_next_pc_reg[12]_i_1_n_0 ,\NLW_reg_next_pc_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_next_pc[12]_i_2_n_0 ,\reg_next_pc[12]_i_3_n_0 ,\reg_next_pc[12]_i_4_n_0 ,\reg_next_pc[12]_i_5_n_0 }),
        .O(reg_next_pc1_in[12:9]),
        .S({\reg_next_pc[12]_i_6_n_0 ,\reg_next_pc[12]_i_7_n_0 ,\reg_next_pc[12]_i_8_n_0 ,\reg_next_pc[12]_i_9_n_0 }));
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_next_pc_reg[16]_i_1 
       (.CI(\reg_next_pc_reg[12]_i_1_n_0 ),
        .CO({\reg_next_pc_reg[16]_i_1_n_0 ,\NLW_reg_next_pc_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_next_pc[16]_i_2_n_0 ,\reg_next_pc[16]_i_3_n_0 ,\reg_next_pc[16]_i_4_n_0 ,\reg_next_pc[16]_i_5_n_0 }),
        .O(reg_next_pc1_in[16:13]),
        .S({\reg_next_pc[16]_i_6_n_0 ,\reg_next_pc[16]_i_7_n_0 ,\reg_next_pc[16]_i_8_n_0 ,\reg_next_pc[16]_i_9_n_0 }));
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_next_pc_reg[20]_i_1 
       (.CI(\reg_next_pc_reg[16]_i_1_n_0 ),
        .CO({\reg_next_pc_reg[20]_i_1_n_0 ,\NLW_reg_next_pc_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_next_pc[31]_i_2_n_0 ,\reg_next_pc[20]_i_2_n_0 ,\reg_next_pc[20]_i_3_n_0 ,\reg_next_pc[20]_i_4_n_0 }),
        .O(reg_next_pc1_in[20:17]),
        .S({\reg_next_pc[20]_i_5_n_0 ,\reg_next_pc[20]_i_6_n_0 ,\reg_next_pc[20]_i_7_n_0 ,\reg_next_pc[20]_i_8_n_0 }));
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_next_pc_reg[4]_i_1 
       (.CI(\<const0> ),
        .CO({\reg_next_pc_reg[4]_i_1_n_0 ,\NLW_reg_next_pc_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_next_pc[4]_i_2_n_0 ,\reg_next_pc[4]_i_3_n_0 ,\reg_next_pc[4]_i_4_n_0 ,\reg_next_pc[4]_i_5_n_0 }),
        .O(reg_next_pc1_in[4:1]),
        .S({\reg_next_pc[4]_i_6_n_0 ,\reg_next_pc[4]_i_7_n_0 ,\reg_next_pc[4]_i_8_n_0 ,\reg_next_pc[4]_i_9_n_0 }));
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_next_pc_reg[8]_i_1 
       (.CI(\reg_next_pc_reg[4]_i_1_n_0 ),
        .CO({\reg_next_pc_reg[8]_i_1_n_0 ,\NLW_reg_next_pc_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_next_pc[8]_i_2_n_0 ,\reg_next_pc[8]_i_3_n_0 ,\reg_next_pc[8]_i_4_n_0 ,\reg_next_pc[8]_i_5_n_0 }),
        .O(reg_next_pc1_in[8:5]),
        .S({\reg_next_pc[8]_i_6_n_0 ,\reg_next_pc[8]_i_7_n_0 ,\reg_next_pc[8]_i_8_n_0 ,\reg_next_pc[8]_i_9_n_0 }));
  FDRE \reg_next_pc_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(reg_next_pc),
        .D(reg_next_pc1_in[9]),
        .Q(\reg_next_pc_reg_n_0_[9] ),
        .R(instr_and_i_1_n_0));
  LUT4 #(
    .INIT(16'h8F80)) 
    \reg_op1[0]_i_1 
       (.I0(\reg_op1[31]_i_7_n_0 ),
        .I1(reg_op12[0]),
        .I2(\cpu_state_reg_n_0_[5] ),
        .I3(\reg_op1[0]_i_2_n_0 ),
        .O(reg_op1[0]));
  LUT6 #(
    .INIT(64'hFFC0AAAAC0C0AAAA)) 
    \reg_op1[0]_i_2 
       (.I0(\reg_op1_reg[3]_i_4_n_7 ),
        .I1(pcpi_rs1_OBUF[1]),
        .I2(\reg_op1[0]_i_3_n_0 ),
        .I3(\reg_op1[0]_i_4_n_0 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .I5(pcpi_rs1_OBUF[4]),
        .O(\reg_op1[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0000FFFE)) 
    \reg_op1[0]_i_3 
       (.I0(instr_srai),
        .I1(instr_sra),
        .I2(instr_srli),
        .I3(instr_srl),
        .I4(\reg_op1[0]_i_5_n_0 ),
        .O(\reg_op1[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \reg_op1[0]_i_4 
       (.I0(instr_srai),
        .I1(instr_sra),
        .I2(instr_srli),
        .I3(instr_srl),
        .I4(\reg_op1[0]_i_5_n_0 ),
        .O(\reg_op1[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \reg_op1[0]_i_5 
       (.I0(\reg_sh_reg_n_0_[3] ),
        .I1(\reg_sh_reg_n_0_[4] ),
        .I2(\reg_sh_reg_n_0_[2] ),
        .O(\reg_op1[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEAAAEAAAEAAA)) 
    \reg_op1[10]_i_1 
       (.I0(\reg_op1[10]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(\reg_pc_reg_n_0_[10] ),
        .I3(\reg_op1[31]_i_6_n_0 ),
        .I4(reg_op12[10]),
        .I5(\reg_op1[31]_i_7_n_0 ),
        .O(reg_op1[10]));
  LUT5 #(
    .INIT(32'h0000EEF0)) 
    \reg_op1[10]_i_2 
       (.I0(\reg_op1[10]_i_3_n_0 ),
        .I1(\reg_op1[10]_i_4_n_0 ),
        .I2(\reg_op1_reg[11]_i_5_n_5 ),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[10]_i_3 
       (.I0(pcpi_rs1_OBUF[14]),
        .I1(\reg_op1[0]_i_4_n_0 ),
        .I2(pcpi_rs1_OBUF[6]),
        .I3(\reg_op1[31]_i_10_n_0 ),
        .O(\reg_op1[10]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[10]_i_4 
       (.I0(pcpi_rs1_OBUF[9]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[11]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[10]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEAAAEAAAEAAA)) 
    \reg_op1[11]_i_1 
       (.I0(\reg_op1[11]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(\reg_pc_reg_n_0_[11] ),
        .I3(\reg_op1[31]_i_6_n_0 ),
        .I4(reg_op12[11]),
        .I5(\reg_op1[31]_i_7_n_0 ),
        .O(reg_op1[11]));
  LUT5 #(
    .INIT(32'h0000EEF0)) 
    \reg_op1[11]_i_2 
       (.I0(\reg_op1[11]_i_3_n_0 ),
        .I1(\reg_op1[11]_i_4_n_0 ),
        .I2(\reg_op1_reg[11]_i_5_n_4 ),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[11]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[11]_i_3 
       (.I0(pcpi_rs1_OBUF[15]),
        .I1(\reg_op1[0]_i_4_n_0 ),
        .I2(pcpi_rs1_OBUF[7]),
        .I3(\reg_op1[31]_i_10_n_0 ),
        .O(\reg_op1[11]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[11]_i_4 
       (.I0(pcpi_rs1_OBUF[10]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[12]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[11]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[11]_i_6 
       (.I0(pcpi_rs1_OBUF[11]),
        .I1(decoded_imm[11]),
        .O(\reg_op1[11]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[11]_i_7 
       (.I0(pcpi_rs1_OBUF[10]),
        .I1(decoded_imm[10]),
        .O(\reg_op1[11]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[11]_i_8 
       (.I0(pcpi_rs1_OBUF[9]),
        .I1(decoded_imm[9]),
        .O(\reg_op1[11]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[11]_i_9 
       (.I0(pcpi_rs1_OBUF[8]),
        .I1(decoded_imm[8]),
        .O(\reg_op1[11]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEAAAEAAAEAAA)) 
    \reg_op1[12]_i_1 
       (.I0(\reg_op1[12]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(\reg_pc_reg_n_0_[12] ),
        .I3(\reg_op1[31]_i_6_n_0 ),
        .I4(reg_op12[12]),
        .I5(\reg_op1[31]_i_7_n_0 ),
        .O(reg_op1[12]));
  LUT5 #(
    .INIT(32'h0000EEF0)) 
    \reg_op1[12]_i_2 
       (.I0(\reg_op1[12]_i_3_n_0 ),
        .I1(\reg_op1[12]_i_4_n_0 ),
        .I2(\reg_op1_reg[15]_i_5_n_7 ),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[12]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[12]_i_3 
       (.I0(pcpi_rs1_OBUF[16]),
        .I1(\reg_op1[0]_i_4_n_0 ),
        .I2(pcpi_rs1_OBUF[8]),
        .I3(\reg_op1[31]_i_10_n_0 ),
        .O(\reg_op1[12]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[12]_i_4 
       (.I0(pcpi_rs1_OBUF[11]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[13]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[12]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEAAAEAAAEAAA)) 
    \reg_op1[13]_i_1 
       (.I0(\reg_op1[13]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(\reg_pc_reg_n_0_[13] ),
        .I3(\reg_op1[31]_i_6_n_0 ),
        .I4(reg_op12[13]),
        .I5(\reg_op1[31]_i_7_n_0 ),
        .O(reg_op1[13]));
  LUT5 #(
    .INIT(32'h0000EEF0)) 
    \reg_op1[13]_i_2 
       (.I0(\reg_op1[13]_i_3_n_0 ),
        .I1(\reg_op1[13]_i_4_n_0 ),
        .I2(\reg_op1_reg[15]_i_5_n_6 ),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[13]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[13]_i_3 
       (.I0(pcpi_rs1_OBUF[17]),
        .I1(\reg_op1[0]_i_4_n_0 ),
        .I2(pcpi_rs1_OBUF[9]),
        .I3(\reg_op1[31]_i_10_n_0 ),
        .O(\reg_op1[13]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[13]_i_4 
       (.I0(pcpi_rs1_OBUF[12]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[14]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[13]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEAAAEAAAEAAA)) 
    \reg_op1[14]_i_1 
       (.I0(\reg_op1[14]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(\reg_pc_reg_n_0_[14] ),
        .I3(\reg_op1[31]_i_6_n_0 ),
        .I4(reg_op12[14]),
        .I5(\reg_op1[31]_i_7_n_0 ),
        .O(reg_op1[14]));
  LUT5 #(
    .INIT(32'h0000EEF0)) 
    \reg_op1[14]_i_2 
       (.I0(\reg_op1[14]_i_3_n_0 ),
        .I1(\reg_op1[14]_i_4_n_0 ),
        .I2(\reg_op1_reg[15]_i_5_n_5 ),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[14]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[14]_i_3 
       (.I0(pcpi_rs1_OBUF[18]),
        .I1(\reg_op1[0]_i_4_n_0 ),
        .I2(pcpi_rs1_OBUF[10]),
        .I3(\reg_op1[31]_i_10_n_0 ),
        .O(\reg_op1[14]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[14]_i_4 
       (.I0(pcpi_rs1_OBUF[13]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[15]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[14]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEAAAEAAAEAAA)) 
    \reg_op1[15]_i_1 
       (.I0(\reg_op1[15]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(\reg_pc_reg_n_0_[15] ),
        .I3(\reg_op1[31]_i_6_n_0 ),
        .I4(reg_op12[15]),
        .I5(\reg_op1[31]_i_7_n_0 ),
        .O(reg_op1[15]));
  LUT5 #(
    .INIT(32'h0000EEF0)) 
    \reg_op1[15]_i_2 
       (.I0(\reg_op1[15]_i_3_n_0 ),
        .I1(\reg_op1[15]_i_4_n_0 ),
        .I2(\reg_op1_reg[15]_i_5_n_4 ),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[15]_i_3 
       (.I0(pcpi_rs1_OBUF[19]),
        .I1(\reg_op1[0]_i_4_n_0 ),
        .I2(pcpi_rs1_OBUF[11]),
        .I3(\reg_op1[31]_i_10_n_0 ),
        .O(\reg_op1[15]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[15]_i_4 
       (.I0(pcpi_rs1_OBUF[14]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[16]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[15]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[15]_i_6 
       (.I0(pcpi_rs1_OBUF[15]),
        .I1(decoded_imm[15]),
        .O(\reg_op1[15]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[15]_i_7 
       (.I0(pcpi_rs1_OBUF[14]),
        .I1(decoded_imm[14]),
        .O(\reg_op1[15]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[15]_i_8 
       (.I0(pcpi_rs1_OBUF[13]),
        .I1(decoded_imm[13]),
        .O(\reg_op1[15]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[15]_i_9 
       (.I0(pcpi_rs1_OBUF[12]),
        .I1(decoded_imm[12]),
        .O(\reg_op1[15]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEAAAEAAAEAAA)) 
    \reg_op1[16]_i_1 
       (.I0(\reg_op1[16]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(\reg_pc_reg_n_0_[16] ),
        .I3(\reg_op1[31]_i_6_n_0 ),
        .I4(reg_op12[16]),
        .I5(\reg_op1[31]_i_7_n_0 ),
        .O(reg_op1[16]));
  LUT5 #(
    .INIT(32'h0000EEF0)) 
    \reg_op1[16]_i_2 
       (.I0(\reg_op1[16]_i_3_n_0 ),
        .I1(\reg_op1[16]_i_4_n_0 ),
        .I2(\reg_op1_reg[19]_i_5_n_7 ),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[16]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[16]_i_3 
       (.I0(pcpi_rs1_OBUF[20]),
        .I1(\reg_op1[0]_i_4_n_0 ),
        .I2(pcpi_rs1_OBUF[12]),
        .I3(\reg_op1[31]_i_10_n_0 ),
        .O(\reg_op1[16]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[16]_i_4 
       (.I0(pcpi_rs1_OBUF[15]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[17]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[16]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEAAAEAAAEAAA)) 
    \reg_op1[17]_i_1 
       (.I0(\reg_op1[17]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(\reg_pc_reg_n_0_[17] ),
        .I3(\reg_op1[31]_i_6_n_0 ),
        .I4(reg_op12[17]),
        .I5(\reg_op1[31]_i_7_n_0 ),
        .O(reg_op1[17]));
  LUT5 #(
    .INIT(32'h0000EEF0)) 
    \reg_op1[17]_i_2 
       (.I0(\reg_op1[17]_i_3_n_0 ),
        .I1(\reg_op1[17]_i_4_n_0 ),
        .I2(\reg_op1_reg[19]_i_5_n_6 ),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[17]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[17]_i_3 
       (.I0(pcpi_rs1_OBUF[21]),
        .I1(\reg_op1[0]_i_4_n_0 ),
        .I2(pcpi_rs1_OBUF[13]),
        .I3(\reg_op1[31]_i_10_n_0 ),
        .O(\reg_op1[17]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[17]_i_4 
       (.I0(pcpi_rs1_OBUF[16]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[18]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[17]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEAAAEAAAEAAA)) 
    \reg_op1[18]_i_1 
       (.I0(\reg_op1[18]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(\reg_pc_reg_n_0_[18] ),
        .I3(\reg_op1[31]_i_6_n_0 ),
        .I4(reg_op12[18]),
        .I5(\reg_op1[31]_i_7_n_0 ),
        .O(reg_op1[18]));
  LUT5 #(
    .INIT(32'h0000EEF0)) 
    \reg_op1[18]_i_2 
       (.I0(\reg_op1[18]_i_3_n_0 ),
        .I1(\reg_op1[18]_i_4_n_0 ),
        .I2(\reg_op1_reg[19]_i_5_n_5 ),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[18]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[18]_i_3 
       (.I0(pcpi_rs1_OBUF[22]),
        .I1(\reg_op1[0]_i_4_n_0 ),
        .I2(pcpi_rs1_OBUF[14]),
        .I3(\reg_op1[31]_i_10_n_0 ),
        .O(\reg_op1[18]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[18]_i_4 
       (.I0(pcpi_rs1_OBUF[17]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[19]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[18]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEAAAEAAAEAAA)) 
    \reg_op1[19]_i_1 
       (.I0(\reg_op1[19]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(\reg_pc_reg_n_0_[19] ),
        .I3(\reg_op1[31]_i_6_n_0 ),
        .I4(reg_op12[19]),
        .I5(\reg_op1[31]_i_7_n_0 ),
        .O(reg_op1[19]));
  LUT5 #(
    .INIT(32'h0000EEF0)) 
    \reg_op1[19]_i_2 
       (.I0(\reg_op1[19]_i_3_n_0 ),
        .I1(\reg_op1[19]_i_4_n_0 ),
        .I2(\reg_op1_reg[19]_i_5_n_4 ),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[19]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[19]_i_3 
       (.I0(pcpi_rs1_OBUF[23]),
        .I1(\reg_op1[0]_i_4_n_0 ),
        .I2(pcpi_rs1_OBUF[15]),
        .I3(\reg_op1[31]_i_10_n_0 ),
        .O(\reg_op1[19]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[19]_i_4 
       (.I0(pcpi_rs1_OBUF[18]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[20]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[19]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[19]_i_6 
       (.I0(pcpi_rs1_OBUF[19]),
        .I1(decoded_imm[19]),
        .O(\reg_op1[19]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[19]_i_7 
       (.I0(pcpi_rs1_OBUF[18]),
        .I1(decoded_imm[18]),
        .O(\reg_op1[19]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[19]_i_8 
       (.I0(pcpi_rs1_OBUF[17]),
        .I1(decoded_imm[17]),
        .O(\reg_op1[19]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[19]_i_9 
       (.I0(pcpi_rs1_OBUF[16]),
        .I1(decoded_imm[16]),
        .O(\reg_op1[19]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[20]_i_4 
       (.I0(pcpi_rs1_OBUF[19]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[21]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[20]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[21]_i_4 
       (.I0(pcpi_rs1_OBUF[20]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[22]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[21]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[22]_i_4 
       (.I0(pcpi_rs1_OBUF[21]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[23]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[22]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[23]_i_4 
       (.I0(pcpi_rs1_OBUF[22]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[24]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[23]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[23]_i_6 
       (.I0(pcpi_rs1_OBUF[23]),
        .I1(decoded_imm[23]),
        .O(\reg_op1[23]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[23]_i_7 
       (.I0(pcpi_rs1_OBUF[22]),
        .I1(decoded_imm[22]),
        .O(\reg_op1[23]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[23]_i_8 
       (.I0(pcpi_rs1_OBUF[21]),
        .I1(decoded_imm[21]),
        .O(\reg_op1[23]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[23]_i_9 
       (.I0(pcpi_rs1_OBUF[20]),
        .I1(decoded_imm[20]),
        .O(\reg_op1[23]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[24]_i_4 
       (.I0(pcpi_rs1_OBUF[23]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[25]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[24]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[25]_i_4 
       (.I0(pcpi_rs1_OBUF[24]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[26]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[25]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[26]_i_4 
       (.I0(pcpi_rs1_OBUF[25]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[27]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[26]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[27]_i_4 
       (.I0(pcpi_rs1_OBUF[26]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[28]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[27]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[27]_i_6 
       (.I0(pcpi_rs1_OBUF[27]),
        .I1(decoded_imm[27]),
        .O(\reg_op1[27]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[27]_i_7 
       (.I0(pcpi_rs1_OBUF[26]),
        .I1(decoded_imm[26]),
        .O(\reg_op1[27]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[27]_i_8 
       (.I0(pcpi_rs1_OBUF[25]),
        .I1(decoded_imm[25]),
        .O(\reg_op1[27]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[27]_i_9 
       (.I0(pcpi_rs1_OBUF[24]),
        .I1(decoded_imm[24]),
        .O(\reg_op1[27]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h22220000FFF00000)) 
    \reg_op1[31]_i_1 
       (.I0(decoder_trigger1),
        .I1(mem_do_rdata),
        .I2(\reg_op1[31]_i_4_n_0 ),
        .I3(\mem_wordsize[1]_i_4_n_0 ),
        .I4(resetn_IBUF),
        .I5(\cpu_state_reg_n_0_[0] ),
        .O(\reg_op1[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hEEEEEEE0)) 
    \reg_op1[31]_i_10 
       (.I0(instr_sll),
        .I1(instr_slli),
        .I2(\reg_sh_reg_n_0_[2] ),
        .I3(\reg_sh_reg_n_0_[4] ),
        .I4(\reg_sh_reg_n_0_[3] ),
        .O(\reg_op1[31]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \reg_op1[31]_i_12 
       (.I0(decoded_rs1[0]),
        .I1(decoded_rs1[1]),
        .I2(decoded_rs1[2]),
        .I3(decoded_rs1[4]),
        .I4(decoded_rs1[3]),
        .O(\reg_op1[31]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'h0000000E)) 
    \reg_op1[31]_i_13 
       (.I0(instr_sll),
        .I1(instr_slli),
        .I2(\reg_sh_reg_n_0_[2] ),
        .I3(\reg_sh_reg_n_0_[4] ),
        .I4(\reg_sh_reg_n_0_[3] ),
        .O(\reg_op1[31]_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[31]_i_14 
       (.I0(pcpi_rs1_OBUF[31]),
        .I1(decoded_imm[31]),
        .O(\reg_op1[31]_i_14_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[31]_i_15 
       (.I0(pcpi_rs1_OBUF[30]),
        .I1(decoded_imm[30]),
        .O(\reg_op1[31]_i_15_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[31]_i_16 
       (.I0(pcpi_rs1_OBUF[29]),
        .I1(decoded_imm[29]),
        .O(\reg_op1[31]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[31]_i_17 
       (.I0(pcpi_rs1_OBUF[28]),
        .I1(decoded_imm[28]),
        .O(\reg_op1[31]_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \reg_op1[31]_i_3 
       (.I0(mem_done),
        .I1(mem_do_prefetch_reg_n_0),
        .O(decoder_trigger1));
  LUT6 #(
    .INIT(64'h00FE00FE00FF0000)) 
    \reg_op1[31]_i_4 
       (.I0(\reg_sh_reg_n_0_[3] ),
        .I1(\reg_sh_reg_n_0_[4] ),
        .I2(\reg_op1[31]_i_8_n_0 ),
        .I3(\cpu_state_reg_n_0_[1] ),
        .I4(\cpu_state_reg_n_0_[5] ),
        .I5(\cpu_state_reg_n_0_[2] ),
        .O(\reg_op1[31]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0010)) 
    \reg_op1[31]_i_6 
       (.I0(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .I1(instr_trap),
        .I2(is_lui_auipc_jal),
        .I3(instr_lui),
        .O(\reg_op1[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h0002)) 
    \reg_op1[31]_i_7 
       (.I0(\reg_op1[31]_i_12_n_0 ),
        .I1(instr_trap),
        .I2(is_lui_auipc_jal),
        .I3(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .O(\reg_op1[31]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \reg_op1[31]_i_8 
       (.I0(\reg_sh_reg_n_0_[1] ),
        .I1(\reg_sh_reg_n_0_[0] ),
        .I2(\reg_sh_reg_n_0_[2] ),
        .O(\reg_op1[31]_i_8_n_0 ));
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
    .INIT(64'hEEEEEAAAEAAAEAAA)) 
    \reg_op1[4]_i_1 
       (.I0(\reg_op1[4]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(\reg_pc_reg_n_0_[4] ),
        .I3(\reg_op1[31]_i_6_n_0 ),
        .I4(reg_op12[4]),
        .I5(\reg_op1[31]_i_7_n_0 ),
        .O(reg_op1[4]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h0000EEF0)) 
    \reg_op1[4]_i_2 
       (.I0(\reg_op1[4]_i_3_n_0 ),
        .I1(\reg_op1[4]_i_4_n_0 ),
        .I2(\reg_op1_reg[7]_i_5_n_7 ),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[4]_i_3 
       (.I0(pcpi_rs1_OBUF[8]),
        .I1(\reg_op1[0]_i_4_n_0 ),
        .I2(pcpi_rs1_OBUF[0]),
        .I3(\reg_op1[31]_i_10_n_0 ),
        .O(\reg_op1[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[4]_i_4 
       (.I0(pcpi_rs1_OBUF[3]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[5]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEAAAEAAAEAAA)) 
    \reg_op1[5]_i_1 
       (.I0(\reg_op1[5]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(\reg_pc_reg_n_0_[5] ),
        .I3(\reg_op1[31]_i_6_n_0 ),
        .I4(reg_op12[5]),
        .I5(\reg_op1[31]_i_7_n_0 ),
        .O(reg_op1[5]));
  LUT5 #(
    .INIT(32'h0000EEF0)) 
    \reg_op1[5]_i_2 
       (.I0(\reg_op1[5]_i_3_n_0 ),
        .I1(\reg_op1[5]_i_4_n_0 ),
        .I2(\reg_op1_reg[7]_i_5_n_6 ),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[5]_i_3 
       (.I0(pcpi_rs1_OBUF[9]),
        .I1(\reg_op1[0]_i_4_n_0 ),
        .I2(pcpi_rs1_OBUF[1]),
        .I3(\reg_op1[31]_i_10_n_0 ),
        .O(\reg_op1[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[5]_i_4 
       (.I0(pcpi_rs1_OBUF[4]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[6]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEAAAEAAAEAAA)) 
    \reg_op1[6]_i_1 
       (.I0(\reg_op1[6]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(\reg_pc_reg_n_0_[6] ),
        .I3(\reg_op1[31]_i_6_n_0 ),
        .I4(reg_op12[6]),
        .I5(\reg_op1[31]_i_7_n_0 ),
        .O(reg_op1[6]));
  LUT5 #(
    .INIT(32'h0000EEF0)) 
    \reg_op1[6]_i_2 
       (.I0(\reg_op1[6]_i_3_n_0 ),
        .I1(\reg_op1[6]_i_4_n_0 ),
        .I2(\reg_op1_reg[7]_i_5_n_5 ),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[6]_i_3 
       (.I0(pcpi_rs1_OBUF[10]),
        .I1(\reg_op1[0]_i_4_n_0 ),
        .I2(pcpi_rs1_OBUF[2]),
        .I3(\reg_op1[31]_i_10_n_0 ),
        .O(\reg_op1[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[6]_i_4 
       (.I0(pcpi_rs1_OBUF[5]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[7]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEAAAEAAAEAAA)) 
    \reg_op1[7]_i_1 
       (.I0(\reg_op1[7]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(\reg_pc_reg_n_0_[7] ),
        .I3(\reg_op1[31]_i_6_n_0 ),
        .I4(reg_op12[7]),
        .I5(\reg_op1[31]_i_7_n_0 ),
        .O(reg_op1[7]));
  LUT5 #(
    .INIT(32'h0000EEF0)) 
    \reg_op1[7]_i_2 
       (.I0(\reg_op1[7]_i_3_n_0 ),
        .I1(\reg_op1[7]_i_4_n_0 ),
        .I2(\reg_op1_reg[7]_i_5_n_4 ),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[7]_i_3 
       (.I0(pcpi_rs1_OBUF[11]),
        .I1(\reg_op1[0]_i_4_n_0 ),
        .I2(pcpi_rs1_OBUF[3]),
        .I3(\reg_op1[31]_i_10_n_0 ),
        .O(\reg_op1[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[7]_i_4 
       (.I0(pcpi_rs1_OBUF[6]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[8]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[7]_i_6 
       (.I0(pcpi_rs1_OBUF[7]),
        .I1(decoded_imm[7]),
        .O(\reg_op1[7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[7]_i_7 
       (.I0(pcpi_rs1_OBUF[6]),
        .I1(decoded_imm[6]),
        .O(\reg_op1[7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[7]_i_8 
       (.I0(pcpi_rs1_OBUF[5]),
        .I1(decoded_imm[5]),
        .O(\reg_op1[7]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_op1[7]_i_9 
       (.I0(pcpi_rs1_OBUF[4]),
        .I1(decoded_imm[4]),
        .O(\reg_op1[7]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEAAAEAAAEAAA)) 
    \reg_op1[8]_i_1 
       (.I0(\reg_op1[8]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(\reg_pc_reg_n_0_[8] ),
        .I3(\reg_op1[31]_i_6_n_0 ),
        .I4(reg_op12[8]),
        .I5(\reg_op1[31]_i_7_n_0 ),
        .O(reg_op1[8]));
  LUT5 #(
    .INIT(32'h0000EEF0)) 
    \reg_op1[8]_i_2 
       (.I0(\reg_op1[8]_i_3_n_0 ),
        .I1(\reg_op1[8]_i_4_n_0 ),
        .I2(\reg_op1_reg[11]_i_5_n_7 ),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[8]_i_3 
       (.I0(pcpi_rs1_OBUF[12]),
        .I1(\reg_op1[0]_i_4_n_0 ),
        .I2(pcpi_rs1_OBUF[4]),
        .I3(\reg_op1[31]_i_10_n_0 ),
        .O(\reg_op1[8]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[8]_i_4 
       (.I0(pcpi_rs1_OBUF[7]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[9]),
        .I3(\reg_op1[0]_i_3_n_0 ),
        .O(\reg_op1[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEAAAEAAAEAAA)) 
    \reg_op1[9]_i_1 
       (.I0(\reg_op1[9]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[5] ),
        .I2(\reg_pc_reg_n_0_[9] ),
        .I3(\reg_op1[31]_i_6_n_0 ),
        .I4(reg_op12[9]),
        .I5(\reg_op1[31]_i_7_n_0 ),
        .O(reg_op1[9]));
  LUT5 #(
    .INIT(32'h0000EEF0)) 
    \reg_op1[9]_i_2 
       (.I0(\reg_op1[9]_i_3_n_0 ),
        .I1(\reg_op1[9]_i_4_n_0 ),
        .I2(\reg_op1_reg[11]_i_5_n_6 ),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\cpu_state_reg_n_0_[5] ),
        .O(\reg_op1[9]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[9]_i_3 
       (.I0(pcpi_rs1_OBUF[13]),
        .I1(\reg_op1[0]_i_4_n_0 ),
        .I2(pcpi_rs1_OBUF[5]),
        .I3(\reg_op1[31]_i_10_n_0 ),
        .O(\reg_op1[9]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_op1[9]_i_4 
       (.I0(pcpi_rs1_OBUF[8]),
        .I1(\reg_op1[31]_i_13_n_0 ),
        .I2(pcpi_rs1_OBUF[10]),
        .I3(\reg_op1[0]_i_3_n_0 ),
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_op1_reg[11]_i_5 
       (.CI(\reg_op1_reg[7]_i_5_n_0 ),
        .CO({\reg_op1_reg[11]_i_5_n_0 ,\NLW_reg_op1_reg[11]_i_5_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[11:8]),
        .O({\reg_op1_reg[11]_i_5_n_4 ,\reg_op1_reg[11]_i_5_n_5 ,\reg_op1_reg[11]_i_5_n_6 ,\reg_op1_reg[11]_i_5_n_7 }),
        .S({\reg_op1[11]_i_6_n_0 ,\reg_op1[11]_i_7_n_0 ,\reg_op1[11]_i_8_n_0 ,\reg_op1[11]_i_9_n_0 }));
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_op1_reg[15]_i_5 
       (.CI(\reg_op1_reg[11]_i_5_n_0 ),
        .CO({\reg_op1_reg[15]_i_5_n_0 ,\NLW_reg_op1_reg[15]_i_5_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[15:12]),
        .O({\reg_op1_reg[15]_i_5_n_4 ,\reg_op1_reg[15]_i_5_n_5 ,\reg_op1_reg[15]_i_5_n_6 ,\reg_op1_reg[15]_i_5_n_7 }),
        .S({\reg_op1[15]_i_6_n_0 ,\reg_op1[15]_i_7_n_0 ,\reg_op1[15]_i_8_n_0 ,\reg_op1[15]_i_9_n_0 }));
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_op1_reg[19]_i_5 
       (.CI(\reg_op1_reg[15]_i_5_n_0 ),
        .CO({\reg_op1_reg[19]_i_5_n_0 ,\NLW_reg_op1_reg[19]_i_5_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[19:16]),
        .O({\reg_op1_reg[19]_i_5_n_4 ,\reg_op1_reg[19]_i_5_n_5 ,\reg_op1_reg[19]_i_5_n_6 ,\reg_op1_reg[19]_i_5_n_7 }),
        .S({\reg_op1[19]_i_6_n_0 ,\reg_op1[19]_i_7_n_0 ,\reg_op1[19]_i_8_n_0 ,\reg_op1[19]_i_9_n_0 }));
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_op1_reg[23]_i_5 
       (.CI(\reg_op1_reg[19]_i_5_n_0 ),
        .CO({\reg_op1_reg[23]_i_5_n_0 ,\NLW_reg_op1_reg[23]_i_5_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[23:20]),
        .O({\reg_op1_reg[23]_i_5_n_4 ,\reg_op1_reg[23]_i_5_n_5 ,\reg_op1_reg[23]_i_5_n_6 ,\reg_op1_reg[23]_i_5_n_7 }),
        .S({\reg_op1[23]_i_6_n_0 ,\reg_op1[23]_i_7_n_0 ,\reg_op1[23]_i_8_n_0 ,\reg_op1[23]_i_9_n_0 }));
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
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_op1_reg[27]_i_5 
       (.CI(\reg_op1_reg[23]_i_5_n_0 ),
        .CO({\reg_op1_reg[27]_i_5_n_0 ,\NLW_reg_op1_reg[27]_i_5_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[27:24]),
        .O({\reg_op1_reg[27]_i_5_n_4 ,\reg_op1_reg[27]_i_5_n_5 ,\reg_op1_reg[27]_i_5_n_6 ,\reg_op1_reg[27]_i_5_n_7 }),
        .S({\reg_op1[27]_i_6_n_0 ,\reg_op1[27]_i_7_n_0 ,\reg_op1[27]_i_8_n_0 ,\reg_op1[27]_i_9_n_0 }));
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_op1_reg[31]_i_11 
       (.CI(\reg_op1_reg[27]_i_5_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,pcpi_rs1_OBUF[30:28]}),
        .O({\reg_op1_reg[31]_i_11_n_4 ,\reg_op1_reg[31]_i_11_n_5 ,\reg_op1_reg[31]_i_11_n_6 ,\reg_op1_reg[31]_i_11_n_7 }),
        .S({\reg_op1[31]_i_14_n_0 ,\reg_op1[31]_i_15_n_0 ,\reg_op1[31]_i_16_n_0 ,\reg_op1[31]_i_17_n_0 }));
  FDRE \reg_op1_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_op1[31]_i_1_n_0 ),
        .D(reg_op1[3]),
        .Q(pcpi_rs1_OBUF[3]),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_op1_reg[3]_i_4 
       (.CI(\<const0> ),
        .CO({\reg_op1_reg[3]_i_4_n_0 ,\NLW_reg_op1_reg[3]_i_4_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[3:0]),
        .O({\reg_op1_reg[3]_i_4_n_4 ,\reg_op1_reg[3]_i_4_n_5 ,\reg_op1_reg[3]_i_4_n_6 ,\reg_op1_reg[3]_i_4_n_7 }),
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
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_op1_reg[7]_i_5 
       (.CI(\reg_op1_reg[3]_i_4_n_0 ),
        .CO({\reg_op1_reg[7]_i_5_n_0 ,\NLW_reg_op1_reg[7]_i_5_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(pcpi_rs1_OBUF[7:4]),
        .O({\reg_op1_reg[7]_i_5_n_4 ,\reg_op1_reg[7]_i_5_n_5 ,\reg_op1_reg[7]_i_5_n_6 ,\reg_op1_reg[7]_i_5_n_7 }),
        .S({\reg_op1[7]_i_6_n_0 ,\reg_op1[7]_i_7_n_0 ,\reg_op1[7]_i_8_n_0 ,\reg_op1[7]_i_9_n_0 }));
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
    .INIT(64'hFFC8C8C888888888)) 
    \reg_op2[0]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(decoded_imm[0]),
        .I2(\reg_op2[4]_i_2_n_0 ),
        .I3(cpuregs_reg_r1_0_31_0_5_n_1),
        .I4(\reg_op2[4]_i_3_n_0 ),
        .I5(\reg_op2[4]_i_4_n_0 ),
        .O(\reg_op2[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[10]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_6_11_n_5),
        .I4(decoded_imm[10]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[11]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_6_11_n_4),
        .I4(decoded_imm[11]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[12]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_12_17_n_1),
        .I4(decoded_imm[12]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[13]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_12_17_n_0),
        .I4(decoded_imm[13]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[14]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_12_17_n_3),
        .I4(decoded_imm[14]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[15]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_12_17_n_2),
        .I4(decoded_imm[15]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[16]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_12_17_n_5),
        .I4(decoded_imm[16]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[17]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_12_17_n_4),
        .I4(decoded_imm[17]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[18]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_18_23_n_1),
        .I4(decoded_imm[18]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[19]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_18_23_n_0),
        .I4(decoded_imm[19]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFC8C8C888888888)) 
    \reg_op2[1]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(decoded_imm[1]),
        .I2(\reg_op2[4]_i_2_n_0 ),
        .I3(cpuregs_reg_r1_0_31_0_5_n_0),
        .I4(\reg_op2[4]_i_3_n_0 ),
        .I5(\reg_op2[4]_i_4_n_0 ),
        .O(\reg_op2[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[20]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_18_23_n_3),
        .I4(decoded_imm[20]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[21]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_18_23_n_2),
        .I4(decoded_imm[21]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[22]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_18_23_n_5),
        .I4(decoded_imm[22]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[23]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_18_23_n_4),
        .I4(decoded_imm[23]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[24]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_24_29_n_1),
        .I4(decoded_imm[24]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[25]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_24_29_n_0),
        .I4(decoded_imm[25]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[26]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_24_29_n_3),
        .I4(decoded_imm[26]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[27]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_24_29_n_2),
        .I4(decoded_imm[27]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[28]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_24_29_n_5),
        .I4(decoded_imm[28]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[29]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_24_29_n_4),
        .I4(decoded_imm[29]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFC8C8C888888888)) 
    \reg_op2[2]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(decoded_imm[2]),
        .I2(\reg_op2[4]_i_2_n_0 ),
        .I3(cpuregs_reg_r1_0_31_0_5_n_3),
        .I4(\reg_op2[4]_i_3_n_0 ),
        .I5(\reg_op2[4]_i_4_n_0 ),
        .O(\reg_op2[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[30]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_30_31_n_0),
        .I4(decoded_imm[30]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[30]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_op2[31]_i_1 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(resetn_IBUF),
        .O(\reg_op2[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[31]_i_2 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_30_31__0_n_0),
        .I4(decoded_imm[31]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[31]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \reg_op2[31]_i_3 
       (.I0(is_lui_auipc_jal),
        .I1(instr_trap),
        .I2(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .O(\reg_op2[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFFFFFEFFFE)) 
    \reg_op2[31]_i_4 
       (.I0(is_slli_srli_srai),
        .I1(\reg_op2[31]_i_5_n_0 ),
        .I2(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .I3(is_lui_auipc_jal),
        .I4(instr_trap),
        .I5(is_lb_lh_lw_lbu_lhu),
        .O(\reg_op2[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \reg_op2[31]_i_5 
       (.I0(decoded_imm_j[3]),
        .I1(decoded_imm_j[4]),
        .I2(decoded_imm_j[2]),
        .I3(decoded_imm_j[1]),
        .I4(decoded_imm_j[11]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFC8C8C888888888)) 
    \reg_op2[3]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(decoded_imm[3]),
        .I2(\reg_op2[4]_i_2_n_0 ),
        .I3(cpuregs_reg_r1_0_31_0_5_n_2),
        .I4(\reg_op2[4]_i_3_n_0 ),
        .I5(\reg_op2[4]_i_4_n_0 ),
        .O(\reg_op2[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFC8C8C888888888)) 
    \reg_op2[4]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(decoded_imm[4]),
        .I2(\reg_op2[4]_i_2_n_0 ),
        .I3(cpuregs_reg_r1_0_31_0_5_n_5),
        .I4(\reg_op2[4]_i_3_n_0 ),
        .I5(\reg_op2[4]_i_4_n_0 ),
        .O(\reg_op2[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \reg_op2[4]_i_2 
       (.I0(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I1(is_slli_srli_srai),
        .O(\reg_op2[4]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h10)) 
    \reg_op2[4]_i_3 
       (.I0(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .I1(is_slli_srli_srai),
        .I2(\reg_op2[4]_i_5_n_0 ),
        .O(\reg_op2[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \reg_op2[4]_i_4 
       (.I0(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .I1(is_lui_auipc_jal),
        .I2(is_lb_lh_lw_lbu_lhu),
        .I3(instr_trap),
        .O(\reg_op2[4]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \reg_op2[4]_i_5 
       (.I0(decoded_imm_j[11]),
        .I1(decoded_imm_j[1]),
        .I2(decoded_imm_j[2]),
        .I3(decoded_imm_j[4]),
        .I4(decoded_imm_j[3]),
        .O(\reg_op2[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[5]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_0_5_n_4),
        .I4(decoded_imm[5]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[6]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_6_11_n_1),
        .I4(decoded_imm[6]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[7]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_6_11_n_0),
        .I4(decoded_imm[7]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[8]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_6_11_n_3),
        .I4(decoded_imm[8]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
        .O(\reg_op2[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAB0000ABAA0300)) 
    \reg_op2[9]_i_1 
       (.I0(\reg_op2[31]_i_3_n_0 ),
        .I1(instr_trap),
        .I2(\reg_op2[31]_i_4_n_0 ),
        .I3(cpuregs_reg_r1_0_31_6_11_n_2),
        .I4(decoded_imm[9]),
        .I5(is_jalr_addi_slti_sltiu_xori_ori_andi),
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
    .INIT(64'hFFFFFEEEFEEEFEEE)) 
    \reg_out[0]_i_1 
       (.I0(\reg_out[0]_i_2_n_0 ),
        .I1(\reg_out[0]_i_3_n_0 ),
        .I2(pcpi_rs1_OBUF[0]),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(decoded_imm[0]),
        .I5(\cpu_state_reg_n_0_[3] ),
        .O(reg_out[0]));
  LUT6 #(
    .INIT(64'hFFEAEAEA00000000)) 
    \reg_out[0]_i_2 
       (.I0(\reg_out[0]_i_4_n_0 ),
        .I1(count_cycle_reg[0]),
        .I2(instr_rdcycle),
        .I3(count_cycle_reg[32]),
        .I4(instr_rdcycleh),
        .I5(\cpu_state_reg_n_0_[5] ),
        .O(\reg_out[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8080000A808)) 
    \reg_out[0]_i_3 
       (.I0(\reg_out[6]_i_5_n_0 ),
        .I1(mem_rdata_IBUF[16]),
        .I2(\reg_out[31]_i_7_n_0 ),
        .I3(mem_rdata_IBUF[0]),
        .I4(\mem_wordsize_reg_n_0_[1] ),
        .I5(\reg_out[0]_i_5_n_0 ),
        .O(\reg_out[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[0]_i_4 
       (.I0(count_instr_reg[32]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[0]),
        .I3(instr_rdinstr),
        .O(\reg_out[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \reg_out[0]_i_5 
       (.I0(mem_rdata_IBUF[16]),
        .I1(mem_rdata_IBUF[24]),
        .I2(mem_rdata_IBUF[0]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(pcpi_rs1_OBUF[0]),
        .I5(mem_rdata_IBUF[8]),
        .O(\reg_out[0]_i_5_n_0 ));
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
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'h0E)) 
    \reg_out[14]_i_10 
       (.I0(latched_is_lh_reg_n_0),
        .I1(latched_is_lu_reg_n_0),
        .I2(\mem_wordsize_reg_n_0_[1] ),
        .O(\reg_out[14]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[14]_i_5 
       (.I0(\reg_pc_reg_n_0_[16] ),
        .I1(decoded_imm[16]),
        .O(\reg_out[14]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[14]_i_6 
       (.I0(\reg_pc_reg_n_0_[15] ),
        .I1(decoded_imm[15]),
        .O(\reg_out[14]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[14]_i_7 
       (.I0(\reg_pc_reg_n_0_[14] ),
        .I1(decoded_imm[14]),
        .O(\reg_out[14]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[14]_i_8 
       (.I0(\reg_pc_reg_n_0_[13] ),
        .I1(decoded_imm[13]),
        .O(\reg_out[14]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEEEAEEEAEEEA)) 
    \reg_out[15]_i_1 
       (.I0(\reg_out[15]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[0] ),
        .I2(\reg_out[31]_i_3_n_0 ),
        .I3(\reg_out[15]_i_3_n_0 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .I5(pcpi_rs1_OBUF[15]),
        .O(reg_out[15]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \reg_out[15]_i_2 
       (.I0(\reg_out[15]_i_4_n_0 ),
        .I1(\reg_out_reg[14]_i_2_n_5 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .O(\reg_out[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4044444440000000)) 
    \reg_out[15]_i_3 
       (.I0(\mem_wordsize_reg_n_0_[1] ),
        .I1(latched_is_lu_reg_n_0),
        .I2(mem_rdata_IBUF[31]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(\mem_wordsize_reg_n_0_[0] ),
        .I5(mem_rdata_IBUF[15]),
        .O(\reg_out[15]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[15]_i_4 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[15]_i_5_n_0 ),
        .I2(count_cycle_reg[15]),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[47]),
        .I5(instr_rdcycleh),
        .O(\reg_out[15]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[15]_i_5 
       (.I0(count_instr_reg[47]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[15]),
        .I3(instr_rdinstr),
        .O(\reg_out[15]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEEEAEEEAEEEA)) 
    \reg_out[16]_i_1 
       (.I0(\reg_out[16]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[0] ),
        .I2(\reg_out[31]_i_3_n_0 ),
        .I3(\reg_out[16]_i_3_n_0 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .I5(pcpi_rs1_OBUF[16]),
        .O(reg_out[16]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \reg_out[16]_i_2 
       (.I0(\reg_out[16]_i_4_n_0 ),
        .I1(\reg_out_reg[14]_i_2_n_4 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .O(\reg_out[16]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \reg_out[16]_i_3 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(latched_is_lu_reg_n_0),
        .I3(mem_rdata_IBUF[16]),
        .O(\reg_out[16]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[16]_i_4 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[16]_i_5_n_0 ),
        .I2(count_cycle_reg[16]),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[48]),
        .I5(instr_rdcycleh),
        .O(\reg_out[16]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[16]_i_5 
       (.I0(count_instr_reg[48]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[16]),
        .I3(instr_rdinstr),
        .O(\reg_out[16]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEEEAEEEAEEEA)) 
    \reg_out[17]_i_1 
       (.I0(\reg_out[17]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[0] ),
        .I2(\reg_out[31]_i_3_n_0 ),
        .I3(\reg_out[17]_i_3_n_0 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .I5(pcpi_rs1_OBUF[17]),
        .O(reg_out[17]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \reg_out[17]_i_2 
       (.I0(\reg_out[17]_i_4_n_0 ),
        .I1(\reg_out_reg[20]_i_5_n_7 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .O(\reg_out[17]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \reg_out[17]_i_3 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(latched_is_lu_reg_n_0),
        .I3(mem_rdata_IBUF[17]),
        .O(\reg_out[17]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[17]_i_4 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[17]_i_5_n_0 ),
        .I2(count_cycle_reg[17]),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[49]),
        .I5(instr_rdcycleh),
        .O(\reg_out[17]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[17]_i_5 
       (.I0(count_instr_reg[49]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[17]),
        .I3(instr_rdinstr),
        .O(\reg_out[17]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEEEAEEEAEEEA)) 
    \reg_out[18]_i_1 
       (.I0(\reg_out[18]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[0] ),
        .I2(\reg_out[31]_i_3_n_0 ),
        .I3(\reg_out[18]_i_3_n_0 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .I5(pcpi_rs1_OBUF[18]),
        .O(reg_out[18]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \reg_out[18]_i_2 
       (.I0(\reg_out[18]_i_4_n_0 ),
        .I1(\reg_out_reg[20]_i_5_n_6 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .O(\reg_out[18]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \reg_out[18]_i_3 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(latched_is_lu_reg_n_0),
        .I3(mem_rdata_IBUF[18]),
        .O(\reg_out[18]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[18]_i_4 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[18]_i_5_n_0 ),
        .I2(count_cycle_reg[18]),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[50]),
        .I5(instr_rdcycleh),
        .O(\reg_out[18]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[18]_i_5 
       (.I0(count_instr_reg[50]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[18]),
        .I3(instr_rdinstr),
        .O(\reg_out[18]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEEEAEEEAEEEA)) 
    \reg_out[19]_i_1 
       (.I0(\reg_out[19]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[0] ),
        .I2(\reg_out[31]_i_3_n_0 ),
        .I3(\reg_out[19]_i_3_n_0 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .I5(pcpi_rs1_OBUF[19]),
        .O(reg_out[19]));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \reg_out[19]_i_2 
       (.I0(\reg_out[19]_i_4_n_0 ),
        .I1(\reg_out_reg[20]_i_5_n_5 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .O(\reg_out[19]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \reg_out[19]_i_3 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(latched_is_lu_reg_n_0),
        .I3(mem_rdata_IBUF[19]),
        .O(\reg_out[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[19]_i_4 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[19]_i_5_n_0 ),
        .I2(count_cycle_reg[19]),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[51]),
        .I5(instr_rdcycleh),
        .O(\reg_out[19]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[19]_i_5 
       (.I0(count_instr_reg[51]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[19]),
        .I3(instr_rdinstr),
        .O(\reg_out[19]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFEEEFEEEFEEE)) 
    \reg_out[1]_i_1 
       (.I0(\reg_out[1]_i_2_n_0 ),
        .I1(\reg_out[1]_i_3_n_0 ),
        .I2(pcpi_rs1_OBUF[1]),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\reg_out_reg[4]_i_4_n_7 ),
        .I5(\cpu_state_reg_n_0_[3] ),
        .O(reg_out[1]));
  LUT6 #(
    .INIT(64'hFFEAEAEA00000000)) 
    \reg_out[1]_i_2 
       (.I0(\reg_out[1]_i_4_n_0 ),
        .I1(count_cycle_reg[1]),
        .I2(instr_rdcycle),
        .I3(count_cycle_reg[33]),
        .I4(instr_rdcycleh),
        .I5(\cpu_state_reg_n_0_[5] ),
        .O(\reg_out[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8080000A808)) 
    \reg_out[1]_i_3 
       (.I0(\reg_out[6]_i_5_n_0 ),
        .I1(mem_rdata_IBUF[17]),
        .I2(\reg_out[31]_i_7_n_0 ),
        .I3(mem_rdata_IBUF[1]),
        .I4(\mem_wordsize_reg_n_0_[1] ),
        .I5(\reg_out[1]_i_5_n_0 ),
        .O(\reg_out[1]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[1]_i_4 
       (.I0(count_instr_reg[33]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[1]),
        .I3(instr_rdinstr),
        .O(\reg_out[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \reg_out[1]_i_5 
       (.I0(mem_rdata_IBUF[17]),
        .I1(mem_rdata_IBUF[25]),
        .I2(mem_rdata_IBUF[1]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(pcpi_rs1_OBUF[0]),
        .I5(mem_rdata_IBUF[9]),
        .O(\reg_out[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEEEAEEEAEEEA)) 
    \reg_out[20]_i_1 
       (.I0(\reg_out[20]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[0] ),
        .I2(\reg_out[31]_i_3_n_0 ),
        .I3(\reg_out[20]_i_3_n_0 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .I5(pcpi_rs1_OBUF[20]),
        .O(reg_out[20]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[20]_i_10 
       (.I0(\reg_pc_reg_n_0_[17] ),
        .I1(decoded_imm[17]),
        .O(\reg_out[20]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \reg_out[20]_i_2 
       (.I0(\reg_out[20]_i_4_n_0 ),
        .I1(\reg_out_reg[20]_i_5_n_4 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .O(\reg_out[20]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \reg_out[20]_i_3 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(latched_is_lu_reg_n_0),
        .I3(mem_rdata_IBUF[20]),
        .O(\reg_out[20]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[20]_i_4 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[20]_i_6_n_0 ),
        .I2(count_cycle_reg[20]),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[52]),
        .I5(instr_rdcycleh),
        .O(\reg_out[20]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[20]_i_6 
       (.I0(count_instr_reg[52]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[20]),
        .I3(instr_rdinstr),
        .O(\reg_out[20]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[20]_i_7 
       (.I0(\reg_pc_reg_n_0_[20] ),
        .I1(decoded_imm[20]),
        .O(\reg_out[20]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[20]_i_8 
       (.I0(\reg_pc_reg_n_0_[19] ),
        .I1(decoded_imm[19]),
        .O(\reg_out[20]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[20]_i_9 
       (.I0(\reg_pc_reg_n_0_[18] ),
        .I1(decoded_imm[18]),
        .O(\reg_out[20]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEEEAEEEAEEEA)) 
    \reg_out[21]_i_1 
       (.I0(\reg_out[21]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[0] ),
        .I2(\reg_out[31]_i_3_n_0 ),
        .I3(\reg_out[21]_i_3_n_0 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .I5(pcpi_rs1_OBUF[21]),
        .O(reg_out[21]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \reg_out[21]_i_2 
       (.I0(\reg_out[21]_i_4_n_0 ),
        .I1(\reg_out_reg[24]_i_5_n_7 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .O(\reg_out[21]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \reg_out[21]_i_3 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(latched_is_lu_reg_n_0),
        .I3(mem_rdata_IBUF[21]),
        .O(\reg_out[21]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[21]_i_4 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[21]_i_5_n_0 ),
        .I2(count_cycle_reg[21]),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[53]),
        .I5(instr_rdcycleh),
        .O(\reg_out[21]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[21]_i_5 
       (.I0(count_instr_reg[53]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[21]),
        .I3(instr_rdinstr),
        .O(\reg_out[21]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEEEAEEEAEEEA)) 
    \reg_out[22]_i_1 
       (.I0(\reg_out[22]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[0] ),
        .I2(\reg_out[31]_i_3_n_0 ),
        .I3(\reg_out[22]_i_3_n_0 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .I5(pcpi_rs1_OBUF[22]),
        .O(reg_out[22]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \reg_out[22]_i_2 
       (.I0(\reg_out[22]_i_4_n_0 ),
        .I1(\reg_out_reg[24]_i_5_n_6 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .O(\reg_out[22]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \reg_out[22]_i_3 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(latched_is_lu_reg_n_0),
        .I3(mem_rdata_IBUF[22]),
        .O(\reg_out[22]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[22]_i_4 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[22]_i_5_n_0 ),
        .I2(count_cycle_reg[22]),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[54]),
        .I5(instr_rdcycleh),
        .O(\reg_out[22]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[22]_i_5 
       (.I0(count_instr_reg[54]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[22]),
        .I3(instr_rdinstr),
        .O(\reg_out[22]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEEEAEEEAEEEA)) 
    \reg_out[23]_i_1 
       (.I0(\reg_out[23]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[0] ),
        .I2(\reg_out[31]_i_3_n_0 ),
        .I3(\reg_out[23]_i_3_n_0 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .I5(pcpi_rs1_OBUF[23]),
        .O(reg_out[23]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \reg_out[23]_i_2 
       (.I0(\reg_out[23]_i_4_n_0 ),
        .I1(\reg_out_reg[24]_i_5_n_5 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .O(\reg_out[23]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \reg_out[23]_i_3 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(latched_is_lu_reg_n_0),
        .I3(mem_rdata_IBUF[23]),
        .O(\reg_out[23]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[23]_i_4 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[23]_i_5_n_0 ),
        .I2(count_cycle_reg[23]),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[55]),
        .I5(instr_rdcycleh),
        .O(\reg_out[23]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[23]_i_5 
       (.I0(count_instr_reg[55]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[23]),
        .I3(instr_rdinstr),
        .O(\reg_out[23]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEEEAEEEAEEEA)) 
    \reg_out[24]_i_1 
       (.I0(\reg_out[24]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[0] ),
        .I2(\reg_out[31]_i_3_n_0 ),
        .I3(\reg_out[24]_i_3_n_0 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .I5(pcpi_rs1_OBUF[24]),
        .O(reg_out[24]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[24]_i_10 
       (.I0(\reg_pc_reg_n_0_[21] ),
        .I1(decoded_imm[21]),
        .O(\reg_out[24]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \reg_out[24]_i_2 
       (.I0(\reg_out[24]_i_4_n_0 ),
        .I1(\reg_out_reg[24]_i_5_n_4 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .O(\reg_out[24]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \reg_out[24]_i_3 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(latched_is_lu_reg_n_0),
        .I3(mem_rdata_IBUF[24]),
        .O(\reg_out[24]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[24]_i_4 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[24]_i_6_n_0 ),
        .I2(count_cycle_reg[24]),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[56]),
        .I5(instr_rdcycleh),
        .O(\reg_out[24]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[24]_i_6 
       (.I0(count_instr_reg[56]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[24]),
        .I3(instr_rdinstr),
        .O(\reg_out[24]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[24]_i_7 
       (.I0(\reg_pc_reg_n_0_[24] ),
        .I1(decoded_imm[24]),
        .O(\reg_out[24]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[24]_i_8 
       (.I0(\reg_pc_reg_n_0_[23] ),
        .I1(decoded_imm[23]),
        .O(\reg_out[24]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[24]_i_9 
       (.I0(\reg_pc_reg_n_0_[22] ),
        .I1(decoded_imm[22]),
        .O(\reg_out[24]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEEEAEEEAEEEA)) 
    \reg_out[25]_i_1 
       (.I0(\reg_out[25]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[0] ),
        .I2(\reg_out[31]_i_3_n_0 ),
        .I3(\reg_out[25]_i_3_n_0 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .I5(pcpi_rs1_OBUF[25]),
        .O(reg_out[25]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \reg_out[25]_i_2 
       (.I0(\reg_out[25]_i_4_n_0 ),
        .I1(\reg_out_reg[28]_i_5_n_7 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .O(\reg_out[25]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \reg_out[25]_i_3 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(latched_is_lu_reg_n_0),
        .I3(mem_rdata_IBUF[25]),
        .O(\reg_out[25]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[25]_i_4 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[25]_i_5_n_0 ),
        .I2(count_cycle_reg[25]),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[57]),
        .I5(instr_rdcycleh),
        .O(\reg_out[25]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[25]_i_5 
       (.I0(count_instr_reg[57]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[25]),
        .I3(instr_rdinstr),
        .O(\reg_out[25]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEEEAEEEAEEEA)) 
    \reg_out[26]_i_1 
       (.I0(\reg_out[26]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[0] ),
        .I2(\reg_out[31]_i_3_n_0 ),
        .I3(\reg_out[26]_i_3_n_0 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .I5(pcpi_rs1_OBUF[26]),
        .O(reg_out[26]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \reg_out[26]_i_2 
       (.I0(\reg_out[26]_i_4_n_0 ),
        .I1(\reg_out_reg[28]_i_5_n_6 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .O(\reg_out[26]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \reg_out[26]_i_3 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(latched_is_lu_reg_n_0),
        .I3(mem_rdata_IBUF[26]),
        .O(\reg_out[26]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[26]_i_4 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[26]_i_5_n_0 ),
        .I2(count_cycle_reg[26]),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[58]),
        .I5(instr_rdcycleh),
        .O(\reg_out[26]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[26]_i_5 
       (.I0(count_instr_reg[58]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[26]),
        .I3(instr_rdinstr),
        .O(\reg_out[26]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEEEAEEEAEEEA)) 
    \reg_out[27]_i_1 
       (.I0(\reg_out[27]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[0] ),
        .I2(\reg_out[31]_i_3_n_0 ),
        .I3(\reg_out[27]_i_3_n_0 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .I5(pcpi_rs1_OBUF[27]),
        .O(reg_out[27]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \reg_out[27]_i_2 
       (.I0(\reg_out[27]_i_4_n_0 ),
        .I1(\reg_out_reg[28]_i_5_n_5 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .O(\reg_out[27]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \reg_out[27]_i_3 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(latched_is_lu_reg_n_0),
        .I3(mem_rdata_IBUF[27]),
        .O(\reg_out[27]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[27]_i_4 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[27]_i_5_n_0 ),
        .I2(count_cycle_reg[27]),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[59]),
        .I5(instr_rdcycleh),
        .O(\reg_out[27]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[27]_i_5 
       (.I0(count_instr_reg[59]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[27]),
        .I3(instr_rdinstr),
        .O(\reg_out[27]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEEEAEEEAEEEA)) 
    \reg_out[28]_i_1 
       (.I0(\reg_out[28]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[0] ),
        .I2(\reg_out[31]_i_3_n_0 ),
        .I3(\reg_out[28]_i_3_n_0 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .I5(pcpi_rs1_OBUF[28]),
        .O(reg_out[28]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[28]_i_10 
       (.I0(\reg_pc_reg_n_0_[25] ),
        .I1(decoded_imm[25]),
        .O(\reg_out[28]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \reg_out[28]_i_2 
       (.I0(\reg_out[28]_i_4_n_0 ),
        .I1(\reg_out_reg[28]_i_5_n_4 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .O(\reg_out[28]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \reg_out[28]_i_3 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(latched_is_lu_reg_n_0),
        .I3(mem_rdata_IBUF[28]),
        .O(\reg_out[28]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[28]_i_4 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[28]_i_6_n_0 ),
        .I2(count_cycle_reg[28]),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[60]),
        .I5(instr_rdcycleh),
        .O(\reg_out[28]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[28]_i_6 
       (.I0(count_instr_reg[60]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[28]),
        .I3(instr_rdinstr),
        .O(\reg_out[28]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[28]_i_7 
       (.I0(\reg_pc_reg_n_0_[28] ),
        .I1(decoded_imm[28]),
        .O(\reg_out[28]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[28]_i_8 
       (.I0(\reg_pc_reg_n_0_[27] ),
        .I1(decoded_imm[27]),
        .O(\reg_out[28]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[28]_i_9 
       (.I0(\reg_pc_reg_n_0_[26] ),
        .I1(decoded_imm[26]),
        .O(\reg_out[28]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEEEAEEEAEEEA)) 
    \reg_out[29]_i_1 
       (.I0(\reg_out[29]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[0] ),
        .I2(\reg_out[31]_i_3_n_0 ),
        .I3(\reg_out[29]_i_3_n_0 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .I5(pcpi_rs1_OBUF[29]),
        .O(reg_out[29]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \reg_out[29]_i_2 
       (.I0(\reg_out[29]_i_4_n_0 ),
        .I1(\reg_out_reg[31]_i_6_n_7 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .O(\reg_out[29]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \reg_out[29]_i_3 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(latched_is_lu_reg_n_0),
        .I3(mem_rdata_IBUF[29]),
        .O(\reg_out[29]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[29]_i_4 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[29]_i_5_n_0 ),
        .I2(count_cycle_reg[29]),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[61]),
        .I5(instr_rdcycleh),
        .O(\reg_out[29]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[29]_i_5 
       (.I0(count_instr_reg[61]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[29]),
        .I3(instr_rdinstr),
        .O(\reg_out[29]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFEEEFEEEFEEE)) 
    \reg_out[2]_i_1 
       (.I0(\reg_out[2]_i_2_n_0 ),
        .I1(\reg_out[2]_i_3_n_0 ),
        .I2(pcpi_rs1_OBUF[2]),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\reg_out_reg[4]_i_4_n_6 ),
        .I5(\cpu_state_reg_n_0_[3] ),
        .O(reg_out[2]));
  LUT6 #(
    .INIT(64'hFFEAEAEA00000000)) 
    \reg_out[2]_i_2 
       (.I0(\reg_out[2]_i_4_n_0 ),
        .I1(count_cycle_reg[2]),
        .I2(instr_rdcycle),
        .I3(count_cycle_reg[34]),
        .I4(instr_rdcycleh),
        .I5(\cpu_state_reg_n_0_[5] ),
        .O(\reg_out[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8080000A808)) 
    \reg_out[2]_i_3 
       (.I0(\reg_out[6]_i_5_n_0 ),
        .I1(mem_rdata_IBUF[18]),
        .I2(\reg_out[31]_i_7_n_0 ),
        .I3(mem_rdata_IBUF[2]),
        .I4(\mem_wordsize_reg_n_0_[1] ),
        .I5(\reg_out[2]_i_5_n_0 ),
        .O(\reg_out[2]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[2]_i_4 
       (.I0(count_instr_reg[34]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[2]),
        .I3(instr_rdinstr),
        .O(\reg_out[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \reg_out[2]_i_5 
       (.I0(mem_rdata_IBUF[18]),
        .I1(mem_rdata_IBUF[26]),
        .I2(mem_rdata_IBUF[2]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(pcpi_rs1_OBUF[0]),
        .I5(mem_rdata_IBUF[10]),
        .O(\reg_out[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEEEAEEEAEEEA)) 
    \reg_out[30]_i_1 
       (.I0(\reg_out[30]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[0] ),
        .I2(\reg_out[31]_i_3_n_0 ),
        .I3(\reg_out[30]_i_3_n_0 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .I5(pcpi_rs1_OBUF[30]),
        .O(reg_out[30]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \reg_out[30]_i_2 
       (.I0(\reg_out[30]_i_4_n_0 ),
        .I1(\reg_out_reg[31]_i_6_n_6 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .O(\reg_out[30]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \reg_out[30]_i_3 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(latched_is_lu_reg_n_0),
        .I3(mem_rdata_IBUF[30]),
        .O(\reg_out[30]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[30]_i_4 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[30]_i_5_n_0 ),
        .I2(count_cycle_reg[30]),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[62]),
        .I5(instr_rdcycleh),
        .O(\reg_out[30]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[30]_i_5 
       (.I0(count_instr_reg[62]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[30]),
        .I3(instr_rdinstr),
        .O(\reg_out[30]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEEEAEEEAEEEA)) 
    \reg_out[31]_i_1 
       (.I0(\reg_out[31]_i_2_n_0 ),
        .I1(\cpu_state_reg_n_0_[0] ),
        .I2(\reg_out[31]_i_3_n_0 ),
        .I3(\reg_out[31]_i_4_n_0 ),
        .I4(\cpu_state_reg_n_0_[2] ),
        .I5(pcpi_rs1_OBUF[31]),
        .O(reg_out[31]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[31]_i_10 
       (.I0(\reg_pc_reg_n_0_[31] ),
        .I1(decoded_imm[31]),
        .O(\reg_out[31]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[31]_i_11 
       (.I0(\reg_pc_reg_n_0_[30] ),
        .I1(decoded_imm[30]),
        .O(\reg_out[31]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[31]_i_12 
       (.I0(\reg_pc_reg_n_0_[29] ),
        .I1(decoded_imm[29]),
        .O(\reg_out[31]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \reg_out[31]_i_2 
       (.I0(\reg_out[31]_i_5_n_0 ),
        .I1(\reg_out_reg[31]_i_6_n_5 ),
        .I2(\cpu_state_reg_n_0_[3] ),
        .O(\reg_out[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000B800)) 
    \reg_out[31]_i_3 
       (.I0(mem_rdata_IBUF[15]),
        .I1(\reg_out[31]_i_7_n_0 ),
        .I2(mem_rdata_IBUF[31]),
        .I3(latched_is_lh_reg_n_0),
        .I4(\mem_wordsize_reg_n_0_[1] ),
        .I5(\reg_out[31]_i_8_n_0 ),
        .O(\reg_out[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \reg_out[31]_i_4 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(latched_is_lu_reg_n_0),
        .I3(mem_rdata_IBUF[31]),
        .O(\reg_out[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \reg_out[31]_i_5 
       (.I0(\cpu_state_reg_n_0_[5] ),
        .I1(\reg_out[31]_i_9_n_0 ),
        .I2(count_cycle_reg[31]),
        .I3(instr_rdcycle),
        .I4(count_cycle_reg[63]),
        .I5(instr_rdcycleh),
        .O(\reg_out[31]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \reg_out[31]_i_7 
       (.I0(\mem_wordsize_reg_n_0_[0] ),
        .I1(pcpi_rs1_OBUF[1]),
        .O(\reg_out[31]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_out[31]_i_8 
       (.I0(latched_is_lb_reg_n_0),
        .I1(mem_rdata_word),
        .O(\reg_out[31]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[31]_i_9 
       (.I0(count_instr_reg[63]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[31]),
        .I3(instr_rdinstr),
        .O(\reg_out[31]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFEEEFEEEFEEE)) 
    \reg_out[3]_i_1 
       (.I0(\reg_out[3]_i_2_n_0 ),
        .I1(\reg_out[3]_i_3_n_0 ),
        .I2(pcpi_rs1_OBUF[3]),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\reg_out_reg[4]_i_4_n_5 ),
        .I5(\cpu_state_reg_n_0_[3] ),
        .O(reg_out[3]));
  LUT6 #(
    .INIT(64'hFFEAEAEA00000000)) 
    \reg_out[3]_i_2 
       (.I0(\reg_out[3]_i_4_n_0 ),
        .I1(count_cycle_reg[3]),
        .I2(instr_rdcycle),
        .I3(count_cycle_reg[35]),
        .I4(instr_rdcycleh),
        .I5(\cpu_state_reg_n_0_[5] ),
        .O(\reg_out[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8080000A808)) 
    \reg_out[3]_i_3 
       (.I0(\reg_out[6]_i_5_n_0 ),
        .I1(mem_rdata_IBUF[19]),
        .I2(\reg_out[31]_i_7_n_0 ),
        .I3(mem_rdata_IBUF[3]),
        .I4(\mem_wordsize_reg_n_0_[1] ),
        .I5(\reg_out[3]_i_5_n_0 ),
        .O(\reg_out[3]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[3]_i_4 
       (.I0(count_instr_reg[35]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[3]),
        .I3(instr_rdinstr),
        .O(\reg_out[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \reg_out[3]_i_5 
       (.I0(mem_rdata_IBUF[19]),
        .I1(mem_rdata_IBUF[27]),
        .I2(mem_rdata_IBUF[3]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(pcpi_rs1_OBUF[0]),
        .I5(mem_rdata_IBUF[11]),
        .O(\reg_out[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFEEEFEEEFEEE)) 
    \reg_out[4]_i_1 
       (.I0(\reg_out[4]_i_2_n_0 ),
        .I1(\reg_out[4]_i_3_n_0 ),
        .I2(pcpi_rs1_OBUF[4]),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\reg_out_reg[4]_i_4_n_4 ),
        .I5(\cpu_state_reg_n_0_[3] ),
        .O(reg_out[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[4]_i_10 
       (.I0(\reg_pc_reg_n_0_[1] ),
        .I1(decoded_imm[1]),
        .O(\reg_out[4]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEA00000000)) 
    \reg_out[4]_i_2 
       (.I0(\reg_out[4]_i_5_n_0 ),
        .I1(count_cycle_reg[4]),
        .I2(instr_rdcycle),
        .I3(count_cycle_reg[36]),
        .I4(instr_rdcycleh),
        .I5(\cpu_state_reg_n_0_[5] ),
        .O(\reg_out[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8080000A808)) 
    \reg_out[4]_i_3 
       (.I0(\reg_out[6]_i_5_n_0 ),
        .I1(mem_rdata_IBUF[20]),
        .I2(\reg_out[31]_i_7_n_0 ),
        .I3(mem_rdata_IBUF[4]),
        .I4(\mem_wordsize_reg_n_0_[1] ),
        .I5(\reg_out[4]_i_6_n_0 ),
        .O(\reg_out[4]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[4]_i_5 
       (.I0(count_instr_reg[36]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[4]),
        .I3(instr_rdinstr),
        .O(\reg_out[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \reg_out[4]_i_6 
       (.I0(mem_rdata_IBUF[20]),
        .I1(mem_rdata_IBUF[28]),
        .I2(mem_rdata_IBUF[4]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(pcpi_rs1_OBUF[0]),
        .I5(mem_rdata_IBUF[12]),
        .O(\reg_out[4]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[4]_i_7 
       (.I0(\reg_pc_reg_n_0_[4] ),
        .I1(decoded_imm[4]),
        .O(\reg_out[4]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[4]_i_8 
       (.I0(\reg_pc_reg_n_0_[3] ),
        .I1(decoded_imm[3]),
        .O(\reg_out[4]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[4]_i_9 
       (.I0(\reg_pc_reg_n_0_[2] ),
        .I1(decoded_imm[2]),
        .O(\reg_out[4]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFEEEFEEEFEEE)) 
    \reg_out[5]_i_1 
       (.I0(\reg_out[5]_i_2_n_0 ),
        .I1(\reg_out[5]_i_3_n_0 ),
        .I2(pcpi_rs1_OBUF[5]),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\reg_out_reg[8]_i_2_n_7 ),
        .I5(\cpu_state_reg_n_0_[3] ),
        .O(reg_out[5]));
  LUT6 #(
    .INIT(64'hFFEAEAEA00000000)) 
    \reg_out[5]_i_2 
       (.I0(\reg_out[5]_i_4_n_0 ),
        .I1(count_cycle_reg[5]),
        .I2(instr_rdcycle),
        .I3(count_cycle_reg[37]),
        .I4(instr_rdcycleh),
        .I5(\cpu_state_reg_n_0_[5] ),
        .O(\reg_out[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8080000A808)) 
    \reg_out[5]_i_3 
       (.I0(\reg_out[6]_i_5_n_0 ),
        .I1(mem_rdata_IBUF[21]),
        .I2(\reg_out[31]_i_7_n_0 ),
        .I3(mem_rdata_IBUF[5]),
        .I4(\mem_wordsize_reg_n_0_[1] ),
        .I5(\reg_out[5]_i_5_n_0 ),
        .O(\reg_out[5]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[5]_i_4 
       (.I0(count_instr_reg[37]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[5]),
        .I3(instr_rdinstr),
        .O(\reg_out[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \reg_out[5]_i_5 
       (.I0(mem_rdata_IBUF[21]),
        .I1(mem_rdata_IBUF[29]),
        .I2(mem_rdata_IBUF[5]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(pcpi_rs1_OBUF[0]),
        .I5(mem_rdata_IBUF[13]),
        .O(\reg_out[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFEEEFEEEFEEE)) 
    \reg_out[6]_i_1 
       (.I0(\reg_out[6]_i_2_n_0 ),
        .I1(\reg_out[6]_i_3_n_0 ),
        .I2(pcpi_rs1_OBUF[6]),
        .I3(\cpu_state_reg_n_0_[2] ),
        .I4(\reg_out_reg[8]_i_2_n_6 ),
        .I5(\cpu_state_reg_n_0_[3] ),
        .O(reg_out[6]));
  LUT6 #(
    .INIT(64'hFFEAEAEA00000000)) 
    \reg_out[6]_i_2 
       (.I0(\reg_out[6]_i_4_n_0 ),
        .I1(count_cycle_reg[6]),
        .I2(instr_rdcycle),
        .I3(count_cycle_reg[38]),
        .I4(instr_rdcycleh),
        .I5(\cpu_state_reg_n_0_[5] ),
        .O(\reg_out[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8080000A808)) 
    \reg_out[6]_i_3 
       (.I0(\reg_out[6]_i_5_n_0 ),
        .I1(mem_rdata_IBUF[22]),
        .I2(\reg_out[31]_i_7_n_0 ),
        .I3(mem_rdata_IBUF[6]),
        .I4(\mem_wordsize_reg_n_0_[1] ),
        .I5(\reg_out[6]_i_6_n_0 ),
        .O(\reg_out[6]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \reg_out[6]_i_4 
       (.I0(count_instr_reg[38]),
        .I1(instr_rdinstrh),
        .I2(count_instr_reg[6]),
        .I3(instr_rdinstr),
        .O(\reg_out[6]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \reg_out[6]_i_5 
       (.I0(latched_is_lu_reg_n_0),
        .I1(latched_is_lh_reg_n_0),
        .I2(latched_is_lb_reg_n_0),
        .I3(\cpu_state_reg_n_0_[0] ),
        .O(\reg_out[6]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \reg_out[6]_i_6 
       (.I0(mem_rdata_IBUF[22]),
        .I1(mem_rdata_IBUF[30]),
        .I2(mem_rdata_IBUF[6]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(pcpi_rs1_OBUF[0]),
        .I5(mem_rdata_IBUF[14]),
        .O(\reg_out[6]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \reg_out[7]_i_1 
       (.I0(\reg_out[7]_i_2_n_0 ),
        .I1(pcpi_rs1_OBUF[7]),
        .I2(\cpu_state_reg_n_0_[2] ),
        .I3(\reg_out_reg[8]_i_2_n_5 ),
        .I4(\cpu_state_reg_n_0_[3] ),
        .O(reg_out[7]));
  LUT6 #(
    .INIT(64'hBBB8B8B888B8B8B8)) 
    \reg_out[7]_i_3 
       (.I0(\reg_out[7]_i_5_n_0 ),
        .I1(\mem_wordsize_reg_n_0_[1] ),
        .I2(mem_rdata_IBUF[7]),
        .I3(\mem_wordsize_reg_n_0_[0] ),
        .I4(pcpi_rs1_OBUF[1]),
        .I5(mem_rdata_IBUF[23]),
        .O(mem_rdata_word));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \reg_out[7]_i_5 
       (.I0(mem_rdata_IBUF[23]),
        .I1(mem_rdata_IBUF[31]),
        .I2(mem_rdata_IBUF[7]),
        .I3(pcpi_rs1_OBUF[1]),
        .I4(pcpi_rs1_OBUF[0]),
        .I5(mem_rdata_IBUF[15]),
        .O(\reg_out[7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[8]_i_5 
       (.I0(\reg_pc_reg_n_0_[8] ),
        .I1(decoded_imm[8]),
        .O(\reg_out[8]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[8]_i_6 
       (.I0(\reg_pc_reg_n_0_[7] ),
        .I1(decoded_imm[7]),
        .O(\reg_out[8]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[8]_i_7 
       (.I0(\reg_pc_reg_n_0_[6] ),
        .I1(decoded_imm[6]),
        .O(\reg_out[8]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_out[8]_i_8 
       (.I0(\reg_pc_reg_n_0_[5] ),
        .I1(decoded_imm[5]),
        .O(\reg_out[8]_i_8_n_0 ));
  FDRE \reg_out_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[0]),
        .Q(\reg_out_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[10]),
        .Q(\reg_out_reg_n_0_[10] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[11]),
        .Q(\reg_out_reg_n_0_[11] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[12]),
        .Q(\reg_out_reg_n_0_[12] ),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_out_reg[12]_i_2 
       (.CI(\reg_out_reg[8]_i_2_n_0 ),
        .CO({\reg_out_reg[12]_i_2_n_0 ,\NLW_reg_out_reg[12]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_pc_reg_n_0_[12] ,\reg_pc_reg_n_0_[11] ,\reg_pc_reg_n_0_[10] ,\reg_pc_reg_n_0_[9] }),
        .O({\reg_out_reg[12]_i_2_n_4 ,\reg_out_reg[12]_i_2_n_5 ,\reg_out_reg[12]_i_2_n_6 ,\reg_out_reg[12]_i_2_n_7 }),
        .S({\reg_out[12]_i_5_n_0 ,\reg_out[12]_i_6_n_0 ,\reg_out[12]_i_7_n_0 ,\reg_out[12]_i_8_n_0 }));
  FDRE \reg_out_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[13]),
        .Q(\reg_out_reg_n_0_[13] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[14]),
        .Q(\reg_out_reg_n_0_[14] ),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_out_reg[14]_i_2 
       (.CI(\reg_out_reg[12]_i_2_n_0 ),
        .CO({\reg_out_reg[14]_i_2_n_0 ,\NLW_reg_out_reg[14]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_pc_reg_n_0_[16] ,\reg_pc_reg_n_0_[15] ,\reg_pc_reg_n_0_[14] ,\reg_pc_reg_n_0_[13] }),
        .O({\reg_out_reg[14]_i_2_n_4 ,\reg_out_reg[14]_i_2_n_5 ,\reg_out_reg[14]_i_2_n_6 ,\reg_out_reg[14]_i_2_n_7 }),
        .S({\reg_out[14]_i_5_n_0 ,\reg_out[14]_i_6_n_0 ,\reg_out[14]_i_7_n_0 ,\reg_out[14]_i_8_n_0 }));
  FDRE \reg_out_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[15]),
        .Q(\reg_out_reg_n_0_[15] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[16]),
        .Q(\reg_out_reg_n_0_[16] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[17]),
        .Q(\reg_out_reg_n_0_[17] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[18]),
        .Q(\reg_out_reg_n_0_[18] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[19]),
        .Q(\reg_out_reg_n_0_[19] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[1]),
        .Q(\reg_out_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[20]),
        .Q(\reg_out_reg_n_0_[20] ),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_out_reg[20]_i_5 
       (.CI(\reg_out_reg[14]_i_2_n_0 ),
        .CO({\reg_out_reg[20]_i_5_n_0 ,\NLW_reg_out_reg[20]_i_5_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_pc_reg_n_0_[20] ,\reg_pc_reg_n_0_[19] ,\reg_pc_reg_n_0_[18] ,\reg_pc_reg_n_0_[17] }),
        .O({\reg_out_reg[20]_i_5_n_4 ,\reg_out_reg[20]_i_5_n_5 ,\reg_out_reg[20]_i_5_n_6 ,\reg_out_reg[20]_i_5_n_7 }),
        .S({\reg_out[20]_i_7_n_0 ,\reg_out[20]_i_8_n_0 ,\reg_out[20]_i_9_n_0 ,\reg_out[20]_i_10_n_0 }));
  FDRE \reg_out_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[21]),
        .Q(\reg_out_reg_n_0_[21] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[22]),
        .Q(\reg_out_reg_n_0_[22] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[23]),
        .Q(\reg_out_reg_n_0_[23] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[24]),
        .Q(\reg_out_reg_n_0_[24] ),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_out_reg[24]_i_5 
       (.CI(\reg_out_reg[20]_i_5_n_0 ),
        .CO({\reg_out_reg[24]_i_5_n_0 ,\NLW_reg_out_reg[24]_i_5_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_pc_reg_n_0_[24] ,\reg_pc_reg_n_0_[23] ,\reg_pc_reg_n_0_[22] ,\reg_pc_reg_n_0_[21] }),
        .O({\reg_out_reg[24]_i_5_n_4 ,\reg_out_reg[24]_i_5_n_5 ,\reg_out_reg[24]_i_5_n_6 ,\reg_out_reg[24]_i_5_n_7 }),
        .S({\reg_out[24]_i_7_n_0 ,\reg_out[24]_i_8_n_0 ,\reg_out[24]_i_9_n_0 ,\reg_out[24]_i_10_n_0 }));
  FDRE \reg_out_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[25]),
        .Q(\reg_out_reg_n_0_[25] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[26]),
        .Q(\reg_out_reg_n_0_[26] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[27]),
        .Q(\reg_out_reg_n_0_[27] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[28]),
        .Q(\reg_out_reg_n_0_[28] ),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_out_reg[28]_i_5 
       (.CI(\reg_out_reg[24]_i_5_n_0 ),
        .CO({\reg_out_reg[28]_i_5_n_0 ,\NLW_reg_out_reg[28]_i_5_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_pc_reg_n_0_[28] ,\reg_pc_reg_n_0_[27] ,\reg_pc_reg_n_0_[26] ,\reg_pc_reg_n_0_[25] }),
        .O({\reg_out_reg[28]_i_5_n_4 ,\reg_out_reg[28]_i_5_n_5 ,\reg_out_reg[28]_i_5_n_6 ,\reg_out_reg[28]_i_5_n_7 }),
        .S({\reg_out[28]_i_7_n_0 ,\reg_out[28]_i_8_n_0 ,\reg_out[28]_i_9_n_0 ,\reg_out[28]_i_10_n_0 }));
  FDRE \reg_out_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[29]),
        .Q(\reg_out_reg_n_0_[29] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[2]),
        .Q(\reg_out_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[30]),
        .Q(\reg_out_reg_n_0_[30] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[31]),
        .Q(\reg_out_reg_n_0_[31] ),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_out_reg[31]_i_6 
       (.CI(\reg_out_reg[28]_i_5_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\reg_pc_reg_n_0_[30] ,\reg_pc_reg_n_0_[29] }),
        .O({\reg_out_reg[31]_i_6_n_5 ,\reg_out_reg[31]_i_6_n_6 ,\reg_out_reg[31]_i_6_n_7 }),
        .S({\<const0> ,\reg_out[31]_i_10_n_0 ,\reg_out[31]_i_11_n_0 ,\reg_out[31]_i_12_n_0 }));
  FDRE \reg_out_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[3]),
        .Q(\reg_out_reg_n_0_[3] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[4]),
        .Q(\reg_out_reg_n_0_[4] ),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_out_reg[4]_i_4 
       (.CI(\<const0> ),
        .CO({\reg_out_reg[4]_i_4_n_0 ,\NLW_reg_out_reg[4]_i_4_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_pc_reg_n_0_[4] ,\reg_pc_reg_n_0_[3] ,\reg_pc_reg_n_0_[2] ,\reg_pc_reg_n_0_[1] }),
        .O({\reg_out_reg[4]_i_4_n_4 ,\reg_out_reg[4]_i_4_n_5 ,\reg_out_reg[4]_i_4_n_6 ,\reg_out_reg[4]_i_4_n_7 }),
        .S({\reg_out[4]_i_7_n_0 ,\reg_out[4]_i_8_n_0 ,\reg_out[4]_i_9_n_0 ,\reg_out[4]_i_10_n_0 }));
  FDRE \reg_out_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[5]),
        .Q(\reg_out_reg_n_0_[5] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[6]),
        .Q(\reg_out_reg_n_0_[6] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[7]),
        .Q(\reg_out_reg_n_0_[7] ),
        .R(\<const0> ));
  FDRE \reg_out_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[8]),
        .Q(\reg_out_reg_n_0_[8] ),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY4 \reg_out_reg[8]_i_2 
       (.CI(\reg_out_reg[4]_i_4_n_0 ),
        .CO({\reg_out_reg[8]_i_2_n_0 ,\NLW_reg_out_reg[8]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\reg_pc_reg_n_0_[8] ,\reg_pc_reg_n_0_[7] ,\reg_pc_reg_n_0_[6] ,\reg_pc_reg_n_0_[5] }),
        .O({\reg_out_reg[8]_i_2_n_4 ,\reg_out_reg[8]_i_2_n_5 ,\reg_out_reg[8]_i_2_n_6 ,\reg_out_reg[8]_i_2_n_7 }),
        .S({\reg_out[8]_i_5_n_0 ,\reg_out[8]_i_6_n_0 ,\reg_out[8]_i_7_n_0 ,\reg_out[8]_i_8_n_0 }));
  FDRE \reg_out_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_out[9]),
        .Q(\reg_out_reg_n_0_[9] ),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[10]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[10] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[10]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[10] ),
        .O(current_pc[10]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[11]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[11] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[11]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[11] ),
        .O(current_pc[11]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[12]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[12] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[12]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[12] ),
        .O(current_pc[12]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[13]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[13] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[13]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[13] ),
        .O(current_pc[13]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[14]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[14] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[14]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[14] ),
        .O(current_pc[14]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[15]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[15] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[15]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[15] ),
        .O(current_pc[15]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[16]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[16] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[16]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[16] ),
        .O(current_pc[16]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[17]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[17] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[17]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[17] ),
        .O(current_pc[17]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[18]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[18] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[18]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[18] ),
        .O(current_pc[18]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[19]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[19] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[19]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[19] ),
        .O(current_pc[19]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[1]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[1] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[1]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[1] ),
        .O(current_pc[1]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[20]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[20] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[20]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[20] ),
        .O(current_pc[20]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[21]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[21] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[21]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[21] ),
        .O(current_pc[21]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[22]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[22] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[22]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[22] ),
        .O(current_pc[22]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[23]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[23] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[23]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[23] ),
        .O(current_pc[23]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[24]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[24] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[24]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[24] ),
        .O(current_pc[24]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[25]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[25] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[25]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[25] ),
        .O(current_pc[25]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[26]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[26] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[26]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[26] ),
        .O(current_pc[26]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[27]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[27] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[27]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[27] ),
        .O(current_pc[27]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[28]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[28] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[28]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[28] ),
        .O(current_pc[28]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[29]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[29] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[29]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[29] ),
        .O(current_pc[29]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[2]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[2] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[2]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[2] ),
        .O(current_pc[2]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[30]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[30] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[30]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[30] ),
        .O(current_pc[30]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[31]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[31] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[31]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[31] ),
        .O(current_pc[31]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[3]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[3] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[3]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[3] ),
        .O(current_pc[3]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[4]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[4] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[4]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[4] ),
        .O(current_pc[4]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[5]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[5] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[5]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[5] ),
        .O(current_pc[5]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[6]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[6] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[6]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[6] ),
        .O(current_pc[6]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[7]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[7] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[7]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[7] ),
        .O(current_pc[7]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[8]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[8] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[8]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[8] ),
        .O(current_pc[8]));
  LUT6 #(
    .INIT(64'hEA2AEAEAEA2A2A2A)) 
    \reg_pc[9]_i_1 
       (.I0(\reg_next_pc_reg_n_0_[9] ),
        .I1(latched_branch_reg_n_0),
        .I2(latched_store_reg_n_0),
        .I3(alu_out_q[9]),
        .I4(latched_stalu_reg_n_0),
        .I5(\reg_out_reg_n_0_[9] ),
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
    .INIT(64'hFFFFFFFFFFF0F8F0)) 
    \reg_sh[0]_i_1 
       (.I0(is_slli_srli_srai),
        .I1(decoded_imm_j[11]),
        .I2(\reg_sh[0]_i_2_n_0 ),
        .I3(\reg_sh[4]_i_3_n_0 ),
        .I4(\reg_sh[0]_i_3_n_0 ),
        .I5(\reg_sh[0]_i_4_n_0 ),
        .O(reg_sh[0]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h88888880)) 
    \reg_sh[0]_i_2 
       (.I0(\cpu_state_reg_n_0_[2] ),
        .I1(\reg_sh_reg_n_0_[0] ),
        .I2(\reg_sh_reg_n_0_[2] ),
        .I3(\reg_sh_reg_n_0_[4] ),
        .I4(\reg_sh_reg_n_0_[3] ),
        .O(\reg_sh[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \reg_sh[0]_i_3 
       (.I0(\reg_op2[4]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_0_5_n_1),
        .O(\reg_sh[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h00000004)) 
    \reg_sh[0]_i_4 
       (.I0(\reg_sh_reg_n_0_[0] ),
        .I1(\cpu_state_reg_n_0_[2] ),
        .I2(\reg_sh_reg_n_0_[2] ),
        .I3(\reg_sh_reg_n_0_[4] ),
        .I4(\reg_sh_reg_n_0_[3] ),
        .O(\reg_sh[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \reg_sh[1]_i_3 
       (.I0(\reg_op2[4]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_0_5_n_0),
        .O(\reg_sh[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF0F8F0)) 
    \reg_sh[2]_i_1 
       (.I0(is_slli_srli_srai),
        .I1(decoded_imm_j[2]),
        .I2(\reg_sh[2]_i_2_n_0 ),
        .I3(\reg_sh[4]_i_3_n_0 ),
        .I4(\reg_sh[2]_i_3_n_0 ),
        .I5(\reg_sh[2]_i_4_n_0 ),
        .O(reg_sh[2]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \reg_sh[2]_i_2 
       (.I0(\cpu_state_reg_n_0_[2] ),
        .I1(\reg_sh_reg_n_0_[1] ),
        .I2(\reg_sh_reg_n_0_[2] ),
        .I3(\reg_sh_reg_n_0_[4] ),
        .I4(\reg_sh_reg_n_0_[3] ),
        .I5(\reg_sh_reg_n_0_[0] ),
        .O(\reg_sh[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \reg_sh[2]_i_3 
       (.I0(\reg_op2[4]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_0_5_n_3),
        .O(\reg_sh[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT4 #(
    .INIT(16'h2220)) 
    \reg_sh[2]_i_4 
       (.I0(\cpu_state_reg_n_0_[2] ),
        .I1(\reg_sh_reg_n_0_[2] ),
        .I2(\reg_sh_reg_n_0_[4] ),
        .I3(\reg_sh_reg_n_0_[3] ),
        .O(\reg_sh[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF0F8F0)) 
    \reg_sh[3]_i_1 
       (.I0(is_slli_srli_srai),
        .I1(decoded_imm_j[3]),
        .I2(\reg_sh[3]_i_2_n_0 ),
        .I3(\reg_sh[4]_i_3_n_0 ),
        .I4(\reg_sh[3]_i_3_n_0 ),
        .I5(\reg_sh[3]_i_4_n_0 ),
        .O(reg_sh[3]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \reg_sh[3]_i_2 
       (.I0(\cpu_state_reg_n_0_[2] ),
        .I1(\reg_sh_reg_n_0_[2] ),
        .I2(\reg_sh_reg_n_0_[3] ),
        .O(\reg_sh[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \reg_sh[3]_i_3 
       (.I0(\reg_op2[4]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_0_5_n_2),
        .O(\reg_sh[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0020002000200022)) 
    \reg_sh[3]_i_4 
       (.I0(\cpu_state_reg_n_0_[2] ),
        .I1(\reg_sh_reg_n_0_[2] ),
        .I2(\reg_sh_reg_n_0_[4] ),
        .I3(\reg_sh_reg_n_0_[3] ),
        .I4(\reg_sh_reg_n_0_[0] ),
        .I5(\reg_sh_reg_n_0_[1] ),
        .O(\reg_sh[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF0F8F0)) 
    \reg_sh[4]_i_1 
       (.I0(is_slli_srli_srai),
        .I1(decoded_imm_j[4]),
        .I2(\reg_sh[4]_i_2_n_0 ),
        .I3(\reg_sh[4]_i_3_n_0 ),
        .I4(\reg_sh[4]_i_4_n_0 ),
        .I5(\reg_sh[4]_i_5_n_0 ),
        .O(reg_sh[4]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT4 #(
    .INIT(16'hA080)) 
    \reg_sh[4]_i_2 
       (.I0(\cpu_state_reg_n_0_[2] ),
        .I1(\reg_sh_reg_n_0_[3] ),
        .I2(\reg_sh_reg_n_0_[4] ),
        .I3(\reg_sh_reg_n_0_[2] ),
        .O(\reg_sh[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \reg_sh[4]_i_3 
       (.I0(instr_trap),
        .I1(is_lb_lh_lw_lbu_lhu),
        .I2(is_lui_auipc_jal),
        .I3(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .I4(\cpu_state_reg_n_0_[2] ),
        .O(\reg_sh[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \reg_sh[4]_i_4 
       (.I0(\reg_op2[4]_i_3_n_0 ),
        .I1(cpuregs_reg_r1_0_31_0_5_n_5),
        .O(\reg_sh[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \reg_sh[4]_i_5 
       (.I0(\cpu_state_reg_n_0_[2] ),
        .I1(\reg_sh_reg_n_0_[3] ),
        .I2(\reg_sh_reg_n_0_[1] ),
        .I3(\reg_sh_reg_n_0_[0] ),
        .I4(\reg_sh_reg_n_0_[4] ),
        .I5(\reg_sh_reg_n_0_[2] ),
        .O(\reg_sh[4]_i_5_n_0 ));
  FDRE \reg_sh_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_sh[0]),
        .Q(\reg_sh_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE \reg_sh_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_sh[1]),
        .Q(\reg_sh_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE \reg_sh_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_sh[2]),
        .Q(\reg_sh_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE \reg_sh_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_sh[3]),
        .Q(\reg_sh_reg_n_0_[3] ),
        .R(\<const0> ));
  FDRE \reg_sh_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_sh[4]),
        .Q(\reg_sh_reg_n_0_[4] ),
        .R(\<const0> ));
  IBUF resetn_IBUF_inst
       (.I(resetn),
        .O(resetn_IBUF));
  OBUFT \trace_data_OBUF[0]_inst 
       (.I(\<const0> ),
        .O(trace_data[0]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[10]_inst 
       (.I(\<const0> ),
        .O(trace_data[10]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[11]_inst 
       (.I(\<const0> ),
        .O(trace_data[11]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[12]_inst 
       (.I(\<const0> ),
        .O(trace_data[12]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[13]_inst 
       (.I(\<const0> ),
        .O(trace_data[13]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[14]_inst 
       (.I(\<const0> ),
        .O(trace_data[14]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[15]_inst 
       (.I(\<const0> ),
        .O(trace_data[15]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[16]_inst 
       (.I(\<const0> ),
        .O(trace_data[16]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[17]_inst 
       (.I(\<const0> ),
        .O(trace_data[17]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[18]_inst 
       (.I(\<const0> ),
        .O(trace_data[18]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[19]_inst 
       (.I(\<const0> ),
        .O(trace_data[19]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[1]_inst 
       (.I(\<const0> ),
        .O(trace_data[1]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[20]_inst 
       (.I(\<const0> ),
        .O(trace_data[20]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[21]_inst 
       (.I(\<const0> ),
        .O(trace_data[21]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[22]_inst 
       (.I(\<const0> ),
        .O(trace_data[22]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[23]_inst 
       (.I(\<const0> ),
        .O(trace_data[23]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[24]_inst 
       (.I(\<const0> ),
        .O(trace_data[24]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[25]_inst 
       (.I(\<const0> ),
        .O(trace_data[25]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[26]_inst 
       (.I(\<const0> ),
        .O(trace_data[26]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[27]_inst 
       (.I(\<const0> ),
        .O(trace_data[27]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[28]_inst 
       (.I(\<const0> ),
        .O(trace_data[28]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[29]_inst 
       (.I(\<const0> ),
        .O(trace_data[29]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[2]_inst 
       (.I(\<const0> ),
        .O(trace_data[2]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[30]_inst 
       (.I(\<const0> ),
        .O(trace_data[30]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[31]_inst 
       (.I(\<const0> ),
        .O(trace_data[31]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[32]_inst 
       (.I(\<const0> ),
        .O(trace_data[32]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[33]_inst 
       (.I(\<const0> ),
        .O(trace_data[33]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[34]_inst 
       (.I(\<const0> ),
        .O(trace_data[34]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[35]_inst 
       (.I(\<const0> ),
        .O(trace_data[35]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[3]_inst 
       (.I(\<const0> ),
        .O(trace_data[3]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[4]_inst 
       (.I(\<const0> ),
        .O(trace_data[4]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[5]_inst 
       (.I(\<const0> ),
        .O(trace_data[5]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[6]_inst 
       (.I(\<const0> ),
        .O(trace_data[6]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[7]_inst 
       (.I(\<const0> ),
        .O(trace_data[7]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[8]_inst 
       (.I(\<const0> ),
        .O(trace_data[8]),
        .T(\<const1> ));
  OBUFT \trace_data_OBUF[9]_inst 
       (.I(\<const0> ),
        .O(trace_data[9]),
        .T(\<const1> ));
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
