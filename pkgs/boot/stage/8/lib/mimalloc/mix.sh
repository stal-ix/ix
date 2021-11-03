{% extends '//lib/mimalloc/mix.sh' %}

{% block lib_deps %}
boot/stage/8/lib/musl/mix.sh
{% endblock %}

{% block bld_deps %}
boot/stage/7/cmake/mix.sh
boot/stage/8/clang/env/mix.sh
{% endblock %}
