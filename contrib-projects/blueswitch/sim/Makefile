#
# Copyright (c) 2015-2016 Jong Hun Han
# All rights reserved
#
# This software was developed by Stanford University and the University of
# Cambridge Computer Laboratory under National Science Foundation under Grant
# No. CNS-0855268, the University of Cambridge Computer Laboratory under EPSRC
# INTERNET Project EP/H040536/1 and by the University of Cambridge Computer
# Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), as part of
# the DARPA MRC research programme.
#
# @NETFPGA_LICENSE_HEADER_START@
#
# Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor license
# agreements.  See the NOTICE file distributed with this work for additional
# information regarding copyright ownership.  NetFPGA licenses this file to you
# under the NetFPGA Hardware-Software License, Version 1.0 (the "License"); you
# may not use this file except in compliance with the License.  You may obtain
# a copy of the License at:
#
#   http://www.netfpga-cic.org
#
# Unless required by applicable law or agreed to in writing, Work distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations under the License.
#
# @NETFPGA_LICENSE_HEADER_END@

sim_miss: clean
	echo "" > ./tv/packet_stim_rx_1.axi
	echo "" > ./tv/packet_stim_rx_2.axi
	echo "" > ./tv/packet_stim_rx_3.axi
	echo "" > ./tv/packet_stim_rx_4.axi
	echo "" > ./tv/reg_stim.axi
	echo "" > ./tv/reg_expect.axi
	vivado -mode tcl -source ./tcl/sume_blueswitch_sim.tcl
	cp -f lib/system_wrapper_tb.tcl proj_system/system.sim/sim_1/behav/
	cp -f lib/simulate.sh proj_system/system.sim/sim_1/behav/
	cd proj_system/system.sim/sim_1/behav/ && bash compile.sh
	cd proj_system/system.sim/sim_1/behav/ && bash elaborate.sh
	cd proj_system/system.sim/sim_1/behav/ && bash simulate.sh

sim_ip: clean
	echo "" > ./tv/packet_stim_rx_1.axi
	echo "" > ./tv/packet_stim_rx_2.axi
	echo "" > ./tv/packet_stim_rx_3.axi
	echo "" > ./tv/packet_stim_rx_4.axi
	cp -f ./tv/reg_ip_case.axi ./tv/reg_stim.axi
	echo "" > ./tv/reg_expect.axi
	vivado -mode tcl -source ./tcl/sume_blueswitch_sim.tcl
	cp -f lib/system_wrapper_tb.tcl proj_system/system.sim/sim_1/behav/
	cp -f lib/simulate.sh proj_system/system.sim/sim_1/behav/
	cd proj_system/system.sim/sim_1/behav/ && bash compile.sh
	cd proj_system/system.sim/sim_1/behav/ && bash elaborate.sh
	cd proj_system/system.sim/sim_1/behav/ && bash simulate.sh

sim_mac: clean
	echo "" > ./tv/packet_stim_rx_1.axi
	echo "" > ./tv/packet_stim_rx_2.axi
	echo "" > ./tv/packet_stim_rx_3.axi
	echo "" > ./tv/packet_stim_rx_4.axi
	cp -f ./tv/reg_mac_case.axi ./tv/reg_stim.axi
	echo "" > ./tv/reg_expect.axi
	vivado -mode tcl -source ./tcl/sume_blueswitch_sim.tcl
	cp -f lib/system_wrapper_tb.tcl proj_system/system.sim/sim_1/behav/
	cp -f lib/simulate.sh proj_system/system.sim/sim_1/behav/
	cd proj_system/system.sim/sim_1/behav/ && bash compile.sh
	cd proj_system/system.sim/sim_1/behav/ && bash elaborate.sh
	cd proj_system/system.sim/sim_1/behav/ && bash simulate.sh

sim_port: clean
	echo "" > ./tv/packet_stim_rx_1.axi
	echo "" > ./tv/packet_stim_rx_2.axi
	echo "" > ./tv/packet_stim_rx_3.axi
	echo "" > ./tv/packet_stim_rx_4.axi
	cp -f ./tv/reg_port_case.axi ./tv/reg_stim.axi
	echo "" > ./tv/reg_expect.axi
	vivado -mode tcl -source ./tcl/sume_blueswitch_sim.tcl
	cp -f lib/system_wrapper_tb.tcl proj_system/system.sim/sim_1/behav/
	cp -f lib/simulate.sh proj_system/system.sim/sim_1/behav/
	cd proj_system/system.sim/sim_1/behav/ && bash compile.sh
	cd proj_system/system.sim/sim_1/behav/ && bash elaborate.sh
	cd proj_system/system.sim/sim_1/behav/ && bash simulate.sh

clean: 
	rm -rf proj_* vivado*.* *.*~ .Xil* *.axi trans*

