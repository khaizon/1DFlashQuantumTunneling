set projDir "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/LED\ drivers/work/vivado"
set projName "LEDStripTest"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/LED\ drivers/work/verilog/au_top_0.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/LED\ drivers/work/verilog/led_driver_1.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/LED\ drivers/work/verilog/reset_conditioner_2.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/LED\ drivers/work/verilog/handle_entities_3.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/LED\ drivers/work/verilog/multi_seven_seg_4.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/LED\ drivers/work/verilog/edge_detector_5.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/LED\ drivers/work/verilog/counter_6.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/LED\ drivers/work/verilog/counter_7.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/LED\ drivers/work/verilog/seven_seg_8.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/LED\ drivers/work/verilog/decoder_9.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/amris/Downloads/alchitry-labs-1.2.1/library/components/au.xdc" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/LED\ drivers/work/constraint/custom.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
