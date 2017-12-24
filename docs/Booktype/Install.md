# Install Booktype

# Update OS and install general dependencies
    apt-get update; apt-get upgrade -y
    apt-get install -y wget curl vim git unzip

# Install database
    apt-get install postgresql -y
    sudo -u postgres createuser -SDRP booktype-user (password: password)
    sudo -u postgres createdb -E utf8 -T template0 -O booktype-user booktype-db
    service postgresql restart


# Install PDF dependencies
    apt-get install -y php5-cli php5-gd
    mkdir -p /var/www/
    cd /tmp/
    wget http://www.mpdfonline.com/repos/MPDF_6_0.zip
    unzip MPDF_6_0.zip -d /var/www/
    cd /var/www/mpdf60/
    chown www-data.www-data examples/test.pdf graph_cache/ tmp/ ttfontdata/


# Add Booktype repo to apt-get
    vim /etc/apt/sources.list
    
# Add the following contents
    # Booktype
    deb http://apt.sourcefabric.org/ trusty main

# Install Booktype
    apt-get update
    apt-get install sourcefabric-keyring --force-yes -y
    apt-get update
    apt-get install booktype -y
