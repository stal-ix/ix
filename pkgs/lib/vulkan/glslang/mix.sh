{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/glslang/archive/refs/tags/master-tot.tar.gz
f51c4b12ac0c8f9dee2067dc207a4fca
{% endblock %}

{% block bld_tool %}
dev/tool/python/mix.sh
dev/lang/bison/3/8/mix.sh
{% endblock %}

{% block lib_deps %}lib/c/mix.sh{% endblock %}
