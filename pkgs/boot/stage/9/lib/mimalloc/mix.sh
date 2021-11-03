{% extends '//lib/mimalloc/mix.sh' %}

{% block lib_deps %}
boot/stage/9/lib/musl/mix.sh
{% endblock %}

{% block bld_deps %}
boot/stage/7/cmake/mix.sh
boot/stage/8/env/mix.sh
{% endblock %}
