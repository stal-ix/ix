{% extends '//lib/cxx/package.sh' %}

{% block deps %}
# lib boot/stage/7/lib
# bld {{'boot/lib/linux' | linux}}
# bld boot/stage/6/cmake boot/stage/7/env
{% endblock %}
