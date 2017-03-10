#!/usr/bin/env bash

#
# Build all images and push them to Docker Hub.
#

cp php.ini 5.4
cd 5.4
docker build . -t eugenesia/drupal-php:5.4-apache -t eugenesia/drupal-php:5.4.45-apache
rm php.ini
docker push eugenesia/drupal-php:5.4-apache
docker push eugenesia/drupal-php:5.4.45-apache
cd ..

cp php.ini 5.5
cd 5.5
docker build . -t eugenesia/drupal-php:5.5-apache -t eugenesia/drupal-php:5.5.38-apache
rm php.ini
docker push eugenesia/drupal-php:5.5-apache
docker push eugenesia/drupal-php:5.5.38-apache
cd ..

cp php.ini 5.6
cd 5.6
docker build . -t eugenesia/drupal-php:5.6-apache -t eugenesia/drupal-php:5.6.30-apache
rm php.ini
docker push eugenesia/drupal-php:5.6-apache
docker push eugenesia/drupal-php:5.6.30-apache
cd ..

