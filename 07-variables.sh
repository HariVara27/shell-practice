#!/bin/bash

#DATE=$(date)

#echo "Time stamp executed:: $DATE"

START_TIME=$(date +%s)

sleep 10

END_TIME=$(date +%s)
TOTAL_TIME=$($END_TIME-$START_TIME)

echo "Script executed in:: $TOTAL_TIME seconds"

