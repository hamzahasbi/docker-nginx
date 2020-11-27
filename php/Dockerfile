FROM php:7.4.10-fpm
LABEL maintainer="hamza.hasbi@gmail.com"

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
    g++ \
    libbz2-dev \
    libc-client-dev \
    libcurl4-gnutls-dev \
    libedit-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libkrb5-dev \
    libldap2-dev \
    libldb-dev \
    libmagickwand-dev \
    libmcrypt-dev \
    libmemcached-dev \
    libpng-dev \
    libpq-dev \
    libsqlite3-dev \
    libssl-dev \
    libonig-dev \
    libtidy-dev \
    libreadline-dev \
    libxslt1-dev \
    libzip-dev \
    memcached \
    wget \
    unzip \
    zlib1g-dev \
    && docker-php-ext-install -j$(nproc) \
    mbstring \
    xsl \
    intl \
    exif \
    ftp \
    zip \
    bcmath \
    bz2 \
    calendar \
    exif \
    gettext \
    mysqli \
    opcache \
    pdo_mysql \
    pdo_pgsql \
    tidy \
    pgsql \
    soap \
    sockets \
    xmlrpc \
    xsl \
    && apt-get -y --no-install-recommends install msmtp \
    && apt-get -y --no-install-recommends install mariadb-client \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && PHP_OPENSSL=yes docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install -j$(nproc) imap \
    && docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-configure ldap \
    && docker-php-ext-install ldap \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip \
    && pecl install xdebug && docker-php-ext-enable xdebug \
    && pecl install memcached && docker-php-ext-enable memcached \
    && pecl install mongodb && docker-php-ext-enable mongodb \
    && pecl install redis && docker-php-ext-enable redis \
    && yes '' | pecl install imagick && docker-php-ext-enable imagick \
    && pecl install apcu && docker-php-ext-enable apcu \
    && pecl install uploadprogress && docker-php-ext-enable uploadprogress \
    && echo "apc.enable_cli=1\n"  \
            "apc.enable=1\n" > /usr/local/etc/php/conf.d/apc.ini \
    && docker-php-source delete \
    && cd /usr/src \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --version=1.10.14 && mv composer.phar /usr/local/bin/composer \
    && wget -O drush.phar "https://github.com/drush-ops/drush-launcher/releases/download/0.8.0/drush.phar" \
    && chmod +x drush.phar \
    && mv drush.phar /usr/local/bin/drush \
    && composer global require "drush/drush:8.1.17" \
    && apt-get remove -y g++ wget \
    && apt-get autoremove --purge -y && apt-get autoclean -y && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* /var/tmp/*




ADD xdebug.ini  /etc/php7.4/conf.d/

RUN echo "upload_max_filesize = 500M\n" \
         "post_max_size = 500M\n" \
         "memory_limit=512M\n" \
         "max_execution_time = 360\n" \
         "max_input_time = 120\n" \
         "max_input_nesting_level = 64\n" \
         > /usr/local/etc/php/conf.d/maxsize.ini

RUN chown -R www-data:www-data $HOME/.composer/
WORKDIR /var/www/html
ENV PATH="/root/.composer/vendor/drush/drush:$PATH"
VOLUME /var/www/html
