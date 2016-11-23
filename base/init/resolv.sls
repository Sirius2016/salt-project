/etc/resolv.conf:
  file.managed:
    - source: salt://init/files/resolv.conf
    - mode: 644
    - user: root
    - group: root
