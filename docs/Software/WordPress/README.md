# wpscan

## Setup

    docker pull wpscanteam/wpscan
    docker run --net="host" -it --rm wpscanteam/wpscan -u https://www.example.com/ --enumerate u --proxy socks5://host.docker.internal:9150 --random-agent

## Using wpscan

    ./wpscan.rb --url www.example.com

### get users

    ./wpscan.rb --url www.example.com --enumerate u

### brute force users

    ./wpscan.rb --url www.example.com --enumerate u[1-30] --proxy socks5://127.0.0.1:9151 --threads 10 --wordlist ./passwords.txt

### Notes

- https://github.com/wpscanteam/wpscan
- https://hackertarget.com/attacking-wordpress/
