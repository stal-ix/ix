{% extends '//mix/template/proxy.sh' %}

{% block run_deps %}
bin/dropbear/sys
{% endblock %}

{% block install %}
cd ${out}

mkdir bin; cd bin

cat << EOF > doas
#!/bin/sh
user=${1}
shift
exec dbclient -t -y -y ${user}@localhost "\${@}"
EOF

cat << EOF > sudo
#!/bin/sh
exec doas root "\${@}"
EOF

chmod +x sudo doas

cd ..

mkdir etc; cd etc

ln -s /var/run/sud dropbear

mkdir -p services/sud; cd services/sud

cat << EOF > run
#!/bin/sh
exec srv sud dropbear -R -F -E -B -j -k -m -P dropbear.pid
EOF

chmod +x run
{% endblock %}
