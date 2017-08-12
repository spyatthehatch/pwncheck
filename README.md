# pwncheck
Simple script to check a password in Troy Hunt's SHA-1 hashed password list
spyatthehatch
August 11, 2017

# Usage
./pwncheck.sh [File] [Password]
File: file containing list of SHA-1 hashed passwords
Password: password to check if it exists in the list
EX: ./pwncheck.sh pwned-passwords-1.0.txt myPassword

