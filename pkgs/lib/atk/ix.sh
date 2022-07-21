{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/atk/-/archive/ATK_2_36_0/atk-ATK_2_36_0.tar.bz2
sha:395894d43f0628497f919dff1b769f5482af99a8991127277e365f9374f46d57
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_tool %}
bld/glib/codegen
{% endblock %}

{% block meson_flags %}
introspection=false
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/atk-1.0 \${CPPFLAGS}"
{% endblock %}
