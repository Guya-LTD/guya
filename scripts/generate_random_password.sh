#!/bin/sh

read -p "Enter Passwrod Length: " LENGTH

date +%s | md5sum | head -c $LENGTH ; echo