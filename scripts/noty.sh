#!/usr/bin/env bash 

function get_last_note() {
    all_notes=$(ls -r "$NOTES_DIR" | grep -oP '\d{14}')
    notes_amount=$(echo "$all_notes" | wc -l)
    taking_note=$1
    if [[ notes_amount -ge taking_note ]] && [[ ! -z "$taking_note" ]]
    then
        note_to_open=$(echo "$all_notes" | sed -n "${taking_note}p")
        printf "Trying to open %s\n" "$note_to_open"
        vim "$NOTES_DIR$note_to_open/README.md"
    elif [ -z "$taking_note" ]
    then
        note_to_open=$(echo "$all_notes" | sed -n "1p")
        printf "Trying to open %s\n" "$note_to_open"
        cd "$NOTES_DIR"
        vim "$NOTES_DIR$note_to_open/README.md"
    else 
        printf "You dont have enough notes in %s\n" $NOTES_DIR
        printf "Check argument after -l, your total amount of note is %s. I can't find note #%s.\n" "$notes_amount" "$taking_note"
    fi
}
isosec=$(date -u +%Y%m%d%H%M%S)

NOTES_DIR="/home/$USER/Documents/Notes/"
note_md="README.md"
note_path="${NOTES_DIR}${isosec}"

if [ -z "$1" ]
then
    cd "$NOTES_DIR"
    mkdir "$note_path" && touch "$note_path/$note_md"
    vim "$note_path/$note_md"
    if [ ! -s "$note_path/$note_md" ]; then
        rm -rf "$note_path" 
    fi

elif [ "$1" = '-l' ] 
then
    get_last_note "${2}"
fi

