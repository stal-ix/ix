{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin
cat << EOF > ${out}/bin/s5
#!/usr/bin/env sh
exec wirez run -F lab3.local:8015 -L 10.10.0.1:53:127.0.0.1:53/udp -- "\${@}"
EOF
chmod +x ${out}/bin/*
{% endblock %}
