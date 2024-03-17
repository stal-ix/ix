{% extends '//die/proxy.sh' %}

{% block lib_deps %}
lib/shim/fake/pkg(pkg_name=librsvg-2.0,pkg_ver=2.100.500)
{% endblock %}

{% block install %}
mkdir -p ${out}/include/librsvg

cat << EOF > ${out}/include/librsvg/rsvg.h
#pragma once

#include <stdlib.h>

struct GError {
    const char* message;
};

using RsvgHandle = void;

static inline RsvgHandle* rsvg_handle_new_from_data(const unsigned char*, size_t, GError** error) {
    static GError* err = new GError{"unimplemented"};

    if (error) {
        *error = err;
    }

    return nullptr;
}

struct RsvgRectangle {
    double x;
    double y;
    double dx;
    double dy;
};

#define rsvg_handle_render_document(a, b, c, d) false
EOF
{% endblock %}
