{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}

mkdir fix; cd fix

base64 -d << EOF > 00-concat.sh
{% include 'concat.sh/base64' %}
EOF

cat << EOF > mtab.sh
ln -s /proc/self/mounts etc/mtab
EOF

cd ..

mkdir etc; cd etc

mkdir group.d

cat << EOF > group.d/00-default
none:x:1:
audio:x:1:
EOF

cat << EOF > os-release
NAME=stal/IX
ID=stalix
ID_LIKE=linux
HOME_URL="https://stal-ix.github.io/"
EOF

echo {{hostname or 'stalix'}} > hostname

mkdir hosts.d

cat << EOF > hosts.d/00-localhost
127.0.0.1  localhost $(cat hostname)
::1        localhost
EOF

echo '00000000000000001111111111111111' > machine-id
{% endblock %}
