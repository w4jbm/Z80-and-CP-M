# XMODEM

This is XMODEM version 2.7 by M. Eberhard. I'm not sure where I originally downloaded this from, but most sites do not seem to have the .com file available.

Older versions seem to be more prevalent across various download sites.

Under Linux, the **sx** command can be used to send a file:

`sx -vv -X -b filename.ext < /dev/ttyUSBx > /dev/ttyUSBx`

The **rx** command is used to receive a file:

`rx -vv -X -E -b filename.ext < /dev/ttyUSBx > /dev/ttyUSBx`
