{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}

mkdir -p etc/sud.d

mkdir fix

cat << EOF > fix/sud.sh
mkdir -p etc/sudo
cat etc/sud.d/* > etc/sudo/authorized_keys
rm -r etc/sud.d
chmod 0600 etc/sudo/authorized_keys
chmod 0700 etc/sudo
EOF

mkdir bin; cd bin

cat << EOF > doas
#!/usr/bin/env sh
user="\${1}"
shift
exec sud_client -p 1 -o 'StrictHostKeyChecking no' -q -t "\${user}@localhost" /bin/env "TMPDIR=\${TMPDIR}" /bin/setcwd "\${PWD}" "\${@}"
EOF

cat << EOF > sudo
#!/usr/bin/env sh
exec doas root "\${@}"
EOF

chmod +x sudo doas
{% endblock %}
