{% extends '//mix/proxy.sh' %}

{% block bld_tool %}
bin/busybox
{% endblock%}

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
root:$(echo | cryptpw -S 237364527345):0:0:root:/home/root:/bin/sh
mix:$(echo | cryptpw -S 237364527347):1000:1000:none:/home/mix:/bin/sh
EOF

cat << EOF > group
root:x:0:
none:x:1:
EOF

cat << EOF > hosts
127.0.0.1  localhost mix
::1        localhost
EOF

echo '00000000000000001111111111111111' > machine-id

ln -s /proc/self/mounts mtab
{% endblock %}

{% block purge_broken_links %}
{% endblock %}
