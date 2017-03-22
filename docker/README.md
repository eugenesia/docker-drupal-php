# Docker folder.

This folder contains Docker-specific configurations.

## Configuration:

* Copy _default.docker-compose.yml_ to _docker-compose.yml_ (mandatory).
* Copy _default.env_ to _.env_ (optional), configure project name.
* Copy _config/default.php.ini_ to _config/php.ini_ (optional).

## Usage

Run `docker-compose up -d` in this folder. Docker will then create a network
_[myproject]\_web_ , and containers _[myproject]\_web_ and
_[myproject]\_mysql_ .

