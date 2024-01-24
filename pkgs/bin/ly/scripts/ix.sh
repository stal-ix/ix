{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/etc/pam.d

cat << EOF > ${out}/etc/pam.d/ly
auth       required   pam_unix.so
account    required   pam_unix.so
password   required   pam_unix.so
session    required   pam_unix.so
EOF
{% endblock %}
