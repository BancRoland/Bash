##! bash/bin

rm pipe1
mkfifo pipe1
#file pipe1

cat pipe1

#másik terminálban

script -f pipe1

# a gépelt szöveg megjelenik az egyes terminálban
