#!/usr/bin/env bash 

function get_last_note() {
    all_notes=$(ls -r "$NOTES_DIR" | grep -oP '\d{14}')
    notes_amount=$(echo "$all_notes" | wc -l)
    taking_note=$1
    if [[ notes_amount -ge taking_note ]] && [[ ! -z "$taking_note" ]] && [[ "$taking_note" == ?(-)+([0-9]) ]] 
    then
        note_to_open=$(echo "$all_notes" | sed -n "${taking_note}p")
        open_note "$NOTES_DIR$note_to_open/$note_md"

    elif [ -z "$taking_note" ]
    then
        note_to_open=$(echo "$all_notes" | sed -n "1p")
        open_note "$NOTES_DIR$note_to_open/$note_md"
    else 
        printf "You dont have enough notes in %s\n" $NOTES_DIR
        printf "Check argument after -l, your total amount of note is %s. I can't find note #%s.\n" "$notes_amount" "$taking_note"
    fi
}

function open_note() {
    cd "$NOTES_DIR"
    vim "$1"
}


function list_all_notes() {
    all_notes=($(ls "$NOTES_DIR" | grep -oP '\d{14}'))
    if [ "$1" = "-t" ] 
    then
        for NOTE_NAME in "${all_notes[@]}"
        do
            trimed_header=$(head -1 "$NOTES_DIR$NOTE_NAME/$note_md" | sed 's/^# *//g' | sed 's/ *$//g' )
            printf "%s %s\n" "$NOTE_NAME" "$trimed_header"
        done
    else
        printf '%s\n' "${all_notes[@]}"
    fi
}

function give_help() {
   echo "Eazy note taking thing."
   echo
   echo "Usage: noty [arguments]    create note"
   echo "Arguments:"
   echo "   ls [-t]     list all notes in directory ~/Documents/Notes/."
   echo "               [Include first line of note]"
   echo "   -l [num]    Open last created notes"
   echo "               [Last note number]"
   echo "   [NOTE ID]   Open note with [NOTE ID] name"
   echo
}

NOTES_DIR="/home/$USER/Documents/Notes/"
note_md="README.md"

if [ -z "$1" ]
then
    isosec=$(date -u +%Y%m%d%H%M%S)
    note_path="${NOTES_DIR}${isosec}"

    cd "$NOTES_DIR"
    mkdir "$note_path" && touch "$note_path/$note_md"
    vim "$note_path/$note_md"
    if [ ! -s "$note_path/$note_md" ]; then
        rm -rf "$note_path" 
    fi
elif [ "$1" = '-l' ] 
then
    get_last_note "${2}"

elif [ "$1" = 'ls' ]
then
    list_all_notes "${2}"
elif [[ $1 =~ [0-9]{14} ]]
then
    if [ -d "$NOTES_DIR${BASH_REMATCH[0]}" ]; then
        open_note "$NOTES_DIR${BASH_REMATCH[0]}/$note_md"
    else
        echo "Notes '${BASH_REMATCH[0]}' not found."
    fi
else
    give_help
fi


