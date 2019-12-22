#!/usr/bin/env bash

source ./colors.sh

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
