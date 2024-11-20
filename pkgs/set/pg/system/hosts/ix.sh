{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/etc/hosts.d

cat << EOF > ${out}/etc/hosts.d/01-nebula.conf
192.168.100.16 lab1.nebula
192.168.100.17 lab2.nebula
192.168.100.18 lab3.nebula
10.0.0.64      lab1.local
10.0.0.68      lab2.local
10.0.0.72      lab3.local
EOF
{% endblock %}
