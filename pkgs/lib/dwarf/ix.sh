{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libdwarf
{% endblock %}

{% block version %}
2.3.3
{% endblock %}

{% block fetch %}
https://www.prevanders.net/libdwarf-{{self.version().strip()}}.tar.xz
bde13d1c49be6f2467326a6e0b3919247471455d16eefc3c6be26c7d4baca36a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
