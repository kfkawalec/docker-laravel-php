FROM php:7.2-fpm
MAINTAINER Krzysztof Kawalec <kf.kawalec@gmail.com>
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        openssh-client \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libcurl4-openssl-dev \
        libldap2-dev \
        libicu-dev \
        libc-client-dev \
        libkrb5-dev \
        libmagickwand-dev --no-install-recommends \
        curl \
        libtidy* \
        mysql-client \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/*

# PHP Extensions
RUN docker-php-ext-install \
        mbstring \
        curl \
        json \
        pdo_mysql \
        exif \
        tidy \
        zip \
        opcache \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu \
    && docker-php-ext-install ldap \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap \
    && pecl install imagick \
    && docker-php-ext-enable imagick

# Memory Limit
RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini

# Time Zone
RUN echo "date.timezone=Europe/Warsaw" > $PHP_INI_DIR/conf.d/date_timezone.ini

RUN php --version
