# DNSSEC

If you do a lookup using a recursive resolver that enforces DNSSEC you should expect to see the AD-Flag (Authenticated answer)


If you want to manually verify the domain run the following command:


    dig @214.16.26.1 +dnssec +sigchase ${domain} A | cat -n


http://backreference.org/2010/11/17/dnssec-verification-with-dig/

