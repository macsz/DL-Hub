#!/bin/bash

if [ -z "$1" ]
  then
    echo "No argument supplied. Usage: ./generate_students.sh <NUMBER> to generate <NUMBER> of students accounts."
    exit 1
fi

NUM=$1

function getPswd {
    tr -cd '[:alnum:]' < /dev/urandom | fold -w8 | head -n1
}

rm -f students.txt

for i in $(seq 1 $NUM);
do
    USER=$(printf "student_%03d" $i)
    PASS=$(getPswd);
    echo $USER:$PASS | tee -a students.txt
done;
