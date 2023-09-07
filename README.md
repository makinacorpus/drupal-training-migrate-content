# About

This module allows you to create test content for the training installation profile.

# Content created

* File: file and media entities.
* Taxonomy: tag, type, generation.
* User: tag, type, generation.
* Node: page, article, pokemon.
* Custom block: Social networks, Pokemon generations.
* Menu.

# How to

1. if needed: download dependencies : ``migrate_plus``, ``migrate_tools``, ``migrate_source_csv``.
2. Activate the ``training_migrate_content``.
3. Run the installation script.


```
Composer require drupal/migrate_plus
Composer require drupal/migrate_tools
Composer require drupal/migrate_source_csv
vendor/bin/drush en -y training_migrate_content
bash web/profiles/training_profile/modules/training_migrate_content/script/migrate.sh
```
