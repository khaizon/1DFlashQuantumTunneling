set projDir "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/vivado"
set projName "theflash"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/au_top_0.v" "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/reset_conditioner_1.v" "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/edge_detector_2.v" "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/button_conditioner_3.v" "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/game_customBeta_4.v" "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/multi_seven_seg_5.v" "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/converter_6.v" "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/pipeline_7.v" "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/alu_16_bit_8.v" "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/game_CU_9.v" "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/game_miniRegfiles_10.v" "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/counter_11.v" "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/counter_12.v" "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/counter_13.v" "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/seven_seg_14.v" "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/decoder_15.v" "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/alu_arithmetic_16.v" "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/alu_boolean_17.v" "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/alu_compare_18.v" "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/alu_shifter_19.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/constraint/alchitry.xdc" "C:/Users/Bryan/OneDrive/Desktop/alchitry-labs-1.2.0/library/components/au.xdc" "C:/Users/Bryan/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/constraint/io.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
