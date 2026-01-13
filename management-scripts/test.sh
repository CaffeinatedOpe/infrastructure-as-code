ssh $1 "fastfetch"
cat "ascii/$(shuf -i 0-10 -n 1).txt"
ssh $1 "sudo kubectl get nodes"