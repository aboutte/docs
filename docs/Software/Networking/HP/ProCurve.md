### Asign vlan to interface

    show vlan
    configure
    vlan 30
    untagged 1
    tagged 3-7
    end

### list mac addresses by port

    show mac-address

### show running configure
    show config

### Save the running config to preserve between reboots

    wr mem

http://blog.petrilopia.net/info/hp-procurve-cli-cheatsheet-2/


tagged v untagged

everything is from the sw01 perspective.

untagged - the packets coming into the switch are not already tagged because the device
is not vlan aware

tagged - the device plugged into this port is vlan aware so the switch needs to leave
the vlan bits of the packet intact so the device itself can read the vlan id


unused ports should be added to vlan 999 to blackhole them

ports that should be connected to the LAN should be vlan 1 untaggged

https://doc.pfsense.org/index.php/Migrate_Assigned_LAN_to_LAGG
http://techierambles.blogspot.com/2009/07/enable-lacp-on-hp-procurve-switch.html
