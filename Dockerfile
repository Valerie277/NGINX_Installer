FROM ubuntu 

RUN apt-get update && apt-get upgrade -y

## Install libraries

RUN apt-get install libgeoip-dev -y
RUN apt-get install build-essential -y
RUN apt-get install git -y 
RUN git clone https://github.com/Valerie277/NGINX_Installer.git ./TMP/

RUN cd ./TMP/Build_NGINX/nginx-1.20.0/
RUN chmod +x ./configure

RUN ./configure \
--sbin-path=/usr/bin/nginx \
--conf-path=/etc/nginx/nginx.conf \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/accesss.log \
--with-pcre --pid-path=/var/run/nginx.pid \
--add-module=../ip2location-nginx-master  \
--add-module=../nginx-rtmp-module-master \
--with-http_mp4_module \
--with-http_secure_link_module \
--with-http_ssl_module \
--build=RTMP_for_Valerie_Albert_BA

RUN make && make install -y