#########################################################################
# File Name: UpdateMenu.sh
# Author: Huaxiao Liang
# mail: 1184903633@qq.com
# Created Time: Fri 15 Nov 2024 01:23:11 PM CST
#########################################################################
#!/bin/bash

# Directory containing markdown files
docs_dir="./docs"
#!/bin/bash
file_name="${HOME}/.vimrc"
lines_to_add=(
"function! ExecuteAfterDelay()"
"  sleep 3"
"  call RetabAndDeleteTraillingUselessChars()"
"  call UpdateMarkdownMenu()"
"  call CocAction('format')"
"  exec ': wq'"
"endfunction"
"silent call ExecuteAfterDelay()"
)
insert_after_line=$(grep -n "CocStart" ${file_name} | cut -d: -f1)
insert_after_line=$((insert_after_line + 6))
# Use a loop to insert each line
for ((i=0; i<${#lines_to_add[@]}; i++)); do
  sed -i "${insert_after_line}i ${lines_to_add[$i]}" "$file_name"
  insert_after_line=$((insert_after_line + 1))
done
# Loop over all markdown files in the docs directory
for file in "$docs_dir"/*.md; do
  if [ -f "$file" ]; then  # Check if the file is a regular file
    # Open the file with vim, press the required keys, save and exit
    vim "$file"
    sleep 3
  fi
done
start_line=$((insert_after_line - 8))  # Line number to start deleting from
end_line=$((start_line + 7))  # Calculate the end line number
# Delete lines from start_line to end_line
sed -i "${start_line},${end_line}d" "$file_name"
g++ UpdateMenu.cpp -o UpdateMenu.exe
./UpdateMenu.exe
rm ./UpdateMenu.exe
