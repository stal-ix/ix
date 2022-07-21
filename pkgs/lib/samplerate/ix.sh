{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsndfile/libsamplerate/archive/refs/tags/0.2.2.tar.gz
sha:16e881487f184250deb4fcb60432d7556ab12cb58caea71ef23960aec6c0405a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
