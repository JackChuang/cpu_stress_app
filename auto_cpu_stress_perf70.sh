#! /bin/bash
#
# run_false_share.sh
# Copyright (C) 2019 jackchuang <jackchuang@echo5>
#
# Distributed under terms of the MIT license.
#
APP="./stress70"

#. func.sh # load lib
PIDS=""
i=0
function get_running_task_pid()
{
    cur_pid=$!
    PIDS+="$cur_pid "
    echo "++ [$cur_pid] $PIDS"
    pid[$i]=$cur_pid
    let i=$i+1
}

pid=()
echo "$0 start"

taskset 0x8 $APP &
get_running_task_pid

taskset 0x4 $APP &
get_running_task_pid

taskset 0x2 $APP &
get_running_task_pid

taskset 0x1 $APP &
get_running_task_pid


for nn in `seq 0 1 $i`
do
    echo "new: wait${nn}/$i pid ${pid[$nn]}"
    wait ${pid[$nn]}
done
echo "========"
echo "| Done |"
echo "========"

echo -e "$0 done\n"
