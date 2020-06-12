## What is this

This repository is a collection of phishing domains generated from it's original domain name.
Example, facebook.com (original) possible phishing domain fabebook.com using bitsquatting technique.

With this collection, you would add it into the Adlists (blocklist) of Pi-Hole.

## How the phishing domain generator works?

A Python script created by @elceef, capable of generating hundreds or thosands of possible phishing domains based on the technique of Addition, Bitsquatting, Homoglyph, Omission, Subdomain and Vowel-Swap.

## Commands used

dnstwist <domain.com> | awk '{print $2} | sed -e '1,9d' | perl -nle 'print if m{^[[:ascii:]]+$}' > output_file

awk '{print $2} - this filter will exact the second column from the output text.

sed -e '1,9d' - this filter will remove the first top 9 lines from the output text.

perl -nle 'print if m{^[[:ascii:]]+$}' - this filter will remove those lines with non-ascii characters, which are not supported in Pi-Hole.