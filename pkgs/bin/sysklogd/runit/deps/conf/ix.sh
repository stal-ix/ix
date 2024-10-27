{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/etc

cat << EOF > ${out}/etc/syslog.conf
*.* /proc/self/fd/1
EOF
{% endblock %}
