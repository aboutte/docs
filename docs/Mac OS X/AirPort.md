
$ /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs
AirPort preferences for en0:

DisconnectOnLogout=NO
JoinMode=Strongest
JoinModeFallback=DoNothing
RememberRecentNetworks=YES
RequireAdminIBSS=NO
RequireAdminNetworkChange=NO
RequireAdminPowerToggle=NO
WoWEnabled=NO

$ sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs joinMode=Strongest

$ /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs
AirPort preferences for en0:

DisconnectOnLogout=NO
JoinMode=Strongest
JoinModeFallback=DoNothing
RememberRecentNetworks=YES
RequireAdminIBSS=NO
RequireAdminNetworkChange=NO
RequireAdminPowerToggle=NO
WoWEnabled=NO
