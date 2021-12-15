{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/google/double-conversion/archive/refs/tags/v3.1.5.tar.gz
e94d3a33a417e692e5600e75019f0272
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/c++/mix.sh
{% endblock %}
