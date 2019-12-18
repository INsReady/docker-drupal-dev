FROM drupal:8.7

# install the PHP extensions we need
RUN apt-get update \
  && apt-get install -y git mariadb-client wget nano \
  && rm -rf /var/lib/apt/lists/*

# install Composer globally
RUN curl -sS https://getcomposer.org/installer | php \
  && mv composer.phar /usr/local/bin/composer

# install drush, from http://docs.drush.org/en/master/install/,
RUN composer require drush/drush \
  && wget -O drush.phar https://github.com/drush-ops/drush-launcher/releases/download/0.6.0/drush.phar \
  && chmod +x drush.phar \
  && mv drush.phar /usr/local/bin/drush \
  && drush self-update \
  && drush init

# install Drupal Console, from https://drupalconsole.com/
RUN curl https://drupalconsole.com/installer -L -o drupal.phar \
  && mv drupal.phar /usr/local/bin/drupal \
  && chmod +x /usr/local/bin/drupal

# install Xdebug, from https://xdebug.org/docs/install
RUN pecl install xdebug \
  && docker-php-ext-enable xdebug

# enable Xdebug remote debugging
RUN { \
    echo 'xdebug.remote_connect_back=true'; \
		echo 'xdebug.remote_autostart=true'; \
		echo 'xdebug.remote_enable=true'; \
    echo 'xdebug.remote_host=10.254.254.254'; \ 
    echo 'memory_limit = 1024M'; \
	} >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# install phpredis extension
ENV PHPREDIS_VERSION 4.3.0
RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
		&& mkdir /usr/src/php/ext -p \
    && mv phpredis-$PHPREDIS_VERSION /usr/src/php/ext/redis \
    && docker-php-ext-install redis

# download devel module
RUN curl -fSL "https://ftp.drupal.org/files/projects/devel-8.x-1.x-dev.tar.gz" -o devel.tar.gz \
  && tar -xvzf devel.tar.gz \
  && rm devel.tar.gz \
  && mv devel modules/

# install and config mhsendmail for mailhog, from https://devilbox.readthedocs.io/en/latest/custom-container/enable-mailhog.html#tl-dr
RUN curl -fSL "https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64" -o mhsendmail \
  && chmod +x mhsendmail \
  && mv mhsendmail /usr/local/bin/ \
  && echo "sendmail_path = '/usr/local/bin/mhsendmail --smtp-addr=\"mailhog:1025\"'" >> /usr/local/etc/php/conf.d/mailhog.ini

ENV TERM xterm
