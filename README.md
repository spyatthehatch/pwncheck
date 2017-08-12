# pwncheck
Simple script to check a password in Troy Hunt's SHA-1 hashed password list<br>
spyatthehatch<br>
August 11, 2017<br>

# Description
This script checks the existence of a SHA-1 hashed password within a file.  Script will return 0 upon successful find in that list, a positive integer otherwise.<br>
<br>
Intended to be used with password list shared by Troy Hunt on his website, https://haveibeenpwned.com<br>

# Usage
./pwncheck.sh [File] [Password]<br>
File: file containing list of SHA-1 hashed passwords<br>
Password: password to check if it exists in the list<br>
EX: ./pwncheck.sh pwned-passwords-1.0.txt myPassword

