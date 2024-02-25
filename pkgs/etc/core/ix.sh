{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}

mkdir fix; cd fix

cat << EOF > passwd.sh
cat etc/passwd.d/* > etc/passwd
rm -r etc/passwd.d
cat etc/hosts.d/* > etc/hosts
rm -r etc/hosts.d
EOF

cat << EOF > mtab.sh
ln -s /proc/self/mounts etc/mtab
EOF

cd ..

mkdir etc; cd etc

mkdir passwd.d

cat << EOF > passwd.d/root
root:x:0:0:root:/home/root:/bin/sh
EOF

cat << EOF > group
root:x:0:
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
