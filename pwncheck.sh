#!/bin/sh

echo "[ ] pwncheck.sh"
echo "[ ] Created by spyatthehatch"
echo "[ ] August 11, 2017"
echo "[ ]"

# If an incorrect number of arguments is passed, output the usage.
if [ "$#" -ne 2 ]; then
  echo "[*] This script checks the existence of a SHA-1 hashed password within"
  echo "[ ] a file.  Script will return 0 upon successful find in that list, a"
  echo "[ ] positive integer otherwise."
  echo "[ ]"
  echo "[*] Intended to be used with password list shared by Troy Hunt on his"
  echo "[ ] website, https://haveibeenpwned.com"
  echo "[ ]"
  echo "[*] Usage: ./pwncheck.sh [File] [Password]"
  echo "[ ] File: file containing list of SHA-1 hashed passwords"
  echo "[ ] Password: password to check if it exists in the list"
  echo "[*] EX: ./pwncheck.sh pwned-passwords-1.0.txt myPassword"
  exit 1
fi

file=$1
password=$2

echo "[ ] Using source file: $file"
echo "[ ] Start password lookup for: $password"

# Get a SHA-1 hash of the given password.
ret=`echo -n "$password" | openssl sha1`
hash=`echo $ret | awk -F '= ' '{print $2}'`
upperHash=`echo $hash | tr [a-z] [A-Z]`

echo "[ ] SHA1 hash: $upperHash"
echo "[ ] Searching..."

# Get the time, to determine how long the search takes.
start=`date +%s.%N`
search=`grep -m 1 $upperHash $file`
end=`date +%s.%N`
runtime=$( echo "$end - $start" | bc )

printf "[ ] Execution time: %02.4fs\n\r" $runtime

# Output 0 if the hash is found, 1 otherwise.
if [ "$search" = "$upperHash" ]; then
  echo "[!] Match found for $password."
  exit 0
else
  echo "[ ] Match not found for $password."
  exit 1
fi

