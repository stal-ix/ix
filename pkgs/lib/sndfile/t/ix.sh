{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsndfile/libsndfile/releases/download/1.2.2/libsndfile-1.2.2.tar.xz
sha:3799ca9924d3125038880367bf1468e53a1b7e3686a934f098b7e1d286cdb80e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ENABLE_STATIC_RUNTIME=ON
{% endblock %}
