# Upstream's Dockerfile (app/Dockerfile) with three changes:
# - php:7.2-apache is Debian 10 (buster), whose packages moved to archive.debian.org, so apt
#   reads the archive (without the expired Release-file check) before it installs anything;
# - pip installs the WeasyPrint release "weasyprint<43" resolves to (0.42.3) with its
#   Python 2 dependencies pinned to the versions that resolve today, so the build stays the same;
# - ADD www reads app/www.
FROM php:7.2-apache

RUN sed -i -e 's|deb.debian.org|archive.debian.org|g' -e 's|security.debian.org|archive.debian.org|g' \
      -e '/buster-updates/d' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99archive

RUN apt update && apt install -y xvfb libfontconfig wkhtmltopdf build-essential python-dev python-pip python-cffi libcairo2 libpango1.0-0 libpangocairo-1.0.0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info && python2 -m pip install weasyprint==0.42.3 cairocffi==0.9.0 CairoSVG==1.0.22 cssselect2==0.2.2 html5lib==1.1 pdfrw==0.4 Pyphen==0.10.0 tinycss2==0.6.1 webencodings==0.5.1


RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable mysqli 
RUN  chown www-data:www-data /var/www/html/

ADD app/www /var/www/html/


EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
