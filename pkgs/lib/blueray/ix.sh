{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libbluray
{% endblock %}

{% block version %}
1.4.0
{% endblock %}

{% block fetch %}
https://code.videolan.org/videolan/libbluray/-/archive/{{self.version().strip()}}/libbluray-{{self.version().strip()}}.tar.bz2
d162a39d261781d44c18007000a6d2a42fbfbe0a606a0bb00a6fca33b043586a
{% endblock %}

{% block lib_deps %}
lib/c
lib/xml/2
lib/freetype
lib/udf/read
{% endblock %}

{% block c_rename_symbol %}
gc_free
{% endblock %}

{% block meson_flags %}
fontconfig=disabled
{% endblock %}
