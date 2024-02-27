{% extends '//lib/vte/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/vte/-/archive/9e8824480ef51374bf9b42ad8ee59f64d50456b1/vte-9e8824480ef51374bf9b42ad8ee59f64d50456b1.tar.bz2
sha:3ea1dfe793c1f9f16f98c7670d026ff2a5bfef7b5fb26f6f29656e5dadd5d39f
https://gitlab.gnome.org/chergert/ptyxis/-/raw/08564402b8a9bc53bc2dbd3ff14f9d9598c14b7b/build-aux/0001-add-notification-and-shell-precmd-preexec.patch
sha:901125a5aa5ac4e2682532cb204f8ca5053c86ff8c28d24d16003b76e80105d8
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/lz4
lib/gtk/4
{% endblock %}

{% block meson_flags %}
{{super()}}
gtk3=false
gtk4=true
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block setup_target_flags %}
# TODO(pg): fixme
export CFLAGS="-Wno-enum-constexpr-conversion ${CFLAGS}"
{% endblock %}

{% block patch %}
patch --fuzz=5 -p1 < ${src}/0001-add-notification-and-shell-precmd-preexec.patch
{{super()}}
cat - src/termprops.hh << EOF >> _
#pragma once
#include <stdlib.h>
#include <string>
#include <charconv>
namespace std {
    inline std::from_chars_result from_chars(const char* first, const char* last, double& value, std::chars_format fmt = std::chars_format::general) {
        std::string s(first, last);
        char* b = (char*)s.c_str();
        char* e = b + s.length();
        value = strtod(b, &e);
        return {first + (e - b), {}};
    }
}
EOF
mv _ src/termprops.hh
{% endblock %}
