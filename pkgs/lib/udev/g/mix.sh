{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://download-fallback.gnome.org/sources/libgudev/237/libgudev-237.tar.xz
a7783083cd74957d3a727ddc4737ee84
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/udev/mix.sh
lib/glib/mix.sh
{% endblock %}

{% block bld_tool %}
lib/glib/mix.sh
{% endblock %}
