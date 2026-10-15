{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
freetype
{% endblock %}

{% block version %}
2.15.0
{% endblock %}

{% block fetch %}
https://gitlab.com/freetype/freetype/-/archive/VER-{{self.version().strip().replace('.', '-')}}/freetype-VER-{{self.version().strip().replace('.', '-')}}.tar.bz2
7a905f2a4bd908926a4d005008017cfb57dc69d257073aab386693d1913c0411
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/png
lib/brotli
lib/bzip/2
{% endblock %}
