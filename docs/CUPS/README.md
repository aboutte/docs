# cups

### These are the steps I used to setup a raspberry pi as a cups server:

    apt-get update
    apt-get upgrade
    apt-get install build-essential wget curl git vim unzip screen dnsutils avahi-utils
    useradd aboutte
    usermod -aG sudo aboutte
    wget https://github.com/apple/cups/archive/v2.2.6.zip
    unzip v2.2.6.zip
    cd cups-2.2.6
    ./configure
    make
    make install
    /etc/init.d/cups start

### Setting up airprint

    apt-get install python-pip
    pip install pycups
    git clone https://github.com/tjfontaine/airprint-generate.git
    cd airprint-generate
    airprint-generate.py -p "" -d /etc/avahi/services/
    service avahi-daemon restart

### Install brother driver on raspberry pi

search for HL-2140 on Brother site.  Download and execute the "Driver Install Tool" script on Pi

### adding printer

After cups is installed use the cupsd.conf in this directory and open up web interface.  Use the add printer button and select RAW for make and model.  The Brother printer driver will be used on the client side to speed up printing.

### Command I have used to add printer on workstations (first download the Brother printer driver):

    /usr/sbin/lpadmin -p Brother -E -v ipp://cups.andyboutte.com:631/printers/Brother -P "/Library/Printers/PPDs/Contents/Resources/Brother HL-2140 series CUPS.gz" -D "Brother" -L "Hobbit hole" -o PageSize=A4

### Browse Bonjour devices
    avahi-browse -alr
