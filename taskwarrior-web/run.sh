#!/bin/bash

export HOME=/config/taskwarrior

mkdir -p "$HOME/.task"

if [ ! -f "$HOME/.taskrc" ]; then
cat > "$HOME/.taskrc" <<EOF
data.location=$HOME/.task
EOF
fi

exec task-web \
  --host 0.0.0.0 \
  --port 5678
