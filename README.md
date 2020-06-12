## What is this?

This repository is a collection of phishing domains generated from it's original domain name. \
Example, `facebook.com` (original) possible phishing domain could be `fabebook.com` using bitsquatting technique.

With this collection, you would add it into the Adlists (blocklist) of [**Pi-Hole**](https://pi-hole.net/) to expand it's capability of blocking potential phishing domains through name manipulation techniques.

## How the phishing domain generator works?

A Python script created by [**@elceef**](https://github.com/elceef/dnstwist), capable of generating hundreds or thosands of possible phishing domains based on the technique of Addition, Bitsquatting, Homoglyph, Omission, Subdomain and Vowel-Swap.

## Commands

`dnstwist -f csv <domain.com> | sed '1d' | grep -v '^original' | cut -d "," -f 2 > output_file`

`sed '1d'` \
This filter remove the header line.

`grep -v '^original'` \
This filter remove the original domain name.

`cut -d "," -f 2` \
This filter show the second column of the output text.

## Contributor

[**@jinjie**](https://github.com/jinjie)

## Original Seed Domains

`facebook.com`\
`twitter.com`\
`instagram.com`\
`reddit.com`\
`whatsapp.com`\
`linkedin.com`\
`pinterest.com`\
`zhihu.com`\
`tiktok.com`\
`tumblr.com`\
`messenger.com`\
`weibo.com`\
`line.me`\
`medium.com`\
`slideshare.net`\
`slack.com`\
`pinterest.co.uk`\
`pinterest.es`\
`pinterest.fr`\
`pinterest.ca`\
`pinterest.com.mx`\
`pinterest.de`\
`pinterest.com.au`\
`redd.it`\
`blogspot.com`\
`snapchat.com`
