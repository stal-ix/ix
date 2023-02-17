{% extends '//die/proxy.sh' %}

{% set srv_dir %}{{srv_slot}}_{{srv_name}}{% endset %}

{% block install %}
cd ${out}; mkdir -p etc/services/{{srv_dir}}; cd etc/services/{{srv_dir}}

cat << EOF > run
#!/bin/sh
exec srv {{srv_dir}} {{srv_command}}
EOF

chmod +x run
{% endblock %}
