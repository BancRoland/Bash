#! bash/bin

rm pipe1
mkfifo pipe1
#file pipe1

gnome-terminal -e "tail -f pipe1"&

echo "hello" >> pipe1
