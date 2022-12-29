#!/usr/bin/env bash

cur_window=$(yabai -m query --windows --window | jq -re ".id")
yabai -m window --display prev || yabai -m window --display last
yabai -m window --focus $cur_window
