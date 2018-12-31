FROM php:7-apache-stretch

# install wget (for downloading memprof) and libjudy (dependency of memprof)
RUN apt-get update \
	&& apt-get install -y wget libjudydebian1 libjudy-dev

# install php-memprof
RUN cd ~ \ 
	&& mkdir php-memprof \
	&& cd php-memprof \
	&& wget --no-check-certificate --content-disposition https://github.com/arnaud-lb/php-memory-profiler/tarball/2.0.0  \
	&& tar -zxvf arnaud-lb-php-memory-profiler-2.0.0-0-gbdae20d.tar.gz \
 	&& cd arnaud-lb-php-memory-profiler-bdae20d \
	&& phpize \
	&& ./configure \
	&& make \
	&& make install

# enable php-memprof by default
COPY docker-conf/memprof.ini /usr/local/etc/php/conf.d/docker-php-ext-memprof.ini


