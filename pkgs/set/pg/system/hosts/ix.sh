{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/etc/hosts.d

cat << EOF > ${out}/etc/hosts.d/01-nebula.conf
192.168.100.16 lab1.nebula
192.168.100.17 lab2.nebula
192.168.100.18 lab3.nebula
EOF
{% endblock %}
