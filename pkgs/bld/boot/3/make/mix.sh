{% extends '//bin/make/mix.sh' %}

{% block make_bin %}
bmake
{% endblock %}

{% block make_no_thrs %}{% endblock %}

{% block bld_libs %}
bld/boot/1/lib/c
{% endblock %}

{% block bld_deps %}
bld/boot/2/env
{% endblock %}

{% block patch %}
{% if linux %}
>lib/fnmatch.c
{% endif %}
{% endblock %}
