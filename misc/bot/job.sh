#!/bin/bash
set -ux

jobname=$1
target=$2

ROOT=$(realpath `dirname $0`/../..)

LOCKS=$ROOT/misc/bot/locks
LOGS=$ROOT/misc/bot/logs
LOCK=$LOCKS/$jobname

mkdir -p $LOGS/$jobname
LOG1=$LOGS/$jobname/last.log
LOG2=$LOGS/$jobname/`date +\%Y-\%m-\%d__\%H-\%M-\%S`.log

echo Job name: $jobname
echo Target: $target
echo ROOT: $ROOT
echo LOCKS: $LOCKS
echo LOGS: $LOGS
echo LOG1: $LOG1
echo LOG2: $LOG2
echo LOCK: $LOCK

touch $LOG1
touch $LOG2


/usr/bin/flock -n $LOCK \
/bin/bash -c "source $ROOT/deploy/bin/activate && nice -n 10 make -C $ROOT $target 2>&1 | tee $LOG1 | tee $LOG2"
