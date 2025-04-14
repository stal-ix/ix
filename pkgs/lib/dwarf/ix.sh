{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdwarf
{% endblock %}

{% block version %}
0.12.0
{% endblock %}

{% block fetch %}
https://www.prevanders.net/libdwarf-{{self.version().strip()}}.tar.xz
sha:444dc1c5176f04d3ebc50341552a8b2ea6c334f8f1868a023a740ace0e6eae9f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
