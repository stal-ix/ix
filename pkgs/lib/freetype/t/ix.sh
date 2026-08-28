{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
freetype
{% endblock %}

{% block version %}
2.14.3
{% endblock %}

{% block fetch %}
https://gitlab.com/freetype/freetype/-/archive/VER-{{self.version().strip().replace('.', '-')}}/freetype-VER-{{self.version().strip().replace('.', '-')}}.tar.bz2
2985ab74a562f66b4a6bc5a7f80119c5190d24fb6cd62da0b9f0121f23475982
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/png
lib/brotli
lib/bzip/2
{% endblock %}
