{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}

mkdir -p etc/sud.d

mkdir fix

cat << EOF > fix/sud.sh
mkdir -p etc/dropbear
cat etc/sud.d/* > etc/dropbear/authorized_keys
rm -r etc/sud.d
chmod 0600 etc/dropbear/authorized_keys
chmod 0700 etc/dropbear
EOF

mkdir bin; cd bin

cat << EOF > doas
#!/usr/bin/env sh
user="\${1}"
shift
exec sud_client -o 'StrictHostKeyChecking no' -q -t "\${user}@localhost" /bin/env "TMPDIR=\${TMPDIR}" /bin/bin_ix/liner setpwd "\${PWD}" "\${@}"
EOF

cat << EOF > sudo
#!/usr/bin/env sh
exec doas root "\${@}"
EOF

chmod +x sudo doas

cd ..

mkdir -p etc/services/sud; cd etc/services/sud

cat << EOF > run
#!/usr/bin/env sh
exec srv sud sud_server -R -F -E -B -j -k -m -P dropbear.pid
EOF

chmod +x run
{% endblock %}
