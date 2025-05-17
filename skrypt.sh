#!/bin/bash

case $1 in
    --date)
        date
        ;;

    --logs)
        if [ -n "$2" ] && [[ "$2" =~ ^[0-9]+$ ]]; then
            num_files="$2"
        else
            num_files=100
        fi

        for i in $(seq 1 "$num_files"); do
            filename="log${i}.txt"
            echo -e "Nazwa pliku: $filename\nSkrypt: $0\nData: $(date)" > "$filename"
        done
        echo "Utworzono $num_files plików log."
        ;;

    --help)
        echo "Dostępne opcje:"
        echo "  --date      Wyświetla dzisiejszą datę"
        echo "  --logs [N]  Tworzy N plików logx.txt (domyślnie 100)"
        echo "  --help      Wyświetla ten tekst pomocy"
        ;;
        
    *)
        echo "Nieznana opcja. Użyj --help aby zobaczyć dostępne opcje."
        ;;
esac

exit 0
