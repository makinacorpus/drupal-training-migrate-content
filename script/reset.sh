#!/bin/bash
YELLOW=$'\e[33;01m'
GREEN=$'\e[32;01m';
NORMAL=$'\e[0m'

printf "${YELLOW}*******************************\n"
printf "* Migration: Reset migration. *\n"
printf "*******************************\n${NORMAL}"

printf "${YELLOW}### Reset File ...\n${NORMAL}"
vendor/bin/drush -y migrate:reset-status migrate_content_file
vendor/bin/drush -y migrate:reset-status migrate_content_media

printf "${YELLOW}### Reset Taxonomy ...\n${NORMAL}"
vendor/bin/drush -y migrate:reset-status migrate_content_taxonomy_tag_fr
vendor/bin/drush -y migrate:reset-status migrate_content_taxonomy_tag_en
vendor/bin/drush -y migrate:reset-status migrate_content_taxonomy_generation_fr
vendor/bin/drush -y migrate:reset-status migrate_content_taxonomy_generation_en
vendor/bin/drush -y migrate:reset-status migrate_content_taxonomy_type_fr
vendor/bin/drush -y migrate:reset-status migrate_content_taxonomy_type_en

printf "${YELLOW}### Reset User ...\n${NORMAL}"
vendor/bin/drush -y migrate:reset-status migrate_content_user

printf "${YELLOW}### Reset Node ...\n${NORMAL}"
vendor/bin/drush -y migrate:reset-status migrate_content_node_page_fr
vendor/bin/drush -y migrate:reset-status migrate_content_node_page_en
vendor/bin/drush -y migrate:reset-status migrate_content_node_article_fr
vendor/bin/drush -y migrate:reset-status migrate_content_node_article_en
vendor/bin/drush -y migrate:reset-status migrate_content_node_pokemon_fr
vendor/bin/drush -y migrate:reset-status migrate_content_node_pokemon_en
vendor/bin/drush -y migrate:reset-status migrate_content_node_pokemon_field_evolution_fr

printf "${YELLOW}### Reset Block ...\n${NORMAL}"
vendor/bin/drush -y migrate:reset-status migrate_block_generation_fr
vendor/bin/drush -y migrate:reset-status migrate_block_generation_en
vendor/bin/drush -y migrate:reset-status migrate_block_social_networks_fr
vendor/bin/drush -y migrate:reset-status migrate_block_social_networks_en

printf "${YELLOW}### Reset Menu ...\n${NORMAL}"
vendor/bin/drush -y migrate:reset-status migrate_menu_links_fr
vendor/bin/drush -y migrate:reset-status migrate_menu_links_en

printf "${YELLOW}### Clear cache ...\n${NORMAL}"
vendor/bin/drush cr

printf "${GREEN}************************************\n"
printf "* Migration: Successfully reseted. *\n"
printf "************************************\n${NORMAL}"

exit 1