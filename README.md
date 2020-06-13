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

[Data/archived_domains.txt](https://github.com/grrygh/dnstwist/blob/master/data/archived_domains.txt)