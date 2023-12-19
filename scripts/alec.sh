#!/usr/bin/env bash 

TEX_FILE="main.tex"

if [[ -f ${TEX_FILE} ]]; then
    last_lecture_number=`grep -oE '\\input\{lecture[0-9]+\.tex\}' ${TEX_FILE} | tail -1 | tr -d -c 0-9`
    if [[ -z "$last_lecture_number" ]]; then
        echo "No valid word for pattern 'lecture[\d]+' in '${TEX_FILE}'"
    else                        
        new_lecture_number=`echo ${last_lecture_number} + 1 | bc`
        new_lecture_name="lecture${new_lecture_number}.tex"
        tex_last_lecture_name="input{lecture${last_lecture_number}.tex}"
        tex_new_lecture_name="\input{${new_lecture_name}}"

        if [[ ! -f ${new_lecture_name} ]]; then
            echo "\\begin{flushright}" >> ${new_lecture_name}
            date +%F  >> $new_lecture_name
            echo "\\end{flushright}" >> ${new_lecture_name}

            cp ${TEX_FILE} /tmp/main.tex.old  
            cat /tmp/main.tex.old | sed "/${tex_last_lecture_name}/a \\\\${tex_new_lecture_name}" > $TEX_FILE 
        else
            echo "'${new_lecture_name}' already exist"
        fi
    fi
else 
    echo "Can't parse '${TEX_FILE}' file. In '`pwd`' no 'main.tex' file"
fi
