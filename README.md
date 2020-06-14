## What is this?

Generate a list of potential phishing domains in a single file **blocklist.txt** which can be used by [**Pi-Hole**](https://pi-hole.net/).

## How it works?

A script generator contributed by [**@jinjie**](https://github.com/jinjie), takes the seed domain(s) and pass through a *twisting* process which output a long list of potential phishing domains using name manupulation techqnies. \
Example, `facebook.com` (original) possible phishing domain could be `fabebook.com` using bitsquatting technique.

## The *Twisting* technique

A Python script created by [**@elceef**](https://github.com/elceef/dnstwist), capable of generating hundreds or thosands of possible phishing domains based on the technique of Addition, Bitsquatting, Homoglyph, Omission, Subdomain and Vowel-Swap.

**Commands used**

`dnstwist -f csv <domain.com> | sed '1d' | grep -v '^original' | cut -d "," -f 2 > output_file`
This generate all possible phishing domains and store it to an output file.

`sed '1d'` \
This filter remove the header line.

`grep -v '^original'` \
This filter remove the original domain name.

`cut -d "," -f 2` \
This filter show the second column of the output text.

## Usage

*What are the files*
seed_domains.txt        - This is where you put in the original seed domain(s).
archived_domains.txt    - A list of seeded domains for reference.
blocklist_txt           - List of potential phishing domains.

**How to use**

You can either folk this repo, generate blocklist from your own seed domains or simply use my blocklist.txt in your Pi-Hole.