FROM php:7.2-fpm-alpine
MAINTAINER Krzysztof Kawalec <kf.kawalec@gmail.com>

RUN apk --no-cache update

RUN docker-php-ext-install mbstring

RUN apk add --no-cache curl curl-dev \
    && docker-php-ext-install curl \
    && apk del --no-cache curl-dev

RUN docker-php-ext-install json

RUN apk add --no-cache mysql-client \
    && docker-php-ext-install pdo_mysql

RUN docker-php-ext-install exif

RUN apk add --no-cache tidyhtml-libs tidyhtml-dev \
    && docker-php-ext-install tidy \
    && apk del --no-cache tidyhtml-dev

RUN apk add --no-cache zlib-dev \
    && docker-php-ext-install zip

RUN docker-php-ext-install opcache

RUN apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-png-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev

RUN apk add --no-cache libldap openldap-dev \
    && docker-php-ext-install ldap \
    && apk del --no-cache openldap-dev

RUN apk add --no-cache icu icu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && apk del --no-cache icu-dev

RUN apk add --no-cache icu-dev imap c-client libssl1.0 libressl-dev imap-dev \
    && docker-php-ext-configure imap --with-imap-ssl \
    && docker-php-ext-install imap \
    && apk del --no-cache icu-dev libressl-dev imap-dev

RUN apk add --no-cache libtool imagemagick $PHPIZE_DEPS imagemagick-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && apk del --no-cache $PHPIZE_DEPS imagemagick-dev

RUN rm -rf /tmp/* /var/cache/apk/*

RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini \
    echo "date.timezone=Europe/Warsaw" > $PHP_INI_DIR/conf.d/date_timezone.ini

RUN php --version