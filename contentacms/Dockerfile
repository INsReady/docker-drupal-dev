FROM drupal:10

# install extra tools
RUN apt-get update \
  && apt-get install -y git apt-utils \
  && rm -rf /var/lib/apt/lists/*

# install Composer globally
RUN curl -sS https://getcomposer.org/installer | php \
  && mv composer.phar /usr/local/bin/composer

# download Contenta CMS
RUN cd /var \
    && rm -rf /var/www \
    && composer create-project contentacms/contenta-jsonapi-project www --stability dev --no-interaction \
    && 	ln -sf /opt/drupal/web /var/www/html \
    # delete composer cache
	  && rm -rf "$COMPOSER_HOME"
