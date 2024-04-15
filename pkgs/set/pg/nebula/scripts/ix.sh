{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/etc/nebula

base64 -d << EOF > ${out}/etc/nebula/ca
{{nebula_ca}}
EOF

base64 -d << EOF > ${out}/etc/nebula/crt
{{nebula_crt}}
EOF

base64 -d << EOF > ${out}/etc/nebula/key
{{nebula_key}}
EOF

base64 -d << EOF > ${out}/etc/nebula/config.yaml
{{nebula_config}}
EOF

mkdir -p ${out}/etc/hosts.d

cat << EOF > ${out}/etc/hosts.d/01-nebula.conf
192.168.100.16 lab1.nebula
192.168.100.17 lab2.nebula
192.168.100.18 lab3.nebula
EOF
{% endblock %}
