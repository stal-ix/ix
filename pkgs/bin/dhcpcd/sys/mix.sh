{% extends '//mix/template/proxy.sh' %}

{% block run_deps %}
bin/dhcpcd
{% endblock %}

{% block install %}
{{super()}}

cd ${out}

mkdir -p etc/services/dhcpcd; cd etc/services/dhcpcd

cat << EOF > run
#!/bin/sh
exec dhcpcd --nobackground --debug --config /etc/dhcpcd.conf
EOF

chmod +x run
{% endblock %}
