#!/bin/bash

cname_prompt() {

        LOCAL_CONF=/arena/local/inventory/local.conf
        AWK=$( command -v awk )

        if [ -f "${LOCAL_CONF}" ]; then
                CNAME=$( "$AWK" -F'=' '/InstID/ {print $2}' "${LOCAL_CONF}" )
                HOST=$( hostname -s )
                REGEX='^parls9.*'

                if [ -n "${CNAME}" ]; then
                        ps1_prod="[\u@${CNAME} \W ]\$ "
                        ps1_prep="[\u@pp${CNAME} \W ]\$ "

                        if [[ ${HOST} =~ ${REGEX} ]]; then
                                export PS1="${ps1_prep}"
                        else
                                export PS1="${ps1_prod}"
                        fi
                else
                        export PS1="[\u@\h \W ]\$ "
                fi
        fi
}
# User specific aliases and functions
cname_prompt
