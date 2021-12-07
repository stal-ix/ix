{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/doxygen/doxygen/archive/refs/tags/Release_1_9_2.tar.gz
efd079fb7955d4f73da791f758c1a93d
{% endblock %}

{% block bld_libs %}
lib/c++/mix.sh
{% endblock %}

{% block bld_tool %}
dev/lang/flex/mix.sh
dev/lang/bison/3/6/mix.sh
dev/tool/python/mix.sh
{% endblock %}
