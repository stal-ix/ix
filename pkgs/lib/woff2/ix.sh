{% extends '//die/c/cmake.sh' %}

{% block version %}
1.0.2
{% endblock %}

{% block fetch %}
https://github.com/google/woff2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:add272bb09e6384a4833ffca4896350fdb16e0ca22df68c0384773c67a175594
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/brotli
{% endblock %}
