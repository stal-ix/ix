{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/etc

cat << EOF > ${out}/etc/ntp.conf
server 0.asia.pool.ntp.org
server 0.oceania.pool.ntp.org
server 0.europe.pool.ntp.org
server 0.north-america.pool.ntp.org
server 2.south-america.pool.ntp.org
EOF
{% endblock %}
