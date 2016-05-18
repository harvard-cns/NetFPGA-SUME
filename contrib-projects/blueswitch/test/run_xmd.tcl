set bitimage [lindex $argv 1]
puts "RUN loading image file."
puts $bitimage
fpga -f $bitimage
exit
