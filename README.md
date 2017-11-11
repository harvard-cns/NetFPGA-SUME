# NetFPGA switch with INT mirroring and dynamic threshold
This repo provides a switch with:
1. INT mirroring
Each packet will be mirrored (only the header part), with some fields in the header modified to store the queueing-related variables, such as queue length, drop or not.
2. Dynamic threshold

## Modified code
	lib/hw/std/cores/output_queues_v1_0_0/
	----output_queues.tcl
	----hdl/output_queues.v
