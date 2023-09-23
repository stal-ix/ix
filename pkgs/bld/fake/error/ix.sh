{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > {{tool_name}}
#!/usr/bin/env sh
exit 1
EOF

chmod +x *
{% endblock %}
