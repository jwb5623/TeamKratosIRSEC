# Troy
# Open a PowerShell window in administrator mode
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" SMB1 -Type DWORD -Value 0 –Force

# SHOW WINDOWS FIREWALL STATUS
# netsh firewall show state; netsh advfirewall show allprofiles

# If for some reason, you need to temporarily disable SMB version 2 & version 3 use this command:
# Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" SMB2 -Type DWORD -Value 0 –Force
