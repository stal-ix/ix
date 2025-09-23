{% extends '//die/hub.sh' %}

{% block run_deps %}
set/fs
bld/all
set/boot
set/debug
bin/kernel
set/install
set/boot/efi
set/stalix(failsafe=1,seed=1,hostname=rescue)
{% endblock %}
