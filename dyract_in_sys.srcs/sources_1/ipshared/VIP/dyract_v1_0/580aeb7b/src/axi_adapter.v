module axi_adapter(
    input              i_rst_n,
    //stream i/f 1
    input              i_pcie_str_data_valid,
    output             o_pcie_str_ack,
    input  [63:0]      i_pcie_str_data,
    output             o_pcie_str_data_valid,
    input              i_pcie_str_ack,
    output [63:0]      o_pcie_str_data,
    input  [31:0]      sys_user_dma_addr_i,
    input  [31:0]      user_sys_dma_addr_i,
    input  [31:0]      sys_user_dma_len_i, 
    input  [31:0]      user_sys_dma_len_i, 
    input              user_sys_dma_en_i,
    input              sys_user_dma_en_i,
    //interrupt if
    output             o_intr_req,
    input              i_intr_ack,
	 //AXI4 write interface
	input              m_axi_mm2s_aclk,
	output [3 : 0]     m_axi_s2mm_awid,
    output [31 : 0]    m_axi_s2mm_awaddr,
    output [7 : 0]     m_axi_s2mm_awlen,
    output [2 : 0]     m_axi_s2mm_awsize,
    output [1 : 0]     m_axi_s2mm_awburst,
    output [2 : 0]     m_axi_s2mm_awprot,
    output [3 : 0]     m_axi_s2mm_awcache,
    output [3 : 0]     m_axi_s2mm_awuser,
    output             m_axi_s2mm_awvalid,
    input              m_axi_s2mm_awready,
    output [63 : 0]    m_axi_s2mm_wdata,
    output [7 : 0]     m_axi_s2mm_wstrb,
    output             m_axi_s2mm_wlast,
    output             m_axi_s2mm_wvalid,
    input              m_axi_s2mm_wready,
    input [1 : 0]      m_axi_s2mm_bresp,
    input              m_axi_s2mm_bvalid,
	output             m_axi_s2mm_bready,
	 //AXI4 read interface
	input              m_axi_s2mm_aclk,
	output [3 : 0]     m_axi_mm2s_arid,
    output [31 : 0]    m_axi_mm2s_araddr,
    output [7 : 0]     m_axi_mm2s_arlen,
    output [2 : 0]     m_axi_mm2s_arsize,
    output [1 : 0]     m_axi_mm2s_arburst,
    output [2 : 0]     m_axi_mm2s_arprot,
    output [3 : 0]     m_axi_mm2s_arcache,
    output [3 : 0]     m_axi_mm2s_aruser,
    output             m_axi_mm2s_arvalid,
    input              m_axi_mm2s_arready,
    input [63 : 0]     m_axi_mm2s_rdata,
    input [1 : 0]      m_axi_mm2s_rresp,
    input              m_axi_mm2s_rlast,
    input              m_axi_mm2s_rvalid,
    output             m_axi_mm2s_rready
);


reg        user_sys_dma_en_p;
reg        user_sys_dma_en_p1;
reg        sys_user_dma_en_p;
reg        sys_user_dma_en_p1;
reg [31:0] sys_user_dma_len;
reg [31:0] sys_user_dma_addr;
reg [31:0] user_sys_dma_len;
reg [31:0] user_sys_dma_addr;
reg [71:0] s_axis_s2mm_cmd_tdata;
reg [71:0] s_axis_mm2s_cmd_tdata;
reg        s_axis_s2mm_cmd_tvalid;
wire       s_axis_s2mm_cmd_tready;
reg        s_axis_mm2s_cmd_tvalid;

reg [1:0]  wr_state;
reg [1:0]  rd_state;

localparam WR_IDLE        = 'd0,
           WR_WAIT        = 'd1,
		   WR_NEXT        = 'd2,
		   WR_WAIT_FINISH = 'd3;
			  
localparam RD_IDLE        = 'd0,
           RD_WAIT        = 'd1,
		   RD_NEXT        = 'd2,
		   RD_WAIT_FINISH = 'd3;
		   
assign o_intr_req = 1'b0;		   
			  

//Synchronizers
always @(posedge m_axi_mm2s_aclk)
begin
    user_sys_dma_en_p  <= user_sys_dma_en_i;
    user_sys_dma_en_p1 <= user_sys_dma_en_p;
    sys_user_dma_en_p  <= sys_user_dma_en_i;
    sys_user_dma_en_p1 <= sys_user_dma_en_p;
end

initial
begin
    wr_state  <=   WR_IDLE;
	 rd_state  <=   RD_IDLE;
end

