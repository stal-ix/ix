{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
bsdutils
{% endblock %}

{% block version %}
13.2
{% endblock %}

{% block fetch %}
https://github.com/dcantrell/bsdutils/archive/refs/tags/v{{self.version().strip()}}.tar.gz
eebd30141ff0d92b77627f4286fd21f8d22d01d175eb28e31daab1857e654b48
{% endblock %}

{% block bld_libs %}
lib/c
lib/xo
lib/c++
lib/edit
lib/curses
lib/openssl
lib/shim/fake(lib_name=tinfo)

{% if linux %}
lib/fts
lib/kernel
lib/rpmatch
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/flex
bld/byacc
bld/prepend
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv sbin/* bin/
rm -r sbin
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block patch %}
prepend src/df/df.c << EOF
#include <err.h>
EOF
{% endblock %}
