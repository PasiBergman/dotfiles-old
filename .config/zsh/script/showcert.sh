openssl s_client -showcerts -servername $1 -connect $1:443 </dev/null
