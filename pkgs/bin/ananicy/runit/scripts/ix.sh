{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/services/ananicy; cd etc/services/ananicy

cat << EOF > run
#!/bin/sh
exec srv ananicy ananicy-cpp start
EOF

chmod +x run
{% endblock %}
