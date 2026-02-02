## Supported tags and respective `Dockerfile` links
-	[`frankenphp` (*Dockerfile*)](https://github.com/INsReady/docker-drupal-dev/blob/master/frankenphp/Dockerfile)
-	[`11`, `latest` (*Dockerfile*)](https://github.com/INsReady/docker-drupal-dev/blob/master/11/Dockerfile)
-	[`10` (*Dockerfile*)](https://github.com/INsReady/docker-drupal-dev/blob/master/10/Dockerfile)
-	[`9` (*Dockerfile*)](https://github.com/INsReady/docker-drupal-dev/blob/master/9/Dockerfile)
-   [`contentacms` (*Dockerfile*)](https://github.com/INsReady/docker-drupal-dev/blob/master/contentacms/Dockerfile)
-   [`thunder` (*Dockerfile*)](https://github.com/INsReady/docker-drupal-dev/blob/master/thunder/Dockerfile)
-   [`varbase` (*Dockerfile*)](https://github.com/INsReady/docker-drupal-dev/blob/master/varbase/Dockerfile)
-   [`govcms` (*Dockerfile*)](https://github.com/INsReady/docker-drupal-dev/blob/master/govcms/Dockerfile)
-	[`7` (*Dockerfile*)](https://github.com/INsReady/docker-drupal-dev/blob/7/Dockerfile)

This image is updated via pull requests to [the `INsReady/docker-drupal-dev` GitHub repo](https://github.com/INsReady/docker-drupal-dev).

## Why do we need this image?

The official Drupal Docker library is optimized for production. Therefore, it doesn't have any developers tools built-in. This image is directly dependent on the official library, and adds a list of tools that necessary for Drupal development. Developers shall use this image for development, and use the official library for production. There should be zero difference in how Drupal works between these two images.

> [Offical Drupal Docker Library](https://hub.docker.com/_/drupal/)

## What tools are included in the developer environment?

- Git
- wget
- nano
- Xdebug (Remote debugging enabled as default)
- phpredis
- mhsendmail (for Mailhog)
- gpg

## Distribution supported

See the supported tags above. Please use the respective Docker tags to download the Drupal distribution below:

- [Contenta CMS](https://www.drupal.org/project/contentacms)
- [Thunder](https://www.drupal.org/project/thunder)
- [Varbase](https://www.drupal.org/project/varbase)
- [govCMS](https://www.drupal.org/project/govcms)
- **Drupal Commerce** has its own dedicated [docker image](https://hub.docker.com/r/insready/drupal-commerce/).

## Contributing
You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/INsReady/docker-drupal-dev/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.
