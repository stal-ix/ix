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
exec iwd 1>stdout 2>stderr
EOF

chmod +x run
{% endblock %}
