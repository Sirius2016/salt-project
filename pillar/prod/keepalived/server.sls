{% if grains['nodename'] == 'ha.nginxs.net' %}
RULE: MASTER
PRI: 10
{% elif grains['nodename'] == 'web01.nginxs.net' %}
RULE: SLAVE
PRI: 5
{% endif %}
