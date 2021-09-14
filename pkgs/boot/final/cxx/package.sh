{% extends '//lib/cxx/package.sh' %}

{% block deps %}
# lib boot/stage/7/lib
# bld {{'boot/lib/linux' | linux}}
# bld boot/final/env/clang
{% endblock %}
