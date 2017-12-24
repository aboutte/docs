# wpscan

## Setup

    vagrant init centos/7; vagrant up --provider virtualbox
    vagrant ssh
    gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    curl -sSL https://get.rvm.io | bash -s stable --ruby
    source /usr/local/rvm/scripts/rvm
    echo "source source /usr/local/rvm/scripts/rvm" >> ~/.bashrc
    rvm install 2.3.1
    rvm use 2.3.1 --default
    echo "gem: --no-ri --no-rdoc" > ~/.gemrc
    gem install bundler
    sudo yum install -y git vim epel-release bind-utils nmap-ncat net-tools htop wget
    git clone https://github.com/wpscanteam/wpscan.git
    cd wpscan
    bundle install --without test
    ./wpscan.rb --update

## Using wpscan

    ./wpscan.rb --url www.example.com

### get users

    ./wpscan.rb --url www.example.com --enumerate u

### brute force users

    ./wpscan.rb --url www.example.com --enumerate u[1-30] --proxy socks5://127.0.0.1:9151 --threads 10 --wordlist ./passwords.txt

## Force wpscan to use tor network

- start tor browser on mac
- setup ssh tunnel to vagrant vm (run this from mac)

    ssh -f -N -T -R9151:localhost:9150 vagrant@127.0.0.1 -p 2222 -i .vagrant/machines/default/virtualbox/private_key

- inside vagrant run:

    ./wpscan.rb --url www.example.com --enumerate u --proxy socks5://127.0.0.1:9151

### Notes

- https://github.com/wpscanteam/wpscan
- https://hackertarget.com/attacking-wordpress/
