# Configure PHP 5 image for Drupal 7.
# from https://www.drupal.org/requirements/php#drupalversions
FROM php:5-apache

MAINTAINER Eugene Sia


# From Drupal 7 Dockerfile
# https://github.com/docker-library/drupal/blob/master/7/apache/Dockerfile

RUN a2enmod rewrite

# install the PHP extensions we need
# See https://github.com/docker-library/docs/blob/master/php/README.md#how-to-install-more-php-extensions
RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev \
  && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
  && docker-php-ext-install gd mbstring pdo pdo_mysql pdo_pgsql zip


# Install Opcache so PHP runs faster, workaround Docker For Mac mounted volume slowness.
# See https://forums.docker.com/t/file-access-in-mounted-volumes-extremely-slow-cpu-bound/8076/191
RUN docker-php-ext-install opcache

WORKDIR /var/www/html

# https://www.drupal.org/node/3060/release
ENV DRUPAL_VERSION 7.50
ENV DRUPAL_MD5 f23905b0248d76f0fc8316692cd64753

RUN curl -fSL "https://ftp.drupal.org/files/projects/drupal-${DRUPAL_VERSION}.tar.gz" -o drupal.tar.gz \
  && echo "${DRUPAL_MD5} *drupal.tar.gz" | md5sum -c - \
  && tar -xz --strip-components=1 -f drupal.tar.gz \
  && rm drupal.tar.gz \
  && chown -R www-data:www-data sites


# Configure PHP.
COPY php.ini /usr/local/etc/php/

# Overwrite default site Apache conf.
COPY 000-default.conf /etc/apache2/sites-available/

# WWW files.
VOLUME ["/var/www/html"]

