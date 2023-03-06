#!/bin/bash
YELLOW=$'\e[33;01m'
GREEN=$'\e[32;01m';
NORMAL=$'\e[0m'

printf "${YELLOW}*********************************\n"
printf "* Migration: Process migration. *\n"
printf "*********************************\n${NORMAL}"

printf "${YELLOW}### Migrate File ...\n${NORMAL}"
vendor/bin/drush -y migrate:import --tag=File

printf "${YELLOW}### Migrate Taxonomy ...\n${NORMAL}"
vendor/bin/drush -y migrate:import --tag=Taxonomy

printf "${YELLOW}### Migrate User ...\n${NORMAL}"
vendor/bin/drush -y migrate:import --tag=User

printf "${YELLOW}### Migrate Node ...\n${NORMAL}"
vendor/bin/drush -y migrate:import --tag=Content

printf "${YELLOW}### Migrate Block ...\n${NORMAL}"
vendor/bin/drush -y migrate:import --tag=Block

printf "${YELLOW}### Migrate Menu ...\n${NORMAL}"
vendor/bin/drush -y migrate:import --tag=Menu

printf "${YELLOW}### Clear cache ...\n${NORMAL}"
vendor/bin/drush cr

printf "${GREEN}**************************************\n"
printf "* Migration: successfully processed. *\n"
printf "**************************************\n${NORMAL}"

exit 1