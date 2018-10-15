FROM nickistre/centos-lamp-xdebug:6.6 
MAINTAINER Nicholas Istre <nicholas.istre@e-hps.com> 

# Install wp-cli 
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp
RUN chmod +rx /usr/local/bin/wp


# Download and extract phpMyAdmin

# Set desired phpMyAdmin version
 
RUN PHPMYADMIN_VERSION=4.8.3 &&  \

	curl https://files.phpmyadmin.net/phpMyAdmin/${PHPMYADMIN_VERSION}/phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages.tar.gz | tar --extract --gunzip --file - --strip-components 1 && \
	rm -rf examples && \
	rm -rf setup && \
	rm -rf sql

COPY .htaccess /var/www/html/.htaccess
COPY config.inc.php /var/www/html/config.inc.php
