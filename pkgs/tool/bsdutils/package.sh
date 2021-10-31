{% extends '//mix/template/meson.sh' %}

{% block fetch %}
# url https://github.com/dcantrell/bsdutils/archive/a1eeb6c8ca7745a28b68ae87b7532d8868b53515.zip
# md5 f3a640fd2b0939d0c17a2eb17801919c
{% endblock %}

{% block deps %}
# bld {{'lib/linux/package.sh lib/fts/package.sh lib/rpmatch/package.sh' | linux}}
# bld lib/cxx/package.sh
# bld lib/xo/package.sh
# bld lib/edit/package.sh
# bld lib/openssl/package.sh
# bld lib/curses/any/package.sh
# bld dev/build/meson/package.sh
# bld dev/build/pkg-config/package.sh
# bld dev/lang/flex/package.sh
# bld dev/lang/byacc/package.sh
# bld env/std/package.sh
{% endblock %}
