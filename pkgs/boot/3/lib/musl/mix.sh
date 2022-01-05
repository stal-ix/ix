{% extends '//lib/musl/t/mix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block make_no_thrs %}
{% endblock %}

{% block bld_deps %}
boot/3/make
boot/2/env
{% endblock %}
