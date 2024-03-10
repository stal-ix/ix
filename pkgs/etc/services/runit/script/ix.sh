{% extends '//die/proxy.sh' %}

{% set sd %}{% if srv_dir %}{{srv_dir}}{% else %}user_{{srv_slot}}_{{srv_name}}{% endif %}{% endset %}

{% block install %}
cd ${out}

mkdir -p etc/services/{{sd}}
cd etc/services/{{sd}}

cat << EOF > hi
{% if srv_user %}
{% block srv_user_prepare %}
mkdir -p /var/run/{{sd}}
chown {{srv_user}} /var/run/{{sd}}
{% endblock %}
exec /bin/su -s /bin/sh {{srv_user}} ${PWD}/lo
{% else %}
exec /bin/sh ${PWD}/lo
{% endif %}
EOF

cat << EOF > lo
{% block srv_command %}
{{srv_command}}
{% endblock %}
EOF

cat << EOF > run
#!/bin/sh
exec srv {{sd}} /bin/sh ${PWD}/hi
EOF

chmod +x run
{% endblock %}
