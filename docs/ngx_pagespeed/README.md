# About

# Install ngx_pagespeed on Ubuntu 14.04

https://developers.google.com/speed/pagespeed/module/build_ngx_pagespeed_from_source

https://www.maxcdn.com/blog/nginx-performance-tips-with-the-google-pagespeed-team/


I am using this knife plugin to bootstrap the DO droplet:

https://github.com/rmoriz/knife-digital_ocean

command to install

	chef gem install knife-digital_ocean
	gem install knife-solo

	knife digital_ocean droplet list --digital_ocean_access_token $DIGITALOCEAN_ACCESS_TOKEN

sfo1
4gb
9801954 (ubuntu 14)
94228 (my ssh key)

Create a droplet with no bootstrap

knife digital_ocean droplet create --server-name aboutte-test-01 --image ubuntu-14-04-x64 --location sfo1 --size 4gb --ssh-keys 94228 --ssh-port 22 --digital_ocean_access_token $DIGITALOCEAN_ACCESS_TOKEN

Create a droplet and bootstrap it:

cd /Users/aboutte/r/docs/ngx_pagespeed; knife digital_ocean droplet create --server-name aboutte-test-02 --image ubuntu-14-04-x64 --location sfo1 --size 4gb --ssh-keys 94228 --run-list "ngx" --solo --digital_ocean_access_token $DIGITALOCEAN_ACCESS_TOKEN


run the following command to install the .deb

	sudo dpkg -i ngx-pagespeed_1.11.33.2-1_amd64.deb
