{% extends '//die/proxy.sh' %}

{% set num %}{% block num %}{% endblock %}{% endset %}

{% block install %}
mkdir -p ${out}/etc/runit/1.d; cd ${out}/etc/runit/1.d

cat << EOF > 01-zram{{num}}.sh
# enable swap on zram{{num}}
echo '{{zram_size or 2048}}M' > /sys/block/zram{{num}}/disksize
mkswap /dev/zram{{num}}
swapon /dev/zram{{num}}
EOF
{% endblock %}
