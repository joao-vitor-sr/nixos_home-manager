#!/usr/bin/env bash

duration=$1

sleep $duration

notify-send "Timer Finished" "The timer has finished after $duration seconds."


