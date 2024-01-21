{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/mity/md4c/archive/refs/tags/release-0.5.1.tar.gz
sha:2dca17c6175a7f11182943079c2a4f9adb5071433e3d3d05ba801ff794993f34
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
