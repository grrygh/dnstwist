## What is this?

Generate a list of potential phishing domains in a single file **blocklist.txt** which can be used by [**Pi-Hole**](https://pi-hole.net/).

## How it works?

A script generator contributed by [**@jinjie**](https://github.com/jinjie), take the seed domain(s) and pass through a *twisting* process which output a long list of potential phishing domains using name manupulation techqnies. \
Example, `facebook.com` (original) possible phishing domain could be `fabebook.com` using bitsquatting technique.

## The *Twisting* technique

A Python script created by [**@elceef**](https://github.com/elceef/dnstwist), capable of generating hundreds or thosands of possible phishing domains based on the technique of Addition, Bitsquatting, Homoglyph, Omission, Subdomain and Vowel-Swap.

## Usage

*What are the files*
seed_domains.txt        - This is where you put in the original seed domain(s).
archived_domains.txt    - A list of seeded domains for reference.
blocklist_txt           - List of potential phishing domains.

## Commands used

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