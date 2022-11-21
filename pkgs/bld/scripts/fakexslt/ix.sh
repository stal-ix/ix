{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > xsltproc
#!/usr/bin/env sh
EOF

chmod +x *
{% endblock %}
