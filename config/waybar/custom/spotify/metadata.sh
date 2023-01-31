#!/bin/bash

status=$(playerctl -p spotify status)
artist=$(playerctl -p spotify metadata xesam:artist | sed -r "s/\\\"/\\'/g" )
title=$(playerctl -p spotify metadata xesam:title | sed -r "s/\\\"/\\'/g")
album=$(playerctl -p spotify metadata xesam:album | sed -r "s/\\\"/\\'/g")

if [[ -z $status ]] 
then
   # spotify is dead, we should die to.
   exit
fi

if [[ $status == "Playing" ]]
then
   echo "{\"class\": \"playing\", \"text\": \"$artist - $title\", \"tooltip\": \"$artist - $title - $album\"}"
   pkill -RTMIN+5 waybar
   #pkill -RTMIN+8 waybar
   exit
fi

if [[ $status == "Paused" ]]
then
   echo "{\"class\": \"paused\", \"text\": \"$artist - $title\", \"tooltip\": \"$artist - $title - $album\"}"
   pkill -RTMIN+5 waybar
   #pkill -RTMIN+8 waybar
   exit
fi

