// (c) Copyright 1995-2015 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: VIP:pcie_intf:dyract:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module dyract_sys_dyract_0_0 (
  pci_exp_rxp,
  pci_exp_rxn,
  pci_exp_txp,
  pci_exp_txn,
  sys_clk_p,
  sys_clk_n,
  sys_reset_n,
  m_axi_s2mm_aclk,
  m_axi_s2mm_awid,
  m_axi_s2mm_awaddr,
  m_axi_s2mm_awlen,
  m_axi_s2mm_awsize,
  m_axi_s2mm_awburst,
  m_axi_s2mm_awprot,
  m_axi_s2mm_awcache,
  m_axi_s2mm_awuser,
  m_axi_s2mm_awvalid,
  m_axi_s2mm_awready,
  m_axi_s2mm_wdata,
  m_axi_s2mm_wstrb,
  m_axi_s2mm_wlast,
  m_axi_s2mm_wvalid,
  m_axi_s2mm_wready,
  m_axi_s2mm_bresp,
  m_axi_s2mm_bvalid,
  m_axi_s2mm_bready,
  m_axi_mm2s_aclk,
  m_axi_mm2s_arid,
  m_axi_mm2s_araddr,
  m_axi_mm2s_arlen,
  m_axi_mm2s_arsize,
  m_axi_mm2s_arburst,
  m_axi_mm2s_arprot,
  m_axi_mm2s_arcache,
  m_axi_mm2s_aruser,
  m_axi_mm2s_arvalid,
  m_axi_mm2s_arready,
  m_axi_mm2s_rdata,
  m_axi_mm2s_rresp,
  m_axi_mm2s_rlast,
  m_axi_mm2s_rvalid,
  m_axi_mm2s_rready,
  pcie_link_status,
  heartbeat
);

