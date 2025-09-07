{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
freetype
{% endblock %}

{% block version %}
2.14.0
{% endblock %}

{% block fetch %}
https://gitlab.com/freetype/freetype/-/archive/VER-{{self.version().strip().replace('.', '-')}}/freetype-VER-{{self.version().strip().replace('.', '-')}}.tar.bz2
a84e167dcc3858418e8022c742007da13aeed7d6c457a739ee0568583a1e612d
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/png
lib/brotli
lib/bzip/2
{% endblock %}
