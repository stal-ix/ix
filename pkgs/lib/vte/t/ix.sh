{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
vte
{% endblock %}

{% block version %}
0.82.1
{% endblock %}

{% block fetch %}
https://github.com/GNOME/vte/archive/refs/tags/{{self.version().strip()}}.tar.gz
24b1f938b19a46d0f88c0bb31687ba45fc300f04ddb8c4e65508762e493ef075
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
lib/fmt/11
lib/fribidi
lib/simd/utf
lib/fast/float
{% endblock %}

{% block bld_libs %}
lib/kernel
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
cat << EOF > src/xxx.hh
#pragma once
template <class S>
inline auto xxx_end(S& s) {
    return s.data() + s.length();
}

template <class S>
inline auto xxx_begin(S& s) {
    return s.data();
}
EOF
prepend src/properties.hh << EOF
#include "xxx.hh"
EOF
prepend src/parser-glue.hh << EOF
#include "xxx.hh"
EOF
sed -e 's|std::end(str)|xxx_end(str)|' \
    -e 's|std::begin(str)|xxx_begin(str)|' \
    -i src/properties.hh
sed -e 's|std::end(str)|xxx_end(str)|' \
    -e 's|std::begin(str)|xxx_begin(str)|' \
    -i src/parser-glue.hh
prepend src/minifont.cc << EOF
#include <algorithm>
EOF
prepend src/parser.hh << EOF
#include <algorithm>
EOF
prepend src/boxed.hh << EOF
#include <utility>
EOF
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
