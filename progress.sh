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

progress.until() {
    $1 &
    PROC_ID=$!

    while kill -0 "$PROC_ID" >/dev/null 2>&1; do
        for i in {1..15}; do
            printf "${GRAY}[";

            for j in {1..15}; do
                if [ $j -le $i ]; then
                    printf "#";
                else
                    printf " ";
                fi
            done

            printf "]${RESET}\n\e[1A";
            sleep 0.05;
        done
    done

    printf "            \n\e[1A";
}
