keepalived-pkg:
  pkg.installed:
    - names:
      - net-snmp-devel
      - ghc-gio-devel
/usr/local/src/keepalived-1.3.1.tar.gz:
  file.managed:
    - source: salt://keepalived/files/keepalived-1.3.1.tar.gz
    - group: root
    - user: root
    - mode: 644
  cmd.run:
    - name: cd /usr/local/src/ && tar zxf keepalived-1.3.1.tar.gz && cd keepalived-1.3.1 && ./configure --prefix=/usr/local/keepalived --enable-snmp   --enable-snmp-checker --enable-snmp-rfcv2   --enable-snmp-rfcv3     --enable-dbus  --enable-sha1     --enable-mem-check && make && make install
    - unless: test -d /usr/local/keepalived
/etc/sysconfig/keepalived:
  file.managed:
    - source: salt://keepalived/files/keepalived-sysconfig
    - mode: 644
    - user: root
    - group: root
/etc/keepalived:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 644
    - makedirs: True
