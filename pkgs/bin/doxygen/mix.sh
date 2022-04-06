{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/doxygen/doxygen/archive/refs/tags/Release_1_9_3.tar.gz
sha:c29426222c9361dc33b762cf1c6447c78cfb0b9c213e5dcdbe31a10540c918c5
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/python
{% endblock %}
