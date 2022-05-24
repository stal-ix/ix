{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/services/sndiod; cd etc/services/sndiod

cat << EOF > run
#!/bin/sh
exec srv sndiod chrt -f 10 sndiod -dd -f rsnd/1
EOF

chmod +x run
{% endblock %}
