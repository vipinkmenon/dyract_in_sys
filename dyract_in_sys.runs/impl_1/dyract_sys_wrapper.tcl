proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {Common-41} -limit 4294967295
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {HDL-1065} -limit 10000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param gui.test TreeTableDev
  debug::add_scope template.lib 1
  open_checkpoint /home/kizheppa/dyract_in_sys/dyract_in_sys.runs/impl_1/dyract_sys_wrapper.dcp
  set_property webtalk.parent_dir /home/kizheppa/dyract_in_sys/dyract_in_sys.cache/wt [current_project]
  set_property parent.project_path /home/kizheppa/dyract_in_sys/dyract_in_sys.xpr [current_project]
  set_property ip_repo_paths {
  /home/kizheppa/dyract_in_sys/dyract_in_sys.cache/ip
  /home/kizheppa/workspace/dyract_ip
} [current_project]
  set_property ip_output_repo /home/kizheppa/dyract_in_sys/dyract_in_sys.cache/ip [current_project]
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force dyract_sys_wrapper_opt.dcp
  catch {report_drc -file dyract_sys_wrapper_drc_opted.rpt}
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  place_design 
  write_checkpoint -force dyract_sys_wrapper_placed.dcp
  catch { report_io -file dyract_sys_wrapper_io_placed.rpt }
  catch { report_clock_utilization -file dyract_sys_wrapper_clock_utilization_placed.rpt }
  catch { report_utilization -file dyract_sys_wrapper_utilization_placed.rpt -pb dyract_sys_wrapper_utilization_placed.pb }
  catch { report_control_sets -verbose -file dyract_sys_wrapper_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force dyract_sys_wrapper_routed.dcp
  catch { report_drc -file dyract_sys_wrapper_drc_routed.rpt -pb dyract_sys_wrapper_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file dyract_sys_wrapper_timing_summary_routed.rpt -rpx dyract_sys_wrapper_timing_summary_routed.rpx }
  catch { report_power -file dyract_sys_wrapper_power_routed.rpt -pb dyract_sys_wrapper_power_summary_routed.pb }
  catch { report_route_status -file dyract_sys_wrapper_route_status.rpt -pb dyract_sys_wrapper_route_status.pb }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  add_files /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/ipshared/xilinx.com/microblaze_v9_4/e11bcbd5/data/mb_bootloop_le.elf
  set_property SCOPED_TO_REF dyract_sys [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/ipshared/xilinx.com/microblaze_v9_4/e11bcbd5/data/mb_bootloop_le.elf]
  set_property SCOPED_TO_CELLS microblaze_0 [get_files -all /home/kizheppa/dyract_in_sys/dyract_in_sys.srcs/sources_1/ipshared/xilinx.com/microblaze_v9_4/e11bcbd5/data/mb_bootloop_le.elf]
  catch { write_mem_info -force dyract_sys_wrapper.mmi }
  catch { write_bmm -force dyract_sys_wrapper_bd.bmm }
  write_bitstream -force dyract_sys_wrapper.bit 
  if { [file exists /home/kizheppa/dyract_in_sys/dyract_in_sys.runs/synth_1/dyract_sys_wrapper.hwdef] } {
    catch { write_sysdef -hwdef /home/kizheppa/dyract_in_sys/dyract_in_sys.runs/synth_1/dyract_sys_wrapper.hwdef -bitfile dyract_sys_wrapper.bit -meminfo dyract_sys_wrapper.mmi -file dyract_sys_wrapper.sysdef }
  }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

