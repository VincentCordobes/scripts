#!/usr/bin/env sh

todo_file=~/Dropbox/wiki/Tasks.md

todo_section=false
done=0
total=0

while read line; do
  if [[ $line =~ Todo ]]; then
    todo_section=true
  elif [[ $line =~ "#" ]]; then
    todo_section=false
  fi


  if $todo_section ; then

    if [[ $line =~ "- [X]" ]]; then
      ((done++))
      ((total++))

    elif [[ $line =~ "- [ ]" ]]; then
      ((total++))
    fi

  fi
done < $todo_file


if [[ ! $total = "0" ]]; then
  echo "done: $done"
  echo "total: $total"
  echo "$(date +%Y-%m-%d) $done $total" >> todos.dat
fi
