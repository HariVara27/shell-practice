#!/bin/bash


#Everything in shell is considered as string

NUMBER1=100
NUMBER2=200
NAME=DEVOPS

SUM=$(($NUMBER1+$NUMBER2+$NAME))

echo "SUM is :: ${SUM}"

LEADERS=("modi"  "trump"  "putin")

echo "All Leaders: ${LEADERS}[@]"


