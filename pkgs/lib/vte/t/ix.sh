{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/vte/-/archive/0.70.1/vte-0.70.1.tar.bz2
sha:04caaa84a9f2741d81623fd77a544dc53ccc67940cd47a9b41520e18355c7b01
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/icu
lib/atk
lib/glib
lib/pango
lib/pcre/2
lib/fribidi
{% endblock %}

{% block bld_tool %}
bld/bash
bld/glib
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

{% block env %}
export CPPFLAGS="-I${out}/include/vte-2.91 \${CPPFLAGS}"
{% endblock %}