input wire [3 : 0] pci_exp_rxp;
input wire [3 : 0] pci_exp_rxn;
output wire [3 : 0] pci_exp_txp;
output wire [3 : 0] pci_exp_txn;
input wire sys_clk_p;
input wire sys_clk_n;
input wire sys_reset_n;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m_axi_s2mm_signal_clock CLK" *)
input wire m_axi_s2mm_aclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_s2mm AWID" *)
output wire [3 : 0] m_axi_s2mm_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_s2mm AWADDR" *)
output wire [31 : 0] m_axi_s2mm_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_s2mm AWLEN" *)
output wire [7 : 0] m_axi_s2mm_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_s2mm AWSIZE" *)
output wire [2 : 0] m_axi_s2mm_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_s2mm AWBURST" *)
output wire [1 : 0] m_axi_s2mm_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_s2mm AWPROT" *)
output wire [2 : 0] m_axi_s2mm_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_s2mm AWCACHE" *)
output wire [3 : 0] m_axi_s2mm_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_s2mm AWUSER" *)
output wire [3 : 0] m_axi_s2mm_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_s2mm AWVALID" *)
output wire m_axi_s2mm_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_s2mm AWREADY" *)
input wire m_axi_s2mm_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_s2mm WDATA" *)
output wire [63 : 0] m_axi_s2mm_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_s2mm WSTRB" *)
output wire [7 : 0] m_axi_s2mm_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_s2mm WLAST" *)
output wire m_axi_s2mm_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_s2mm WVALID" *)
output wire m_axi_s2mm_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_s2mm WREADY" *)
input wire m_axi_s2mm_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_s2mm BRESP" *)
input wire [1 : 0] m_axi_s2mm_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_s2mm BVALID" *)
input wire m_axi_s2mm_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_s2mm BREADY" *)
output wire m_axi_s2mm_bready;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m_axi_mm2s_signal_clock CLK" *)
input wire m_axi_mm2s_aclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mm2s ARID" *)
output wire [3 : 0] m_axi_mm2s_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mm2s ARADDR" *)
output wire [31 : 0] m_axi_mm2s_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mm2s ARLEN" *)
output wire [7 : 0] m_axi_mm2s_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mm2s ARSIZE" *)
output wire [2 : 0] m_axi_mm2s_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mm2s ARBURST" *)
output wire [1 : 0] m_axi_mm2s_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mm2s ARPROT" *)
output wire [2 : 0] m_axi_mm2s_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mm2s ARCACHE" *)
output wire [3 : 0] m_axi_mm2s_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mm2s ARUSER" *)
output wire [3 : 0] m_axi_mm2s_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mm2s ARVALID" *)
output wire m_axi_mm2s_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mm2s ARREADY" *)
input wire m_axi_mm2s_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mm2s RDATA" *)
input wire [63 : 0] m_axi_mm2s_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mm2s RRESP" *)
input wire [1 : 0] m_axi_mm2s_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mm2s RLAST" *)
input wire m_axi_mm2s_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mm2s RVALID" *)
input wire m_axi_mm2s_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_mm2s RREADY" *)
output wire m_axi_mm2s_rready;
output wire pcie_link_status;
output wire heartbeat;

  dyract #(
    .RECONFIG_ENABLE(0)
  ) inst (
    .pci_exp_rxp(pci_exp_rxp),
    .pci_exp_rxn(pci_exp_rxn),
    .pci_exp_txp(pci_exp_txp),
    .pci_exp_txn(pci_exp_txn),
    .sys_clk_p(sys_clk_p),
    .sys_clk_n(sys_clk_n),
    .sys_reset_n(sys_reset_n),
    .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
    .m_axi_s2mm_awid(m_axi_s2mm_awid),
    .m_axi_s2mm_awaddr(m_axi_s2mm_awaddr),
    .m_axi_s2mm_awlen(m_axi_s2mm_awlen),
    .m_axi_s2mm_awsize(m_axi_s2mm_awsize),
    .m_axi_s2mm_awburst(m_axi_s2mm_awburst),
    .m_axi_s2mm_awprot(m_axi_s2mm_awprot),
    .m_axi_s2mm_awcache(m_axi_s2mm_awcache),
    .m_axi_s2mm_awuser(m_axi_s2mm_awuser),
    .m_axi_s2mm_awvalid(m_axi_s2mm_awvalid),
    .m_axi_s2mm_awready(m_axi_s2mm_awready),
    .m_axi_s2mm_wdata(m_axi_s2mm_wdata),
    .m_axi_s2mm_wstrb(m_axi_s2mm_wstrb),
    .m_axi_s2mm_wlast(m_axi_s2mm_wlast),
    .m_axi_s2mm_wvalid(m_axi_s2mm_wvalid),
    .m_axi_s2mm_wready(m_axi_s2mm_wready),
    .m_axi_s2mm_bresp(m_axi_s2mm_bresp),
    .m_axi_s2mm_bvalid(m_axi_s2mm_bvalid),
    .m_axi_s2mm_bready(m_axi_s2mm_bready),
    .m_axi_mm2s_aclk(m_axi_mm2s_aclk),
    .m_axi_mm2s_arid(m_axi_mm2s_arid),
    .m_axi_mm2s_araddr(m_axi_mm2s_araddr),
    .m_axi_mm2s_arlen(m_axi_mm2s_arlen),
    .m_axi_mm2s_arsize(m_axi_mm2s_arsize),
    .m_axi_mm2s_arburst(m_axi_mm2s_arburst),
    .m_axi_mm2s_arprot(m_axi_mm2s_arprot),
    .m_axi_mm2s_arcache(m_axi_mm2s_arcache),
    .m_axi_mm2s_aruser(m_axi_mm2s_aruser),
    .m_axi_mm2s_arvalid(m_axi_mm2s_arvalid),
    .m_axi_mm2s_arready(m_axi_mm2s_arready),
    .m_axi_mm2s_rdata(m_axi_mm2s_rdata),
    .m_axi_mm2s_rresp(m_axi_mm2s_rresp),
    .m_axi_mm2s_rlast(m_axi_mm2s_rlast),
    .m_axi_mm2s_rvalid(m_axi_mm2s_rvalid),
    .m_axi_mm2s_rready(m_axi_mm2s_rready),
    .pcie_link_status(pcie_link_status),
    .heartbeat(heartbeat)
  );
endmodule
