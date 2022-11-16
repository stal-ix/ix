{% extends '//lib/linux/headers/ix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block host_libs %}
bld/boot/3/lib/c
{% endblock %}

{% block bld_deps %}
bld/boot/6/env/cxx
{% endblock %}
