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

    --init)
        repo_url="https://github.com/Iza58479/Projekt.git"
        folder_name=$(basename "$repo_url" .git)
        git clone "$repo_url"
        export PATH="$PWD/$folder_name:":$PATH
        echo "Dodano $folder_name do PATH"
        ;;

    --help | -h)
        echo "Dostępne opcje:"
        echo "  --date      Wyświetla dzisiejszą datę"
        echo "  --logs [N]  Tworzy N plików logx.txt (domyślnie 100)"
        echo "  --help      Wyświetla ten tekst pomocy"
	echo "  --init      Klonuje całe repozytorium do katalogu, w którym został uruchomiony, oraz ustawia ścieżkę w zmiennej środowiskowej PATH"
        ;;
        
    *)
        echo "Nieznana opcja. Użyj --help aby zobaczyć dostępne opcje."
        ;;
esac

exit 0
