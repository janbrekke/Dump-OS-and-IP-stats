#!/bin/bash
#
# Info:
# Dump OS info and Network stats
#
# Created by: Jan Brekke
# DigitalBrekke
# Date: 12/04/2020
#
################################

#Variables
F="IPstats-OSinfo-dump.txt" #filename
SPACE="printf \n\n" #add space under header
SEPERATOR="echo --------------------"


#Script creating file
touch $F

#Script adding OS info header and details
$SEPERATOR > $F
echo OS Info >> $F
$SEPERATOR >> $F
$SPACE >> $F
lsb_release -idrc >> $F
$SPACE >> $F

#script adding Network info header and details
$SEPERATOR >> $F
echo IP Configuration >> $F
$SEPERATOR >> $F
$SPACE >> $F
echo IPv4 and Subnet: >> $F
ip a | awk '/inet / {print $2,$NF}' >> $F
echo   >> $F
echo Gateway: >> $F
route -n | awk '/UG/ {print $2,$NF}' >> $F 
$SPACE >> $F

