Encrypt:

openssl aes-256-cbc -a -salt -in secrets.txt -out secrets.txt.enc

Decrypt:

openssl aes-256-cbc -d -a -in secrets.txt.enc -out secrets.txt.new
