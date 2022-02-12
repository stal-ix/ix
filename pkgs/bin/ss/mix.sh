{% extends '//mix/template/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > ss
#!/bin/sh
exec "${USER}/.session"
EOF

chmod +x ss
{% endblock %}
