#
# Copyright (c) 2015 Digilent Inc.
# Copyright (c) 2015 Tinghui Wang (Steve)
# All rights reserved.
#
# File:
# nf_sume_compile.tcl
#
# Project:
# acceptance_test
#
# Author:
# Tinghui Wang (Steve)
#
# Description:
# Vivado TCL script to synthesize and implement the specified 
# acceptance_test project.
#
# Useage:
# $ vivado -source tcl/nf_sume_compile -tclargs <project_name>
#
# @NETFPGA_LICENSE_HEADER_START@
#
# Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
# license agreements.  See the NOTICE file distributed with this work for
# additional information regarding copyright ownership.  NetFPGA licenses this
# file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
# "License"); you may not use this file except in compliance with the
# License.  You may obtain a copy of the License at:
#
#   http://www.netfpga-cic.org
#
# Unless required by applicable law or agreed to in writing, Work distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.
#
# @NETFPGA_LICENSE_HEADER_END@
#

if { $::argc != 1 } {
	puts "nf_sume_compile <project_name>";
	error "nf_sume_compile: missing args <project_name>";
}

set interface_name [lindex $argv 0]
set project_name nf_sume_${interface_name}_example

open_project "project/${project_name}/${project_name}.xpr"
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
exit
