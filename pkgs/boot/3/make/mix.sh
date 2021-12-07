{% extends '//dev/build/make/mix.sh' %}

{% block make_bin %}
bmake
{% endblock %}

{% block bld_libs %}
boot/1/lib/c/mix.sh
{% endblock %}

{% block bld_deps %}
boot/2/env/mix.sh
{% endblock %}

{% block patch %}
{% if target.os == 'linux' %}
>lib/fnmatch.c
{% endif %}
{% endblock %}
