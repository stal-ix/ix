{% extends '//mix/template/meson.sh' %}

{% block fetch %}
# url https://github.com/dcantrell/bsdutils/archive/a1eeb6c8ca7745a28b68ae87b7532d8868b53515.zip
# md5 f3a640fd2b0939d0c17a2eb17801919c
{% endblock %}

{% block deps %}
# bld {{'lib/linux/mix.sh lib/fts/package.sh lib/rpmatch/package.sh' | linux}}
# bld lib/cxx/mix.sh
# bld lib/xo/mix.sh
# bld lib/edit/mix.sh
# bld lib/openssl/mix.sh
# bld lib/curses/any/mix.sh
# bld dev/build/meson/mix.sh
# bld dev/build/pkg-config/mix.sh
# bld dev/lang/flex/mix.sh
# bld dev/lang/byacc/mix.sh
# bld env/std/mix.sh
{% endblock %}
