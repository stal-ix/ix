{% extends '//mix/template/proxy.sh' %}

{% set num %}{% block num %}{% endblock %}{% endset %}

{% block install %}
mkdir -p ${out}/etc/runit/1.d; cd ${out}/etc/runit/1.d

cat << EOF > 01-zram{{num}}.sh
echo '2048M' > /sys/block/zram{{num}}/disksize
mkswap /dev/zram{{num}}
swapon /dev/zram{{num}}
EOF
{% endblock %}
