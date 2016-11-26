base:
  '*':
    - init.resolv
    - init.rsyslog
    - init.sysctl
    - init.epel
    - init.pkg
    - zabbix.agent
  'ha.nginxs.net':
    - haproxy.install
    - keepalived.install
  'web01.nginxs.net':
    - haproxy.install
    - keepalived.install
    - nginx.install
  'web02.nginxs.net':
    - nginx.install
