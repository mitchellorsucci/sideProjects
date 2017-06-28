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


start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  create_project -in_memory -part xc7a35ticsg324-1L
  set_property board_part digilentinc.com:arty:part0:1.1 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir /home/mitchellorsucci/FPGA/RGBfun/RGBfun.cache/wt [current_project]
  set_property parent.project_path /home/mitchellorsucci/FPGA/RGBfun/RGBfun.xpr [current_project]
  set_property ip_output_repo /home/mitchellorsucci/FPGA/RGBfun/RGBfun.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  add_files -quiet /home/mitchellorsucci/FPGA/RGBfun/RGBfun.runs/synth_1/Arty_Top.dcp
  read_xdc /home/mitchellorsucci/FPGA/Constraints/Arty_Master.xdc
  link_design -top Arty_Top -part xc7a35ticsg324-1L
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force Arty_Top_opt.dcp
  catch { report_drc -file Arty_Top_drc_opted.rpt }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force Arty_Top_placed.dcp
  catch { report_io -file Arty_Top_io_placed.rpt }
  catch { report_utilization -file Arty_Top_utilization_placed.rpt -pb Arty_Top_utilization_placed.pb }
  catch { report_control_sets -verbose -file Arty_Top_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force Arty_Top_routed.dcp
  catch { report_drc -file Arty_Top_drc_routed.rpt -pb Arty_Top_drc_routed.pb -rpx Arty_Top_drc_routed.rpx }
  catch { report_methodology -file Arty_Top_methodology_drc_routed.rpt -rpx Arty_Top_methodology_drc_routed.rpx }
  catch { report_power -file Arty_Top_power_routed.rpt -pb Arty_Top_power_summary_routed.pb -rpx Arty_Top_power_routed.rpx }
  catch { report_route_status -file Arty_Top_route_status.rpt -pb Arty_Top_route_status.pb }
  catch { report_clock_utilization -file Arty_Top_clock_utilization_routed.rpt }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file Arty_Top_timing_summary_routed.rpt -rpx Arty_Top_timing_summary_routed.rpx }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force Arty_Top_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force Arty_Top.mmi }
  write_bitstream -force Arty_Top.bit -bin_file
  catch {write_debug_probes -no_partial_ltxfile -quiet -force debug_nets}
  catch {file copy -force debug_nets.ltx Arty_Top.ltx}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

