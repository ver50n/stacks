FROM centos:centos7

RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum -y install yum-utils net-tools

RUN yum-config-manager --enable remi-php74
RUN yum update -y

RUN yum install -y php \
    mod_ssl openssl \
    php-fpm \
    php-cli \
    php-pdo \
    php-mysql \
    php-zip \
    php-mbstring \
    php-dom \
    php-soap \
    wget \
    unzip \
    vim \
    git

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN HASH="$(wget -q -O - https://composer.github.io/installer.sig)"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN rm -f composer-setup.php

RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash -
RUN yum install -y nodejs

RUN npm install yarn -g

COPY ./conf/httpd.conf /etc/httpd/conf/httpd.conf
COPY ./conf/ssl.conf /etc/httpd/conf.d/ssl.conf
COPY ./conf/php.ini /etc/php.ini
COPY ./conf/sites-enabled /etc/httpd/conf/sites-enabled
