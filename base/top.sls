base:
  '*':
    - init.resolv
    - init.pkg
    - init.rsyslog
    - init.sysctl
  'ha.nginxs.net':
    - haproxy.install
    - keepalived.install
  'web01.nginxs.net':
    - haproxy.install
    - keepalived.install
    - nginx.install
  'web02.nginxs.net':
    - nginx.install
