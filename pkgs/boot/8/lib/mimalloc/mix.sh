{% extends '//lib/mimalloc/mix.sh' %}

{% block lib_deps %}
boot/8/lib/musl/mix.sh
{% endblock %}

{% block bld_libs %}
{% endblock %

{% block bld_deps %}
boot/7/cmake/mix.sh
boot/8/clang/env/mix.sh
{% endblock %}
