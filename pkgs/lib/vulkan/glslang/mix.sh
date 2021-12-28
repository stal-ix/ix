{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/glslang/archive/refs/tags/11.7.1.tar.gz
0855c7b65da1e9be5ff89eeddeda691a
{% endblock %}

{% block bld_tool %}
dev/tool/python
dev/lang/bison/3/8
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
