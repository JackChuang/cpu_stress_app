#! /bin/bash
#
# auto_cpu_stress_test_single.sh
# Copyright (C) 2022 jackchuang <jackchuang@echo5>
#
# Distributed under terms of the MIT license.
#



for i in `seq 10`; do
	echo "time taskset 0x1 ./stress50"
	time taskset 0x1 ./stress50

	echo "time taskset 0x2 ./stress50"
	time taskset 0x2 ./stress50

	echo "time taskset 0x4 ./stress50"
	time taskset 0x4 ./stress50
done
