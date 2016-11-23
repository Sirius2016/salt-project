www:
  user.present:
    - fullname: www
    - shell: /bin/bash
    - home: /home/www
    - uid: 610
    - gid: 610
    - groups:
      - www
    - require:
      - group: www
  group.present:
    - gid: 610
