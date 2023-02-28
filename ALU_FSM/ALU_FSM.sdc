###################################################################

# Created by write_sdc on Sun Feb 26 13:27:58 2023

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_driving_cell -lib_cell INVX1 [get_ports clka]
set_driving_cell -lib_cell INVX1 [get_ports clkb]
set_driving_cell -lib_cell INVX1 [get_ports reset_in]
set_driving_cell -lib_cell INVX1 [get_ports n_dec_in]
set_driving_cell -lib_cell INVX1 [get_ports z_dec_in]
set_driving_cell -lib_cell INVX1 [get_ports p_dec_in]
set_driving_cell -lib_cell INVX1 [get_ports n_alu_in]
set_driving_cell -lib_cell INVX1 [get_ports z_alu_in]
set_driving_cell -lib_cell INVX1 [get_ports p_alu_in]
set_driving_cell -lib_cell INVX1 [get_ports we_reg_in]
set_driving_cell -lib_cell INVX1 [get_ports br_in]
create_clock [get_ports clka]  -period 50  -waveform {0 25}
set_input_delay -clock clka  1  [get_ports clkb]
set_input_delay -clock clka  1  [get_ports reset_in]
set_input_delay -clock clka  1  [get_ports n_dec_in]
set_input_delay -clock clka  1  [get_ports z_dec_in]
set_input_delay -clock clka  1  [get_ports p_dec_in]
set_input_delay -clock clka  1  [get_ports n_alu_in]
set_input_delay -clock clka  1  [get_ports z_alu_in]
set_input_delay -clock clka  1  [get_ports p_alu_in]
set_input_delay -clock clka  1  [get_ports we_reg_in]
set_input_delay -clock clka  1  [get_ports br_in]
set_output_delay -clock clka  1  [get_ports pc_ctl_0_out]
set_output_delay -clock clka  1  [get_ports pc_latch_clkedge]
set_output_delay -clock clka  1  [get_ports {state_out[3]}]
set_output_delay -clock clka  1  [get_ports {state_out[2]}]
set_output_delay -clock clka  1  [get_ports {state_out[1]}]
set_output_delay -clock clka  1  [get_ports {state_out[0]}]
