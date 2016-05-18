#!/bin/sh -f
xv_path="/local/scratch-3/jh896/ecad/Vivado/2014.4"
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
