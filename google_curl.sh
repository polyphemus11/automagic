total_pages=0
count=0
domain=""
echo "What domain would you like to expand?"
read domain
echo "How many search result pages?"
read total_pages
total_pages=$((total_pages*10))
count=0
while [ $count -lt $total_pages ]; do
echo "https://www.google.de/search?tbs=li:1&q=allinurl:+-www+site:$domain&start=$count"
curl -A "Mozilla/4.0" -skLm 10 "https://www.google.de/search?tbs=li:1&q=allinurl:+-www+site:utica.edu&start=$count" | grep -oP '\/url\?q=.+?&amp' | sed 's|/url?q=||; s|&amp||' >> curl.txt
count=$((count+10))
done
cat curl.txt | cut -d/ -f3 | sort | uniq > subdomains.txt
