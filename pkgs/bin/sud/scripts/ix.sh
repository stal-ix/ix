{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}

mkdir bin; cd bin

cat << EOF > doas
#!/usr/bin/env sh
user="\${1}"
shift
exec sud_client -p 1 -o 'StrictHostKeyChecking no' -q -t "\${user}@localhost" /bin/env "PATH=\${PATH}" "TMPDIR=\${TMPDIR}" /bin/setcwd "\${PWD}" "\${@}"
EOF

cat << EOF > sudo
#!/usr/bin/env sh
exec doas root "\${@}"
EOF

chmod +x sudo doas
{% endblock %}
