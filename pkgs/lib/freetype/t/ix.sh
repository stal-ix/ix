{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
freetype
{% endblock %}

{% block version %}
2.13.3
{% endblock %}

{% block fetch %}
https://gitlab.com/freetype/freetype/-/archive/VER-{{self.version().strip().replace('.', '-')}}/freetype-VER-{{self.version().strip().replace('.', '-')}}.tar.bz2
sha:2f8aa590bbb4deaf77c530b77e4c5c636ae365403b8793b9841f09faf32f3a06
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/png
lib/brotli
lib/bzip/2
{% endblock %}
