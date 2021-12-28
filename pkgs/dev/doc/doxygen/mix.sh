{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/doxygen/doxygen/archive/refs/tags/Release_1_9_2.tar.gz
efd079fb7955d4f73da791f758c1a93d
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
dev/lang/flex
dev/lang/bison/3/8
dev/tool/python
{% endblock %}
