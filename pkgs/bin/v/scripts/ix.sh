{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > v
#!/usr/bin/env sh
chroma -s autumn "\${@}" | cat -n | most
EOF

chmod +x v
{% endblock %}
