#!/bin/bash

case $1 in
    --date | -d)
        date
        ;;

    --logs | -l)
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

    --error | -e)
        if [ -n "$2" ] && [[ "$2" =~ ^[0-9]+$ ]]; then
            num_files="$2"
        else
            num_files=100
        fi

        for i in $(seq 1 "$num_files"); do
            filename="error${i}.txt"
            echo -e "Nazwa pliku: $filename\nSkrypt: $0\nData: $(date)" > "$filename"
        done
        echo "Utworzono $num_files plików error."
        ;;

    --init)
        repo_url="https://github.com/Iza58479/Projekt.git"
        folder_name=$(basename "$repo_url" .git)
        git clone "$repo_url"
        export PATH="$PWD/$folder_name:":$PATH
        echo "Dodano $folder_name do PATH"
        ;;

    --help | -h)
        echo "Dostępne opcje:"
        echo "  --date, -d      Wyświetla dzisiejszą datę"
        echo "  --logs [N], -l [N]  Tworzy N plików logx.txt (domyślnie 100)"
	echo "  --error [N] Tworzy N plików errorx.txt (domyślnie 100)"
        echo "  --help, -h      Wyświetla ten tekst pomocy"
	echo "  --init      Klonuje całe repozytorium do katalogu, w którym został uruchomiony, oraz ustawia ścieżkę w zmiennej środowiskowej PATH"
        ;;
        
    *)
        echo "Nieznana opcja. Użyj --help aby zobaczyć dostępne opcje."
        ;;
esac

exit 0
