#!/bin/bash

STUDENT_ACCOUNTS=`cat /hub/students.txt`;
SPEAKERS_ACCOUNTS=`cat /hub/speakers.txt`;

function addStudents {
  mkdir -p /home/students/;
  groupadd students;

  for ENTRY in $STUDENT_ACCOUNTS;
  do
    USER=`echo $ENTRY | cut -d':' -f1`;
    PASS=`echo $ENTRY | cut -d':' -f2`;
    HOME_DIR=/home/students/$USER;

    printf "Creating student account $USER... ";
    echo $USER:$PASS::::$HOME_DIR:/bin/bash | newusers;
    cp /root/.bashrc $HOME_DIR/.bashrc;

    chown -R $USER:$USER $HOME_DIR;
    chmod og-wrx $HOME_DIR;
    usermod -a -G students $USER;
    printf "done.\n"
  done;
}

function addSpeakers {
  mkdir -p /home/speakers/;
  groupadd speakers;

  for ENTRY in $SPEAKERS_ACCOUNTS;
  do
    USER=`echo $ENTRY | cut -d':' -f1`;
    PASS=`echo $ENTRY | cut -d':' -f2`;
    HOME_DIR=/home/speakers/$USER;

    printf "Creating speaker account $USER... ";
    echo $USER:$PASS::::$HOME_DIR:/bin/bash | newusers;
    cp /root/.bashrc $HOME_DIR/.bashrc;

    chown -R $USER:$USER $HOME_DIR;
    chmod og-wrx $HOME_DIR;
    usermod -a -G speakers $USER;
    printf "done.\n"
  done;
}

addStudents
addSpeakers

bash
# jupyterhub -f /etc/jupyterhub/jupyterhub_config.py
