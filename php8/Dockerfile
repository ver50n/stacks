FROM centos:centos7

RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum -y install yum-utils net-tools

RUN yum-config-manager --disable 'remi-php*'
RUN yum-config-manager --enable remi-php80
RUN yum update -y

RUN yum install -y php \
    mod_ssl \
    openssl \
    php-{cli,pdo,mysql,zip,gd,mbstring,dom,soap} \
    wget \
    unzip \
    vim \
    git \
    gcc \
    make \
    bc \
    sed \
    autoconf \
    automake \
    libtool \
    tree \
    pcre-devel \
    cmake \
    brotli \
    httpd-devel

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    HASH="$(wget -q -O - https://composer.github.io/installer.sig)" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    rm -f composer-setup.php

RUN git clone --depth=1 --recursive https://github.com/kjdev/apache-mod-brotli.git
RUN cd apache-mod-brotli && \
    ./autogen.sh && \
    ./configure && \
    make && \
    cp .libs/mod_brotli.so /usr/lib64/httpd/modules/mod_brotli.so -fv

RUN curl -sL https://rpm.nodesource.com/setup_16.x | bash - 
RUN yum install -y nodejs 

RUN npm install yarn -g

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./conf/httpd.conf /etc/httpd/conf/httpd.conf
COPY ./conf/ssl.conf /etc/httpd/conf.d/ssl.conf
COPY ./conf/brotli.conf /etc/httpd/conf.d/brotli.conf
COPY ./conf/php.ini /etc/php.ini
COPY ./conf/sites-enabled /etc/httpd/conf/sites-enabled
COPY ./conf/key /etc/httpd/key

WORKDIR /var/www/html/wagokoro