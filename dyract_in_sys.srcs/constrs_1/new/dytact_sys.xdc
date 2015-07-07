set_property PACKAGE_PIN AV35 [get_ports sys_reset_n]
set_property IOSTANDARD LVCMOS18 [get_ports sys_reset_n]
set_property IOSTANDARD LVCMOS18 [get_ports heartbeat]
set_property IOSTANDARD LVCMOS18 [get_ports pcie_link_status]
set_property PACKAGE_PIN AM39 [get_ports heartbeat]
set_property PACKAGE_PIN AN39 [get_ports pcie_link_status]
set_property PACKAGE_PIN AR37 [get_ports init_calib_complete]
set_property IOSTANDARD LVCMOS18 [get_ports init_calib_complete]


create_clock -period 10.000 [get_ports sys_clk_p]


create_debug_core u_ila_0_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0_0]
set_property port_width 1 [get_debug_ports u_ila_0_0/clk]
connect_debug_port u_ila_0_0/clk [get_nets [list dyract_sys_i/dyract_0/inst/pcie/PIPE_USERCLK2_IN]]
set_property port_width 1 [get_debug_ports u_ila_0_0/probe0]
connect_debug_port u_ila_0_0/probe0 [get_nets [list dyract_sys_i/dyract_0/inst/pcie/app/rx_engine/m_axis_rx_tready0]]
create_debug_core u_ila_1_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_1_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_1_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_1_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1_0]
set_property port_width 1 [get_debug_ports u_ila_1_0/clk]
connect_debug_port u_ila_1_0/clk [get_nets [list dyract_sys_i/mig_7series_0_ui_clk]]
set_property port_width 32 [get_debug_ports u_ila_1_0/probe0]
connect_debug_port u_ila_1_0/probe0 [get_nets [list {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[0]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[1]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[2]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[3]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[4]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[5]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[6]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[7]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[8]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[9]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[10]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[11]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[12]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[13]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[14]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[15]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[16]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[17]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[18]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[19]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[20]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[21]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[22]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[23]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[24]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[25]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[26]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[27]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[28]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[29]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[30]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARADDR[31]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe1]
connect_debug_port u_ila_0_0/probe1 [get_nets [list dyract_sys_i/dyract_0/inst/pcie/m_axis_rx_tvalid]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe2]
connect_debug_port u_ila_0_0/probe2 [get_nets [list dyract_sys_i/dyract_0/inst/pcie/app/rx_engine/rcvd_data_valid_o0]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe3]
connect_debug_port u_ila_0_0/probe3 [get_nets [list dyract_sys_i/dyract_0/inst/sys_user_dma_en]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe4]
connect_debug_port u_ila_0_0/probe4 [get_nets [list dyract_sys_i/dyract_0/inst/user_sys_dma_en]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe5]
connect_debug_port u_ila_0_0/probe5 [get_nets [list dyract_sys_i/dyract_0/inst/pcie/app/intr_done]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe6]
connect_debug_port u_ila_0_0/probe6 [get_nets [list dyract_sys_i/dyract_0/inst/pcie/app/intr_req]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe7]
connect_debug_port u_ila_0_0/probe7 [get_nets [list dyract_sys_i/dyract_0/inst/pcie/app/reg_file/intr_state]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe8]
connect_debug_port u_ila_0_0/probe8 [get_nets [list dyract_sys_i/dyract_0/inst/pcie/pcie_7x_v1_8_i/cfg_interrupt_msienable]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe9]
connect_debug_port u_ila_0_0/probe9 [get_nets [list dyract_sys_i/dyract_0/inst/pcie/pcie_7x_v1_8_i/cfg_interrupt_msixenable]]
create_debug_port u_ila_1_0 probe
set_property port_width 2 [get_debug_ports u_ila_1_0/probe1]
connect_debug_port u_ila_1_0/probe1 [get_nets [list {dyract_sys_i/dyract_0_m_axi_mm2s_ARBURST[0]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARBURST[1]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 8 [get_debug_ports u_ila_1_0/probe2]
connect_debug_port u_ila_1_0/probe2 [get_nets [list {dyract_sys_i/dyract_0_m_axi_mm2s_ARLEN[0]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARLEN[1]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARLEN[2]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARLEN[3]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARLEN[4]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARLEN[5]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARLEN[6]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARLEN[7]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 3 [get_debug_ports u_ila_1_0/probe3]
connect_debug_port u_ila_1_0/probe3 [get_nets [list {dyract_sys_i/dyract_0_m_axi_mm2s_ARSIZE[0]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARSIZE[1]} {dyract_sys_i/dyract_0_m_axi_mm2s_ARSIZE[2]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 64 [get_debug_ports u_ila_1_0/probe4]
connect_debug_port u_ila_1_0/probe4 [get_nets [list {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[0]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[1]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[2]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[3]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[4]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[5]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[6]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[7]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[8]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[9]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[10]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[11]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[12]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[13]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[14]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[15]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[16]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[17]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[18]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[19]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[20]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[21]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[22]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[23]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[24]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[25]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[26]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[27]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[28]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[29]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[30]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[31]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[32]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[33]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[34]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[35]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[36]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[37]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[38]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[39]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[40]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[41]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[42]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[43]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[44]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[45]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[46]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[47]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[48]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[49]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[50]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[51]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[52]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[53]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[54]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[55]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[56]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[57]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[58]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[59]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[60]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[61]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[62]} {dyract_sys_i/dyract_0_m_axi_mm2s_RDATA[63]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 2 [get_debug_ports u_ila_1_0/probe5]
connect_debug_port u_ila_1_0/probe5 [get_nets [list {dyract_sys_i/dyract_0_m_axi_mm2s_RRESP[0]} {dyract_sys_i/dyract_0_m_axi_mm2s_RRESP[1]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 32 [get_debug_ports u_ila_1_0/probe6]
connect_debug_port u_ila_1_0/probe6 [get_nets [list {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[0]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[1]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[2]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[3]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[4]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[5]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[6]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[7]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[8]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[9]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[10]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[11]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[12]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[13]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[14]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[15]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[16]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[17]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[18]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[19]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[20]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[21]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[22]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[23]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[24]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[25]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[26]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[27]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[28]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[29]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[30]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWADDR[31]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 2 [get_debug_ports u_ila_1_0/probe7]
connect_debug_port u_ila_1_0/probe7 [get_nets [list {dyract_sys_i/dyract_0_m_axi_s2mm_AWBURST[0]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWBURST[1]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 8 [get_debug_ports u_ila_1_0/probe8]
connect_debug_port u_ila_1_0/probe8 [get_nets [list {dyract_sys_i/dyract_0_m_axi_s2mm_AWLEN[0]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWLEN[1]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWLEN[2]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWLEN[3]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWLEN[4]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWLEN[5]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWLEN[6]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWLEN[7]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 3 [get_debug_ports u_ila_1_0/probe9]
connect_debug_port u_ila_1_0/probe9 [get_nets [list {dyract_sys_i/dyract_0_m_axi_s2mm_AWSIZE[0]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWSIZE[1]} {dyract_sys_i/dyract_0_m_axi_s2mm_AWSIZE[2]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 2 [get_debug_ports u_ila_1_0/probe10]
connect_debug_port u_ila_1_0/probe10 [get_nets [list {dyract_sys_i/dyract_0_m_axi_s2mm_BRESP[0]} {dyract_sys_i/dyract_0_m_axi_s2mm_BRESP[1]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 64 [get_debug_ports u_ila_1_0/probe11]
connect_debug_port u_ila_1_0/probe11 [get_nets [list {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[0]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[1]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[2]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[3]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[4]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[5]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[6]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[7]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[8]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[9]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[10]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[11]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[12]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[13]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[14]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[15]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[16]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[17]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[18]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[19]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[20]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[21]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[22]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[23]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[24]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[25]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[26]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[27]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[28]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[29]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[30]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[31]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[32]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[33]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[34]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[35]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[36]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[37]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[38]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[39]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[40]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[41]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[42]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[43]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[44]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[45]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[46]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[47]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[48]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[49]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[50]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[51]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[52]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[53]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[54]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[55]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[56]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[57]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[58]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[59]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[60]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[61]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[62]} {dyract_sys_i/dyract_0_m_axi_s2mm_WDATA[63]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 8 [get_debug_ports u_ila_1_0/probe12]
connect_debug_port u_ila_1_0/probe12 [get_nets [list {dyract_sys_i/dyract_0_m_axi_s2mm_WSTRB[0]} {dyract_sys_i/dyract_0_m_axi_s2mm_WSTRB[1]} {dyract_sys_i/dyract_0_m_axi_s2mm_WSTRB[2]} {dyract_sys_i/dyract_0_m_axi_s2mm_WSTRB[3]} {dyract_sys_i/dyract_0_m_axi_s2mm_WSTRB[4]} {dyract_sys_i/dyract_0_m_axi_s2mm_WSTRB[5]} {dyract_sys_i/dyract_0_m_axi_s2mm_WSTRB[6]} {dyract_sys_i/dyract_0_m_axi_s2mm_WSTRB[7]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe13]
connect_debug_port u_ila_1_0/probe13 [get_nets [list dyract_sys_i/dyract_0_m_axi_mm2s_ARREADY]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe14]
connect_debug_port u_ila_1_0/probe14 [get_nets [list dyract_sys_i/dyract_0_m_axi_mm2s_ARVALID]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe15]
connect_debug_port u_ila_1_0/probe15 [get_nets [list dyract_sys_i/dyract_0_m_axi_mm2s_RLAST]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe16]
connect_debug_port u_ila_1_0/probe16 [get_nets [list dyract_sys_i/dyract_0_m_axi_mm2s_RREADY]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe17]
connect_debug_port u_ila_1_0/probe17 [get_nets [list dyract_sys_i/dyract_0_m_axi_mm2s_RVALID]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe18]
connect_debug_port u_ila_1_0/probe18 [get_nets [list dyract_sys_i/dyract_0_m_axi_s2mm_AWREADY]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe19]
connect_debug_port u_ila_1_0/probe19 [get_nets [list dyract_sys_i/dyract_0_m_axi_s2mm_AWVALID]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe20]
connect_debug_port u_ila_1_0/probe20 [get_nets [list dyract_sys_i/dyract_0_m_axi_s2mm_BREADY]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe21]
connect_debug_port u_ila_1_0/probe21 [get_nets [list dyract_sys_i/dyract_0_m_axi_s2mm_BVALID]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe22]
connect_debug_port u_ila_1_0/probe22 [get_nets [list dyract_sys_i/dyract_0_m_axi_s2mm_WLAST]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe23]
connect_debug_port u_ila_1_0/probe23 [get_nets [list dyract_sys_i/dyract_0_m_axi_s2mm_WREADY]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe24]
connect_debug_port u_ila_1_0/probe24 [get_nets [list dyract_sys_i/dyract_0_m_axi_s2mm_WVALID]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_PIPE_USERCLK2_IN]
