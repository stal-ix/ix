{% extends '//lib/c++/mix.sh' %}

{% block lib_deps %}
{% endblock %}

{% block bld_libs %}
{% if target.os == 'linux' %}
boot/7/lib/linux/mix.sh
{% endif %}
{% endblock %}

{% block bld_deps %}
boot/7/cmake/mix.sh
boot/7/python/mix.sh
boot/8/env/std/mix.sh
{% endblock %}
