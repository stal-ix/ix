{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/vte/-/archive/0.68.0/vte-0.68.0.tar.bz2
sha:cfb6fe3a11967de4f1ac5f7e0606d821036dca3171f9eddf35183956f7879e55
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/icu
lib/atk
lib/glib
lib/gtk/3
lib/pango
lib/pcre/2
lib/fribidi
{% endblock %}

{% block bld_tool %}
bld/bash
bin/glib/codegen
{% endblock %}

{% block meson_flags %}
gir=false
vapi=false
gnutls=false
_systemd=false
{% endblock %}

{% block patch %}
sed -e 's|W_EXITCODE.*|SIGKILL << 8;|' -i src/widget.cc
sed -e 's|+ debug_sources||' -i src/app/meson.build
{% endblock %}
