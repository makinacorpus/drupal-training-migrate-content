#!/bin/bash
YELLOW=$'\e[33;01m'
GREEN=$'\e[32;01m';
NORMAL=$'\e[0m'

printf "${YELLOW}**********************************\n"
printf "* Migration: Rollback migration. *\n"
printf "**********************************\n${NORMAL}"

printf "${YELLOW}### Rollback File ...\n${NORMAL}"
vendor/bin/drush -y migrate:rollback --tag=File

printf "${YELLOW}### Rollback Taxonomy ...\n${NORMAL}"
vendor/bin/drush -y migrate:rollback --tag=Taxonomy

printf "${YELLOW}### Rollback User ...\n${NORMAL}"
vendor/bin/drush -y migrate:rollback --tag=User

printf "${YELLOW}### Rollback Node ...\n${NORMAL}"
vendor/bin/drush -y migrate:rollback --tag=Content

printf "${YELLOW}### Rollback Block ...\n${NORMAL}"
vendor/bin/drush -y migrate:rollback --tag=Block

printf "${YELLOW}### Rollback Menu ...\n${NORMAL}"
vendor/bin/drush -y migrate:rollback --tag=Menu

printf "${YELLOW}### Clear cache ...\n${NORMAL}"
vendor/bin/drush cr

printf "${GREEN}***************************************\n"
printf "* Migration: Successfully rollbacked. *\n"
printf "***************************************\n${NORMAL}"

exit 1