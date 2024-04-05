{% extends '//die/hub.sh' %}

{% block run_deps %}
set/fs
bld/all
set/boot
set/debug
set/install
set/boot/efi
bin/kernel/6/8
bin/kernel/gengrub
set/stalix(failsafe=1,seed=1,hostname=rescue)
{% endblock %}
