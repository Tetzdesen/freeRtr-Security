#!/bin/bash
#by Everson

#Environment variable
RTR="rtr.jar"
HWSW=

tmux new-session -d -s rare 'java -jar '$RTR' routersc topology/r1/r1-hw.txt topology/r1/r1-sw.txt'
tmux split-window -v -t 0 -p 50
tmux send 'java -jar '$RTR' routersc topology/r2/r2-hw.txt topology/r2/r2-sw.txt' ENTER;
tmux split-window -h -t 0 -p 50
tmux a;
