{% extends '//bin/dash/sh/old/ix.sh' %}

{% block bld_libs %}
bld/boot/1/lib/c
{% endblock %}

{% block bld_deps %}
bld/boot/2/wak
bld/boot/2/minised
bld/boot/2/sbase
bld/boot/2/make
bld/boot/0/env
{% endblock %}

{% block script_parts %}
/usr/bin/env
PATH={{ix_boot_path}}
env
sh
-s
{% endblock %}
