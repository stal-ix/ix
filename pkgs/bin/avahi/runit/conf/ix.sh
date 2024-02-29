{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/etc

cat << EOF > ${out}/etc/avahi.conf
[server]
{% if hostname %}
host-name={{hostname}}
{% endif %}
use-ipv4=yes
use-ipv6=no

[wide-area]
enable-wide-area=no

[publish]
publish-hinfo=no
publish-workstation=no
#disable-publishing=no
#disable-user-service-publishing=no
#add-service-cookie=no
#publish-addresses=yes
#publish-domain=yes
#publish-dns-servers=192.168.50.1, 192.168.50.2
#publish-resolv-conf-dns-servers=yes
#publish-aaaa-on-ipv4=yes
#publish-a-on-ipv6=no

[reflector]
enable-reflector=no

[rlimits]
#rlimit-as=
#rlimit-core=0
#rlimit-data=8388608
#rlimit-fsize=0
#rlimit-nofile=768
#rlimit-stack=8388608
#rlimit-nproc=3
EOF
{% endblock %}
