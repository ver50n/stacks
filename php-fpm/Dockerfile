FROM ver50n1/php7.4

COPY php.ini /usr/local/etc/php/

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN rm composer-setup.php

ENTRYPOINT ["/usr/sbin/httpd","-D","FOREGROUND"]