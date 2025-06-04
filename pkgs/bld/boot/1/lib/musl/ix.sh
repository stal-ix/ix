{% extends '//lib/musl/boot/ix.sh' %}

{% block bld_deps %}
bld/boot/1/sh
bld/boot/0/env
{% endblock %}

{% block script_parts %}
/usr/bin/env
PATH={{ix_boot_path}}
env
sh
-s
{% endblock %}
