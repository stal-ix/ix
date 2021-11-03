{% extends '//lib/mimalloc/mix.sh' %}

{% block lib_deps %}
boot/stage/8/lib/musl/mix.sh
{% endblock %}

{% block bld_deps %}
boot/stage/7/cmake/mix.sh
boot/stage/7/env/clang/mix.sh
{% endblock %}
