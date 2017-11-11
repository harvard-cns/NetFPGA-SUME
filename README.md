# NetFPGA switch with INT mirroring, early drop for special packets, and dynamic threshold
This repo provides a switch with:
1. INT mirroring

	Each packet will be mirrored (only the header part), with some fields in the header modified to store the queueing-related variables, such as queue length, drop or not. 
	
	The collector of the mirrored packets is in another repo: TCP_replay_testbed. See `TCP_replay_testbed/runtime_capture`.

2. Early drop for special packets

	A packet with some bit marked 1 will be dropped early: if the `queue_lenght > threshold-3*MAX_PACKET_SIZE`, drop the packet.

3. Dynamic threshold

## Modified code
	lib/hw/std/cores/output_queues_v1_0_0/
		output_queues.tcl
		hdl/output_queues.v
	lib/hw/std/cores/fallthrough_small_fifo_twothresh_v1_0_0 (new dir)

the `.old` files under the above two dirs is the version with only INT mirroring and early drop. The corresponding `.v` files are based on the `.old` files and adding dynamic threshold.

### Detail
1. INT mirroring

	The `output_queue` is the module for output queue, which originally calls `fallthrough_small_fifo`.

	We change it to call `fallthrough_small_fifo_twothresh`, which exposes the queue length. We put the queue length in the mirrored packet header. The mirroring port is numbered 0.

2. Early drop
	
	The `fallthrough_small_fifo_twothresh` also takes another threshold called `PROG_FULL_THRESHOLD_EARLY`. It compares the queue length with this early threshold, and returns whether the early threshold is reached (`prog_full` in small_fifo_twothresh). `output_queue` module takes `prog_full` and the 120-th bit (0-th bit of tos field) in packet, and decides whether to drop the packet (prog_full == 1 and 120-th bit == 1) or not.

3. Dynamic threshold

	The `fallthrough_small_fifo_twothresh` and `small_fifo_twothresh` expose the current queue length to `output_queue`. `output_queue` uses the queue lengths to calculate the dynamic threshold (`real_threshold` in output_queue.v), and assign the dynamic threshold back to `fallthrough_small_fifo_twothresh` and `small_fifo_twothresh` for them to decide whether the threshold is reached or not (`prog_full` (early drop) and `nearly_full` (normal drop)).

	Note that the both `prog_full` and `nearly_full` are based on the dynamic threshold, not the configured `PROG_FULL_THRESHOLD` and `PROG_FULL_THRESHOLD_EARLY`. These two configurations are not used.

## Usage
### Compile

You may follow SUME official guideline (https://github.com/NetFPGA /NetFPGA-SUME-public/wiki/Projects) to get started. 

Specifically, if you issue `make` in the top dir ([root@nf-test109 NetFPGA-SUME-live]# make), this will build all the basic modules. 

Next, you will need to build other modules manually. First, issue `make` in the `lib/hw/xilinx/cores/cam_v1_1_0` and `lib/hw/xilinx/cores/tcam_v1_1_0` to build CAM and TCAM modules (please refer this: https://github.com/NetFPGA/NetFPGA-SUME-public/wiki/NetFPGA-SUME-TCAM-IPs). Second, every time you add or modify the code of some modules (like we did in the step 3 above), you need to go to that specific module and rebuild it. For example, you will issue [root@nf-test109 NetFPGA-SUME-live\lib/hw/std/cores/fallthrough_small_fifo_twothresh_v1_0_0]# make).

Last, issue `make` in `projects/reference_switch` to build the project, which will leverage all the necessary modules you just built.

Again, everytime make a change to a modules under lib/hw/std/cores/, just do `make` under the dir of the module, and `make` in `projects/reference_switch`.

### Change dynamic threshold
Change `BIT_SHIFT_ALPHA` in `lib/hw/std/cores/output_queues_v1_0_0/hdl/output_queues.v` to change the alpha of dynamic thresholding.

Stop dynamic threshold: swap the .old files with the corresponding .v files.
