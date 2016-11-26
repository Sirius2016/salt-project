/usr/local/src/haproxy-1.6.10.tar.gz:
  file.managed:
    - source: salt://haproxy/files/haproxy-1.6.10.tar.gz
    - group: root
    - user: root
    - mode: 644
  cmd.run:
    - name: cd /usr/local/src && tar zxf haproxy-1.6.10.tar.gz && cd haproxy-1.6.10 && make TARGET=linux26 PREFIX=/usr/local/haproxy && make install PREFIX=/usr/local/haproxy
    - unless: test -d /usr/local/haproxy
/etc/init.d/haproxy:
  file.managed:
    - source: salt://haproxy/files/haproxy-init
    - group: root
    - user: root
    - mode: 755
/etc/haproxy:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 644
    - makedirs: True
net.ipv4.ip_nonlocal_bind:
  sysctl.present: 
    - value: 1
