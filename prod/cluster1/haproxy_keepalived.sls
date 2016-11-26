/etc/haproxy/haproxy.cfg:
  file.managed:
    - source: salt://cluster1/files/haproxy.cfg
    - group: root
    - user: root
    - mode: 755
haproxy-server:
  file.managed:
    - source: salt://cluster1/files/haproxy-init
    - name: /etc/init.d/haproxy
    - group: root
    - user: root
    - mode: 755
  cmd.run:
    - name: chkconfig --add haproxy
    - unless: chkconfig --list | grep haproxy
    - require:
      - file: /etc/init.d/haproxy
  service.running:
    - name: haproxy
    - enable: True
    - reload: True
    - watch:
      - file: /etc/haproxy/haproxy.cfg
/etc/keepalived/keepalived.conf:
  file.managed:
    - source: salt://cluster1/files/keepalived.conf
    - group: root
    - user: root
    - mode: 755
    - template: jinja
    - defaults:
      {% if grains['nodename'] == 'ha.nginxs.net' %}
      RULE: MASTER
      PRI: 10
      ROUTE_ID: ha
      {% elif grains['nodename'] == 'web01.nginxs.net' %}
      RULE: SLAVE
      PRI: 5
      ROUTE_ID: web01
      {% endif %}
keepalived-server:
  file.managed:
    - source: salt://cluster1/files/keepalived-init
    - name: /etc/init.d/keepalived
    - group: root
    - user: root
    - mode: 755
  cmd.run:
    - name: chkconfig --add keepalived
    - unless: chkconfig --list | grep keepalived
    - require:
      - file: /etc/init.d/keepalived
  service.running:
    - name: keepalived
    - enable: True
    - reload: True
    - watch:
      - file: /etc/keepalived/keepalived.conf
