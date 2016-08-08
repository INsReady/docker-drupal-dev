# Supported tags and respective `Dockerfile` links

-	[`8.2`, `latest` (*Dockerfile*)](https://github.com/INsReady/docker-drupal-dev/blob/master/Dockerfile)
-	[`8.1` (*Dockerfile*)](https://github.com/INsReady/docker-drupal-dev/blob/8.1/Dockerfile)
-	[`8.0` (*Dockerfile*)](https://github.com/INsReady/docker-drupal-dev/blob/8.0/Dockerfile)
-	[`7` (*Dockerfile*)](https://github.com/INsReady/docker-drupal-dev/blob/7/Dockerfile)

This image is updated via pull requests to [the `INsReady/docker-drupal-dev` GitHub repo](https://github.com/INsReady/docker-drupal-dev).

# Why do we need this image?

The official Drupal Docker library is optimized for production. Therefore, it doesn't have any developers tools built-in. This image is directly dependent on the official library, and adds a list of tools that necessary for Drupal development. Developers shall use this image for development, and use the official library for deployment and production. There should be zero difference in how Drupal works between these two images.

> [Offical Drupal Docker Library](https://hub.docker.com/_/drupal/)

# What tools are included?

- Git
- MariaDB Client
- wget
- nano
- Composer
- Drush
- Drupal Console
- Xdebug (Remote debugging enabled as default)
- Drupal Devel module
