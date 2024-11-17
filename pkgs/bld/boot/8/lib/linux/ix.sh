{% extends '//lib/linux/headers/ix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block host_libs %}
bld/boot/4/lib/c
{% endblock %}

{% block bld_deps %}
bld/boot/7/env/cxx
{% endblock %}
