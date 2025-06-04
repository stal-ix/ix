{% extends '//lib/musl/boot/ix.sh' %}

{% block make_no_thrs %}
{% endblock %}

{% block script_parts %}
/usr/bin/env
PATH={{ix_boot_path}}
env
sh
-s
{% endblock %}
