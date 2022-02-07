{% extends '//mix/template/proxy.sh' %}

{% block install %}
mkdir -p ${out}/etc/runit/1.d; cd ${out}/etc/runit/1.d

cat << EOF > 01-zram0.sh
echo '2048M' > /sys/block/zram0/disksize
mkswap /dev/zram0
swapon /dev/zram0
EOF
{% endblock %}
