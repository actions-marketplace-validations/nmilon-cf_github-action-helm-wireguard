#!/bin/sh -l
if [ -z "$WIREGUARD_CONFIG" ] 
then 
    echo "No VPN config given, not starting tunnel"
else
    echo "Starting VPN tunnel"
    sudo bash -c "echo $WIREGUARD_CONFIG > /etc/wireguard/tunnel.conf"
    sudo wg-quick up tunnel;
fi
echo $KUBECONFIG > ~/.kube/config;
echo $EXEC | bash
