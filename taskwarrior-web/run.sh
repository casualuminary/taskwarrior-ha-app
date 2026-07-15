#!/usr/bin/with-contenv bash

export TASKDATA=/config/.task

mkdir -p "$TASKDATA"

cd /app/taskwarrior-web || exit 1

exec bundle exec task-web \
    -o 0.0.0.0 \
    -p 5678

echo "PID=$$"
ps