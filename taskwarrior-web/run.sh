#!/bin/sh

export TASKDATA=/config/.task

mkdir -p "$TASKDATA"

cd /app/taskwarrior-web || exit 1
echo "PWD=$(pwd)"
ls -la

exec bundle exec task-web \
  -o 0.0.0.0 \
  -p 5678

echo "task-web exited: $?"
sleep 300
