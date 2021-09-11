{% extends '//dev/lang/clang/package.sh' %}

{% block extradeps %}
# dep {{mix.if_linux('boot/lib/linux')}} boot/lib/cxx
# dep boot/stage/6/cmake boot/stage/6/python boot/stage/5/env
{% endblock %}
