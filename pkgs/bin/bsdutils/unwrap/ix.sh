{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
bsdutils
{% endblock %}

{% block version %}
13.2
{% endblock %}

{% block fetch %}
https://codeberg.org/dcantrell/bsdutils/archive/v{{self.version().strip()}}.tar.gz
c3ff4c669a3906e1aa221b87c26802bb698bdf44509a91057137868130c9c818
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
