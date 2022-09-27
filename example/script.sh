#!/bin/bash

output=$(terraform output -json)

masters=$(echo $output | jq -r '.Small_typed_machines.value')
workers=$(echo $output | jq -r '.medium_typed_machines.value')
mastersLength=$(echo $masters | jq length ) 
workersLength=$(echo $workers | jq length )

case "$1" in
  change-hostname)
    for (( i=0; i<$mastersLength; i++ ))
    do
        ip=$(echo $masters | jq .[$i] | awk '{print $1}' | tr -d '"')
        hostname=$(echo $masters | jq .[$i] | awk '{print $2}' | awk -F"=" '{split($2,a," ");gsub(/"/, "", a[1]);print a[1]}')
        ssh-copy-id root@$ip
        ssh root@$ip "hostnamectl set-hostname $hostname"
    done
    
    for (( i=0; i<$workersLength; i++ ))
    do
        ip=$(echo $workers | jq .[$i] | awk '{print $1}' | tr -d '"')
        hostname=$(echo $workers | jq .[$i] | awk '{print $2}' | awk -F"=" '{split($2,a," ");gsub(/"/, "", a[1]);print a[1]}')
        ssh-copy-id root@$ip
        ssh root@$ip "hostnamectl set-hostname $hostname"
    done
    ;;
  install-kubernetes)

    git clone https://github.com/alperencelik/noobspray.git
    cd noobspray/ansible

# Update inventory file with current ip addresses.

    for (( i=0; i<=$mastersLength; i++ ))
    do
        declare -a ips
        ips[$i]=$(echo $masters | jq .[$i] | awk '{print $1}' | tr -d '"')
        let "index = $i-1"
        sed -i "s/master-$i ansible_user=root ansible_host.*/master-$i ansible_user=root ansible_host=${ips[$index]}/g" inventory
    done

    for (( i=0; i<=$workersLength; i++ ))
    do
        declare -a ips
        ips[$i]=$(echo $workers | jq .[$i] | awk '{print $1}' | tr -d '"')
        let "index = $i-1"
        sed -i "s/worker-$i ansible_user=root ansible_host.*/worker-$i ansible_user=root ansible_host=${ips[$index]}/g" inventory
    done

    ansible-playbook kubernetes.yaml 

   ;;
    *) echo "Unknown option: $1"
esac

