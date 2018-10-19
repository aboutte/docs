
# cluster status showing red

if the web interface cluster status shows red for one or more nodes but no issues are apparent it is possibly a status check failure.

## check cluster status

first check and make sure all nodes are seen:

    cat /etc/pve/.members
    
if all nodes are registering as healthy it is likely just a status check issue

## restart the `pvestatd` service

    /etc/init.d/cman status

Check the cluster status in the web ui after the restart

