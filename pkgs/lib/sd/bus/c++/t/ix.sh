{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Kistler-Group/sdbus-cpp/archive/refs/tags/v1.5.0.tar.gz
sha:577986929f911320fb9ef6a3e2badd464dc38411ebc25d2966f5cb85c39f0897
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/basu
{% endblock %}
