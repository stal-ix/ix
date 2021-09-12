{% extends '//dev/lang/clang/package.sh' %}

{% block extradeps %}
# bld {{mix.if_linux('boot/lib/linux')}} boot/lib/cxx
# bld boot/stage/6/cmake boot/stage/6/python boot/stage/5/env
{% endblock %}
