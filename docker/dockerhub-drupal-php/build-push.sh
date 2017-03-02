#!/usr/bin/env bash

#
# Build all images and push them to Docker Hub.
#

cd 5.4
docker build . -t eugenesia/drupal-php:5.4-apache -t eugenesia/drupal-php:5.4.45-apache
docker push eugenesia/drupal-php:5.4-apache
docker push eugenesia/drupal-php:5.4.45-apache
cd ..

cd 5.5
docker build . -t eugenesia/drupal-php:5.5-apache -t eugenesia/drupal-php:5.5.38-apache
docker push eugenesia/drupal-php:5.5-apache
docker push eugenesia/drupal-php:5.5.38-apache
cd ..

cd 5.6
docker build . -t eugenesia/drupal-php:5.6-apache -t eugenesia/drupal-php:5.6.30-apache
docker push eugenesia/drupal-php:5.6-apache
docker push eugenesia/drupal-php:5.6.30-apache
cd ..

