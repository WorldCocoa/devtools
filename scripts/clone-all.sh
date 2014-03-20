#/bin/bash
for line in $(cat repository.list.txt); do
    git clone ${line}   
done