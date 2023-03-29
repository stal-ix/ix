{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > {{tool_name}}
#!/usr/bin/env sh
echo \${@} >> \${tmp}/fakes
EOF

chmod +x *
{% endblock %}
