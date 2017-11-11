# NetFPGA switch with INT mirroring, early drop for special packets, and dynamic threshold
This repo provides a switch with:
1. INT mirroring

Each packet will be mirrored (only the header part), with some fields in the header modified to store the queueing-related variables, such as queue length, drop or not.

2. Early drop for special packets

A packet with some bit marked 1 will be dropped early: if the `queue_lenght > threshold-3*MAX_PACKET_SIZE`, drop the packet.

3. Dynamic threshold

## Modified code
	lib/hw/std/cores/output_queues_v1_0_0/
		output_queues.tcl
		hdl/output_queues.v
	lib/hw/std/cores/fallthrough_small_fifo_twothresh_v1_0_0 (new dir)

the `.old` files under the above two dirs are version without dynamic threshold (but with INT mirroring).

### Detail
1. INT mirroring
The `output_queue` is the module for output queue, which originally calls `fallthrough_small_fifo`.
