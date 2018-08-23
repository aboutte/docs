# wpscan

## Setup

    docker pull wpscanteam/wpscan

## Using wpscan

    docker run --net="host" -it --rm wpscanteam/wpscan wpscan --threads 2 --url www.example.com --proxy socks5://host.docker.internal:9150 --random-agent

### get users

    docker run --net="host" -it --rm wpscanteam/wpscan wpscan --threads 2 --url www.example.com --enumerate u --proxy socks5://host.docker.internal:9150 --random-agent

### brute force users

    docker run --net="host" -it -v ~/r/docs/docs/Software/WordPress/:/wordlists --rm wpscanteam/wpscan wpscan --throttle 500 --threads 1 --url www.example.com --proxy socks5://host.docker.internal:9150 --random-agent --wordlist /wordlists/500-worst-passwords.txt --username admin
    
### troubleshooting

    --debug-output
    -v
    curl --socks5 127.0.0.1:9150 ipconfig.io

### Notes

- https://github.com/wpscanteam/wpscan
- https://hackertarget.com/attacking-wordpress/
