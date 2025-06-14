FROM rockylinux:9.3

RUN dnf -y update

RUN dnf -y install https://rpms.remirepo.net/enterprise/remi-release-9.rpm
RUN dnf -y module reset php
RUN dnf -y module enable php:remi-8.3

RUN dnf install -y php php-{cli,pdo,mysql,zip,gd,mbstring,dom,fpm,bcmath} \
    wget \
    unzip \
    vim \
    git \
    libtool \
    net-tools \
    supervisor  > /dev/null;

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    HASH="$(wget -q -O - https://composer.github.io/installer.sig)" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    rm -f composer-setup.php

RUN dnf module reset nodejs
RUN dnf module -y enable nodejs:20
RUN dnf module -y install nodejs:20/common
RUN npm install --global yarn

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./conf/php-fpm.conf /etc/php-fpm.conf
COPY ./conf/php.ini /etc/php.ini

WORKDIR /var/www/html

RUN mkdir -p /var/run/php-fpm/
