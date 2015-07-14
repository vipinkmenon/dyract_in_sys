//--------------------------------------------------------------------------------
// Project    : SWITCH
// File       : rx_engine.v
// Version    : 0.1
// Author     : Vipin.K
//
// Description: 128 bit PCIe transaction layer receive unit
//
//--------------------------------------------------------------------------------

`timescale 1ns/1ns

module rx_engine  #(
  parameter C_DATA_WIDTH  = 128                                  // RX interface data width
) (
  input                         clk_i,                           // 250Mhz clock from PCIe core
  input                         rst_n,                           // Active low reset
  // AXI-S
  input  [C_DATA_WIDTH-1:0]     m_axis_rx_tdata,                 // Stream signals from the PCIe core
  input                         m_axis_rx_tlast,
  input                         m_axis_rx_tvalid,
  output reg                    m_axis_rx_tready,
  input    [21:0]               m_axis_rx_tuser,
  //Tx engine
  input                         compl_done_i,                    // Tx engine indicating completion packet is sent
  output reg                    req_compl_wd_o,                  // Request Tx engine for completion packet transmission 
  output reg [31:0]             tx_reg_data_o,                   // Data for completion packet              
  output reg [2:0]              req_tc_o,                        // Memory Read TC
  output reg                    req_td_o,                        // Memory Read TD
  output reg                    req_ep_o,                        // Memory Read EP
  output reg [1:0]              req_attr_o,                      // Memory Read Attribute
  output reg [9:0]              req_len_o,                       // Memory Read Length (1DW)
  output reg [15:0]             req_rid_o,                       // Memory Read Requestor ID
  output reg [7:0]              req_tag_o,                       // Memory Read Tag
  output reg [6:0]              req_addr_o,                      // Memory Read Address
  //Register file
  output reg [31:0]             reg_data_o,                      // Write data to register
  output reg                    reg_data_valid_o,                // Register write data is valid
  output reg [9:0]              reg_addr_o,                      // Register address
  input                         fpga_reg_wr_ack_i,               // Register write acknowledge
  output reg                    fpga_reg_rd_o,                   // Register read enable
  input      [31:0]             reg_data_i,                      // Register read data
  input                         fpga_reg_rd_ack_i,               // Register read acknowledge
  output reg [7:0]              cpld_tag_o,
  //Stream
  output reg [C_DATA_WIDTH-1:0] rcvd_data_o,                     // Memory ready completion data after DMA read request
  output reg                    rcvd_data_valid_o                // Completion data is valid
);

    // Local Registers
    wire               sof_present;
    wire               sof_right;
    wire               sof_mid;
    wire               eof;
    reg [2:0]          state;
    reg [95:0]         rx_tdata_p;
    reg [31:0]         rx_tdata_p1;
    reg                rcv_data1;
    reg                rcv_data2;
	reg                lock_tag;
	reg                user_wr_ack;
	reg                sof_mid_flag;
	 
    // State Machine state declaration
	localparam  IDLE           = 'd0,
	            SEND_DATA      = 'd1,
                WAIT_FPGA_DATA = 'd2,
                WAIT_TX_ACK    = 'd4,
                WR_DATA        = 'd5,
                RX_DATA        = 'd6;
					
    // TLP packet type encoding
	localparam MEM_RD = 7'b0000000,
               MEM_WR = 7'b1000000,
               CPLD   = 7'b1001010;
               
   assign sof_present = m_axis_rx_tuser[14];
   assign sof_right = !m_axis_rx_tuser[13] && sof_present;
   assign sof_mid = m_axis_rx_tuser[13] && sof_present;
   assign eof     = m_axis_rx_tuser[21];
            
   initial
   begin
	    m_axis_rx_tready <=  1'b0;
        req_compl_wd_o   <=  1'b0;
        state            <=  IDLE;
        rcv_data1        <=  1'b0;
        rcv_data2        <=  1'b0;
        fpga_reg_rd_o    <=  1'b0;
        reg_data_valid_o <=  1'b0;
   end
   					
   //The receive state machine
   always @ ( posedge clk_i ) 
   begin
        case (state)
            IDLE : begin
                m_axis_rx_tready <=  1'b1;                  // Indicate ready to accept TLPs
                reg_data_valid_o <=  1'b0;
                if ((m_axis_rx_tvalid) && (m_axis_rx_tready))
                begin
                    if (sof_mid) 
                    begin                                       // Valid data on the bus
				        if(m_axis_rx_tdata[94:88] == MEM_RD)      // If memory ready request
				        begin
				            m_axis_rx_tready <=  1'b0;              // Block further TLPs until the requested data is sent by Tx engine
				        	req_len_o        <=  m_axis_rx_tdata[73:64];  // Place the packet info on the bus for Tx engine
                            req_attr_o       <=  m_axis_rx_tdata[77:76];
                            req_ep_o         <=  m_axis_rx_tdata[78];
                            req_td_o         <=  m_axis_rx_tdata[79];
                            req_tc_o         <=  m_axis_rx_tdata[86:84];
                            req_rid_o        <=  m_axis_rx_tdata[127:112];
                            req_tag_o        <=  m_axis_rx_tdata[111:104];                           
                            state            <=  SEND_DATA;
                        end    
						else if(m_axis_rx_tdata[94:88] == MEM_WR) // If memory write request	 
						begin
						      state            <=   WR_DATA;
						      m_axis_rx_tready <=   1'b0;
						      sof_mid_flag     <=   1'b1;
						end       
                        else if(m_axis_rx_tdata[94:88] == CPLD)   // If completion packet
						begin
                              state    <=  RX_DATA;
                              lock_tag <=  1'b1;
						end	
                    end
                    else if (sof_right)
                    begin
                        if(m_axis_rx_tdata[30:24] == MEM_RD)
                        begin
                            m_axis_rx_tready <=  1'b0;                // Block further TLPs until the requested data is sent by Tx engine  
                            req_len_o        <=  m_axis_rx_tdata[9:0];  // Place the packet info on the bus for Tx engine
                            req_attr_o       <=  m_axis_rx_tdata[13:12];
                            req_ep_o         <=  m_axis_rx_tdata[14];
                            req_td_o         <=  m_axis_rx_tdata[15];
                            req_tc_o         <=  m_axis_rx_tdata[22:20];
                            req_rid_o        <=  m_axis_rx_tdata[63:48];
                            req_tag_o        <=  m_axis_rx_tdata[47:40];
                            req_addr_o       <=  m_axis_rx_tdata[70:64];                         
                            reg_addr_o       <=  m_axis_rx_tdata[73:64];
                            state            <=  WAIT_FPGA_DATA; 
                            fpga_reg_rd_o    <=  1'b1;   
                        end
                        if(m_axis_rx_tdata[30:24] == MEM_WR)
                        begin
                            m_axis_rx_tready <=   1'b0;
                            reg_data_o       <=   m_axis_rx_tdata[127:96];
                            reg_addr_o       <=   m_axis_rx_tdata[73:64];
                            reg_data_valid_o <=   1'b1;  
                            state            <=   WR_DATA; 
                        end
                        if(m_axis_rx_tdata[30:24] == CPLD)
                        begin
                            cpld_tag_o <=  m_axis_rx_tdata[79:72];
                            rcv_data2  <=  1'b1;
                            state      <=  RX_DATA;
                        end
                    end
                end
            end    
            SEND_DATA: begin
                if (m_axis_rx_tvalid)
                begin
                    req_addr_o         <=  m_axis_rx_tdata[6:0];
                    reg_addr_o         <=  m_axis_rx_tdata[9:0];
                    state              <=  WAIT_FPGA_DATA; 
                    fpga_reg_rd_o      <=  1'b1;   
                end
            end
            WAIT_FPGA_DATA:begin
			    fpga_reg_rd_o    <=  1'b0; 
                if(fpga_reg_rd_ack_i)
                begin 
                    req_compl_wd_o   <=  1'b1;        //Request Tx engine to send data
                    tx_reg_data_o    <=  reg_data_i;
                    state            <=  WAIT_TX_ACK; //Wait for ack from Tx engine for data sent
                end
            end
            WAIT_TX_ACK: begin
                if(compl_done_i)
                begin
                    state            <=  IDLE;
                    req_compl_wd_o   <=  1'b0;
			        m_axis_rx_tready <=  1'b1;
                end
            end
			WR_DATA:begin
                reg_data_valid_o <=   1'b0;
                if (sof_mid_flag)
                begin
                    reg_data_o       <=   m_axis_rx_tdata[63:32];
                    reg_addr_o       <=   m_axis_rx_tdata[9:0];   
                    reg_data_valid_o <=   1'b1;    
                end
                if (fpga_reg_wr_ack_i)
                begin
                    state            <=   IDLE;   
                    m_axis_rx_tready <=   1'b1;								
                end
		    end
            RX_DATA:begin
                if(lock_tag)
                begin
				    lock_tag <= 1'b0;
				    cpld_tag_o <= m_axis_rx_tdata[15:8];
				end    
                if(m_axis_rx_tvalid && eof)
                begin
                    rcv_data1        <=  1'b0;
                    rcv_data2        <=  1'b0;
                    if (sof_mid & m_axis_rx_tdata[94:88] == CPLD)   // If completion packet
                    begin
                          state    <=  RX_DATA;
                          lock_tag <=  1'b1;
                    end    
                    else if (sof_right & m_axis_rx_tdata[30:24] == CPLD)
                    begin
                        cpld_tag_o <=  m_axis_rx_tdata[79:72];
                        rcv_data2  <=  1'b1;
                        state      <=  RX_DATA;
                    end
                    else
                        state            <=  IDLE;
                end
                else if(!rcv_data2)
                    rcv_data1  <=  1'b1;
            end
        endcase
    end

    //Packing data from the received completion packet. Required since the TLP header is 3 DWORDs.
    always @(posedge clk_i)
    begin
        rx_tdata_p  <= m_axis_rx_tdata[127:32];
        rx_tdata_p1 <= m_axis_rx_tdata[127:96];
        if(rcv_data1 & m_axis_rx_tvalid)
        begin
            rcvd_data_valid_o <= 1'b1;   
            rcvd_data_o       <= {m_axis_rx_tdata[31:0],rx_tdata_p};
        end
        else if(rcv_data2 & m_axis_rx_tvalid)
        begin
            rcvd_data_valid_o <= 1'b1;   
            rcvd_data_o       <= {m_axis_rx_tdata[95:0],rx_tdata_p1};
        end
        else
            rcvd_data_valid_o <= 1'b0;
    end

endmodule