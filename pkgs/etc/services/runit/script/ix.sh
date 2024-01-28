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
exec srv {{sd}} su -s /bin/sh {{srv_user}} ${PWD}/cmd
{% else %}
exec srv {{sd}} ${PWD}/cmd
{% endif %}
EOF

chmod +x run
{% endblock %}
