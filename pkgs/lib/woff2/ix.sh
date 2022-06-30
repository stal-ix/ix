{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/google/woff2/archive/refs/tags/v1.0.2.tar.gz
sha:add272bb09e6384a4833ffca4896350fdb16e0ca22df68c0384773c67a175594
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/brotli
{% endblock %}
