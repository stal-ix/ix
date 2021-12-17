{% extends '//boot/7/lib/compiler_rt/mix.sh' %}

{% block bld_libs %}
boot/8/lib/cxx/mix.sh
{% endblock %}

{% block bld_deps %}
boot/7/cmake/mix.sh
boot/7/python/mix.sh
boot/8/env/std/mix.sh
{% endblock %}
