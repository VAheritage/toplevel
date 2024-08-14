#!/bin/bash

mkdir -p "/usr/local/projects/cron_log"

echo "committing locally changed files"
/usr/share/tomcat/update-published

echo "Pulling new records from git"
echo "  "
/usr/bin/git --git-dir=/usr/local/projects/published/.git/ --work-tree=/usr/local/projects/published/ pull

echo "Checking and updating large files greater than 2 MB"
echo "  "
/usr/local/projects/bin/update_large_files 

echo "Harvesting new records via OAI"
echo "  "
/usr/local/projects/oai-harvest-manager/harvestAll.sh /usr/local/projects/oai-harvest-data/config.xml | sort -r

echo "Indexing all updates"
echo "  "
/usr/local/projects/vivaxtf/bin/textIndexer.sh -index default

echo "Done Processing!"
exit 0

