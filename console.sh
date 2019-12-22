#!/usr/bin/env bash

source ./colors.sh

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
