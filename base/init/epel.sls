epel-rpm:
  file.managed:
    {% if grains['osfinger'] == 'CentOS-6' %}
    - name: /usr/local/src/epel-release-6-8.noarch.rpm
    {% elif grains['os'] == 'CentOS Linux-7' %}
    - name: /usr/local/src/epel-release-latest-7.noarch.rpm
    {% endif %}
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    {% if grains['osfinger'] == 'CentOS-6' %}
    - name: rpm -ivh /usr/local/src/epel-release-6-8.noarch.rpm
    {% elif grains['os'] == 'CentOS Linux-7' %}
    - name: rpm -ivh /usr/local/src/epel-release-latest-7.noarch.rpm
    {% endif %}
    - unless: test -f /etc/yum.repos.d/epel.repo 
    - require:
      - file: epel-rpm
