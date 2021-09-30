@ECHO OFF
:: This file is a reusable script to quickly change Windows user passwords for IRSEC 2021.
ECHO Welcome, traveler. If you are on Team Kratos, you may proceed. If you are not, please go away. 
ECHO Kratos blesses you for your compliance.

set /a doitagain=1
DOSKEY /LISTSIZE=0

:DoIt:
set /p theuser="Please enter a username: "
set /p thepass="Please enter new password: "
net user %theuser% %thepass%
set /p doitagain="Do you wish to do it again? (Y/N): "

if %doitagain%==N (goto :Done) else (
    set /a doitagain+=1
    goto :DoIt)

:Done
ECHO "Thank you, enjoy IRSEC!"
