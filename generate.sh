#!/bin/bash

DNSTWIST_BIN=`which dnstwist`
BASE_DIR=$( dirname "${BASH_SOURCE[0]}" )
DATA_DIR="${BASE_DIR}/data"


# Checks if dnstwist are installed
if [ "$?" -ne "0" ];
then
    echo "ERROR: Install dnstwist first: https://github.com/elceef/dnstwist"
    exit 1
fi

# Read from the seed_domain.txt file, and start twisting...
cat ${DATA_DIR}/seed_domains.txt | sed '/^$/d' | sort | while read domain
do
    echo "Twisting ${domain}..."
    $DNSTWIST_BIN -f csv $domain | sed '1d' | grep -v '^original' | cut -d "," -f 2 >> ${DATA_DIR}/blocklist.txt
done

# Sort and remove duplicate lines from blocklist.txt
cat ${DATA_DIR}/blocklist.txt | sort | uniq > ${DATA_DIR}/tmp && mv ${DATA_DIR}/tmp ${DATA_DIR}/blocklist.txt

# Archive seed domains.
cat ${DATA_DIR}/seed_domains.txt >> ${DATA_DIR}/archived_domains.txt

# Sort and remove duplicate lines from archived_domains.txt
cat ${DATA_DIR}/archived_domains.txt | sort | uniq > ${DATA_DIR}/tmp && mv ${DATA_DIR}/tmp ${DATA_DIR}/archived_domains.txt

# Clear seed_domains.txt file
echo -n > "${DATA_DIR}/seed_domains.txt"

echo "Done"
exit 0