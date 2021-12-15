{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/gabime/spdlog/archive/refs/tags/v1.8.5.tar.gz
8755cdbc857794730a022722a66d431a
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/c++/mix.sh
{% endblock %}
