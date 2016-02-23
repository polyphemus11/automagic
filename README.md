Introduction
===========
These files should already have the execution bit on, but if not, you need to "chmod +x ./find_subdomains.sh" before you run it.

This repo contains my custom scripts for my various 'pen-testing' needs.  Scripts are added as I find a need for them.

google_curl.sh
===========

It crawls google and will dump all subdomains found onto the console and into a text document.  You can run it over and over and you can manually pick up where you left off (i.e. I was on search result page 10, now, I want to crawl google search pages 11-25).  As you saw in the snapshot, there can be thousands of search results so this was my solution, to aggregate all that and extract the subdomain information. 

Lastly, and most important, test it with 1 search page first!  Google is  hypocritical and ironically will sense that you are crawling their results and start to throttle your crawls (probably sensitive about people copying their search results).  So test it once with a small amount of search pages, wait, then do one or two big crawls.  If you think google has started to limit your searches, don't worry, it's only for a limited time, and it's only for your robot, you just have to browse to google and if you see a captcha box prompting you to enter a code you can then bypass the block.  But then you'll need to wait a little bit to start crawling again.

CurlST.sh
===========

This file accepts either a single domain as input or a files of domains, a single domain per line.
This script is helpful in determining server type based on the server response.  It will either output to a file (if inputting a file) or output to the terminal.

RandFileGen.py
===========

This script handles itself and guides you through the process of creating a specified number of files.  It will prompt for an upper and lower file size limit to randomly generate files wthin those bounds for the specified amount of files.  Additionally, the files are sequentially named to make it easier to track if the script created all the files correctly as well as ensuring unique file names.  Lastly, it randomly assigns a "file extension" to the name.  Of note, this is not a true file extenstion as known file types will have specific HEX signatures.  This script does not go that granular.  http://en.wikipedia.org/wiki/List_of_file_signatures

iHide
===========
iHide scripts out the Hping3 application to transmit content over ICMP.  Run iHide -h to view the help file.

Scavenger
===========
Scavenger is a script that automates dig queries to transfer content over DNS.  Run Scavenger -h to view the help file.

Sniff_URL
===========
Sniff_URL retrieves domain requests off the wire.  The script searchs for the "Host" field and can combine instances to reduce numerous GET requests of the same domain.
