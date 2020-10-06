#!/bin/sh
# Script to start the CamillaDSP server  192.168.1.XX:5000 (with correct IP address)

su tc -c  "/usr/local/bin/python3 /home/tc/Camilla_GUI_v0.4.2/main.py" &

exit
