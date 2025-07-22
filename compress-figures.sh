#!/usr/bin/env bash

trash chapters/*/compressed 2>/dev/null

find chapters/*/figures -type f -name '*.pdf' | while IFS= read -r file; do
    new=${file//figures/compressed}

    if [[ $file == *"lola"* ]]; then
        quality=75
    elif [[ $file == *"appa"* ]]; then
        quality=45
    else
        quality=90
    fi

    mkdir -p "$(dirname "$new")"
    mutool clean -gggg \
        --gray-image-recompress-method=jpeg:$quality \
        --color-image-recompress-method=jpeg:$quality \
        "$file" "$new" > dump.log 2>&1

    old_size=$(stat -f %z "$file")
    new_size=$(stat -f %z "$new")

    if grep -q "warning" dump.log; then
        rm "$new"
    elif [ "$old_size" -gt "$new_size" ]; then
        echo "$file"
    else
        rm "$new"
    fi
done

find chapters/*/figures -type f -name '*.png' | while IFS= read -r file; do
    new=${file%.*}.jpg
    new=${new//figures/compressed}

    mkdir -p "$(dirname "$new")"
    magick "$file" -quality 90 "$new"

    old_size=$(stat -f %z "$file")
    new_size=$(stat -f %z "$new")

    if [ "$old_size" -gt "$new_size" ]; then
        echo "$file"
    else
        rm "$new"
    fi
done
