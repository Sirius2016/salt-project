/usr/local/nginx/conf/nginx.conf:
  file.managed:
    - source: salt://cluster1/files/nginx.conf
    - mode: 644
    - user: root
    - group: root
/usr/local/nginx/conf.d/blog.nginxs.net.conf:
  file.managed:
    - source: salt://cluster1/files/blog.nginxs.net.conf
    - mode: 644
    - user: root
    - group: root
nginx-server:
  file.managed:
    - name: /etc/init.d/nginx
    - source: salt://cluster1/files/nginx-init
    - mode: 755
    - user: root
    - group: root
  cmd.run:
    - name: chkconfig --add nginx
    - unless: chkconfig --list | grep nginx
    - require:
      - file: /etc/init.d/nginx
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - watch:
      - file: /usr/local/nginx/conf/nginx.conf
      - file: /usr/local/nginx/conf.d/blog.nginxs.net.conf
