#!/bin/bash

case $1 in
    --date)
        date
        ;;

    --logs)
    if [ -n "$2" ] && [[ "$2" =~ ^[0-9]+$ ]]; then
      num_files="$2"
      for i in $(seq 1 "$num_files"); do
        filename="log${i}.txt"
        echo -e "Nazwa pliku: $filename\nSkrypt: $0\nData: $(date)" > "$filename"
      done
      echo "Utworzono $num_files plików log."
    else
        for i in $(seq 1 100); do
            filename="log${i}.txt"
            echo -e "Nazwa pliku: $filename\nSkrypt: $0\nData: $(date)" > $filename
	    echo "Utworzono 100 plików."
        done
fi
    ;;
esac

exit 0
