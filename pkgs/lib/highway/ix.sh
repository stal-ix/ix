{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/highway/archive/refs/tags/1.1.0.tar.gz
sha:354a8b4539b588e70b98ec70844273e3f2741302c4c377bcc4e81b3d1866f7c9
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
HWY_ENABLE_EXAMPLES=OFF
{% endblock %}
