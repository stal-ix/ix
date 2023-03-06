{% extends '//die/proxy.sh' %}

{% set sd %}{% if srv_dir %}{{srv_dir}}{% else %}user_{{srv_slot}}_{{srv_name}}{% endif %}{% endset %}

{% block install %}
cd ${out}; mkdir -p etc/services/{{sd}}; cd etc/services/{{sd}}

cat << EOF > cmd
exec {{srv_command}}
EOF

cat << EOF > run
#!/bin/sh
exec srv {{sd}} su {{srv_user or 'root'}} ${PWD}/cmd
EOF

chmod +x run
{% endblock %}
