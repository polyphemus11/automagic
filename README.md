custom-kali
===========

This repo contains my custom scripts for my various pen-testing needs

1. google_curl
Script that automates specific google searches. This particular script is used to discover subdomains given a certain domain. Try DNS zone transfers first, but most likely the name server won't allow it, thus this script was created.  It can take quite a while, especially you you want to comb through thousands of search results.  I tried to speed it up by decreasing the max wait time, but google terminated the sessions.  Hypocritical of them as they crawl everyone else, but then they won't let you crawl them ;)
