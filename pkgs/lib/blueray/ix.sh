{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libbluray
{% endblock %}

{% block version %}
1.5.0
{% endblock %}

{% block fetch %}
https://code.videolan.org/videolan/libbluray/-/archive/{{self.version().strip()}}/libbluray-{{self.version().strip()}}.tar.bz2
0a70f8c63aa1c64c0d3fc743d0a0e7071ac6c68f69b49e596505a3f64c71cf0a
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
