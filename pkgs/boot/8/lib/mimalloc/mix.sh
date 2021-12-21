{% extends '//lib/mimalloc/mix.sh' %}

{% block lib_deps %}
boot/8/lib/musl/mix.sh
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
boot/8/env/cxx/mix.sh
{% endblock %}
