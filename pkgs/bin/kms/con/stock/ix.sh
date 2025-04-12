{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
kmscon
{% endblock %}

{% block version %}
9.0.0
{% endblock %}

{% block fetch %}
https://github.com/Aetf/kmscon/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:eb594e48768962b665959aa9a643934f986bee68163b4ab593b9e6c987be825c
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
lib/tsm
lib/udev
lib/xkb/common
{% if kmscon_pretty %}
lib/pango
{% endif %}
{% if kmscon_fast %}
lib/drivers/3d
{% endif %}
{% endblock %}

{% block meson_flags %}
tests=false
{% endblock %}
