{% extends '//lib/cxx/package.sh' %}

{% block deps %}
# lib boot/stage/7/lib/package.sh
# bld {{'boot/lib/linux/package.sh' | linux}}
# bld boot/final/env/clang/package.sh
{% endblock %}
