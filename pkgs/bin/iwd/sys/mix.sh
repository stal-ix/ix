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
exec iwd
EOF

chmod +x run
{% endblock %}
