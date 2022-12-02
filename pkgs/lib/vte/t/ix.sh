{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/vte/-/archive/0.70.2/vte-0.70.2.tar.bz2
sha:17504b21b6391620337403c792767ae7367597d1de8ff53d4a325697883093d0
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
