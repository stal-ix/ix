{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/etc

base64 -d << EOF > ${out}/etc/avahi.conf
{% include 'avahi.conf/base64' %}
EOF
{% endblock %}
