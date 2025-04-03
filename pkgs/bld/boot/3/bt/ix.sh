{% extends '//bld/box/shim/ix.sh' %}

{% block bld_deps %}
bld/boot/2/env
{% endblock %}

{% block script_parts %}
/usr/bin/env
PATH={{ix_boot_path}}
env
sh
-s
{% endblock %}
