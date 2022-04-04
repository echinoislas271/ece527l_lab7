#set path

set WDIR "/home/users5/ec385912/ECE527LSP22/ECE527L-LAB7/state_machine"
set SYN     "$WDIR/syn"
set SRC     "$WDIR/src"
set GUIDE   "$SYN/guidance"
set LOG     "$SYN/log"
set MAPPED  "$SYN/mapped"
set NETLIST "$SYN/netlist"

#specify SVF output file
set_svf $GUIDE/state_machine.svf

#read in the entire design
read_verilog $SRC/state_machine.v
link

#apply constraints and attributes
create_clock -period 100 [get_ports clk]
set_clock_uncertainty 1 [get_ports clk]
set_operating_conditions -max "WCCOM"

#compile the design
compile

#analye and debug the design
report_timing > $LOG/state_machine_timing.rpt
report_area > $LOG/state_machine_area.rpt

#save design database
write_file -format ddc -hierarchy -output $MAPPED/state_machine_synthesized.ddc
write_file -format verilog -hierarchy -output $NETLIST/state_machine_netlist.v

#write sdf file
write_sdf $SYN/sdf_state_machine.sdf

#exit dc shell
exit
