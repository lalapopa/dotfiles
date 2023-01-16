# be carefull list all files except tex pdf rtx 

find -type f -not -path "*.tex" -not -path "*.pdf" -not -path "*.rtx" -not -path "*/figures/*" -not -path "*/tables/*" -not -path "*/.git/*" -not -path "*/_minted-main/*" 
