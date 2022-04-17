#! /bin/bash
#
# auto_cpu_stress_test_single.sh
# Copyright (C) 2022 jackchuang <jackchuang@echo5>
#
# Distributed under terms of the MIT license.
#

APP="./stress100"

for i in `seq 10`; do
	echo "time taskset 0x1 $APP"
	time taskset 0x1 $APP

	echo "time taskset 0x2 $APP"
	time taskset 0x2 $APP

	echo "time taskset 0x4 $APP"
	time taskset 0x4 $APP

	echo "time taskset 0x8 $APP"
	time taskset 0x8 $APP
done
