#!/bin/bash

function sscreen() {

        HOSTORIP=$1
        WINDOW=$2
        SSH_CMD=$( command -v ssh )

        if [ -z "${HOSTORIP}" ]; then
                printf "Usage: %s <user_name>@<host_or_ip> <screen_window>\n" "${0}";
        else
                if [ -n "${WINDOW}" ]; then
                        "${SSH_CMD}" -t "${HOSTORIP}" screen -D -RR "${WINDOW}"; else
                        "${SSH_CMD}" -t "${HOSTORIP}" screen -D -RR;

                        # If screen command is not installed on the remote machine
                        if [ "$?" -eq 127 ]; then
                                printf "screen is not installed on the remote machine, do you still want to connect? [y/n] : ";
                                read ans

                                if [[ ${ans} =~ y ]] || [[ ${ans} =~ yes ]]; then
                                        "${SSH_CMD}" "${HOSTORIP}"; 
                                fi
                        fi
                fi
        fi
}
