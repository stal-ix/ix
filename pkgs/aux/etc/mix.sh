{% extends '//mix/proxy.sh' %}

{% block bld_tool %}
bin/busybox/full
{% endblock%}

{% block install %}
cd ${out}

mkdir etc; cd etc

cat << EOF > passwd
root:$(echo | cryptpw -S 237364527345):0:0:root:/home/root:/bin/sh
mix:$(echo | cryptpw -S 237364527347):1000:1000:none:/home/mix:/bin/sh
pg:$(echo | cryptpw -S 237364527348):10000:10000:none:/home/pg:/home/pg/.session
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
