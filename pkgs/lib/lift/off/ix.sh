{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libliftoff
{% endblock %}

{% block version %}
0.5.0
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/emersion/libliftoff/-/archive/v{{self.version().strip()}}/libliftoff-v{{self.version().strip()}}.tar.bz2
sha:2ed21be3c563b129bd8f188195a23256017e15908c195f3edcd3697584caf1c8
{% endblock %}

{% block lib_deps %}
lib/c
lib/drm
{% endblock %}
