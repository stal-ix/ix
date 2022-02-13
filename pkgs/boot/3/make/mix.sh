{% extends '//bin/make/mix.sh' %}

{% block make_bin %}
bmake
{% endblock %}

{% block make_no_thrs %}{% endblock %}

{% block bld_libs %}
boot/1/lib/c
{% endblock %}

{% block bld_deps %}
boot/2/env
{% endblock %}

{% block patch %}
{% if linux %}
>lib/fnmatch.c
{% endif %}
{% endblock %}
