{% extends '//die/c/autorehell.sh' %}

{% block version %}
0.1.0
{% endblock %}

{% block fetch %}
https://github.com/dboyan/wayland-tracer/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:2dde4693835fd53d1f9a704014a96471eb7f91ddac5e825c99e26960615f5472
{% endblock %}

{% block bld_libs %}
lib/c
lib/expat
{% endblock %}
