
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name final_project_simple -dir "C:/Xilinx/final_project_simple/planAhead_run_2" -part xc3s50antqg144-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "microprocessor.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {IMEM.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top IMEM $srcset
add_files [list {microprocessor.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s50antqg144-4
