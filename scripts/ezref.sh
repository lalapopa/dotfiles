#!/usr/bin/env bash 

rg . | fzf -m | grep -oP '^[\d\w\/.-]*(?=:)'

