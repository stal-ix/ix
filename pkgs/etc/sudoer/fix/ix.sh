{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/fix

cat << EOF > ${out}/fix/sud.sh
set -xue

if test -f etc/sud; then
    mkdir -p etc/sudo
    mv etc/sud etc/sudo/authorized_keys
    chmod 0600 etc/sudo/authorized_keys
    chmod 0700 etc/sudo
fi
EOF
{% endblock %}
