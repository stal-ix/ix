{% extends '//bin/make/old/ix.sh' %}

{% block bld_libs %}
bld/boot/2/lib/c
{% endblock %}

{% block bld_deps %}
bld/boot/3/cc
bld/boot/2/env
{% endblock %}

{% block patch %}
{% if linux %}
>lib/fnmatch.c
{% endif %}
{% endblock %}
