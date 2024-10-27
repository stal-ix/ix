{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/etc

cat << EOF > ${out}/etc/syslog.conf
*.* /var/run/syslogd/std/log
EOF
{% endblock %}
