#!/bin/sh

sudo picocom /dev/ttyUSB2 --echo --imap crcrlf --omap crcrlf -b 9600

:2I
:2A
:2H0800
