{% extends '//dev/lang/clang/package.sh' %}

{% block extradeps %}
# bld {{'boot/lib/linux' | linux}} boot/lib/cxx
# bld boot/stage/6/cmake boot/stage/6/python boot/stage/5/env
{% endblock %}
