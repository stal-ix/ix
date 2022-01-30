{% extends '//mix/template/proxy.sh' %}

{% block install %}
cd ${out}

mkdir -p etc/services/priod; cd etc/services/priod

cat << EOF > run
#!/bin/sh
exec srv priod /etc/services/priod/priod.sh
EOF

base64 -d << EOF > priod.sh
{% include 'priod.sh/base64' %}
EOF

chmod +x run priod.sh
{% endblock %}
