{% extends '//mix/template/proxy.sh' %}

{% block install %}
cd ${out}

mkdir etc; cd etc

cat << EOF > passwd
root:x:0:0:root:/home/root:/bin/sh
mix:x:1000:1000:bin:/home/mix:/bin/sh
EOF

cat << EOF > group
root:x:0:
EOF

cat << EOF > hosts
127.0.0.1  localhost mix
::1        localhost
EOF

echo '00000000000000001111111111111111' > machine-id

ln -s /proc/self/mounts mtab
{% endblock %}
