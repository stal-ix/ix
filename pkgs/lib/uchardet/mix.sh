{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/freedesktop/uchardet/archive/refs/tags/v0.0.7.tar.gz
f1ac05da2edfc17b12d1f942695f59b8
{% endblock %}

{% block lib_deps %}
lib/c++/mix.sh
{% endblock %}

{% block bld_deps %}
env/std/mix.sh
boot/final/env/tools/mix.sh
{% endblock %}
