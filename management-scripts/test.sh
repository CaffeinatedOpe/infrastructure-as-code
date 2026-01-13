ssh $1 "fastfetch"
cat "ascii/$(shuf -i 1-6 -n 1).txt"
ssh $1 "sudo kubectl get nodes"