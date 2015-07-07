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

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
dyract_sys_dyract_0_0 your_instance_name (
  .pci_exp_rxp(pci_exp_rxp),                // input wire [3 : 0] pci_exp_rxp
  .pci_exp_rxn(pci_exp_rxn),                // input wire [3 : 0] pci_exp_rxn
  .pci_exp_txp(pci_exp_txp),                // output wire [3 : 0] pci_exp_txp
  .pci_exp_txn(pci_exp_txn),                // output wire [3 : 0] pci_exp_txn
  .sys_clk_p(sys_clk_p),                    // input wire sys_clk_p
  .sys_clk_n(sys_clk_n),                    // input wire sys_clk_n
  .sys_reset_n(sys_reset_n),                // input wire sys_reset_n
  .m_axi_s2mm_aclk(m_axi_s2mm_aclk),        // input wire m_axi_s2mm_aclk
  .m_axi_s2mm_awid(m_axi_s2mm_awid),        // output wire [3 : 0] m_axi_s2mm_awid
  .m_axi_s2mm_awaddr(m_axi_s2mm_awaddr),    // output wire [31 : 0] m_axi_s2mm_awaddr
  .m_axi_s2mm_awlen(m_axi_s2mm_awlen),      // output wire [7 : 0] m_axi_s2mm_awlen
  .m_axi_s2mm_awsize(m_axi_s2mm_awsize),    // output wire [2 : 0] m_axi_s2mm_awsize
  .m_axi_s2mm_awburst(m_axi_s2mm_awburst),  // output wire [1 : 0] m_axi_s2mm_awburst
  .m_axi_s2mm_awprot(m_axi_s2mm_awprot),    // output wire [2 : 0] m_axi_s2mm_awprot
  .m_axi_s2mm_awcache(m_axi_s2mm_awcache),  // output wire [3 : 0] m_axi_s2mm_awcache
  .m_axi_s2mm_awuser(m_axi_s2mm_awuser),    // output wire [3 : 0] m_axi_s2mm_awuser
  .m_axi_s2mm_awvalid(m_axi_s2mm_awvalid),  // output wire m_axi_s2mm_awvalid
  .m_axi_s2mm_awready(m_axi_s2mm_awready),  // input wire m_axi_s2mm_awready
  .m_axi_s2mm_wdata(m_axi_s2mm_wdata),      // output wire [63 : 0] m_axi_s2mm_wdata
  .m_axi_s2mm_wstrb(m_axi_s2mm_wstrb),      // output wire [7 : 0] m_axi_s2mm_wstrb
  .m_axi_s2mm_wlast(m_axi_s2mm_wlast),      // output wire m_axi_s2mm_wlast
  .m_axi_s2mm_wvalid(m_axi_s2mm_wvalid),    // output wire m_axi_s2mm_wvalid
  .m_axi_s2mm_wready(m_axi_s2mm_wready),    // input wire m_axi_s2mm_wready
  .m_axi_s2mm_bresp(m_axi_s2mm_bresp),      // input wire [1 : 0] m_axi_s2mm_bresp
  .m_axi_s2mm_bvalid(m_axi_s2mm_bvalid),    // input wire m_axi_s2mm_bvalid
  .m_axi_s2mm_bready(m_axi_s2mm_bready),    // output wire m_axi_s2mm_bready
  .m_axi_mm2s_aclk(m_axi_mm2s_aclk),        // input wire m_axi_mm2s_aclk
  .m_axi_mm2s_arid(m_axi_mm2s_arid),        // output wire [3 : 0] m_axi_mm2s_arid
  .m_axi_mm2s_araddr(m_axi_mm2s_araddr),    // output wire [31 : 0] m_axi_mm2s_araddr
  .m_axi_mm2s_arlen(m_axi_mm2s_arlen),      // output wire [7 : 0] m_axi_mm2s_arlen
  .m_axi_mm2s_arsize(m_axi_mm2s_arsize),    // output wire [2 : 0] m_axi_mm2s_arsize
  .m_axi_mm2s_arburst(m_axi_mm2s_arburst),  // output wire [1 : 0] m_axi_mm2s_arburst
  .m_axi_mm2s_arprot(m_axi_mm2s_arprot),    // output wire [2 : 0] m_axi_mm2s_arprot
  .m_axi_mm2s_arcache(m_axi_mm2s_arcache),  // output wire [3 : 0] m_axi_mm2s_arcache
  .m_axi_mm2s_aruser(m_axi_mm2s_aruser),    // output wire [3 : 0] m_axi_mm2s_aruser
  .m_axi_mm2s_arvalid(m_axi_mm2s_arvalid),  // output wire m_axi_mm2s_arvalid
  .m_axi_mm2s_arready(m_axi_mm2s_arready),  // input wire m_axi_mm2s_arready
  .m_axi_mm2s_rdata(m_axi_mm2s_rdata),      // input wire [63 : 0] m_axi_mm2s_rdata
  .m_axi_mm2s_rresp(m_axi_mm2s_rresp),      // input wire [1 : 0] m_axi_mm2s_rresp
  .m_axi_mm2s_rlast(m_axi_mm2s_rlast),      // input wire m_axi_mm2s_rlast
  .m_axi_mm2s_rvalid(m_axi_mm2s_rvalid),    // input wire m_axi_mm2s_rvalid
  .m_axi_mm2s_rready(m_axi_mm2s_rready),    // output wire m_axi_mm2s_rready
  .pcie_link_status(pcie_link_status),      // output wire pcie_link_status
  .heartbeat(heartbeat)                    // output wire heartbeat
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

