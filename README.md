# Docker container for PHP including Git, Composer and PHPUnit
[![Docker Pulls](https://img.shields.io/docker/pulls/karbon001/docker-laravel-php.svg)](https://hub.docker.com/r/karbon001/docker-laravel-php/)

Docker images for Laravel built on top of the [official PHP images](https://hub.docker.com/r/_/php/) with the addition of some common and useful extensions for Laravel Framework.

## Available tags and `Dockerfile` links
- [`latest` (_Dockerfile_)](https://github.com/kfkawalec/gitlab-ci-laravel-php/blob/master/Dockerfile)
- [`7.0-fpm` (_7.0/Dockerfile_)](https://github.com/kfkawalec/gitlab-ci-laravel-php/blob/master/7.0/Dockerfile)
- [`7.1-fpm` (_7.1/Dockerfile_)](https://github.com/kfkawalec/gitlab-ci-laravel-php/blob/master/7.1/Dockerfile)

## Installed extensions
The following modules and extensions have been enabled,
in addition to those you can already find in the [official PHP image](https://hub.docker.com/r/_/php/):

- `mbstring`
- `curl`
- `json`
- `pdo_mysql`
- `exif`
- `tidy`
- `zip`
- `opcache`
- `gd`
- `ldap`
- `intl`
- `imap`
- `imagick`

## Composer
[Composer](https://getcomposer.org) is installed globally in the all images.

## PHPUnit & CodeSniffer
[PHPUnit](https://phpunit.de/) and [CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer) are installed globally in the all images.
