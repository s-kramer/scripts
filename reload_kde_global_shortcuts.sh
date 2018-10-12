#!/bin/bash
 # kwriteconfig --group plasmashell --key 'activate widget 77' 'Ctrl+Esc,none,Activate Application Dashboard Widget'
sed -i "s/Alt+F1/Ctrl+Esc/" ~/.config/kglobalshortcutsrc

kquitapp kglobalaccel && sleep 1 && kglobalaccel5 &

