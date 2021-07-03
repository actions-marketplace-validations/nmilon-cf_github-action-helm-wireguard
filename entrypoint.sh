#!/bin/sh -l
if [ -z "$WIREGUARD_CONFIG" ] 
then 
    echo "No VPN config given, not starting tunnel"
else
    echo "Starting VPN tunnel"
    echo $WIREGUARD_CONFIG > /etc/wireguard/tunnel.conf
    wg-quick up tunnel;
fi
echo $KUBECONFIG > ~/.kube/config;
echo "$EXEC" > run.sh
chmod +x ./run.sh
echo "Executing script"

./run.sh

if [ -z "$WIREGUARD_CONFIG" ] 
then 
    echo "No VPN config given, not stopping tunnel"
else
    echo "Stopping VPN tunnel"
    wg-quick down tunnel;
fi