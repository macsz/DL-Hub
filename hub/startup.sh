#!/bin/bash

STUDENT_ACCOUNTS=`cat /hub/students.txt`;

function addStudents {
  mkdir -p /home/students/;
  groupadd students;

  for ENTRY in $STUDENT_ACCOUNTS;
  do
    USER=`echo $ENTRY | cut -d':' -f1`;
    PASS=`echo $ENTRY | cut -d':' -f2`;
    HOME_DIR=/home/students/$USER;

    printf "Creating student $USER... ";
    echo $USER:$PASS::::$HOME_DIR:/bin/bash | newusers;
    cp /root/.bashrc $HOME_DIR/.bashrc;

    chown -R $USER:$USER $HOME_DIR;
    usermod -a -G students $USER;
    printf "done.\n"
  done;
}

addStudents

bash
