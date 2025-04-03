{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.prevanders.net/libdwarf-0.12.0.tar.xz
sha:444dc1c5176f04d3ebc50341552a8b2ea6c334f8f1868a023a740ace0e6eae9f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
