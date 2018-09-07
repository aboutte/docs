
# ssh tunneling

good diagram that explains the different options

https://unix.stackexchange.com/a/46271

## ssh tunnel example

if server is running service on 127.0.0.1:5601 you can access it locally at localhost:9000
    
ssh -L 9000:localhost:5601 ec2-user@10.0.27.226

# socks proxy for accessing mgmt network

ssh -D 3128 -f -C -q -N bastion.mgmt.andyboutte.com