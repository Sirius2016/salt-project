include:
  - init.www
/usr/local/src/pcre-8.38.tar.gz:
  file.managed:
    - source: salt://nginx/files/pcre-8.38.tar.gz
    - mode: 644
    - user: root
    - group: root
  cmd.run:
    - name: cd /usr/local/src/ && tar zxf pcre-8.38.tar.gz
    - unless: test -d /usr/local/src/pcre-8.38
/usr/local/src/nginx-1.10.2.tar.gz:
  file.managed:
    - source: salt://nginx/files/nginx-1.10.2.tar.gz
    - mode: 644
    - user: root
    - group: root
  cmd.run:
    - name: cd /usr/local/src/ && tar zxf nginx-1.10.2.tar.gz && cd nginx-1.10.2 &&  ./configure --prefix=/usr/local/nginx --with-poll_module   --with-threads    --with-http_ssl_module    --with-http_v2_module   --with-http_sub_module     --with-http_gunzip_module   --with-http_auth_request_module   --with-http_stub_status_module    --with-stream       --with-stream_ssl_module   --with-pcre=/usr/local/src/pcre-8.38 && make && make install
    - unless: test -d /usr/local/nginx
/usr/local/nginx/conf.d:
  file.directory:
    - user: www
    - group: www
    - dir_mode: 755
    - makedirs: True
/usr/local/nginx/web:
  file.directory:
    - user: www
    - group: www
    - dir_mode: 755
    - makedirs: True
