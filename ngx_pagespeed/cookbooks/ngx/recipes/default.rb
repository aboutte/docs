#
# Cookbook Name:: ngx
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute 'Update apt-get' do
  command 'apt-get update'
end

node['ngx']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

bash 'First download ngx_pagespeed' do
  code <<-EOH
    cd /root/
    NPS_VERSION=1.11.33.2
    wget https://github.com/pagespeed/ngx_pagespeed/archive/release-${NPS_VERSION}-beta.zip -O release-${NPS_VERSION}-beta.zip
    unzip release-${NPS_VERSION}-beta.zip
    cd ngx_pagespeed-release-${NPS_VERSION}-beta/
    wget https://dl.google.com/dl/page-speed/psol/${NPS_VERSION}.tar.gz
    tar -xzvf ${NPS_VERSION}.tar.gz  # extracts to psol/

    cd /root/
    # Download and build nginx with support for pagespeed
    # check http://nginx.org/en/download.html for the latest version
    NGINX_VERSION=1.10.1
    wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
    tar -xvzf nginx-${NGINX_VERSION}.tar.gz
    cd nginx-${NGINX_VERSION}/
    ./configure --add-module=$HOME/ngx_pagespeed-release-${NPS_VERSION}-beta ${PS_NGX_EXTRA_FLAGS}
    make
    sudo checkinstall -D --default --pkgname ngx_pagespeed --pkgversion $NPS_VERSION --install=no
    EOH
end
