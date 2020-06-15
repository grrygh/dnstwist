#! /bin/bash

DNSTWIST_BIN=`which dnstwist`
BASE_DIR=$( dirname "${BASH_SOURCE[0]}" )
DATA_DIR="${BASE_DIR}/data"
SEEDED=`cat ${DATA_DIR}/archived_domains.txt`
SEED=`cat ${DATA_DIR}/seed_domains.txt`

# Checks if dnstwist are installed
if [ "$?" -ne "0" ];
then
    echo "ERROR: Install dnstwist first: https://github.com/elceef/dnstwist"
    exit 1
fi

# Check if seed_domains.txt is empty
if [[ -z "$SEED" ]]
then
    echo "seed_domains.txt file is empty, put in some seed domains and try again."
    exit 1
fi

# Sanitize seed_domains.txt, sort and remove duplicate
CLEAN_SEED=$(echo "${SEED}" | sort | uniq)

# Compare CLEAN_SEED with archived_domains.txt, store duplicate domains in DUP_SEED var
DUP_SEED=`comm -12 <(echo "${CLEAN_SEED}") <(echo "${SEEDED}")`

# Compare CLEAN_SEED with archvied_domains.txt, store new domains in NEW_SEED var
PURE_SEED=`comm -23 <(echo "${CLEAN_SEED}") <(echo "${SEEDED}")`

twisting() {

# Read from the seed_domain.txt file, remove any blank lines and start twisting...
echo ${PURE_SEED} | xargs -n 1 | sort | while read domain
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

}

# Check if DUP_SEED is empty...
if [[ -z "$DUP_SEED" ]]
then
    twisting
else
    echo "These seed domains had been processed previously and will be ignored."
    echo "${DUP_SEED}"
    echo ""
    twisting
fi

echo "Done"
exit 0
