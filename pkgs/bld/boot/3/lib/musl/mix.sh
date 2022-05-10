{% extends '//lib/musl/t/mix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block make_no_thrs %}
{% endblock %}

{% block bld_deps %}
bld/boot/3/make
bld/boot/2/env
{% endblock %}
