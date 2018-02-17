pivpn


https://github.com/iphoting/ovpnmcgen.rb

For iPhone export in pfSense:
- set p12 export password that is in pfSense
- export using Bundled Configurations: Archive

For Laptop export in pfsense:
- set p12 password to empty field
- export Viscosity (Mac OS X and Windows: Viscosity inline config


cd /Users/aboutte/Documents/r/docs/docs/VPN
ovpnmcgen.rb generate aboutte iphone -o /Volumes/openvpn_configs/aboutte-iphone.mobileconfig

# add username password

<key>auth-user-pass</key>
  <string>user\nPassword</string>

scp /Volumes/openvpn_configs/aboutte-iphone.mobileconfig root@mobileconfig.andyboutte.com:/var/www/mobileconfigs/aboutte-iphone.mobileconfig

Open mobileconfig.andyboutte.com in Safari on iPhone