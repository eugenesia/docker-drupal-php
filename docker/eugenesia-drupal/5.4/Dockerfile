# Configure Drupal 7 image for ClientHub.
# from https://www.drupal.org/requirements/php#drupalversions
# Based on Dockerfile for drupal:7-apache https://github.com/docker-library/drupal/blob/master/7/apache/Dockerfile
FROM eugenesia/php:5.4-apache

MAINTAINER Eugene Sia <eugene@eugenesia.co.uk>
LABEL description="PHP5/Apache environment suitable for running a Drupal 7 site."

RUN a2enmod rewrite

# install the PHP extensions we need
RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev \
  && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
  && docker-php-ext-install gd mbstring pdo pdo_mysql pdo_pgsql zip

# Install other PHP extensions we need.
# See https://github.com/docker-library/docs/blob/master/php/README.md#how-to-install-more-php-extensions
RUN docker-php-ext-install opcache

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

