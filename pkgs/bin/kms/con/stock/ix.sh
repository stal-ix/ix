{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
kmscon
{% endblock %}

{% block version %}
9.1.0
{% endblock %}

{% block fetch %}
https://github.com/Aetf/kmscon/archive/refs/tags/v{{self.version().strip()}}.tar.gz
56427c29cb581db22f7ebf76bc8678dc8948700cce39b60be001a88d1d297beb
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
lib/tsm
lib/udev
lib/pango
lib/xkb/common
{% if opengl %}
lib/drivers/3d
{% endif %}
{% endblock %}

{% block meson_flags %}
tests=false
{% endblock %}
