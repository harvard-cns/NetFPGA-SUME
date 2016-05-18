#!/bin/sh -f
xv_path="add your Xilinx tool path"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim system_wrapper_tb_behav -gui -key {Behavioral:sim_1:Functional:system_wrapper_tb} -tclbatch system_wrapper_tb.tcl -log simulate.log
