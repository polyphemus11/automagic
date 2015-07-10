total_pages=0
count=0
domain=""
echo "What domain would you like to expand?"
read domain
echo "Enter the starting page (0 for 1st page)"
read count
count=$((count*10))
echo "How many search result pages?"
echo "(last search page; 10 results per page)"
read total_pages
total_pages=$((total_pages*10))
while [ $count -lt $total_pages ]; do
echo "https://www.google.com/search?tbs=li:1&q=allinurl:+-www+site:$domain&start=$count"
curl -A "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36" -skLm 10 "https://www.google.com/search?tbs=li:1&q=allinurl:+-www+site:$domain&start=$count" | grep -oP '\/url\?q=.+?&amp' | sed 's|/url?q=||; s|&amp||' >> $domain-URLs.txt
count=$((count+10))
done
cat $domain-URLs.txt | cut -d/ -f3 | sort | uniq > $domain-subdomains.txt
echo "All URLs found are in URLs.txt"
echo "All unique (sub)domains are in $domain-subdomains.txt"
cat $domain-subdomains.txt
