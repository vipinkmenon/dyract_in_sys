//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.4 (lin64) Build 1071353 Tue Nov 18 16:47:07 MST 2014
//Date        : Tue Jul  7 16:24:07 2015
//Host        : lappc14.epfl.ch running 64-bit Red Hat Enterprise Linux Server release 7.1 (Maipo)
//Command     : generate_target dyract_sys_wrapper.bd
//Design      : dyract_sys_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module dyract_sys_wrapper
   (ddr3_sdram_addr,
    ddr3_sdram_ba,
    ddr3_sdram_cas_n,
    ddr3_sdram_ck_n,
    ddr3_sdram_ck_p,
    ddr3_sdram_cke,
    ddr3_sdram_cs_n,
    ddr3_sdram_dm,
    ddr3_sdram_dq,
    ddr3_sdram_dqs_n,
    ddr3_sdram_dqs_p,
    ddr3_sdram_odt,
    ddr3_sdram_ras_n,
    ddr3_sdram_reset_n,
    ddr3_sdram_we_n,
    heartbeat,
    init_calib_complete,
    pci_exp_rxn,
    pci_exp_rxp,
    pci_exp_txn,
    pci_exp_txp,
    pcie_link_status,
    reset,
    sys_clk_n,
    sys_clk_p,
    sys_diff_clock_clk_n,
    sys_diff_clock_clk_p,
    sys_reset_n);
  output [13:0]ddr3_sdram_addr;
  output [2:0]ddr3_sdram_ba;
  output ddr3_sdram_cas_n;
  output [0:0]ddr3_sdram_ck_n;
  output [0:0]ddr3_sdram_ck_p;
  output [0:0]ddr3_sdram_cke;
  output [0:0]ddr3_sdram_cs_n;
  output [7:0]ddr3_sdram_dm;
  inout [63:0]ddr3_sdram_dq;
  inout [7:0]ddr3_sdram_dqs_n;
  inout [7:0]ddr3_sdram_dqs_p;
  output [0:0]ddr3_sdram_odt;
  output ddr3_sdram_ras_n;
  output ddr3_sdram_reset_n;
  output ddr3_sdram_we_n;
  output heartbeat;
  output init_calib_complete;
  input [3:0]pci_exp_rxn;
  input [3:0]pci_exp_rxp;
  output [3:0]pci_exp_txn;
  output [3:0]pci_exp_txp;
  output pcie_link_status;
  input reset;
  input sys_clk_n;
  input sys_clk_p;
  input sys_diff_clock_clk_n;
  input sys_diff_clock_clk_p;
  input sys_reset_n;

  wire [13:0]ddr3_sdram_addr;
  wire [2:0]ddr3_sdram_ba;
  wire ddr3_sdram_cas_n;
  wire [0:0]ddr3_sdram_ck_n;
  wire [0:0]ddr3_sdram_ck_p;
  wire [0:0]ddr3_sdram_cke;
  wire [0:0]ddr3_sdram_cs_n;
  wire [7:0]ddr3_sdram_dm;
  wire [63:0]ddr3_sdram_dq;
  wire [7:0]ddr3_sdram_dqs_n;
  wire [7:0]ddr3_sdram_dqs_p;
  wire [0:0]ddr3_sdram_odt;
  wire ddr3_sdram_ras_n;
  wire ddr3_sdram_reset_n;
  wire ddr3_sdram_we_n;
  wire heartbeat;
  wire init_calib_complete;
  wire [3:0]pci_exp_rxn;
  wire [3:0]pci_exp_rxp;
  wire [3:0]pci_exp_txn;
  wire [3:0]pci_exp_txp;
  wire pcie_link_status;
  wire reset;
  wire sys_clk_n;
  wire sys_clk_p;
  wire sys_diff_clock_clk_n;
  wire sys_diff_clock_clk_p;
  wire sys_reset_n;

dyract_sys dyract_sys_i
       (.ddr3_sdram_addr(ddr3_sdram_addr),
        .ddr3_sdram_ba(ddr3_sdram_ba),
        .ddr3_sdram_cas_n(ddr3_sdram_cas_n),
        .ddr3_sdram_ck_n(ddr3_sdram_ck_n),
        .ddr3_sdram_ck_p(ddr3_sdram_ck_p),
        .ddr3_sdram_cke(ddr3_sdram_cke),
        .ddr3_sdram_cs_n(ddr3_sdram_cs_n),
        .ddr3_sdram_dm(ddr3_sdram_dm),
        .ddr3_sdram_dq(ddr3_sdram_dq),
        .ddr3_sdram_dqs_n(ddr3_sdram_dqs_n),
        .ddr3_sdram_dqs_p(ddr3_sdram_dqs_p),
        .ddr3_sdram_odt(ddr3_sdram_odt),
        .ddr3_sdram_ras_n(ddr3_sdram_ras_n),
        .ddr3_sdram_reset_n(ddr3_sdram_reset_n),
        .ddr3_sdram_we_n(ddr3_sdram_we_n),
        .heartbeat(heartbeat),
        .init_calib_complete(init_calib_complete),
        .pci_exp_rxn(pci_exp_rxn),
        .pci_exp_rxp(pci_exp_rxp),
        .pci_exp_txn(pci_exp_txn),
        .pci_exp_txp(pci_exp_txp),
        .pcie_link_status(pcie_link_status),
        .reset(reset),
        .sys_clk_n(sys_clk_n),
        .sys_clk_p(sys_clk_p),
        .sys_diff_clock_clk_n(sys_diff_clock_clk_n),
        .sys_diff_clock_clk_p(sys_diff_clock_clk_p),
        .sys_reset_n(sys_reset_n));
endmodule
