# 
# Synthesis run script generated by Vivado
# 

set_param gui.test TreeTableDev
debug::add_scope template.lib 1
set_msg_config -id {Common-41} -limit 4294967295
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {HDL-1065} -limit 10000

create_project -in_memory -part xc7vx485tffg1761-2
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/kizheppa/dyract_in_sys/dyract_in_sys.cache/wt [current_project]
set_property parent.project_path /home/kizheppa/dyract_in_sys/dyract_in_sys.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part xilinx.com:vc707:part0:1.1 [current_project]
set_property ip_repo_paths /home/kizheppa/workspace/dyract_ip [current_project]
add_files /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/dyract_sys.bd
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_microblaze_0_1/dyract_sys_microblaze_0_1.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_microblaze_0_1/dyract_sys_microblaze_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_dlmb_v10_1/dyract_sys_dlmb_v10_1.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_dlmb_v10_1/dyract_sys_dlmb_v10_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_ilmb_v10_1/dyract_sys_ilmb_v10_1.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_ilmb_v10_1/dyract_sys_ilmb_v10_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_dlmb_bram_if_cntlr_1/dyract_sys_dlmb_bram_if_cntlr_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_ilmb_bram_if_cntlr_1/dyract_sys_ilmb_bram_if_cntlr_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_lmb_bram_1/dyract_sys_lmb_bram_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_mdm_1_1/dyract_sys_mdm_1_1.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_mdm_1_1/dyract_sys_mdm_1_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_mig_7series_0_3/dyract_sys_mig_7series_0_3/user_design/constraints/dyract_sys_mig_7series_0_3.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_mig_7series_0_3/dyract_sys_mig_7series_0_3/user_design/constraints/dyract_sys_mig_7series_0_3_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_mig_7series_0_3/dyract_sys_mig_7series_0_3_board.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_xbar_1/dyract_sys_xbar_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_rst_mig_7series_0_100M_1/dyract_sys_rst_mig_7series_0_100M_1_board.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_rst_mig_7series_0_100M_1/dyract_sys_rst_mig_7series_0_100M_1.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_rst_mig_7series_0_100M_1/dyract_sys_rst_mig_7series_0_100M_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_dyract_0_1/src/user_fifo/user_fifo_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_dyract_0_1/src/user_fifo/user_fifo/user_fifo.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_dyract_0_1/src/user_fifo/user_fifo/user_fifo_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_dyract_0_1/src/axi_datamover_0/axi_datamover_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_dyract_0_1/src/axi_datamover_0/axi_datamover_0.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_dyract_0_1/src/axi_datamover_0/axi_datamover_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_dyract_0_1/src/pcie_7x_0/source/pcie_7x_0-PCIE_X1Y0.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_dyract_0_1/src/pcie_7x_0/synth/pcie_7x_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_dyract_0_1/src/config_buffer/config_buffer/config_buffer_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_dyract_0_1/src/config_buffer/config_buffer/config_buffer.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_dyract_0_1/src/config_buffer/config_buffer_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/ipshared/VIP/dyract_v1_1/034c9e85/src/dyract.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_auto_us_0/dyract_sys_auto_us_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_auto_us_0/dyract_sys_auto_us_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_auto_us_1/dyract_sys_auto_us_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_auto_us_1/dyract_sys_auto_us_1_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_auto_pc_0/dyract_sys_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_auto_us_2/dyract_sys_auto_us_2_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_auto_us_2/dyract_sys_auto_us_2_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_auto_us_3/dyract_sys_auto_us_3_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_auto_us_3/dyract_sys_auto_us_3_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_auto_us_4/dyract_sys_auto_us_4_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/ip/dyract_sys_auto_us_4/dyract_sys_auto_us_4_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/dyract_sys_ooc.xdc]
set_property is_locked true [get_files /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/bd/dyract_sys/dyract_sys.bd]

read_verilog -library xil_defaultlib /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/imports/hdl/dyract_sys_wrapper.v
read_xdc /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/constrs_1/new/dytact_sys.xdc
set_property used_in_implementation false [get_files /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/constrs_1/new/dytact_sys.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
catch { write_hwdef -file dyract_sys_wrapper.hwdef }
synth_design -top dyract_sys_wrapper -part xc7vx485tffg1761-2
write_checkpoint -noxdef dyract_sys_wrapper.dcp
catch { report_utilization -file dyract_sys_wrapper_utilization_synth.rpt -pb dyract_sys_wrapper_utilization_synth.pb }
