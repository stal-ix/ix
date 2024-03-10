{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/etc/sud.d

cat << EOF > ${out}/etc/sud.d/{{pubkey_name}}
{{pubkey_value}}
EOF
{% endblock %}
