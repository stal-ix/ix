{% extends '//mix/template/proxy.sh' %}

{% block run_deps %}
bin/dropbear
{% endblock %}

{% block install %}
cd ${out}

mkdir bin; cd bin

cat << EOF > sudo
#!/bin/sh
exec dbclient -y -y root@localhost "\$@"
EOF

chmod +x sudo

cd ..

mkdir etc; cd etc

ln -s /var/run/sud dropbear

mkdir -p services/sud; cd services/sud

cat << EOF > run
#!/bin/sh
mkdir -p /var/run/sud
cd /var/run/sud
exec flock lock dropbear -R -F -E -B -j -k -m -P dropbear.pid 1>>out 2>>out
EOF

chmod +x run
{% endblock %}
