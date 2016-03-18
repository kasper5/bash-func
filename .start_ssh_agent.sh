#!/bin/bash

startSSHagent(){

        SSH_AGENT=$( command -v ssh-agent )

        if [ -z "$( ps -U ${USER} | grep 'ssh-agent' | grep -v grep )" ]; then
                eval $( ${SSH_AGENT} -s ) &>/dev/null 
        fi
}
startSSHagent
