# Configure Drupal 7 image for ClientHub.
# from https://www.drupal.org/requirements/php#drupalversions
# Based on Dockerfile for drupal:7-apache https://github.com/docker-library/drupal/blob/master/7/apache/Dockerfile
FROM eugenesia/php:5.3-apache-ubuntu

MAINTAINER Eugene Sia <eugene@eugenesia.co.uk>
LABEL description="PHP5/Apache environment suitable for running a Drupal 7 site."

RUN a2enmod rewrite

# install the PHP extensions we need
# libmysql++-dev needed for pdo_mysql
# libpq-dev needed for pdo_pgsql
# mysqli needed for Drupal
RUN apt-get update && apt-get install -y \
  php5-curl \
  php5-gd \
  php5-mcrypt \
  php5-mysql \
  && rm -rf /var/lib/apt/lists/*

#  # Opcache must be installed using Pecl for PHP <= 5.4
#  # See http://php.net/manual/en/opcache.installation.php#opcache.installation.pecl
#  # RUN docker-php-ext-install opcache
#  RUN pecl install zendopcache \
#    && docker-php-ext-enable opcache
#  
#  # Install XHProf PECL extension for perf profiling.
#  RUN pecl install xhprof-beta \
#    && docker-php-ext-enable xhprof
#  
#  # Overwrite default site Apache conf.
#  # Doesn't seem to have any effect as it's in sites-available/ not
#  # sites-enabled/
#  #
#  # COPY 000-default.conf /etc/apache2/sites-available/

# Configure PHP.
# COPY php.ini /etc/php5/apache2/

# WWW files.
VOLUME ["/var/www"]

