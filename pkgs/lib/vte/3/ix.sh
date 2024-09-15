{% extends '//lib/vte/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/vte/-/archive/0.78.0/vte-0.78.0.tar.bz2
sha:f822dbcc1143afb7d542be6af9c1d4b7083322055aa4afc6a10b8eca290e0649
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/lz4
lib/gtk/3
lib/fast/float
{% endblock %}

{% block meson_flags %}
{{super()}}
gtk3=true
gtk4=false
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/prepend
{% endblock %}

{% block build_flags %}
{{super()}}
shut_up
{% endblock %}

{% block patch %}
{{super()}}
echo 'int main() {}'  > src/color-test.cc
prepend src/icu-glue.hh << EOF
#include <string_view>
EOF
cat - src/termprops.hh << EOF >> _
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
mv _ src/termprops.hh
prepend src/minifont.cc << EOF
#include <algorithm>
EOF
{% endblock %}
