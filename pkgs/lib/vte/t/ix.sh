{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/vte/-/archive/0.78.2/vte-0.78.2.tar.bz2
sha:c655778c2148c30f7416a450d7d9dad7bf481d3411896095aacd92a448c3ebf3
{% endblock %}

{% block lib_deps %}
lib/c
lib/lz4
lib/c++
lib/icu
lib/atk
lib/glib
lib/pango
lib/pcre/2
lib/fribidi
lib/fast/float
{% endblock %}

{% block bld_libs %}
lib/shim/wait
{% endblock %}

{% block bld_tool %}
bld/bash
bld/glib
bld/prepend
{% endblock %}

{% block meson_flags %}
gir=false
vapi=false
gnutls=false
_systemd=false
{% endblock %}

{% block patch %}
sed -e 's|+ debug_sources||' -i src/app/meson.build
echo 'int main() {}'  > src/color-test.cc
prepend src/icu-glue.hh << EOF
#include <string_view>
EOF
prepend src/termprops.hh << EOF
#pragma once
#include <fast_float/fast_float.h>
#include <charconv>
namespace std {
    inline std::from_chars_result from_chars(const char* first, const char* last, double& value, std::chars_format fmt = std::chars_format::general) {
        auto ret = fast_float::from_chars(first, last, value);
        return {ret.ptr, ret.ec};
    }
}
EOF
prepend src/minifont.cc << EOF
#include <algorithm>
EOF
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
