{% extends '//lib/mimalloc/mix.sh' %}

{% block lib_deps %}
boot/stage/7/lib/musl/mix.sh
{% endblock %}

{% block bld_deps %}
boot/stage/6/cmake/mix.sh
boot/stage/6/env/clang/mix.sh
{% endblock %}
