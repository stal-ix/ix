{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Kistler-Group/sdbus-cpp/archive/refs/tags/v1.4.0.tar.gz
sha:ca7405c7f0f9ae3023dcfa37bc68974c4b8a1c9ea2909b970e0aedc3e8657ee6
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/basu
{% endblock %}
