{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}

mkdir fix; cd fix

cat << EOF > passwd.sh
cat etc/passwd.d/* > etc/passwd
rm -r etc/passwd.d
EOF

cd ..

mkdir etc; cd etc

mkdir passwd.d

cat << EOF > passwd.d/root
root:x:0:0:root:/home/root:/bin/sh
ix:x:1000:1000:none:/home/ix:/bin/sh
EOF

cat << EOF > group
root:x:0:
none:x:1:
audio:x:1:
EOF

echo {{hostname or 'stalix'}} > hostname

cat << EOF > hosts
127.0.0.1  localhost $(cat hostname)
::1        localhost
EOF

echo '00000000000000001111111111111111' > machine-id

cat << EOF > profile
unset LANG

export PATH="/ix/realm/\${USER}/bin:/bin"
export IX_SDIR="/var/tmp/\$(id -u)"
export IX_ROOT=/ix
export TMPDIR="\${IX_SDIR}/\$\$"
export XDG_DATA_DIRS="/ix/realm/\${USER}/share"
export XDG_RUNTIME_DIR="\${TMPDIR}"

mkdir -m 0700 -p \${XDG_RUNTIME_DIR}

cd \${HOME}
EOF

ln -s profile session

ln -s /proc/self/mounts mtab
{% endblock %}

{% block purge_broken_links %}
{% endblock %}

{% block chmod_ro %}
{% endblock %}
