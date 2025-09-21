{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
freetype
{% endblock %}

{% block version %}
2.14.1
{% endblock %}

{% block fetch %}
https://gitlab.com/freetype/freetype/-/archive/VER-{{self.version().strip().replace('.', '-')}}/freetype-VER-{{self.version().strip().replace('.', '-')}}.tar.bz2
7fea7e6fd000b6c9387374d9487d66a0822d45721f43f47e00201f62977e2b0f
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/png
lib/brotli
lib/bzip/2
{% endblock %}
