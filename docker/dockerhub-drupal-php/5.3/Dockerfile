# Configure Drupal 7 image for ClientHub.
# from https://www.drupal.org/requirements/php#drupalversions
# Based on Dockerfile for drupal:7-apache https://github.com/docker-library/drupal/blob/master/7/apache/Dockerfile
FROM eugenesia/php:5.3-apache

MAINTAINER Eugene Sia <eugene@eugenesia.co.uk>
LABEL description="PHP5/Apache environment suitable for running a Drupal 7 site."

RUN a2enmod rewrite

# install the PHP extensions we need
# libmysql++-dev needed for pdo_mysql
# libpq-dev needed for pdo_pgsql
RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev libmysql++-dev \
  && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
  && docker-php-ext-install gd mbstring pdo pdo_mysql pdo_pgsql zip

# Install other PHP extensions we need.
# See https://github.com/docker-library/docs/blob/master/php/README.md#how-to-install-more-php-extensions

# Opcache must be installed using Pecl for PHP <= 5.4
# See http://php.net/manual/en/opcache.installation.php#opcache.installation.pecl
# RUN docker-php-ext-install opcache
RUN pecl install zendopcache \
  && docker-php-ext-enable opcache

# Install XHProf PECL extension for perf profiling.
RUN pecl install xhprof-beta \
  && docker-php-ext-enable xhprof

# Overwrite default site Apache conf.
# Doesn't seem to have any effect as it's in sites-available/ not
# sites-enabled/
#
# COPY 000-default.conf /etc/apache2/sites-available/

# Configure PHP.
COPY php.ini /usr/local/etc/php/

# WWW files.
VOLUME ["/var/www/html"]

