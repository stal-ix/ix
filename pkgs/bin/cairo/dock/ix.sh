{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Cairo-Dock/cairo-dock-core/archive/refs/tags/3.6.0.tar.gz
8b7c5d08dbd61d4f18c463a0eba4b8a0ff5c2830225c56b7cffe9e84d01af2e3
{% endblock %}

{% block bld_libs %}
lib/c
lib/glu
lib/curl
lib/rsvg
lib/gtk/3
lib/opengl
lib/dbus/glib
lib/opengl/drivers
lib/gtk/layer/shell/3
lib/shim/fake/pkg(pkg_name=gl,pkg_ver=100500)
{% endblock %}

{% block bld_tool %}
bld/gzip
{% endblock %}
