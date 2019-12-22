#!/usr/bin/env bash

BLACK='\033[1;30m';
RED='\033[1;31m';
GREEN='\033[1;32m';
YELLOW='\033[1;33m';
BLUE='\033[1;34m';
MAGENTA='\033[1;35m';
CYAN='\033[1;36m';
GRAY='\033[1;37m';
WHITE='\033[1;38m';
RESET='\033[0m';

console.line() {
    printf "\n";
}

console.log() {
    printf "$WHITE$1$RESET\n";
}

console.info() {
    printf "$YELLOW$1$RESET\n";
}

console.error() {
    printf "$RED$1$RESET\n";
}

console.success() {
    printf "$GREEN$1$RESET\n";
}

console.ask() {
    printf "$MAGENTA$1:\n";
    printf " > $RESET";
    read $2;
}

console.choose() {
    printf "$MAGENTA$1:$RESET\n";

    for i in "${!KEYS[@]}"; do
        if [ "${KEYS[$i]}" == "$CHOICE" ]
        then
            printf " $YELLOW[${KEYS[$i]}]$RESET $CYAN${LABELS[$i]}$RESET\n";
        else
            printf " $CYAN[${KEYS[$i]}] ${LABELS[$i]}$RESET\n";
        fi
    done

    printf "$RESET \n";
    printf "$YELLOW$2 ($CHOICE):$RESET\n";
    printf " > ";

    local RESULT;
    read RESULT;

    if [ ! -z $RESULT ]
    then
        CHOICE=$RESULT;
    fi

    printf "\n";
}

console.continue() {
    printf "$YELLOW";
    read -n 1 -s -r -p "$1";
    printf "$RESET";
}
