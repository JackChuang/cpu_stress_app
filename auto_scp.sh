#! /bin/bash
#
# auto_scp.sh
# Copyright (C) 2022 jackchuang <jackchuang@echo5>
#
# Distributed under terms of the MIT license.
#

scp stress* root@10.4.4.222:/
scp auto_cpu_stress_* root@10.4.4.222:/ 

scp ~/c/pophype_make_ramdisk/src/migrate root@10.4.4.222:/bin
scp ~/c/pophype_make_ramdisk/src/migrate_dbg root@10.4.4.222:/bin


# ssh root@10.4.4.222
# Usage of vCPU migration:
# taskset 0x8 migrate (for experiments) # 0x1 0x2 0x4 0x8
# or
# taskset 0x8 migrate_dbg (for debugging with printf) 
#
# For Eurosys23, move vCPU3 back to origin is enough.
echo "$ taskset 0x8 migrate"
echo "Don't do it in ssh"
