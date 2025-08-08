#!/bin/bash

echo "UFW Firewall Setup Script"

# Input 1: Ports to block
read -p "Enter ports to BLOCK (comma-separated, or press Enter for none): " BLOCK_PORTS

# Input 2: Ports to allow
read -p "Enter ports to ALLOW (comma-separated, or press Enter for none): " ALLOW_PORTS

# Input 3: IPs to block
read -p "Enter IPs to BLOCK (comma-separated, or press Enter for none): " BLOCK_IPS

# Input 4: IPs to allow
read -p "Enter IPs to ALLOW (comma-separated, or press Enter for none): " ALLOW_IPS

# enable UFW
sudo ufw enable

echo "Blocking ports..."
IFS=',' read -ra PORT_BLOCK <<< "$BLOCK_PORTS"
for port in "${PORT_BLOCK[@]}"; do
    [[ -n "$port" ]] && sudo ufw deny "$port"
done

echo "Allowing ports..."
IFS=',' read -ra PORT_ALLOW <<< "$ALLOW_PORTS"
for port in "${PORT_ALLOW[@]}"; do
    [[ -n "$port" ]] && sudo ufw allow "$port"
done

echo "Blocking IPs..."
IFS=',' read -ra IP_BLOCK <<< "$BLOCK_IPS"
for ip in "${IP_BLOCK[@]}"; do
    [[ -n "$ip" ]] && sudo ufw deny from "$ip"
done

echo "Allowing IPs..."
IFS=',' read -ra IP_ALLOW <<< "$ALLOW_IPS"
for ip in "${IP_ALLOW[@]}"; do
    [[ -n "$ip" ]] && sudo ufw allow from "$ip"
done

echo "Current UFW status:"
sudo ufw status numbered
