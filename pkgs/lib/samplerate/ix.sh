{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libsamplerate
{% endblock %}

{% block version %}
0.2.2
{% endblock %}

{% block fetch %}
https://github.com/libsndfile/libsamplerate/archive/refs/tags/{{self.version().strip()}}.tar.gz
16e881487f184250deb4fcb60432d7556ab12cb58caea71ef23960aec6c0405a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIBSAMPLERATE_EXAMPLES=OFF
{% endblock %}
