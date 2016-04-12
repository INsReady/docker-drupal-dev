FROM drupal:7

# install the PHP extensions we need
RUN apt-get update \
  && apt-get install -y git mariadb-client wget nano \
  && rm -rf /var/lib/apt/lists/*

# install drush, from http://docs.drush.org/en/master/install/
RUN wget http://files.drush.org/drush.phar \
  && chmod +x drush.phar \
  && mv drush.phar /usr/local/bin/drush \
  && drush init -y

# install Xdebug, from https://xdebug.org/docs/install
RUN pecl install xdebug \
  && docker-php-ext-enable xdebug

# enable Xdebug remote debugging
RUN { \
		echo 'xdebug.remote_autostart=true'; \
		echo 'xdebug.remote_enable=true'; \
		echo 'xdebug.remote_connect_back=true'; \
	} >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# download devel module
RUN curl -fSL "https://ftp.drupal.org/files/projects/devel-7.x-1.x-dev.tar.gz" -o devel.tar.gz \
  && tar -xvzf devel.tar.gz \
  && mv devel sites/all/modules/

ENV TERM xterm
