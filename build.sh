#!/bin/bash -x
IN_DIR="$1"
OUT_DIR="$IN_DIR""_html"
if [ ! -d "$IN_DIR" ]
then
    echo 'Not a directory'
    exit 1
fi

rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

for f in "$IN_DIR"/*.html
    do
        fname=`basename $f`
        cat templates/header.html > "$OUT_DIR/$fname"
        cat "$f" >> "$OUT_DIR/$fname"
        cat templates/footer.html >> "$OUT_DIR/$fname"
    done

echo "Done."
