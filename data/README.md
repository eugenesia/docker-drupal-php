Files and directories mounted into the Docker containers.

Includes code and MySQL data, etc.

Download Drupal 7 into the folder _./drupal/_ e.g.
```
drush dl drupal-7 -y
mv drupal-7.54 drupal
```

In _settings.php_, ensure that Drush can reach MySQL through the exposed port.
Insert this:
```
if (drupal_is_cli()) {
  $databases['default']['default']['host'] = '127.0.0.1';
  $databases['default']['default']['port'] = 3308;
}
```
where _3308_ is your exposed MySQL port, defined in _docker-compose.yml_.

