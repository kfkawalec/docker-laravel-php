FROM php:7.2-fpm-alpine
MAINTAINER Krzysztof Kawalec <kf.kawalec@gmail.com>

#
RUN apk --no-cache update \
    && apk --no-cache upgrade \
    && apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
        openssh-client \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev \
#        libmcrypt-dev \
        curl-dev \
        openldap-dev \
        icu-dev \
        imap-dev \
#        libc-dev \
        libtool \
        imagemagick-dev \
        curl \
        tidyhtml-dev \
        zlib-dev \
        mysql-client

# PHP Extensions
RUN docker-php-ext-install \
#        mcrypt \
        mbstring \
        curl \
        json \
        pdo_mysql \
        exif \
        tidy \
        zip \
        opcache \
        ldap \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-png-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-configure imap --with-imap-ssl \
    && docker-php-ext-install imap \
    && pecl install imagick \
    && docker-php-ext-enable imagick

RUN apk del --no-cache .build-deps && \
    rm -rf /tmp/* /var/cache/apk/*

# Memory Limit
RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini

# Time Zone
RUN echo "date.timezone=Europe/Warsaw" > $PHP_INI_DIR/conf.d/date_timezone.ini

RUN php --version