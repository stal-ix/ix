{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/fix

cat << EOF > ${out}/fix/sud.sh
mkdir -p etc/sudo
cat etc/sud.d/* > etc/sudo/authorized_keys
rm -r etc/sud.d
chmod 0600 etc/sudo/authorized_keys
chmod 0700 etc/sudo
EOF
{% endblock %}
