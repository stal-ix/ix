{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/doxygen/doxygen/archive/refs/tags/Release_1_9_7.tar.gz
sha:691777992a7240ed1f822a5c2ff2c4273b57c1cf9fc143553d87f91a0c5970ee
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/iconv
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/python
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
