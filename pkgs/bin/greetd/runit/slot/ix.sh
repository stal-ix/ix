{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}

mkdir -p etc/services/greetd{{slot}}
cd etc/services/greetd{{slot}}

cat << EOF > daemon
#!/bin/sh
exec /bin/greetd --socket-path \${PWD}/socket --config /etc/greetd/config.toml
EOF

cat << EOF > run
#!/bin/sh
exec srv greetd{{slot}} ${PWD}/daemon
EOF

chmod +x run daemon

cd ${out}

mkdir -p etc/greetd

cat << EOF > etc/greetd/config.toml
[terminal]
vt = {{slot}}
switch = false

[default_session]
command = "agreety --cmd sh"
user = "greeter"
EOF

mkdir -p etc/pam.d

cat << EOF > etc/pam.d/greetd
auth       required   pam_unix.so
account    required   pam_unix.so
password   required   pam_unix.so
session    required   pam_unix.so
EOF
{% endblock %}
