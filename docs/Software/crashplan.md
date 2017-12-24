point crashplan client at headless server

on workstation start an ssh connection to headless server:

ssh -N -T -R4243:localhost:4200 aboutte@192.168.0.150

On the headless machine get the authenticaion token out of this file:

/var/lib/crashplan/.ui_info (4243,112a70d7-c6f8-43fa-8f78-1832748cecc7,127.0.0.1)

On the mac:

cd /Library/Application\ Support/CrashPlan
cp .ui_info .ui_info.backup
vim .ui_info

Change port to 4200 and replace authentication token with the one from the headless server