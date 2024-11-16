{% extends '//bin/dash/sh/old/ix.sh' %}

{% block bld_libs %}
bld/boot/3/lib/c
{% endblock %}

{% block bld_deps %}
bld/boot/3/cc
bld/boot/3/sh/0
bld/boot/3/make/1
bld/boot/2/env
{% endblock %}
