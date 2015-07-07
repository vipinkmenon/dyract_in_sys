//--------------------------------------------------------------------------------
// Project    : SWITCH
// File       : top.v
// Version    : 0.1
// Author     : Vipin.K
//
// Description: Arbitrator to arbitrate among PSGs to access PCIe core
//
//--------------------------------------------------------------------------------


`define MAX_SLAVE 16
module user_dma_req_arbitrator #(
    parameter NUM_SLAVES = 'd4,
    parameter ADDR_WIDTH = 'd32,
    parameter LEN_WIDTH  = 'd12,
    parameter TAG_WIDTH  = 'd8,
    parameter DATA_WIDTH = 'd64,
    parameter DMA_LEN    = 'd5
    )
   (
       input                                    i_clk,
       input                                    i_rst_n,
       //To PSG slaves
       input                                    i_slave_dma_req,
       input      [31:0]                        i_slave_dma_addr,
       input      [11:0]                        i_slave_dma_len,
       input      [7 :0]                        i_slave_dma_tag,
       output reg                               o_slave_dma_ack, 
 
       input                                    i_slave_dma_data_avail,
       input      [31:0]                        i_slave_dma_wr_addr,
       output reg                               o_slave_dma_data_rd,
       input      [63:0]                        i_slave_dma_data,
       input      [4:0]                         i_slave_dma_wr_len,
       output reg                               o_slave_dma_done,
       //To PCIe Tx engine
       output reg                               o_dma_req,
       input                                    i_dma_ack,
       output reg [31:0]                        o_dma_req_addr,
       output reg [11:0]                        o_dma_req_len,
       output reg [7:0]                         o_dma_req_tag,
 
       output reg                               o_dma_data_avail,
       output reg [31:0]                        o_dma_wr_addr,
       input                                    i_dma_data_rd,
       output reg [63:0]                        o_dma_data,
       output reg [4:0]                         o_dma_len,
       input                                    i_dma_done
    );



always@(*)
begin
   o_slave_dma_data_rd  <=    i_dma_data_rd;
   o_dma_data           <=    i_slave_dma_data;
   o_dma_req_addr       <=    i_slave_dma_addr;
   o_dma_req_len        <=    i_slave_dma_len;
   o_dma_req_tag        <=    i_slave_dma_tag;
   o_dma_wr_addr        <=    i_slave_dma_wr_addr; 
   o_dma_len            <=    i_slave_dma_wr_len;
   o_slave_dma_done     <=    i_dma_done;
   o_dma_req            <=    i_slave_dma_req;
   o_slave_dma_ack      <=    i_dma_ack;
   o_dma_data_avail     <=    i_slave_dma_data_avail;
end

endmodule
