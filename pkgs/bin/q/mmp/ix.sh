{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://qmmp.ylsoftware.com/files/qmmp/2.1/qmmp-2.1.0.tar.bz2
sha:ac7b5981e371dc58759d5efd2babb42e377ecc5260ba3e57ac6dbf0897570ddc
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/deps
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
{% endblock %}
