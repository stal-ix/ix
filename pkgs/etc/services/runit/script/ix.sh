{% extends '//die/proxy.sh' %}

{% set sd %}{% if srv_dir %}{{srv_dir}}{% else %}user_{{srv_slot}}_{{srv_name}}{% endif %}{% endset %}

{% block install %}
cd ${out}

mkdir -p etc/services/{{sd}}
cd etc/services/{{sd}}

cat << EOF > cmd_1
{% if srv_user %}
mkdir -p /var/run/{{sd}}
chown {{srv_user}} /var/run/{{sd}}
exec /bin/su -s /bin/sh {{srv_user}} ${PWD}/cmd_2
{% else %}
exec /bin/sh ${PWD}/cmd_2
{% endif %}
EOF

cat << EOF > cmd_2
{{srv_command}}
EOF

cat << EOF > run
#!/bin/sh
exec srv {{sd}} /bin/sh ${PWD}/cmd_1
EOF

chmod +x run
{% endblock %}
