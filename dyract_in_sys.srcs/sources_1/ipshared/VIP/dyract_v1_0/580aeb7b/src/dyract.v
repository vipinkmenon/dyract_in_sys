
module dyract #(parameter RECONFIG_ENABLE  = 0
  )
  (
  input   [3:0]        pci_exp_rxp,
  input   [3:0]        pci_exp_rxn, 
  output  [3:0]        pci_exp_txp,
  output  [3:0]        pci_exp_txn,  
  input                sys_clk_p,
  input                sys_clk_n,
  input                sys_reset_n,
//axi clock and reset
  input                m_axi_s2mm_aclk,
  output [3 : 0]       m_axi_s2mm_awid,
  output [31 : 0]      m_axi_s2mm_awaddr,
  output [7 : 0]       m_axi_s2mm_awlen,
  output [2 : 0]       m_axi_s2mm_awsize,
  output [1 : 0]       m_axi_s2mm_awburst,
  output [2 : 0]       m_axi_s2mm_awprot,
  output [3 : 0]       m_axi_s2mm_awcache,
  output [3 : 0]       m_axi_s2mm_awuser,
  output               m_axi_s2mm_awvalid,
  input                m_axi_s2mm_awready,
  output [63 : 0]      m_axi_s2mm_wdata,
  output [7 : 0]       m_axi_s2mm_wstrb,
  output               m_axi_s2mm_wlast,
  output               m_axi_s2mm_wvalid,
  input                m_axi_s2mm_wready,
  input [1 : 0]        m_axi_s2mm_bresp,
  input                m_axi_s2mm_bvalid,
  output               m_axi_s2mm_bready,
  //AXI4 read interface
  input                m_axi_mm2s_aclk,
  output [3 : 0]       m_axi_mm2s_arid,
  output [31 : 0]      m_axi_mm2s_araddr,
  output [7 : 0]       m_axi_mm2s_arlen,
  output [2 : 0]       m_axi_mm2s_arsize,
  output [1 : 0]       m_axi_mm2s_arburst,
  output [2 : 0]       m_axi_mm2s_arprot,
  output [3 : 0]       m_axi_mm2s_arcache,
  output [3 : 0]       m_axi_mm2s_aruser,
  output               m_axi_mm2s_arvalid,
  input                m_axi_mm2s_arready,
  input  [63 : 0]      m_axi_mm2s_rdata,
  input  [1 : 0]       m_axi_mm2s_rresp,
  input                m_axi_mm2s_rlast,
  input                m_axi_mm2s_rvalid,
  output               m_axi_mm2s_rready,
  output               pcie_link_status,
  output               heartbeat
);

wire [31:0]  user_wr_data;
wire [19:0]  user_addr;
wire [31:0]  user_rd_data;
wire [63:0]  user_str1_wr_data;
wire [63:0]  user_str1_rd_data;
wire [63:0]  user_str2_wr_data;
wire [63:0]  user_str2_rd_data;
wire [63:0]  user_str3_wr_data;
wire [63:0]  user_str3_rd_data;
wire [63:0]  user_str4_wr_data;
wire [63:0]  user_str4_rd_data;
wire [31:0]  sys_user_dma_addr;
wire [31:0]  user_sys_dma_addr;
wire [31:0]  sys_user_dma_len;
wire [31:0]  user_sys_dma_len; 

//assign o_axi_clk = pcie_clk;


// Instantiate the module
(*KEEP_HIERARCHY = "SOFT"*)
pcie_top #(
     .RECONFIG_ENABLE(RECONFIG_ENABLE) 
     )
     pcie (
    .pci_exp_txp(pci_exp_txp), 
    .pci_exp_txn(pci_exp_txn), 
    .pci_exp_rxp(pci_exp_rxp), 
    .pci_exp_rxn(pci_exp_rxn), 
    .sys_clk_p(sys_clk_p), 
    .sys_clk_n(sys_clk_n), 
    .sys_reset_n(sys_reset_n), 
    .user_clk_o(user_clk), 
	.pcie_clk_o(pcie_clk),
    .user_reset_o(user_reset),
    //user stream interface 
    .axi_clk_i(m_axi_s2mm_aclk),
    .user_intr_req_i(user_intr_req), 
    .user_intr_ack_o(user_intr_ack), 
    .user_str_data_valid_o(user_str1_data_wr_valid),
    .user_str_ack_i(user_str1_wr_ack),
    .user_str_data_o(user_str1_wr_data),
    .user_str_data_valid_i(user_str1_data_rd_valid),
    .user_str_ack_o(user_str1_rd_ack),
    .user_str_data_i(user_str1_rd_data),
    .sys_user_dma_addr_o(sys_user_dma_addr),
    .user_sys_dma_addr_o(user_sys_dma_addr),
    .sys_user_dma_len_o(sys_user_dma_len), 
    .user_sys_dma_len_o(user_sys_dma_len), 
    .user_sys_dma_en_o(user_sys_dma_en),
    .sys_user_dma_en_o(sys_user_dma_en),
    .pcie_link_status(pcie_link_status)
);
	 
(*KEEP_HIERARCHY = "SOFT"*)
    axi_adapter adpt(
         .i_rst_n(user_reset),
         //pcie strm 1
         .i_pcie_str_data_valid(user_str1_data_wr_valid),
         .o_pcie_str_ack(user_str1_wr_ack),
         .i_pcie_str_data(user_str1_wr_data),
         .o_pcie_str_data_valid(user_str1_data_rd_valid),
         .i_pcie_str_ack(user_str1_rd_ack),
         .o_pcie_str_data(user_str1_rd_data),
         .sys_user_dma_addr_i(sys_user_dma_addr),
         .user_sys_dma_addr_i(user_sys_dma_addr),
         .sys_user_dma_len_i(sys_user_dma_len), 
         .user_sys_dma_len_i(user_sys_dma_len), 
         .user_sys_dma_en_i(user_sys_dma_en),
         .sys_user_dma_en_i(sys_user_dma_en),
         //intr
         .m_axi_s2mm_aclk(m_axi_s2mm_aclk),         .m_axi_s2mm_awid(m_axi_s2mm_awid),
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
         //intr
        .o_intr_req(user_intr_req),
        .i_intr_ack(user_intr_ack)
    );



reg   [28:0] led_counter;

always @( posedge user_clk)
begin
    led_counter <= led_counter + 1;
end

assign heartbeat = led_counter[27];
	 
endmodule
	 