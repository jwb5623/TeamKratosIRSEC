#!/bin/bash
#A.J. Musacchio
echo "Building Your Firewall."

sudo iptables -F #clears all of the current iptable rules

#LDAP used for authentication with AD server using ports 389
sudo iptables -A INPUT -p udp --dport 389 -j ACCEPT
sudo iptables -A OUTPUT -p udp --sport 389 -j ACCEPT 

#DNS over port 53
sudo iptables -A INPUT -p udp --dport 53 -j ACCEPT
sudo iptables -A OUTPUT -p udp --sport 53 -j ACCEPT 

#allow ICMP
sudo iptables -A INPUT -p icmp -j ACCEPT
sudo iptables -A OUTPUT -p icmp -j ACCEPT

#HTTP and HTTPS used for web browsing using ports 80 and 443
sudo iptables -A INPUT -p tcp -m multiport --dports 80,443 -j ACCEPT
sudo iptables -A OUTPUT -p tcp -m multiport --dports 80,443 -j ACCEPT

#Github says gitlab needs access to ssh as well. SSH uses port 22.
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT

#blocks all traffic so we can create a whitelist, only allow traffic wanted
sudo iptables -P INPUT DROP 
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT DROP

#save rules to tables
sudo iptables -L -v 

echo "Build Complete."


