#!/bin/sh

export TASKDATA=/config/.task
export TASKRC=/config/.taskrc

mkdir -p "$TASKDATA"
mkdir -p /run/nginx

exec /start.sh