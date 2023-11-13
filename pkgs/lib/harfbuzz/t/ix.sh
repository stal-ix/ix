{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/8.3.0.tar.gz
sha:6a093165442348d99f3307480ea87ed83bdabaf642cdd9548cff6b329e93bfac
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}

{% block bld_tool %}
bld/glib
bld/python
bin/ragel/6
{% endblock %}

{% block meson_flags %}
glib=enabled
gobject=enabled
tests=disabled
docs=disabled
{% endblock %}
