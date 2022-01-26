{% extends '//mix/template/proxy.sh' %}

{% block run_deps %}
bin/iwd
{% endblock %}

{% block install %}
{{super()}}

cd ${out}

mkdir -p etc/services/iwd; cd etc/services/iwd

cat << EOF > run
#!/bin/sh
mkdir -p /var/run/iwd
cd /var/run/iwd
exec flock lock iwd 1>>out 2>>out
EOF

chmod +x run
{% endblock %}
