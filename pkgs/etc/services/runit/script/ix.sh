{% extends '//die/proxy.sh' %}

{% set sd %}{% if srv_dir %}{{srv_dir}}{% else %}user_{{srv_slot}}_{{srv_name}}{% endif %}{% endset %}

{% block install %}
cd ${out}; mkdir -p etc/services/{{sd}}; cd etc/services/{{sd}}

cat << EOF > cmd
{{srv_command}}
EOF

cat << EOF > run
#!/bin/sh
{% if srv_user %}
mkdir -p /var/run/{{sd}}
chown {{srv_user}} /var/run/{{sd}}
exec srv {{sd}} /bin/su -s /bin/sh {{srv_user}} ${PWD}/cmd
{% else %}
exec srv {{sd}} /bin/sh ${PWD}/cmd
{% endif %}
EOF

chmod +x run
{% endblock %}
