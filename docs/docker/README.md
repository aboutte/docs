centos 7

yum update
yum install vim git net-tools htop nmap-ncat bind-utils epel-release python-pip
curl -fsSL https://get.docker.com/ | sh
systemctl start docker
systemctl enable docker
usermod -aG docker aboutte
pip install docker-compose
yum upgrade python*


# running ELK stack in docker
git clone https://github.com/aboutte/docker-elk
docker-compose up
