#!/usr/bin/env bash
#              ^^^^- NOT sh; sh does not support [[ ]] or <(...)

addWords() {
  local tempFile dictFile
  tempFile=$(mktemp dictFile.XXXXXX) || return
  dictFile=$1; shift

  [[ -e "$dictFile" ]] || touch "$dictFile" || return

  sort -um "$dictFile" <(printf '%s\n' "$@" | sort -u) >"$tempFile"
  mv -- "$tempFile" "$dictFile"
}
touch anotherDict
addWords anotherDict VAR1=3 
echo "part 2"
#addWords myDict $1 $2
#echo "part 3"
#echo "$1"
#echo "part4"
#echo "$2"
cat anotherDict
