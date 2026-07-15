#!/bin/sh

export TASKDATA=/config/.task

mkdir -p "$TASKDATA"

exec task-web \
  -o 0.0.0.0 \
  -p 5678

echo "task-web exited: $?"
sleep 300
