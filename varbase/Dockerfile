FROM drupal:9

# install extra tools
RUN apt-get update \
  && apt-get install -y git \
  && rm -rf /var/lib/apt/lists/*

# install Composer globally
RUN curl -sS https://getcomposer.org/installer | php \
  && mv composer.phar /usr/local/bin/composer

# download varbase
RUN cd /var \
    && rm -rf /var/www \
    && composer create-project vardot/varbase-project:~9 www --no-dev --no-interaction
    && 	ln -sf /opt/drupal/web /var/www/html \
    # delete composer cache
	  && rm -rf "$COMPOSER_HOME"