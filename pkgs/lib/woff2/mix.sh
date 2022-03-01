{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/google/woff2/archive/refs/tags/v1.0.2.tar.gz
793c8844845351cb80730a74937e411b
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/brotli
{% endblock %}
