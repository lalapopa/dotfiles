#!/bin/sh

background='0000003F'
foreground='D1D0D1cc'
primary='40BFFFcc'
font_size='16pt'

i3lock \
--bar-color $background \
--keyhl-color $primary \
--time-color $foreground \
--date-color $foreground \
--ringver-color $foreground \
--ringwrong-color $foreground \
--verif-color $foreground \
--wrong-color $foreground \
--layout-color $foreground \
--blur 5 \
--bar-indicator \
--bar-direction 1 \
--bar-orientation horizontal \
--bar-pos x+40 y+h \
--bar-max-height 5 \
--bar-base-width 41 \
--bar-periodic-step 100 \
--bar-count 18  \
--bar-step 50 \
--redraw-thread \
\
--clock --force-clock -k \
--indicator \
--keylayout 2 \
--layout-align 2 \
--date-align 2 \
--time-align 2 \
--verif-align 2 \
--wrong-align 2 \
--noinput-text "" \
--date-str "" \
\
--time-font "Iosevka" \
--time-size $font_size \
--date-font "Iosevka" \
--date-size $font_size \
--layout-font "Iosevka" \
--layout-size $font_size \
--verif-font "Iosevka" \
--verif-size $font_size \
--wrong-font "Iosevka" \
--wrong-size $font_size \
--greeter-font "Iosevka" \
--greeter-size $font_size \
--ind-pos x+w-9:y+24 \
--time-pos x+w-7:y+24 \
--date-pos x+w-180:y-5 \
