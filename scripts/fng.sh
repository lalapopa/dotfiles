#!/usr/bin/env sh

file_name="$1"

match_line=$(head -1 "$file_name" | grep "$2")

if [ -n "${match_line}" ]; then
  echo "$file_name"
fi

