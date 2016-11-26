prod:
  'ha.nginxs.net':
    - cluster1.haproxy_keepalived
  'web01.nginxs.net':
    - cluster1.haproxy_keepalived
    - cluster1.nginx
  'web02.nginxs.net':
    - cluster1.nginx
