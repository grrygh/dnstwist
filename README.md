## What is this?

This repository is a collection of phishing domains generated from it's original domain name. \
Example, `facebook.com` (original) possible phishing domain could be `fabebook.com` using bitsquatting technique.

With this collection, you would add it into the Adlists (blocklist) of [**Pi-Hole**](https://pi-hole.net/) to expand it's capability of blocking potential phishing domains through name manipulation techniques.

## How the phishing domain generator works?

A Python script created by [**@elceef**](https://github.com/elceef/dnstwist), capable of generating hundreds or thosands of possible phishing domains based on the technique of Addition, Bitsquatting, Homoglyph, Omission, Subdomain and Vowel-Swap.

## Commands

`dnstwist <domain.com> | awk '{print $2} | sed -e '1,9d' | perl -nle 'print if m{^[[:ascii:]]+$}' > output_file`

`awk '{print $2}` \
This filter will display the second column from the output text.

`sed -e '1,9d'` \
This filter will remove the first top 9 lines from the output text.

`perl -nle 'print if m{^[[:ascii:]]+$}'` \
This filter will remove those lines with non-ascii characters, which are not supported in Pi-Hole.

## Original Seed Domains

`facebook.com`\
`fb.com`\
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
`snapchat.com`\
