# Delos
Write-Host "Beginning Firewall Process."

#Adding HTTP and HTTPS to ist of services that will be available.
Write-Host "Adding HTTP and HTTPS ports"
New-NetFirewallRule -DisplayName 'HTTP' -Direction Inbound -Action Allow -Protocol TCP -LocalPort 80
New-NetFirewallRule -DisplayName 'HTTP' -Direction Outbound -Action Allow -Protocol TCP -LocalPort 80
New-NetFirewallRule -DisplayName 'HTTPS' -Direction Inbound -Action Allow -Protocol TCP -LocalPort 443
New-NetFirewallRule -DisplayName 'HTTPS' -Direction Outbound -Action Allow -Protocol TCP -LocalPort 443

#LDAP authentication with port 389
Write-Host "Adding LDAP ports"
New-NetFirewallRule -DisplayName 'LDAP' -Direction Inbound -Action Allow -Protocol UDP -LocalPort 389
New-NetFirewallRule -DisplayName 'LDAP' -Direction Outbound -Action Allow -Protocol UDP -LocalPort 389

#DNS over port 53
Write-Host "Adding DNS ports"
New-NetFirewallRule -DisplayName 'DNS UDP' -Direction Inbound -Action Allow -Protocol UDP -LocalPort 53
New-NetFirewallRule -DisplayName 'DNS UDP' -Direction Outbound -Action Allow -Protocol UDP -LocalPort 53
New-NetFirewallRule -DisplayName 'DNS TCP' -Direction Inbound -Action Allow -Protocol TCP -LocalPort 53
New-NetFirewallRule -DisplayName 'DNS TCP' -Direction Outbound -Action Allow -Protocol TCP -LocalPort 53

#Adding DHCP
New-NetFirewallRule -DisplayName 'DHCP' -Direction Inbound -Action Allow -Protocol UDP -LocalPort 67
New-NetFirewallRule -DisplayName 'DHCP' -Direction Outbound -Action Allow -Protocol UDP -LocalPort 68

#Group Policy uses port 138
Write-Host "Adding Group Policy Ports"
New-NetFirewallRule -DisplayName 'GP' -Direction Inbound -Action Allow -Protocol UDP -LocalPort 138
New-NetFirewallRule -DisplayName 'GP' -Direction Outbound -Action Allow -Protocol UDP -LocalPort 138

#Adding Kerberos
New-NetFirewallRule -DisplayName 'Kerberos' -Direction Inbound -Action Allow -Protocol TCP -LocalPort 88
New-NetFirewallRule -DisplayName 'Kerberos' -Direction Outbound -Action Allow -Protocol TCP -LocalPort 88
New-NetFirewallRule -DisplayName 'Kerberos' -Direction Inbound -Action Allow -Protocol UDP -LocalPort 88
New-NetFirewallRule -DisplayName 'Kerberos' -Direction Outbound -Action Allow -Protocol UDP -LocalPort 88

#blocks all traffic in and out on well known ports
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

Write-Host "Completed Firewall Process."
Windows_firewall_scripts_Musacchio.ps1
3 KB