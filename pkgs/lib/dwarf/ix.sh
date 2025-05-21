{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdwarf
{% endblock %}

{% block version %}
2.0.0
{% endblock %}

{% block fetch %}
https://www.prevanders.net/libdwarf-{{self.version().strip()}}.tar.xz
sha:c3d1db72a979e14ee60b93010f0698d30fc1bca4eb1341006783d4e9c9ec7e72
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
