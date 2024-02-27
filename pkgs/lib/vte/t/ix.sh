{% extends '//die/c/meson.sh' %}

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

{% block bld_libs %}
lib/shim/wait
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
sed -e 's|+ debug_sources||' -i src/app/meson.build
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/vte-2.91 \${CPPFLAGS}"
{% endblock %}
