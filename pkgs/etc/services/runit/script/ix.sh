{% extends '//die/proxy.sh' %}

{% set sd %}{% if srv_dir %}{{srv_dir}}{% else %}user_{{srv_slot}}_{{srv_name}}{% endif %}{% endset %}

{% block install %}
cd ${out}; mkdir -p etc/services/{{sd}}; cd etc/services/{{sd}}

cat << EOF > run
#!/bin/sh
exec srv {{sd}} {{srv_command}}
EOF

chmod +x run
{% endblock %}
