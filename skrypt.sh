#!/bin/bash

case $1 in
    --date)
        date
        ;;

    --logs)
        for i in $(seq 1 100); do
            filename="log${i}.txt"
            echo -e "Nazwa pliku: $filename\nSkrypt: $0\nData: $(date)" > $filename
        done
        ;;
esac
