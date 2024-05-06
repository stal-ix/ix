{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if system_realm %}
# ix mut system -set/stalix set/pg --system_realm=1
set/pg/system(alsa_device=hw:1,dev_mngr=fs,failsafe=1,kernel_boot_flags=amd_pstate=active)
{% else %}
# ix mut set/pg
set/pg/user(mesa_driver=aco)
{% endif %}
{% endblock %}