//Write state machine
always @(posedge m_axi_mm2s_aclk)
begin
   case(wr_state)
	    WR_IDLE:begin
		     s_axis_s2mm_cmd_tvalid <=  1'b0;
		     if(sys_user_dma_en_p1)
			  begin
			      sys_user_dma_addr <= sys_user_dma_addr_i;
					sys_user_dma_len  <= sys_user_dma_len_i;
					s_axis_s2mm_cmd_tvalid <= 1'b1;
               wr_state               <= WR_WAIT;	
			      if(sys_user_dma_len_i > 'd8388576) //Maximum length supported by data mover
					begin
					    s_axis_s2mm_cmd_tdata <= {
						                          4'h0,          //reserved
						                          4'h0,          //command tag
						                          sys_user_dma_addr_i, //Start address
						                          1'b0,          //DRE request
						                          1'b0,          //EOF
						                          6'd0,          //DRE
						                          1'b1,          //INCR
						                          23'd8388576    //BTT
						                          };				 
					end
					else
					begin
					    s_axis_s2mm_cmd_tdata <= {
						                          4'h0,          //reserved
						                          4'h0,          //command tag
						                          sys_user_dma_addr_i, //Start address
						                          1'b0,          //DRE request
						                          1'b0,          //EOF
						                          6'd0,          //DRE
						                          1'b1,          //INCR
						                          sys_user_dma_len_i[22:0]  //BTT
						                          };
					end
			  end
		 end
		 WR_WAIT:begin
		     if(s_axis_s2mm_cmd_tready)
			  begin
			      s_axis_s2mm_cmd_tvalid <= 1'b0;
					sys_user_dma_addr <= sys_user_dma_addr + 23'd8388576;
					sys_user_dma_len  <= sys_user_dma_len - 23'd8388576;
					if(sys_user_dma_len > 23'd8388576)
					begin
					   wr_state     <=   WR_NEXT;
					end
					else
					    wr_state    <=   WR_WAIT_FINISH;
			  end
		 end
		 WR_NEXT:begin
		     wr_state               <= WR_WAIT;
		     if(sys_user_dma_len > 'd8388576) //Maximum length supported by data mover
			  begin
				    s_axis_s2mm_cmd_tdata <= {
					                          4'h0,          //reserved
					                          4'h0,          //command tag
					                          sys_user_dma_addr_i, //Start address
					                          1'b0,          //DRE request
					                          1'b0,          //EOF
					                          6'd0,          //DRE
					                          1'b1,          //INCR
					                          23'd8388576    //BTT
					                          };
					 s_axis_s2mm_cmd_tvalid <= 1'b1;						 
				end
				else
				begin
				    s_axis_s2mm_cmd_tdata <= {
					                          4'h0,          //reserved
					                          4'h0,          //command tag
					                          sys_user_dma_addr_i, //Start address
					                          1'b0,          //DRE request
					                          1'b0,          //EOF
					                          6'd0,          //DRE
					                          1'b1,          //INCR
					                          sys_user_dma_len_i[22:0]  //BTT
					                          };
					 s_axis_s2mm_cmd_tvalid <= 1'b1;					
				end
		 end
		 WR_WAIT_FINISH:begin
		     if(!sys_user_dma_en_p1)
			  begin
			      wr_state <= WR_IDLE;
			  end
		 end
	endcase
end



//Write state machine
always @(posedge m_axi_mm2s_aclk)
begin
   case(rd_state)
	    RD_IDLE:begin
		     s_axis_mm2s_cmd_tvalid <=  1'b0;
		     if(user_sys_dma_en_p1)
			  begin
			      user_sys_dma_addr <= user_sys_dma_addr_i;
					user_sys_dma_len  <= user_sys_dma_len_i;
					s_axis_mm2s_cmd_tvalid <= 1'b1;
               rd_state               <= RD_WAIT;	
			      if(user_sys_dma_len_i > 'd8388576) //Maximum length supported by data mover
					begin
					    s_axis_mm2s_cmd_tdata <= {
						                          4'h0,          //reserved
						                          4'h0,          //command tag
						                          user_sys_dma_addr_i, //Start address
						                          1'b0,          //DRE request
						                          1'b0,          //EOF
						                          6'd0,          //DRE
						                          1'b1,          //INCR
						                          23'd8388576    //BTT
						                          };				 
					end
					else
					begin
					    s_axis_mm2s_cmd_tdata <= {
						                          4'h0,          //reserved
						                          4'h0,          //command tag
						                          user_sys_dma_addr_i, //Start address
						                          1'b0,          //DRE request
						                          1'b1,          //EOF
						                          6'd0,          //DRE
						                          1'b1,          //INCR
						                          user_sys_dma_len_i[22:0]  //BTT
						                          };
					end
			  end
		 end
		 WR_WAIT:begin
		     if(s_axis_mm2s_cmd_tready)
			  begin
			      s_axis_mm2s_cmd_tvalid <= 1'b0;
					user_sys_dma_addr <= user_sys_dma_addr + 23'd8388576;
					user_sys_dma_len  <= user_sys_dma_len - 23'd8388576;
					if(user_sys_dma_len > 23'd8388576)
					begin
					    rd_state     <=   RD_NEXT;
					end
					else
					    rd_state     <=   RD_WAIT_FINISH;
			  end
		 end
		 RD_NEXT:begin
		     rd_state               <= RD_WAIT;
			  s_axis_mm2s_cmd_tvalid <= 1'b1;	
		     if(user_sys_dma_len > 'd8388576) //Maximum length supported by data mover
			  begin
				    s_axis_mm2s_cmd_tdata <= {
					                          4'h0,          //reserved
					                          4'h0,          //command tag
					                          user_sys_dma_addr_i, //Start address
					                          1'b0,          //DRE request
					                          1'b0,          //EOF
					                          6'd0,          //DRE
					                          1'b1,          //INCR
					                          23'd8388576    //BTT
					                          };
				end
				else
				begin
				    s_axis_mm2s_cmd_tdata <= {
					                          4'h0,          //reserved
					                          4'h0,          //command tag
					                          user_sys_dma_addr_i, //Start address
					                          1'b0,          //DRE request
					                          1'b1,          //EOF
					                          6'd0,          //DRE
					                          1'b1,          //INCR
					                          user_sys_dma_len_i[22:0]  //BTT
					                          };				
				end
		 end
		 RD_WAIT_FINISH:begin
		     if(!user_sys_dma_en_p1)
			  begin
			      rd_state <= RD_IDLE;
			  end
		 end
	endcase
end





axi_datamover_0 dm (
  .m_axi_mm2s_aclk(m_axi_mm2s_aclk), 
  .m_axi_mm2s_aresetn(i_rst_n), // input m_axi_mm2s_aresetn
  .mm2s_err(), // output mm2s_err
  .m_axis_mm2s_cmdsts_aclk(m_axi_mm2s_aclk), 
  .m_axis_mm2s_cmdsts_aresetn(i_rst_n), 
  .s_axis_mm2s_cmd_tvalid(s_axis_mm2s_cmd_tvalid), 
  .s_axis_mm2s_cmd_tready(s_axis_mm2s_cmd_tready), 
  .s_axis_mm2s_cmd_tdata(s_axis_mm2s_cmd_tdata), 
  .m_axis_mm2s_sts_tvalid(), // output m_axis_mm2s_sts_tvalid
  .m_axis_mm2s_sts_tready(1'b0), // input m_axis_mm2s_sts_tready
  .m_axis_mm2s_sts_tdata(), // output [7 : 0] m_axis_mm2s_sts_tdata
  .m_axis_mm2s_sts_tkeep(), // output [0 : 0] m_axis_mm2s_sts_tkeep
  .m_axis_mm2s_sts_tlast(), // output m_axis_mm2s_sts_tlast
  //AXI4 to stream (read)
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
  //AXI stream out
  .m_axis_mm2s_tdata(o_pcie_str_data), 
  .m_axis_mm2s_tkeep(), 
  .m_axis_mm2s_tlast(),
  .m_axis_mm2s_tvalid(o_pcie_str_data_valid),
  .m_axis_mm2s_tready(i_pcie_str_ack), 
  //Stream to AXI4 (write)
  .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
  .m_axi_s2mm_aresetn(i_rst_n), 
  .s2mm_err(), // output s2mm_err
  .m_axis_s2mm_cmdsts_awclk(m_axi_s2mm_aclk), 
  .m_axis_s2mm_cmdsts_aresetn(i_rst_n), 
  .s_axis_s2mm_cmd_tvalid(s_axis_s2mm_cmd_tvalid), 
  .s_axis_s2mm_cmd_tready(s_axis_s2mm_cmd_tready), 
  .s_axis_s2mm_cmd_tdata(s_axis_s2mm_cmd_tdata), 
  .m_axis_s2mm_sts_tvalid(), // output m_axis_s2mm_sts_tvalid
  .m_axis_s2mm_sts_tready(1'b0), // input m_axis_s2mm_sts_tready
  .m_axis_s2mm_sts_tdata(), // output [7 : 0] m_axis_s2mm_sts_tdata
  .m_axis_s2mm_sts_tkeep(), // output [0 : 0] m_axis_s2mm_sts_tkeep
  .m_axis_s2mm_sts_tlast(), // output m_axis_s2mm_sts_tlast
  //axi 4 write
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
  //axi stream input
  .s_axis_s2mm_tdata(i_pcie_str_data),
  .s_axis_s2mm_tkeep(8'hFF),
  .s_axis_s2mm_tlast(1'b0), // input s_axis_s2mm_tlast
  .s_axis_s2mm_tvalid(i_pcie_str_data_valid),
  .s_axis_s2mm_tready(o_pcie_str_ack)
);

endmodule
