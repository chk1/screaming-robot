tail -fn0 /dev/shm/PLAYER_fprintf.log | \
while read line ; do
    echo "$line" | grep -E 'bumper 00 001 001 3 (1 0 0|0 1 0|0 0 1)'
    if [ $? = 0 ]
    then
       sox -v 0.01 /root/bump.wav -d &
    fi
done
