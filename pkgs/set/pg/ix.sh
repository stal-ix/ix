{% extends '//die/hub.sh' %}

{% block sys_args %}
alsa_device=hw:1
dev_mngr=fs
failsafe=1
kernel_boot_flags=amd_pstate=passive
fetcher_socks5_proxy=192.168.100.64:1080;192.168.100.64:1081
curses=netbsd
intl_ver=no
libc_lite=1
pidns=1
enclave=1
initrd=1
{% endblock %}

{% block run_deps %}
{% if system_realm %}
# ix mut system -set/stalix set/pg --system_realm=1
set/pg/system({{self.sys_args().strip().replace('\n', ',')}})
{% else %}
# ix mut set/pg
set/pg/user(opengl=angle,vulkan=amd/radv)
{% endif %}
{% endblock %}
