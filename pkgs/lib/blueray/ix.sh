{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libbluray
{% endblock %}

{% block version %}
1.5.1
{% endblock %}

{% block fetch %}
https://code.videolan.org/videolan/libbluray/-/archive/{{self.version().strip()}}/libbluray-{{self.version().strip()}}.tar.bz2
0f415b559d7f074ba78db259f61c3c61458057263a0181aaafdee1856b0fb17f
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
