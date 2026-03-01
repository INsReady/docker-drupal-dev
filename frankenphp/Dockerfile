FROM dunglas/frankenphp:1-php8.4

# install the PHP extensions we need
RUN apt-get update \
  && apt-get install -y git mariadb-client wget nano pv gpg \
  && rm -rf /var/lib/apt/lists/*

RUN install-php-extensions \
    apcu \
    gd \
    opcache \
    pdo_mysql \
    pdo_pgsql \
    zip

COPY --from=drupal:php8.4 /opt/drupal /opt/drupal
COPY --from=drupal:php8.4 /usr/local/etc/php/conf.d/* /usr/local/etc/php/conf.d/
COPY --from=composer/composer:2-bin /composer /usr/local/bin/

# install Xdebug, from https://xdebug.org/docs/install
RUN pecl install xdebug \
  && docker-php-ext-enable xdebug

# enable Xdebug remote debugging
RUN { \
    echo 'xdebug.mode=debug'; \
    echo 'xdebug.discover_client_host=true'; \
    echo 'xdebug.client_host=host.docker.internal'; \
    echo 'xdebug.start_with_request=yes'; \
    echo 'memory_limit = 4096M'; \
    echo 'error_log = /var/log/php_error.log'; \
    echo 'xdebug.log = /var/log/xdebug.log'; \
} >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# https://github.com/docker-library/drupal/pull/259
# https://github.com/moby/buildkit/issues/4503
# https://github.com/composer/composer/issues/11839
# https://github.com/composer/composer/issues/11854
# https://github.com/composer/composer/blob/94fe2945456df51e122a492b8d14ac4b54c1d2ce/src/Composer/Console/Application.php#L217-L218
ENV COMPOSER_ALLOW_SUPERUSER 1

WORKDIR /opt/drupal
COPY Caddyfile /etc/frankenphp/Caddyfile
RUN set -eux; \
	chown -R www-data:www-data web/sites web/modules web/themes; \
	rm -rf /app/public; \
	ln -sf /opt/drupal/web /app/public; \
	echo "\$settings['trusted_host_patterns'] = ['^' . preg_quote(\$_SERVER['SERVER_NAME'] ?? 'localhost', '/') . '\$'];" >> /opt/drupal/web/sites/default/default.settings.php; \
	cp /opt/drupal/web/sites/default/default.settings.php /opt/drupal/web/sites/default/settings.php

# preemptively creates log files, and give them to www-data
RUN cd /var/log \
  && touch php_error.log xdebug.log \
  && chown 1001:1001 php_error.log xdebug.log

ENV PATH=${PATH}:/opt/drupal/vendor/bin
