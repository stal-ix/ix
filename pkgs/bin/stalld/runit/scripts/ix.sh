{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/services/stalld; cd etc/services/stalld

cat << EOF > run
#!/bin/sh
exec srv stalld stalld -l -v -f
EOF

chmod +x run
{% endblock %}
