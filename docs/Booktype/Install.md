apt-get update; apt-get upgrade -y
apt-get install -y wget curl vim git unzip

# database
apt-get install postgresql -y
sudo -u postgres createuser -SDRP booktype-user (password: password)
sudo -u postgres createdb -E utf8 -T template0 -O booktype-user booktype-db
service postgresql restart

# pdf
apt-get install -y php5-cli php5-gd
mkdir -p /var/www/
cd /tmp/
wget http://www.mpdfonline.com/repos/MPDF_6_0.zip
unzip MPDF_6_0.zip -d /var/www/
cd /var/www/mpdf60/
chown www-data.www-data examples/test.pdf graph_cache/ tmp/ ttfontdata/


# booktype
# add booktype repo to apt-get
vim /etc/apt/sources.list
## # Booktype
## deb http://apt.sourcefabric.org/ trusty main
apt-get update
apt-get install sourcefabric-keyring --force-yes -y
apt-get update
apt-get install booktype -y
