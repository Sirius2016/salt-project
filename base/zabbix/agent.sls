zabbix22-agent:
  pkg.installed:
    - name: zabbix22-agent
  file.managed:
    - name: /etc/zabbix_agentd.conf
    - source: salt://zabbix/files/zabbix_agentd.conf
    - template: jinja
    - defaults:
      Server: {{ pillar['ZABBIX_SERVER_BJ'] }}
    - require:
      - pkg: zabbix22-agent
zabbix-agent:
  service.running:
    - enable: True
    - watch:
      - pkg: zabbix22-agent
    - require:
      - file: zabbix22-agent
  cmd.run:
    {% if grains['init'] == 'upstart' %}
    - name: chkconfig --add zabbix-agent
    - unless: chkconfig --list | grep  zabbix-agent
    {% elif grains['os'] == 'CentOS Linux-7' %}
    - name: systemctl enabled zabbix-agent.service
    - unless: systemctl is-enabled zabbix-agent.service
    {% endif %}
    - require:
      - pkg: zabbix22-agent
zabbix_agentd_conf-symlink:
  file.symlink:
    - name: /etc/zabbix/zabbix_agentd.conf
    - target: /etc/zabbix_agentd.conf
    - require_in:
      - service: zabbix22-agent
    - require:
      - pkg: zabbix22-agent
      - file: zabbix22-agent

zabbix_agentd.conf.d:
  file.directory:
    - name: /etc/zabbix/zabbix_agentd.conf.d
    - watch_in:
      - service: zabbix22-agent
    - require:
      - pkg: zabbix22-agent
