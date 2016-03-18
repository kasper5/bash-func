#!/bin/bash

xrdp() {

        USER_NAME=$1
        REMOTE_HOST=$2

        XFREERDP=$( command -v xfreerdp )
        DRIVE=/mnt/linux-share
        if [ -d "${DRIVE}" ]; then
                OPTIONS="/drive:linux-share,${DRIVE} +clipboard /w:1820 /h:820" 
        else
                OPTIONS="+clipboard /w:1820 /h:820"
        fi

        "${XFREERDP}" /u:"${USER_NAME}" /v:"${REMOTE_HOST}" "${OPTIONS}" 
}
