set projDir "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/vivado"
set projName "theflash"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/au_top_0.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/ws2812b_writer_1.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/reset_conditioner_2.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/edge_detector_3.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/button_conditioner_4.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/game_customBeta_5.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/multi_seven_seg_6.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/converter_7.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/entities_handler_8.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/pipeline_9.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/alu_16_bit_10.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/game_CU_11.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/game_miniRegfiles_12.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/counter_13.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/counter_14.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/counter_15.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/seven_seg_16.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/decoder_17.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/alu_arithmetic_18.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/alu_boolean_19.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/alu_compare_20.v" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/verilog/alu_shifter_21.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/constraint/custom.xdc" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/constraint/alchitry.xdc" "C:/Users/amris/Downloads/alchitry-labs-1.2.1/library/components/au.xdc" "C:/Users/amris/Documents/GitHub/1DFlashQuantumTunneling/theflash/work/constraint/io.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
